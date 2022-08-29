import 'package:flutter/material.dart';
import 'package:notes/shared/debounce/debounce.dart';
import 'package:super_editor/super_editor.dart';
import 'package:super_editor_markdown/super_editor_markdown.dart';
import 'package:notes/shared/string_tools.dart' as string_tools;

typedef ListenerDisposer = VoidCallback;
typedef ChangeListener = void Function(String? value);

class SuperEditorWrapper {
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
    var layout = GlobalKey() as DocumentLayout;
    var resolver = layoutResolver ?? () => layout;

    return SuperEditorWrapper(
      document: document,
      editor: editor,
      composer: composer,
      documentLayout: layout,
      layoutResolver: resolver,
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
  final DocumentLayout documentLayout;
  final Debouncer _debouncer = Debouncer();

  void dispose() {
    document.dispose();
    composer.dispose();
  }

  void _conversionListener() {
      // TODO implement conversions on change
    print("checking for conversions");
  }

  void boldSelection() {

  }

  void underlineSelection() {
    throw UnimplementedError();
  }

  void italicizeSelection() {

  }

  void createLinkFromSelection(String url) {

  }

  void convertToParagraph() {

  }

  void convertToHeader(NamedAttribution headerLevel) {
    // final test = "";
    // test.matchAsPrefix(string);
  }

  void convertToTask([ bool complete = false]) {

  }

  void convertToHorizontalRule() {
    /*
    You can create a horizontal break to divide your text by placing three (or more) underscores

___

or asterisks

***

or hyphens

---

on their own line.

_ _ _
* * * *
and the spaces don't have to be evenly distributed
*  ****
     */
  }

  ListenerDisposer _addChangeListener(ChangeListener listener) {
    void voidListener() {
      _debouncer.run(() {
        final markdown = serializeDocumentToMarkdown(document);
        listener(markdown);
      }, _conversionListener);
    }

    return () => document.removeListener(voidListener);
  }
}
