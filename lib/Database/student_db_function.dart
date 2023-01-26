import 'package:hive/hive.dart';
import '../data/Model/students.dart';

class Boxes {
  static Box<Student> getdata() {
    return Hive.box<Student>('studentbox');
  }

// insertion
  static insertion(
      {required String name,
      required String addno,
      required String course,
      required String whoadd}) async {
    final stdentObj = Student(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        addmissionNumber: addno,
        course: course,
        whoAdd: whoadd);
    final box = getdata();
    box.add(stdentObj);
  }

  static Delete(int index) async {
    final box = getdata();
    box.delete(index);
  }
}
