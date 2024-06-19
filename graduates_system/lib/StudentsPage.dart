import 'package:flutter/material.dart';

class StudentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sección de Estudiantes'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200, // Espacio para gráficos - puedes ajustar el tamaño según sea necesario
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  'Aquí podrás agregar gráficos y más datos relacionados con los estudiantes',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Otros datos relacionados con estudiantes:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Aquí puedes agregar más widgets para mostrar información adicional
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Nombre: Juan Pérez'),
              subtitle: Text('Carrera: Ingeniería Informática'),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email: juan.perez@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Ubicación: Bogotá, Colombia'),
            ),
          ],
        ),
      ),
    );
  }
}
