import 'package:get_it/get_it.dart';
import 'package:notes/shared/commander/commander.dart';
import 'package:notes/shared/commander/commands/handlers/note_command_handlers.dart';
import 'package:notes/shared/commander/commands/note_commands.dart';
import 'package:notes/shared/queries/notes_queries.dart';
import 'package:notes/shared/repository/notes_repository.dart';
import 'package:notes/shared/store/note_store.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

final registerSingleton = GetIt.I.registerSingleton;
final inject = GetIt.I.get;

Future setup() async {
  await _sembast();

  registerSingleton<NotesRepository>(NotesSembastRepository());
  registerSingleton(NotesQueries());
  registerSingleton(NoteStore()..init());

  _commands();
}

Future _sembast() async {
  final appDir = await getApplicationDocumentsDirectory();
  await appDir.create(recursive: true);
  String dbPath = join(appDir.path, "notes.db");
  final dbFactory = databaseFactoryIo;
  final db = await dbFactory.openDatabase(dbPath);
  registerSingleton(db);
}

void _commands() {
  final commander = CommanderBuilder()
      .addGroup(CommandHandlerGroup<CreateNote>([createNoteHandler]))
      .addGroup(CommandHandlerGroup<UpdateNote>([updateNoteHandler]))
      .addGroup(CommandHandlerGroup<DeleteNote>([deleteNoteHandler]))
      .finalize();

  registerSingleton(commander);
}
