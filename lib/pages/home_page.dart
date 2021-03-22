import 'package:first_parcial/models/person.dart';
import 'package:first_parcial/pages/register_page.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  final String user;
  MainApp(this.user);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(user),
    );
  }
}

class HomePage extends StatefulWidget {
  final String user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> persons = [
    Person(
      image:
          'https://aulaweb.unicesar.edu.co/pluginfile.php/77890/user/icon/snap/f1?rev=4113720',
      name: 'Will',
      surname: 'Mora',
      profession: 'Ing. Sistemas',
      date: DateTime(1999, 9, 14),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              widget.user,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () {},
              title: Text(persons[index].name + ' ' + persons[index].surname),
              subtitle: Text(persons[index].profession),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(persons[index].image),
              ),
              trailing: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(persons[index].format()),
                  Text(persons[index].getAge()),
                ],
              ));
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Register('Register Page')))
              .then((value) {
            if (value != null) {
              setState(() {
                persons.add(value);
              });
            }
          });
        },
        tooltip: 'Adicionar Cliente',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
