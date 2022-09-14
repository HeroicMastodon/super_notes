import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes/shared/widgets/rich_text/document_wrapper.dart';
import 'package:super_editor/super_editor.dart';
import 'package:super_editor_markdown/super_editor_markdown.dart';

class SuperRichText extends HookWidget {
  const SuperRichText({Key? key, this.initialValue, this.onChanged})
      : super(key: key);

  final String? initialValue;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    final wrapper =
        useState(SuperEditorWrapper.fromMarkdown(initialValue, listener: onChanged)).value;

    // TODO: Consider making a useDispose() hook
    useEffect(() {
      return () {
        wrapper.dispose();
      };
    });

    return SuperEditor(
      editor: wrapper.editor,
      composer: wrapper.composer,
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
