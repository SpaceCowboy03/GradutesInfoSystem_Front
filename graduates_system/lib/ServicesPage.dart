import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  List<String> services = [
    'Servicio 1',
    'Servicio 2',
    'Bolsa de Empleos', // Agregar la opción específica
    'Servicio 3',
    'Servicio 4',
    'Servicio 5',
    'Servicio 6',
    'Servicio 7',
    'Servicio 8',
    'Servicio 9',
    'Servicio 10',
  ];

  TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'Todos'; // Opción de filtro seleccionada
  List<String> filteredServices = [];

  @override
  void initState() {
    super.initState();
    filteredServices.addAll(services);
  }

  void filterServices(String query) {
    filteredServices.clear();
    if (query.isEmpty) {
      filteredServices.addAll(services);
    } else {
      filteredServices.addAll(services.where((service) => service.toLowerCase().contains(query.toLowerCase())));
    }
    applyFilter(_selectedFilter); // Aplicar el filtro actual después de cada búsqueda
  }

  void applyFilter(String filter) {
    if (filter == 'Todos') {
      filteredServices = List.from(services);
    } else if (filter == 'Bolsa de Empleos') {
      filteredServices = services.where((service) => service == 'Bolsa de Empleos').toList();
    } else {
      filteredServices = services.where((service) => service != 'Bolsa de Empleos').toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicios'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: filterServices,
                    decoration: InputDecoration(
                      hintText: 'Buscar servicios...',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: _selectedFilter,
                  onChanged: (value) {
                    setState(() {
                      _selectedFilter = value!;
                      applyFilter(_selectedFilter);
                    });
                  },
                  items: <String>[
                    'Todos',
                    'Bolsa de Empleos',
                    'Otros', // Ejemplo de otra categoría de filtro
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredServices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredServices[index]),
                  subtitle: Text('Descripción del servicio'),
                  onTap: () {
                    // Implementa aquí la navegación o acción al detalle del servicio
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
