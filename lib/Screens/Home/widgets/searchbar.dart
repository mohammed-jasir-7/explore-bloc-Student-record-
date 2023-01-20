import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week_5/Database/student_db_function.dart';
import 'package:week_5/Model/students.dart';
import 'package:week_5/Screens/Home/widgets/bodylist.dart';

class Searchbar extends StatefulWidget {
  Searchbar({super.key});
  static ValueNotifier<List<Student>> st = ValueNotifier([]);

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  TextEditingController searchKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              style: GoogleFonts.montserrat(fontSize: 15),
              decoration: InputDecoration(
                  hintText: "search",
                  suffixIcon: Icon(Icons.search),
                  border: InputBorder.none),
              controller: searchKey,
              onChanged: (value) {
                searchStudent(value);
              },
            ),
          ),
          width: 200,
          height: 10,
        ),
      ),
    );
  }

  searchStudent(value) {
    final box = Boxes.getdata();

    var jk =
        box.values.where((element) => element.name.contains(searchKey.text));
    setState(() {
      Searchbar.st.value = jk.toList();
    });

    print("ttttt");
  }
}
