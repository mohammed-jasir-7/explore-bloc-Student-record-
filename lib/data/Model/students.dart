import 'package:hive_flutter/adapters.dart';
part 'students.g.dart';

@HiveType(typeId: 0)
class Student extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String addmissionNumber;
  @HiveField(3)
  late String course;
  @HiveField(4)
  final String whoAdd;

  Student(
      {required this.id,
      required this.name,
      required this.addmissionNumber,
      required this.course,
      required this.whoAdd});
}
