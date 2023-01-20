import 'package:hive/hive.dart';
import 'package:week_5/Model/students.dart';
import 'package:week_5/Model/users.dart';

class Boxes {
  static Box<Student> getdata() {
    return Hive.box<Student>('studentbox');
  }
}
