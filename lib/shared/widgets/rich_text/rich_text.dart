import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes/shared/hooks/disposable.dart';
import 'package:notes/shared/widgets/rich_text/document_wrapper.dart';
import 'package:notes/shared/widgets/rich_text/task_node.dart';
import 'package:super_editor/super_editor.dart';
import 'package:super_editor_markdown/super_editor_markdown.dart';

final _darkModeStyles = [
  StyleRule(
    BlockSelector.all,
    (doc, docNode) {
      return {
        "textStyle": const TextStyle(
          color: Color(0xFFCCCCCC),
        ),
      };
    },
  ),
];

class SuperRichText extends HookWidget {
  const SuperRichText({Key? key, this.initialValue, this.onChanged})
      : super(key: key);

  final String? initialValue;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final wrapper = useDisposable(
      SuperEditorWrapper.fromMarkdown(
        initialValue,
        listener: onChanged,
      ),
    );

    return Column(
      children: [
        Toolbar(wrapper),
        Expanded(
          child: SuperEditor(
            editor: wrapper.editor,
            composer: wrapper.composer,
            selectionStyle:
                const SelectionStyles(selectionColor: Color(0xb813bdff)),
            documentOverlayBuilders: [
              DefaultCaretOverlayBuilder(
                const CaretStyle().copyWith(color: Colors.blueAccent),
              )
            ],
            stylesheet: defaultStylesheet.copyWith(
              addRulesAfter: [
                taskStyles,
                ..._darkModeStyles,
              ],
            ),
          ),
        ),
      ],
    );
  }

  MutableDocument createDocument() {
    if (initialValue == null || initialValue?.isEmpty == true) {
      return MutableDocument(
        nodes: [
          ParagraphNode(
            id: DocumentEditor.createNodeId(),
            text: AttributedText(text: ''),
          ),
        ],
      );
    }

    final deserialized = deserializeMarkdownToDocument(initialValue ?? "");

    return deserialized;
  }
}

class Toolbar extends HookWidget {
  const Toolbar(this.wrapper, {Key? key}) : super(key: key);

  final SuperEditorWrapper wrapper;

  @override
  Widget build(BuildContext context) {
    final state = useState<_TextType?>(null);
    useEffect(() {
      void listener() {
        state.value = _getCurrentTextType();
      }

      wrapper.composer.addListener(listener);
      return () => wrapper.composer.removeListener(listener);
    });
    return state.value != null
        ? Container(
            decoration: const BoxDecoration(
              color: Color(0xff565656),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: SizedBox(
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Only allow the user to select a new type of text node if
                  // the currently selected node can be converted.
                  DropdownButton<_TextType>(
                    menuMaxHeight: 250,
                    value: _getCurrentTextType(),
                    items: _TextType.values
                        .map((textType) => DropdownMenuItem<_TextType>(
                              value: textType,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(_getTextTypeName(textType)),
                              ),
                            ))
                        .toList(),
                    icon: const Icon(Icons.arrow_drop_down),
                    style: const TextStyle(
                      // color: Colors.black,
                      fontSize: 12,
                    ),
                    underline: const SizedBox(),
                    elevation: 0,
                    itemHeight: 48,
                    onChanged: (textType) {
                      _convertTextToNewType(textType);
                      state.value = _getCurrentTextType();
                    },
                  ),
                  _buildVerticalDivider(),
                  Center(
                    child: IconButton(
                      onPressed: wrapper.boldSelection,
                      icon: const Icon(Icons.format_bold),
                      splashRadius: 16,
                      tooltip: "Bold",
                    ),
                  ),
                  Center(
                    child: IconButton(
                      onPressed: wrapper.italicizeSelection,
                      icon: const Icon(Icons.format_italic),
                      splashRadius: 16,
                      tooltip: "Italics",
                    ),
                  ),
                  Center(
                    child: IconButton(
                      onPressed: wrapper.strikeThroughSelection,
                      icon: const Icon(Icons.strikethrough_s),
                      splashRadius: 16,
                      tooltip: "Strike Through",
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  void _convertTextToNewType(_TextType? textType) {
    switch (textType) {
      case _TextType.header1:
        wrapper.convertSelectionToHeader(1);
        break;
      case _TextType.header2:
        wrapper.convertSelectionToHeader(2);
        break;
      case _TextType.header3:
        wrapper.convertSelectionToHeader(3);
        break;
      case _TextType.header4:
        wrapper.convertSelectionToHeader(4);
        break;
      case _TextType.header5:
        wrapper.convertSelectionToHeader(5);
        break;
      case _TextType.header6:
        wrapper.convertSelectionToHeader(6);
        break;
      case _TextType.paragraph:
        wrapper.convertSelectionToParagraph();
        break;
      case _TextType.blockquote:
        break;
      case _TextType.orderedListItem:
        // TODO: Handle this case.
        break;
      case _TextType.unorderedListItem:
        // TODO: Handle this case.
        break;
      case _TextType.taskItem:
        wrapper.convertToTask();
        break;
      case null:
        break;
      case _TextType.codeBlock:
        wrapper.convertSelectionToCodeBlock();
        break;
    }
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 1,
      color: Colors.grey.shade300,
    );
  }

  _TextType _getCurrentTextType() {
    if (wrapper.composer.selection == null) return _TextType.paragraph;
    final selectedNode = wrapper.editor.document
        .getNodeById(wrapper.composer.selection!.extent.nodeId);
    if (selectedNode is ParagraphNode) {
      final type = selectedNode.getMetadataValue('blockType');

      if (type == header1Attribution) {
        return _TextType.header1;
      } else if (type == header2Attribution) {
        return _TextType.header2;
      } else if (type == header3Attribution) {
        return _TextType.header3;
      } else if (type == header4Attribution) {
        return _TextType.header4;
      } else if (type == header5Attribution) {
        return _TextType.header5;
      } else if (type == header6Attribution) {
        return _TextType.header6;
      } else if (type == blockquoteAttribution) {
        return _TextType.blockquote;
      } else if (type == taskAttribution) {
        return _TextType.taskItem;
      } else if (type == codeAttribution) {
        return _TextType.taskItem;
      } else {
        return _TextType.paragraph;
      }
    } else if (selectedNode is ListItemNode) {
      return selectedNode.type == ListItemType.ordered
          ? _TextType.orderedListItem
          : _TextType.unorderedListItem;
    } else {
      throw Exception('Invalid node type: $selectedNode');
    }
  }

  /// Returns the localized name for the given [_TextType], e.g.,
  /// "Paragraph" or "Header 1".
  String _getTextTypeName(_TextType textType) {
    switch (textType) {
      case _TextType.header1:
        return "header 1";
      case _TextType.header2:
        return "header 2";
      case _TextType.header3:
        return "header 3";
      case _TextType.header4:
        return "header 4";
      case _TextType.header5:
        return "header 5";
      case _TextType.header6:
        return "header 6";
      case _TextType.paragraph:
        return "paragraph";
      case _TextType.blockquote:
        return "block quote";
      case _TextType.orderedListItem:
        return "ordered list item";
      case _TextType.unorderedListItem:
        return "unordered list item";
      case _TextType.taskItem:
        return "task item";
      case _TextType.codeBlock:
        return "code block";
    }
  }
}

enum _TextType {
  header1,
  header2,
  header3,
  header4,
  header5,
  header6,
  paragraph,
  blockquote,
  orderedListItem,
  unorderedListItem,
  taskItem,
  codeBlock,
}
