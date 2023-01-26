import '../data/Model/users.dart';

class DBFunctions {
  List<Users> usersLists = [];
  final user =
      Users(userName: "userone", password: "1234", "assets/images/1.png");
  final user2 =
      Users(userName: "user2", password: "1234", "assets/images/user2.webp");
  addUser() {
    usersLists.add(user);
    usersLists.add(user2);
  }
}
