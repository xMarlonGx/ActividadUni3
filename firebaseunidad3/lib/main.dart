import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Componentes/Registro.dart';
import 'Componentes/firebase.dart';

int _paginaActual = 0;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Unidad 3",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCapitanes();
    print(Capitanes.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Equipos"),
      ),
      bottomNavigationBar: botonesFooter(),
      body: getPaginas(),
    );
  }

  Widget Add() {
    return Container(child: registro());
  }

  Widget Edit() {
    return Container(child: Text("asdas"));
  }

  Widget Delete() {
    return Container(child: Text("asdas"));
  }

  Widget getPaginas() {
    return IndexedStack(
      index: _paginaActual,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Add(),
        Edit(),
        Delete(),
        Listado(),
      ],
    );
  }

  Widget botonesFooter() {
    List items = [
      Icons.add_circle,
      Icons.edit,
      Icons.delete,
      Icons.list,
    ];
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
                onPressed: () {
                  setState(() {
                    _paginaActual = index;
                  });
                },
                icon: Icon(
                  items[index],
                  color: _paginaActual == index ? Colors.black87 : Colors.white,
                ));
          }),
        ),
      ),
    );
  }

  Widget Listado() {
    return Center(
        child: Column(
      children: List.generate(Capitanes.length, (index) {
        return Column(
          children: [
            Container(
                child: Text("Capitan: " +
                    Capitanes[index]['Nombre'] +
                    " Equipo: " +
                    Equipos[index]['Nombre'])),
            Container(
                child: Text("Entrenador: " +
                    Equipos[index]['Entrenador'] +
                    " Web: " +
                    Equipos[index]['web'])),
            Container(
                child: Text("Estadio: " +
                    Estadio[index]['Nombre'] +
                    " Capacidad: " +
                    Estadio[index]['Capacidad'].toString())),
            Container(
                child: Text("Coordenadas: Latitud: " +
                    Coordenada[index]['latitud'].toString() +
                    " Longitud: " +
                    Coordenada[index]['Longitud'].toString())),
          ],
        );
      }),
    ));
  }
}
