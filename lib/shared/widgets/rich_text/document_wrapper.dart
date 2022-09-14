import 'package:flutter/material.dart';
import 'package:notes/shared/debounce/debounce.dart';
import 'package:notes/shared/hooks/disposable.dart';
import 'package:notes/shared/widgets/rich_text/attribution_tools.dart';
import 'package:notes/shared/widgets/rich_text/task_node.dart';
import 'package:super_editor/super_editor.dart';
import 'package:super_editor_markdown/super_editor_markdown.dart';
import 'package:notes/shared/string_tools.dart' as string_tools;

typedef ListenerDisposer = VoidCallback;
typedef ChangeListener = void Function(String value);

const _paragraphLeader = r'(/p) ';
const _headerRegex = r'(#*) ';
const _codeBlockLeader = r'(```)';

// TODO Look at interactive demo for implementing easy copy and paste

class SuperEditorWrapper implements Disposable {
  SuperEditorWrapper({
    required this.document,
    required this.editor,
    required this.composer,
    required this.operations,
    required this.layoutResolver,
    required this.documentLayout,
    ChangeListener? listener,
  }) {
    if (listener != null) {
      _addChangeListener(listener);
    } else {
      document.addListener(_conversionListener);
    }
  }

  factory SuperEditorWrapper.fromMarkdown(
    String? markdown, {
    DocumentEditor Function(Document doc)? documentEditorFactory,
    DocumentComposer? documentComposer,
    CommonEditorOperations? operations,
    DocumentLayoutResolver? layoutResolver,
    DocumentLayout? layout,
    ChangeListener? listener,
  }) {
    final document = !string_tools.isNullOrWhitespace(markdown)
        ? deserializeMarkdownToDocument(markdown!)
        : MutableDocument(nodes: [
            ParagraphNode(
                id: DocumentEditor.createNodeId(),
                text: AttributedText(text: ''))
          ]);
    var editor = documentEditorFactory != null
        ? documentEditorFactory.call(document)
        : DocumentEditor(document: document);

    var composer = documentComposer ?? DocumentComposer();
    var layout = GlobalKey();
    var resolver =
        layoutResolver ?? () => layout.currentState as DocumentLayout;

    return SuperEditorWrapper(
      document: document,
      editor: editor,
      composer: composer,
      documentLayout: layout,
      layoutResolver: resolver,
      listener: listener,
      operations: operations ??
          CommonEditorOperations(
            editor: editor,
            composer: composer,
            documentLayoutResolver: resolver,
          ),
    );
  }

  final MutableDocument document;
  final DocumentEditor editor;
  final DocumentComposer composer;
  final CommonEditorOperations operations;
  final DocumentLayoutResolver layoutResolver;
  final GlobalKey documentLayout;
  final Debouncer _debouncer = Debouncer();

  DocumentSelection? _documentSelection;

  void dispose() {
    _debouncer.dispose();
    document.dispose();
    composer.dispose();
  }

  void _conversionListener() {
    _documentSelection = composer.selection ?? _documentSelection;
    print("checking for conversions");
    final node = _getSelectionTextNode();
    if (node == null) return;

    final headerLevel = _nodeHeaderLevel(node);
    if (headerLevel != null) {
      print("Converting to Header $headerLevel");
      _convertToHeader(headerLevel, node);
      return;
    }

    if (_shouldConvertSelectionToParagraph(node)) {
      print("Converting to Paragraph");
      _convertToParagraph(node);
      return;
    }

    if (_shouldConvertSelectionToCode(node)) {
      print("Converting to code block");
      _convertToCodeBlock(node);
    }

    print("No conversions to be done");
  }

  void boldSelection() {
    toggleAttribute(boldAttribution);
  }

  void toggleAttribute(NamedAttribution attribution) {
    final selection = _documentSelection;
    if (selection == null) return;

    editor.executeCommand(
      ToggleTextAttributionsCommand(
        documentSelection: selection,
        attributions: {attribution},
      ),
    );
    return;
  }

  void strikeThroughSelection() {
    final node = _getSelectionTextNode();
    if (node is TaskNode) return;

    toggleAttribute(strikethroughAttribution);
  }

  void underlineSelection() {
    toggleAttribute(underlineAttribution);
  }

  void italicizeSelection() {
    toggleAttribute(italicsAttribution);
  }

  void convertSelectionToParagraph() {
    final node = _getSelectionTextNode();
    if (node == null) return;

    _convertToParagraph(node, false);
  }

  void convertSelectionToHeader(int headerLevel) {
    final node = _getSelectionTextNode();
    if (node == null) return;

    _convertToHeader(headerLevel, node, false);
  }

  void convertSelectionToCodeBlock() {
    final node = _getSelectionTextNode();
    if (node == null) return;

    _convertToCodeBlock(node, false);
  }

  void createLinkFromSelection(String url) {}

  // TODO make public methods that get the node
  void _convertToParagraph(TextNode node, [bool trim = true]) {
    final newNode = ParagraphNode(
      id: node.id,
      text: AttributedText(
        text: trim
            ? node.text.text.substring(_paragraphLeader.length)
            : node.text.text,
        // spans: trim
        //     ? _fixSpanOffsets(node.text.spans, _paragraphLeader.length)
        //     : node.text.spans,
      ),
    );
    _convertNode(node, newNode);
  }

  AttributedSpans _fixSpanOffsets(AttributedSpans spans, int leaderLength) {
    return spans..pushAttributionsBack(leaderLength);
  }

  void _convertToHeader(int headerLevel, TextNode node, [bool trim = true]) {
    final attribution = levelToAttribution[headerLevel];
    if (attribution == null) return;

    final newNode = ParagraphNode(
      id: node.id,
      text: AttributedText(
        text: trim ? node.text.text.substring(headerLevel + 1) : node.text.text,
        // spans: trim
        //     ? _fixSpanOffsets(node.text.spans, headerLevel + 1)
        //     : node.text.spans,
      ),
      metadata: {'blockType': attribution},
    );
    _convertNode(node, newNode);
  }

  void _convertToCodeBlock(TextNode node, [bool trim = true]) {
    final newNode = ParagraphNode(
      id: node.id,
      text: AttributedText(
        text: trim
            ? node.text.text.substring(_codeBlockLeader.length)
            : node.text.text,
        // spans: trim
        //     ? _fixSpanOffsets(node.text.spans, _codeBlockLeader.length)
        //     : node.text.spans,
      ),
      metadata: {'blockType': codeAttribution},
    );
    _convertNode(node, newNode);
  }

  void _convertNode(DocumentNode node, DocumentNode newNode) {
    editor.executeCommand(EditorCommandFunction((doc, transaction) {
      transaction.replaceNode(oldNode: node, newNode: newNode);
    }));
  }

  TextNode? _getSelectionTextNode() {
    final selection = _documentSelection;
    if (selection == null) return null;

    final node = document.getNode(selection.base);
    if (node is! TextNode) return null;

    return node;
  }

  bool _shouldConvertSelectionToParagraph(TextNode node) {
    String? group = _matchNodeText(_paragraphLeader, node);

    return group != null;
  }

  bool _shouldConvertSelectionToCode(TextNode node) {
    String? group = _matchNodeText(_codeBlockLeader, node);

    return group != null;
  }

  int? _nodeHeaderLevel(TextNode node) {
    String? group = _matchNodeText(_headerRegex, node);

    if (group == null) return null;

    final headerLevel = group.length > 6 ? 6 : group.length;

    return headerLevel;
  }

  String? _matchNodeText(String source, TextNode node) {
    final regex = RegExp(source);
    final text = node.text.text;
    final match = regex.matchAsPrefix(text);
    if (match == null || match.groupCount < 1) return null;
    final group = match.group(1);
    return group;
  }

  bool convertToTask() {
    return false;
  }

  ListenerDisposer _addChangeListener(ChangeListener listener) {
    void voidListener() {
      _debouncer.run(() {
        final markdown = serializeDocumentToMarkdown(document);
        listener(markdown);
      }, _conversionListener);
    }

    document.addListener(voidListener);
    composer.addListener(voidListener);

    return () => document.removeListener(voidListener);
  }
}
