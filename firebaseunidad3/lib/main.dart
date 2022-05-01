import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Componentes/firebase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        title: Text("Equipos"),
      ),
      body: Body(),
    );
  }

  Widget Body() {
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
          ],
        );
      }),
    ));
  }
}
