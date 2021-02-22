import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final String description;
  const TaskWidget({Key key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 29,
        vertical: 32,
      ),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (title != null) ? title : "Unnamed task",
            style: TextStyle(
              color: Color(0xff474747),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              description != null ? description : "empty task",
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 15,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
