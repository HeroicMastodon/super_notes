import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

final registerSingleton = GetIt.I.registerSingleton;

setup() async {
  await _sembast();
}

Future _sembast() async {
  final appDir = await getApplicationDocumentsDirectory();
  await appDir.create(recursive: true);
  String dbPath = join(appDir.path, "notes.db");
  final dbFactory = databaseFactoryIo;
  final db = await dbFactory.openDatabase(dbPath);
  registerSingleton(db);
}