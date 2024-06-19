import 'package:flutter/material.dart';
import 'StudentsPage.dart';
import 'ProgramsPage.dart';
import 'AcademicWorksPage.dart';
import 'ServicesPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sistema de Información de Egresados'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú Principal',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Estudiantes'),
              onTap: () {
                Navigator.pushNamed(context, '/students');
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Programas Académicos'),
              onTap: () {
                Navigator.pushNamed(context, '/programs');
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Trabajos Académicos'),
              onTap: () {
                Navigator.pushNamed(context, '/academic-works');
              },
            ),
            ListTile(
              leading: Icon(Icons.local_activity),
              title: Text('Servicios'),
              onTap: () {
                Navigator.pushNamed(context, '/services');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Bienvenido al Sistema de Información de Egresados',
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              '../images/cyt.jpg',
              height: 500,
              width: 900,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}