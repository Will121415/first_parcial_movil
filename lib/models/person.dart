import 'package:intl/intl.dart';

class Person {
  String image;
  String name;
  String surname;
  String profession;
  DateTime date;

  Person({this.image, this.name, this.surname, this.profession, this.date});

  getAge() {
    return ((DateTime.now().difference(this.date).inDays) / 365)
        .floor()
        .toString();
  }

  format() {
    return DateFormat.yMMMd().format(this.date);
  }
}
