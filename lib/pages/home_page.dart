import 'package:first_parcial/models/person.dart';
import 'package:first_parcial/pages/register_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(widget: widget),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Register('Register Page')));
              },
              title: Text(persons[index].name + ' ' + persons[index].surname),
              subtitle: Text(persons[index].profession),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(persons[index].image),
              ),
              trailing: Text(persons[index].toString() +
                  '\n       ' +
                  persons[index].getAge(persons[index].date).toString()),
            );
          },
        ));
  }
}
