import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:week_5/Database/student_db_function.dart';

import '../../../business_logic/blocs/bloc/student_bloc.dart';
import '../../../data/Model/students.dart';
import '../Home/home_screen.dart';
import '../Login/widget/loginForm.dart';
import 'widget/student_details.dart';

class StudentDetails extends StatelessWidget {
  StudentDetails({super.key, required this.detail});
  Student detail;
  TextEditingController name = TextEditingController();
  TextEditingController addno = TextEditingController();
  TextEditingController course = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                // details here
                Detail(detail: detail),
                ElevatedButton(
                    onPressed: () {
                      show(context);
                    },
                    child: const Text("edit")),
                IconButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              username: LoginForm.logindUser.userName),
                        ),
                        (route) => false),
                    icon: const Icon(Icons.home))
              ],
            ),
          ),
        ),
      ),
    );
  }

  show(BuildContext context) {
    name.text = detail.name;
    addno.text = detail.addmissionNumber;
    course.text = detail.course;
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: Container(
            height: 300,
            child: Column(
              children: [
                const Text("Edit"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: name,
                    style: GoogleFonts.montserrat(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "name",
                        hintStyle: const TextStyle(color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: addno,
                    style: GoogleFonts.montserrat(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Admission No",
                        hintStyle: const TextStyle(color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: course,
                    style: GoogleFonts.montserrat(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: const BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "course",
                        hintStyle: const TextStyle(color: Colors.black)),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<StudenttBloc>(context).add(EditEvent(
                          id: detail.id,
                          name: name.text,
                          index: detail.key,
                          addmissionNo: addno.text,
                          course: course.text,
                          whoAdd: detail.whoAdd));
                      Navigator.pop(ctx);
                    },
                    child: const Text("update"))
              ],
            ),
          ),
        );
      },
    );
  }

  // Future edit() async {
  //   detail.name = name.text;
  //   detail.addmissionNumber = addno.text;
  //   detail.course = course.text;
  //   detail.save();
  // }
}
