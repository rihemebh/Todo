import 'package:flutter/material.dart';
import 'package:todo/Widgets.dart';
import 'package:todo/databaseHelper.dart';
import 'package:todo/views/TaskPage.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  DataBaseHelper db = new DataBaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          color: Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 32,
                      top: 32,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                  Expanded(
                      child: ScrollConfiguration(
                          behavior: NoGlowBehaviour(),
                          child: FutureBuilder(
                              initialData: [],
                              future: db.getTasks(),
                              builder: (context, snapshot) {
                                return ScrollConfiguration(
                                  behavior: NoGlowBehaviour(),
                                  child: ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TaskPage(
                                                        task: snapshot
                                                            .data[index],
                                                      )));
                                        },
                                        child: TaskCard(
                                            title: snapshot.data[index].title),
                                      );
                                    },
                                  ),
                                );
                              }))),
                ],
              ),
              Positioned(
                bottom: 24.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskPage(task: null,),
                        )).then((value) => setState(() {}));
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        //color: Color(0xFF7349FE),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF7349FE),
                            Color(0xFF642FDB),
                          ],
                          begin: Alignment(0.0, -1),
                          end: Alignment(0.0, 1),
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image(
                      image: AssetImage('assets/images/add_icon.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
