import 'package:notes/shared/commander/commander.dart';
import 'package:notes/shared/commander/commands/note_commands.dart';

void main() async {
  final commander = NoteCommander();
  commander.registerCommandHandler(CreateNote, (command) {
    print(command.title);
  });
  commander.registerCommandHandler(CreateNote, (command) {
    print("hello from second command");
  });
  commander.registerCommandHandlers(CreateNote, [
    (command) => print("hello from 3"),
    (command) => print("hello from 4"),
  ]);

  print("sending");
  await commander.send(const CreateNote("hello from one", null));
  print("sent");
}
