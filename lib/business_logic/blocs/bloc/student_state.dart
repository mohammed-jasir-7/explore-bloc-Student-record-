part of 'student_bloc.dart';

abstract class StudentState extends Equatable {
  const StudentState();
}

//initial
class StudentInitial extends StudentState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//loading
class StudentLoad extends StudentState {
  final List<Student> student;

  StudentLoad({required this.student});
  @override
  List<Object> get props => [student];
}

class StudentAdd extends StudentState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StudentSearchState extends StudentState {
  final List<Student> searchResult;

  StudentSearchState({required this.searchResult});

  @override
  // TODO: implement props
  List<Object> get props => [searchResult];
}

class StudentDetailsState extends StudentState {
  final Student details;
  final int index;

  StudentDetailsState({required this.details, required this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [details];
}
