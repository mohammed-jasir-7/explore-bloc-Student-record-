import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:week_5/business_logic/blocs/bloc/student_bloc.dart';
import 'package:week_5/data/Model/students.dart';

import '../../student/student_screen.dart';

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<StudenttBloc>(context).add(StudentInitialEvent());

    return BlocBuilder<StudenttBloc, StudentState>(
      builder: (context, state) {
        log(state.toString());
        if (state is StudentInitial) {
          return CircularProgressIndicator();
        } else if (state is StudentLoad) {
          return StudentList(
            state: state.student,
          );
        } else if (state is StudentSearchState) {
          return StudentList(state: state.searchResult);
        }
        return CircularProgressIndicator();
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

class StudentList extends StatelessWidget {
  const StudentList({Key? key, required this.state}) : super(key: key);
  final List<Student> state;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentDetails(detail: state[index]),
                  ));
            },
            child: Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(state[index].name),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 241, 118, 109),
                  ),
                  onPressed: () {
                    BlocProvider.of<StudenttBloc>(context)
                        .add(DeleteEvent(index: state[index].key));
                  },
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: state.length);
  }
}
