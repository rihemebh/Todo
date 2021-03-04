import 'package:flutter/material.dart';
import 'package:todo/view/dialog.dart';
import 'package:todo/view/taskWidget.dart';
import 'package:todo/view/todoPage.dart';
import 'model/task.dart';
import 'DAO/dbHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Tasks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataBaseHelper db = DataBaseHelper();
  List<Task> tasks;

  Future showData() async {
    tasks = await db.getTasks();

    setState(() {
      tasks = tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    TaskDialog dialog;
    showData();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xffd3a2e4),
      ),
      body: Container(
        color: Color(0xFFF6F6F6),
        child: ListView.builder(
          itemCount: tasks != null ? tasks.length : 1,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TodoPage(
                              task: tasks[index],
                            )));
              },
              child: Dismissible(
                key: Key(tasks[index].id.toString()),
                onDismissed: (direction) {
                  db.deleteTask(tasks[index]);
                  setState(() {
                    tasks.removeAt(index);
                  });
                },
                child: TaskWidget(
                  title: tasks[index].title,
                  description: tasks[index].description,
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffd3a2e4),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  dialog.buildDialog(context, Task()));
        },
        child: Center(child: Icon(Icons.add)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          /*child: Row(
              children: [
                IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(left: 28.0),
                    icon: Icon(Icons.home)),
                    
                IconButton(
                    iconSize: 30.0,
                    padding: EdgeInsets.only(right: 28.0),
                    icon: Icon(Icons.calendar_today)),
              ],
            )*/
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
