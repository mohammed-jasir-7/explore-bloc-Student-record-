import 'package:week_5/Database/student_db_function.dart';

import '../Model/students.dart';

class StudentRepository {
  //return search result
  Future<List<Student>> searchStudent(String query) async {
    final stuentlist = Boxes.getdata();
    final q = query.toLowerCase().trim();
    var searchResult = stuentlist.values
        .where((element) => element.name.toLowerCase().contains(q));

    return searchResult.toList();
  }

  Future updation(Student model, int key) async {
    final stuentlist = Boxes.getdata();
    stuentlist.put(key, model);
  }
}
