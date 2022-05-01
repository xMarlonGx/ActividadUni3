// ignore_for_file: unnecessary_new

import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseunidad3/Componentes/Coordenadas.dart';
import 'package:firebaseunidad3/Componentes/Equipo.dart';
import 'package:flutter/material.dart';

import 'Componentes/Registro.dart';
import 'Componentes/firebase.dart';
import 'Componentes/Equipo.dart';

int _paginaActual = 0;
int activoMenu2 = 0;
List menu_home = ["Capitanes", "Equipo", "Coordenadas", "Has", "Estadio"];

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

enum SingingCharacter { lafayette, jefferson }
SingingCharacter? _character = SingingCharacter.lafayette;

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
    return SingleChildScrollView(
        child: Column(
      children: [
        // ignore: prefer_const_constructors
        SizedBox(
          height: 10,
        ),
        // bloque 1
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(menu_home.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              activoMenu2 = index;
                            });
                          },
                          child: Text(menu_home[index]),
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.white,
                              elevation: 0,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(35.0),
                              ),
                              primary: activoMenu2 == index
                                  ? Colors.blue
                                  : Color.fromARGB(255, 236, 236, 236),
                              onPrimary: activoMenu2 == index
                                  ? Color.fromARGB(255, 236, 236, 236)
                                  : Colors.blue),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            )),
        //Bloque 2
        // ignore: prefer_const_constructors
        SizedBox(
          height: 10,
        ),
        // bloque 3

        activoMenu2 == 0
            ? Capitan()
            : activoMenu2 == 1
                ? Equi()
                : activoMenu2 == 2
                    ? Coordenadas()
                    : Text("data")
      ],
    ));
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
