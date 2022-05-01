import 'package:firebaseunidad3/Componentes/firebase.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Capitan extends StatefulWidget {
  Capitan({Key? key}) : super(key: key);

  @override
  State<Capitan> createState() => _CapitanState();
}

TextEditingController Equipocontroller = TextEditingController();
TextEditingController Nombrecontroller = TextEditingController();

class _CapitanState extends State<Capitan> {
  @override
  Widget build(BuildContext context) {
    return Capitans();
  }

  Widget Capitans() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Equipo(), Nombre(), botones()],
        ),
      ),
    );
  }

  Widget Equipo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: Equipocontroller,
        autocorrect: true,
        decoration: InputDecoration(
          hintText: "Equipo",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          prefixIcon: const Icon(Icons.add_circle_outlined),
        ),
      ),
    );
  }

  Widget Nombre() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
        controller: Nombrecontroller,
        decoration: InputDecoration(
          hintText: "Nombre",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          prefixIcon: const Icon(Icons.auto_stories_outlined),
        ),
      ),
    );
  }

  Widget botones() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[botonRegistrar()],
    );
  }

  Widget botonRegistrar() {
    int ids = Capitanes.length + 1;

    return Container(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            addUser(ids, Nombrecontroller.text.toString(),
                int.parse(Equipocontroller.text.toString()));
          });
        },
        child: const Text("Registrar"),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.green,
          shadowColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
          side: BorderSide(color: Colors.green, width: 1),
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  CollectionReference users =
      FirebaseFirestore.instance.collection('Capitanes');

  Future<void> addUser(int id, String Nombres, int Equ) {
    return users
        .add({'Equipo_id': Equ, 'Nombre': Nombres, 'id': id})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
