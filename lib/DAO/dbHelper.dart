import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo/model/task.dart';
import 'package:todo/model/todo.dart';

class DataBaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT)");
        await db.execute(
            "CREATE TABLE todos(id INTEGER PRIMARY KEY, taskId INTEGER, title TEXT, isDone INTEGER)");

        return db;
      },
      version: 1,
    );
  }

  Future<void> insertTask(Task task) async {
    Database db = await database();

    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTask(Task task) async {
    Database db = await database();
    await db.delete('tasks', where: "id = ?", whereArgs: [task.id]);
  }

  Future<void> insertTodo(ToDo todo) async {
    Database db = await database();

    await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Task>> getTasks() async {
    Database db = await database();
    List<Map<String, dynamic>> taskMap = await db.query('tasks');

    return List.generate(taskMap.length, (index) {
      return Task(
          id: taskMap[index]['id'],
          title: taskMap[index]['title'],
          description: taskMap[index]['description']);
    });
  }

  Future<List<ToDo>> getTodo() async {
    Database db = await database();
    List<Map<String, dynamic>> todoMap = await db.query('todos');

    return List.generate(todoMap.length, (index) {
      return ToDo(
          id: todoMap[index]['id'],
          title: todoMap[index]['title'],
          taskId: todoMap[index]['taskId'],
          isDone: todoMap[index]['isDone']);
    });
  }
}
