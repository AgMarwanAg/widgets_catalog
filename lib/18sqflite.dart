import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class Sqflite extends StatefulWidget {
  const Sqflite({super.key});

  @override
  State<Sqflite> createState() => _SqfliteState();
}

class _SqfliteState extends State<Sqflite> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomPage(),
    );
  }
}

class HomPage extends StatefulWidget {
  const HomPage({super.key});

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  List<NoteModel> notes = [];
  @override
  void initState() {
    getAllData();
    super.initState();
  }

  getAllData() async {
    notes = await NoteDB().fetchAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: "Sqflite",
      filePath: 'lib/18sqflite.dart',
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(notes[index].title),
                subtitle: Text(notes[index].content),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    final result = await NoteDB().deleteNote(notes[index].id);
                    if (result > 0) {
                      getAllData();
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Note deleted'),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return const BottomSheet();
            },
          );
          getAllData();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BottomSheet extends StatefulWidget {
  const BottomSheet({
    super.key,
  });

  @override
  State<BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 16.0),
          TextField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
              )),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () async {
              int value = await NoteDB().insert(title: titleController.text, content: contentController.text);
              if (value > 0) {
                titleController.clear();
                contentController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class DataBaseService {
  Database? db;

  Future<Database> getDatabase() async {
    if (db != null) {
      return db!;
    } else {
      db = await initializeDB();
      return db!;
    }
  }

  Future<Database> initializeDB() async {
    final path = await getPath();
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
    );
    return database;
  }

  Future<String> getPath() async {
    String dbName = 'appDB.db';
    String path = await getDatabasesPath();
    return join(path, dbName);
  }

  Future<void> create(Database database, int version) async => await NoteDB().createTable(database);
}

class NoteDB {
  createTable(Database database) async {
    await database.execute(
      """CREATE TABLE IF NOT EXISTS notes
      (id INTEGER PRIMARY KEY AUTOINCREMENT, 
      title TEXT, 
      content TEXT)""",
    );
  }

  insert({required String title, required String content}) async {
    final db = await DataBaseService().getDatabase();
    return await db.rawInsert("INSERT INTO notes(title, content) VALUES('$title', '$content')");
  }

  Future<List<NoteModel>> fetchAll() async {
    final db = await DataBaseService().getDatabase();
    final notes = await db.rawQuery("SELECT * FROM notes");
    print(notes);
    return notes.map((e) => NoteModel.fromJson(e)).toList();
  }

  Future<int> deleteNote(int id) async {
    final db = await DataBaseService().getDatabase();
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}

class NoteModel {
  final int id;
  final String title;
  final String content;
  NoteModel({required this.id, required this.title, required this.content});
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id']?.toInt() ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
