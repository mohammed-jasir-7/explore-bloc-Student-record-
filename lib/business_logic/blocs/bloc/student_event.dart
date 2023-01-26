part of 'student_bloc.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();
}

// initial event
class StudentInitialEvent extends StudentEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

//add event
class AddEvent extends StudentEvent {
  final String name, addmissionNo, course, whoAdd;

  const AddEvent(
      {required this.name,
      required this.addmissionNo,
      required this.course,
      required this.whoAdd});
  @override
  List<Object?> get props => [name, addmissionNo, course, whoAdd];
}

// edit event
class EditEvent extends StudentEvent {
  final String name, addmissionNo, course, whoAdd, id;
  final int index;

  const EditEvent(
      {required this.name,
      required this.id,
      required this.index,
      required this.addmissionNo,
      required this.course,
      required this.whoAdd});

  @override
  List<Object?> get props => throw UnimplementedError();
}

//delete event
class DeleteEvent extends StudentEvent {
  final int index;

  const DeleteEvent({required this.index});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class SearchEvent extends StudentEvent {
  final String query;

  SearchEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
