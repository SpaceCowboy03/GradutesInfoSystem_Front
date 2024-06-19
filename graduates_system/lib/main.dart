import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'StudentsPage.dart';
import 'ProgramsPage.dart';
import 'AcademicWorksPage.dart';
import 'ServicesPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Información de Egresados',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      routes: {
        '/students': (context) => StudentsPage(),
        '/programs': (context) => ProgramsPage(),
        '/academic-works': (context) => AcademicWorksPage(),
        '/services': (context) => ServicesPage(),
      },
    );
  }
}