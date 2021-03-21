class Person {
  String image;
  String name;
  String surname;
  String profession;
  DateTime date;
  int age;

  Person({this.image, this.name, this.surname, this.profession, this.date});

  getAge(DateTime date) {
    return ((DateTime.now().difference(date).inDays) / 365).floor();
  }

  toString() {
    return date.year.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.day.toString();
  }
}
