import 'package:notes/shared/commander/commander.dart';
import 'package:notes/shared/commander/commands/note_commands.dart';

void main() async {
  final commander = CommanderBuilder()
      .addGroup(CommandHandlerGroup<CreateNote>([
        (command) => print(command.title),
      ]))
      .finalize();

  print("sending");
  // await commander.send(const CreateNote("hello from two", null));
  print("sent");
}
