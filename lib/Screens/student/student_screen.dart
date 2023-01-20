import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:week_5/Database/student_db_function.dart';
import 'package:week_5/Model/students.dart';
import 'package:week_5/Screens/Home/home_screen.dart';
import 'package:week_5/Screens/Login/widget/loginForm.dart';
import 'package:week_5/Screens/student/widget/student_details.dart';

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
                ValueListenableBuilder<Box<Student>>(
                  valueListenable: Boxes.getdata().listenable(),
                  builder: (context, value, child) {
                    return Column(
                      children: [Detail(detail: detail)],
                    );
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      print(detail.key);
                      show(context);
                    },
                    child: Text("edit")),
                IconButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                              username: LoginForm.logindUser.userName),
                        ),
                        (route) => false),
                    icon: Icon(Icons.home))
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
                Text("Edit"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: name,
                    style: GoogleFonts.montserrat(color: Colors.black),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "name",
                        hintStyle: TextStyle(color: Colors.black)),
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
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "Admission No",
                        hintStyle: TextStyle(color: Colors.black)),
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
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 3),
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "course",
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      edit();
                      Navigator.pop(ctx);
                    },
                    child: Text("updte"))
              ],
            ),
          ),
        );
      },
    );
  }

  Future edit() async {
    detail.name = name.text;
    detail.addmissionNumber = addno.text;
    detail.course = course.text;
    detail.save();
  }
}
