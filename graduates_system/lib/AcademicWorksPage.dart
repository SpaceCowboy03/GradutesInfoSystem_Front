import 'package:flutter/material.dart';

class AcademicWorksPage extends StatefulWidget {
  @override
  _AcademicWorksPageState createState() => _AcademicWorksPageState();
}

class _AcademicWorksPageState extends State<AcademicWorksPage> {
  List<String> academicWorks = [
    'Título del Trabajo 1',
    'Título del Trabajo 2',
    'Título del Trabajo 3',
    'Título del Trabajo 4',
    'Título del Trabajo 5',
    'Título del Trabajo 6',
    'Título del Trabajo 7',
    'Título del Trabajo 8',
    'Título del Trabajo 9',
    'Título del Trabajo 10',
  ];

  List<String> recentPublications = [
    'Publicación reciente 1',
    'Publicación reciente 2',
    'Publicación reciente 3',
    'Publicación reciente 4',
    'Publicación reciente 5',
  ];

  String _selectedFilter = 'Todos'; // Opción de filtro seleccionada
  TextEditingController _searchController = TextEditingController();

  List<String> filteredWorks = [];

  @override
  void initState() {
    super.initState();
    filteredWorks.addAll(academicWorks);
  }

  void filterWorks(String query) {
    filteredWorks.clear();
    if (query.isEmpty) {
      filteredWorks.addAll(academicWorks);
    } else {
      filteredWorks.addAll(academicWorks.where((work) => work.toLowerCase().contains(query.toLowerCase())));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trabajos Académicos'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    controller: _searchController,
                    onChanged: filterWorks,
                    decoration: InputDecoration(
                      hintText: 'Buscar trabajos académicos...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Filtrar por:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: _selectedFilter,
                    onChanged: (value) {
                      setState(() {
                        _selectedFilter = value!;
                        // Aquí implementa la lógica de filtrado según el valor seleccionado
                      });
                    },
                    items: <String>['Todos', 'Tipo 1', 'Tipo 2', 'Tipo 3']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredWorks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredWorks[index]),
                          subtitle: Text('Descripción del trabajo académico'),
                          onTap: () {
                            // Implementa aquí la navegación o acción al detalle del trabajo académico
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Publicaciones Recientes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: recentPublications.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(recentPublications[index]),
                          subtitle: Text('Autor de la publicación'),
                          onTap: () {
                            // Implementa aquí la navegación o acción a la publicación reciente
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
