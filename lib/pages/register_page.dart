import 'package:first_parcial/models/person.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  final title;
  Register(this.title);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name, surname, profession, image;

  TextEditingController ctrlName;
  TextEditingController ctrlSurname;
  TextEditingController ctrlProfession;
  TextEditingController ctrlImage;
  DateTime dateInput;

  @override
  void initState() {
    ctrlName = TextEditingController();
    ctrlSurname = TextEditingController();
    ctrlProfession = TextEditingController();
    ctrlImage = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            TextBox(
              controlador: ctrlName,
              label: 'Nombre',
            ),
            TextBox(
              controlador: ctrlSurname,
              label: 'Apellido',
            ),
            TextBox(
              controlador: ctrlProfession,
              label: 'Profesion',
            ),
            TextBox(
              controlador: ctrlImage,
              label: 'URL de Imagen',
            ),
            TextButton(
              onPressed: _datepresent,
              child: Text(
                dateInput == null
                    ? 'Seleccionar Fecha'
                    : 'Fecha: ' + DateFormat.yMMMd().format(dateInput),
                style: TextStyle(color: Colors.blue),
              ),
            ),

            // Boton
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
              child: Text('Save'),
            ),

            //
          ],
        ),
      ),
    );
  }

  _datepresent() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
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
  final label;
  const TextBox({
    this.label,
    Key key,
    @required this.controlador,
  }) : super(key: key);

  final TextEditingController controlador;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: TextField(
          controller: controlador,
          decoration: InputDecoration(
              filled: true,
              labelText: this.label,
              // suffix: Icon(Icons.access_alarm),
              suffix: GestureDetector(
                child: Icon(Icons.close),
                onTap: () {
                  controlador.clear();
                },
              )
              //probar suffix
              ),
          onSubmitted: (String nombres) {
            // cajatexto(context, nombres);
          }),
    );
  }
}
