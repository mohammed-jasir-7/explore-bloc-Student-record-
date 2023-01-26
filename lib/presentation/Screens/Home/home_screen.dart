import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_5/Database/student_db_function.dart';
import 'package:week_5/business_logic/blocs/bloc/student_bloc.dart';

import 'package:week_5/presentation/Screens/Home/widgets/bodylist.dart';
import 'package:week_5/presentation/Screens/Home/widgets/drawer.dart';
import 'package:week_5/presentation/Screens/Home/widgets/searchbar.dart';
import '../../../data/Model/students.dart';
import '../Login/widget/loginForm.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required String username});
  TextEditingController name = TextEditingController();
  TextEditingController addno = TextEditingController();
  TextEditingController course = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerSide(),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 58, 58, 58),
        actions: [
          const Searchbar(),
          TextButton(
            onPressed: () {
              addscreen(context);
            },
            child: const Text(
              "ADD",
              style: TextStyle(color: Colors.amber),
            ),
          )
        ],
        leading: Builder(
          builder: (contex) {
            return IconButton(
              icon: const Icon(Icons.menu),
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
        content: SizedBox(
          height: 300,
          child: Column(
            children: [
              const Text("Student Form"),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: addno,
                    decoration:
                        const InputDecoration(labelText: 'Admission No'),
                  ),
                  TextFormField(
                    controller: name,
                    decoration: const InputDecoration(labelText: 'Name'),
                  ),
                  TextFormField(
                    controller: course,
                    decoration: const InputDecoration(labelText: 'Course'),
                  ),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<StudenttBloc>(context).add(AddEvent(
                            name: name.text,
                            addmissionNo: addno.text,
                            course: course.text,
                            whoAdd: LoginForm.logindUser.userName));
                      },
                      child: const Text("add"))
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
