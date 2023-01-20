import 'package:flutter/material.dart';
import 'package:week_5/Database/student_db_function.dart';
import 'package:week_5/Model/students.dart';
import 'package:week_5/Screens/Home/widgets/bodylist.dart';

import 'package:week_5/Screens/Home/widgets/drawer.dart';
import 'package:week_5/Screens/Home/widgets/searchbar.dart';
import 'package:week_5/Screens/Login/widget/loginForm.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required String username});
  TextEditingController name = TextEditingController();
  TextEditingController addno = TextEditingController();
  TextEditingController course = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSide(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 58, 58),
        actions: [
          Searchbar(),
          TextButton(
            onPressed: () {
              addscreen(context);
            },
            child: Text(
              "ADD",
              style: TextStyle(color: Colors.amber),
            ),
          )
        ],
        leading: Builder(
          builder: (contex) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(contex).openDrawer();
              },
            );
          },
        ),
      ),
      body: HomeBody(),
    );
  }

  addscreen(BuildContext contex) {
    showDialog(
      context: contex,
      builder: (context) => AlertDialog(
        content: Container(
          height: 300,
          child: Column(
            children: [
              Text("Student Form"),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: addno,
                    decoration: InputDecoration(labelText: 'Admission No'),
                  ),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    controller: course,
                    decoration: InputDecoration(labelText: 'Course'),
                  ),
                  TextButton(
                      onPressed: () {
                        addStudent();
                        Navigator.pop(context);
                      },
                      child: Text("add"))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Future addStudent() async {
    final stdentObj = Student(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name.text,
        addmissionNumber: addno.text,
        course: course.text,
        whoAdd: LoginForm.logindUser.userName);
    final box = Boxes.getdata();
    box.add(stdentObj);
  }
}
