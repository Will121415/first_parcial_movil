import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  final title;
  Register(this.title);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String name, surname, phone;

  TextEditingController controllerName;
  TextEditingController controllerSurname;
  TextEditingController controllerPhone;
  DateTime dateInput;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    controllerPhone = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            TextBox(
              controlador: controllerName,
              label: 'Nombre',
            ),
            TextBox(
              controlador: controllerSurname,
              label: 'Apellido',
            ),
            TextBox(
              controlador: controllerPhone,
              label: 'Telefono',
            ),
            TextButton(
              onPressed: _datepresent,
              child: Text(
                dateInput == null
                    ? 'Establecer Fecha'
                    : DateFormat.yMMMd().format(dateInput),
                style: TextStyle(color: Colors.blue),
              ),
            ),

            // Boton
            ElevatedButton(
              onPressed: () {
                name = controllerName.text;
                surname = controllerSurname.text;
                phone = controllerPhone.text;

                if (name.isNotEmpty && surname.isNotEmpty) {
                  // Navigator.pop(context,
                  //     Client(name: name, surname: surname, phone: phone));
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
