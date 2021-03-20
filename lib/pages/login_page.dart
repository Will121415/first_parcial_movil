import 'package:first_parcial/models/user.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String user, password;
  User _user;

  TextEditingController controllerUser;
  TextEditingController controllerPassword;

  @override
  void initState() {
    _user = User();
    controllerUser = TextEditingController();
    controllerPassword = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/icon.png',
                  height: 200.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextFied(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextFile(),
              SizedBox(
                height: 30.0,
              ),
              _buttonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextFied() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: controllerUser,
          decoration: InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'ejemplo@correo.com',
              labelText: 'E-mail'),
        ),
      );
    });
  }

  Widget _passwordTextFile() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          controller: controllerPassword,
          decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: '*******',
              labelText: 'Password'),
        ),
      );
    });
  }

  Widget _buttonLogin() {
    // User _user = User();
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 80.0,
            vertical: 15.0,
          ),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 10,
        ),
        onPressed: () {
          user = controllerUser.text;
          password = controllerPassword.text;

          print(user + ' ' + password);
          print(_user.user + ' ' + _user.password);

          if (user.isNotEmpty && password.isNotEmpty) {
            if ((user == _user.user) && (password == _user.password)) {
              print('Bienvenido $user');
            } else {
              print('Usuario y/o Contraseña incorrecta...!');
            }
          } else {
            if (user.isEmpty) {
              print('El campo USER es obligatorio..!');
            } else {
              print('El campo PASSWORD es obligatorio..!');
            }
          }
        },
      );
    });
  }
}
