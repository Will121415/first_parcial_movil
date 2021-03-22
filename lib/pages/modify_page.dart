import 'package:first_parcial/models/person.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Modify extends StatefulWidget {
  final Person person;
  Modify(this.person, {Key key}) : super(key: key);

  @override
  _Modify createState() => _Modify();
}

class _Modify extends State<Modify> {
  String name, surname, profession, image;

  TextEditingController ctrlName;
  TextEditingController ctrlSurname;
  TextEditingController ctrlProfession;
  TextEditingController ctrlImage;
  DateTime dateInput;

  @override
  void initState() {
    Person p = widget.person;

    ctrlName = TextEditingController(text: p.name);
    ctrlSurname = TextEditingController(text: p.surname);
    ctrlProfession = TextEditingController(text: p.profession);
    ctrlImage = TextEditingController(text: p.image);
    dateInput = p.date;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
          title: 'Modify App',
          theme: ThemeData(
            primaryColor: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text('Modify Page'),
            ),
            body: ListView(
              children: [
                TextBox(controller: ctrlName, label: 'Nombre'),
                TextBox(
                  controller: ctrlSurname,
                  label: 'Apellido',
                ),
                TextBox(controller: ctrlProfession, label: 'Profesion'),
                TextBox(controller: ctrlImage, label: 'Image'),
                TextButton(
                  onPressed: _datepresent,
                  child: Text(
                    dateInput == null
                        ? 'Seleccionar Fecha'
                        : 'Fecha: ' + DateFormat.yMMMd().format(dateInput),
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    name = ctrlName.text;
                    surname = ctrlSurname.text;
                    profession = ctrlProfession.text;
                    image = ctrlImage.text;

                    if (name.isNotEmpty &&
                        surname.isNotEmpty &&
                        profession.isNotEmpty &&
                        image.isNotEmpty) {
                      Navigator.pop(
                          context,
                          Person(
                              image: image,
                              name: name,
                              surname: surname,
                              profession: profession,
                              date: dateInput));
                    }
                  },
                  child: Text('Actualizar'),
                ),
              ],
            ),
          )),
    );
  }

  _datepresent() {
    showDatePicker(
            context: context,
            initialDate: dateInput,
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          dateInput = value;
          print(value);
        });
      }
    });
  }
}

class TextBox extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const TextBox({
    this.label,
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            labelText: this.label,
            suffix: GestureDetector(
              child: Icon(Icons.close),
              onTap: () => controller.clear(),
            )),
      ),
    );
  }
}
