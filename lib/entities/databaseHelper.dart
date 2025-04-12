import 'package:rogos/entities/worker_class.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DbWorker {
  static Future <Database>openDB() async {


    
    return openDatabase(join(await getDatabasesPath(),"worker.db"),
    onCreate:(db, version) async {
      await db.execute(
        'CREATE TABLE worker (id INTEGER PRIMARY KEY AUTOINCREMENT,nombre TEXT,salario TEXT,ultimo_cobro TEXT, proximo_cobro TEXT, estado TEXT)'
      );
      await db.execute(
        '''CREATE TABLE Discipline (
        id INTEGER PRIMARY KEY AUTOINCREMENT,worker_id , Hecho TEXT,
        FOREIGN KEY (worker_id) REFERENCES worker (id) ON DELETE CASCADE
        )'''
      );

    },version: 1);

  }
  
  static Future<void>insert(Worker WORKER) async{
   Database database = await openDB();

    await database.insert('worker',WORKER.to_map());
  }
  static Future<void>InsertarIncidencia(Worker WORKER) async{
   Database database = await openDB();

    await database.insert('Discipline', WORKER.Incidencias_to_map());
  }


  static Future<List<Worker>> getAllWorkers() async {
    final Database database = await DbWorker.openDB();
    final List<Map<String, dynamic>> maps = await database.query('worker');
    return List.generate(maps.length, (i) {
      return Worker.fromMap(maps[i]);
    });
  }

  static Future<Worker?> getWorker(String nombre) async {
    final Database database = await DbWorker.openDB();
    final List<Map<String, dynamic>> maps = await database.query(
      'worker',
      where: 'nombre = ?',
      whereArgs: [nombre],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return Worker.fromMap(maps.first);
    }
    return null;
  }

  // Update
  static Future<void> update(int? id, String Campo, String Dato) async {
    final Database database = await DbWorker.openDB();
    await database.update(
      'worker',
      {Campo:Dato},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete
  static Future<void> delete(String nombre) async {
    final Database database = await DbWorker.openDB();
    await database.delete(
      'worker',
      where: 'nombre = ?',
      whereArgs: [nombre],
    );
  }

  
  
  
}