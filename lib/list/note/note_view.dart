import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:notes/list/note/note_view_model.dart';

class NoteView extends HookWidget {
  const NoteView(
    this.id, {
    super.key,
    required this.onNoteSelected,
  });

  final String id;
  final void Function(String id) onNoteSelected;

  @override
  Widget build(BuildContext context) {
    final viewModel = useState(NoteViewModel()..init(id)).value;

    return ListTile(
      onTap: () => onNoteSelected(id),
      title: Text(viewModel.title),
      subtitle: Text(viewModel.dateCreated),
      trailing: IconButton(icon: const Icon(Icons.delete), onPressed: viewModel.onDelete,),
    );
  }
}
