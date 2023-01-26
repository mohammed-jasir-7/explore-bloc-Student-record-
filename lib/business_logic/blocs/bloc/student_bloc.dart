import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_5/Database/student_db_function.dart';
import 'package:week_5/data/repositories/student_repository.dart';

import '../../../data/Model/students.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudenttBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository searchrs = StudentRepository();
  List<Student> student = [];
  StudenttBloc() : super(StudentInitial()) {
    on<StudentInitialEvent>((event, emit) async {
      final box = Boxes.getdata().values.toList();
      student.clear();
      student.addAll(box);
      emit(StudentInitial());
      emit(StudentLoad(student: student));
    });

    on<AddEvent>((event, emit) async {
      await Boxes.insertion(
          name: event.name,
          addno: event.addmissionNo,
          course: event.course,
          whoadd: event.whoAdd);

      //emit(StudentLoad(student: cc.student));
      add(StudentInitialEvent());

      // emit(StudentLoad(student: student));
    });
// delete event
    on<DeleteEvent>((event, emit) async {
      print(event.index);
      log("message");
      Boxes.Delete(event.index);
      add(StudentInitialEvent());
    });
    //search event
    on<SearchEvent>((event, emit) async {
      log(event.query);

      var searchdata = await searchrs.searchStudent(event.query);
      log(searchdata.length.toString());
      emit(StudentSearchState(searchResult: searchdata));
      //emit(StudentSearchState(searchResult: searchdata));
    });
    on<EditEvent>((event, emit) async {
      final studentObj = Student(
          id: event.id,
          name: event.name,
          addmissionNumber: event.addmissionNo,
          course: event.course,
          whoAdd: event.whoAdd);
      await searchrs.updation(studentObj, event.index);
      emit(StudentDetailsState(details: studentObj, index: event.index));
    });
  }
}
