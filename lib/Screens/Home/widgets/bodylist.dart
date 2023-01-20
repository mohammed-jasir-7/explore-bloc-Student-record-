import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:week_5/Database/student_db_function.dart';
import 'package:week_5/Model/students.dart';
import 'package:week_5/Screens/Home/widgets/searchbar.dart';
import 'package:week_5/Screens/student/student_screen.dart';

class HomeBody extends StatefulWidget {
  HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    print(Searchbar.st.value.isEmpty);
    return ValueListenableBuilder<Box<Student>>(
      valueListenable: Boxes.getdata().listenable(),
      builder: (context, value, _) {
        print("jasirrrrrrrrrrrrrrrrrrrrrrr");
        final data = value.values.toList();
        Searchbar.st.value = value.values.toList();
        return ValueListenableBuilder(
          valueListenable: Searchbar.st,
          builder: (context, value, child) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentDetails(
                                detail: Searchbar.st.value[index]),
                          ));
                    },
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(Searchbar.st.value[index].name),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            data[index].delete();
                          },
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: Searchbar.st.value.length);
          },
        );
      },
    );
    // : ValueListenableBuilder(
    //     valueListenable: Searchbar.st,
    //     builder: (context, value, _) {
    //       var data = value;
    //       return ListView.separated(
    //           itemBuilder: (context, index) {
    //             return GestureDetector(
    //               onTap: () {
    //                 Navigator.pushReplacement(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) =>
    //                           StudentDetails(detail: data[index]),
    //                     ));
    //               },
    //               child: ListTile(
    //                 title: Text(data[index].name),
    //                 trailing: IconButton(
    //                   icon: Icon(
    //                     Icons.delete,
    //                     color: Colors.red,
    //                   ),
    //                   onPressed: () {
    //                     data[index].delete();
    //                   },
    //                 ),
    //               ),
    //             );
    //           },
    //           separatorBuilder: (context, index) => Divider(),
    //           itemCount: data.length);
    //     },
    //   );
  }
}
