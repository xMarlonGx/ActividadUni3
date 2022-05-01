import 'package:flutter/material.dart';

Widget Coordenadas() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Longitud(), Latitud(), botones()],
      ),
    ),
  );
}

Widget Longitud() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
      autocorrect: true,
      decoration: InputDecoration(
        hintText: "Longitud",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        prefixIcon: const Icon(Icons.numbers),
      ),
    ),
  );
}

Widget Latitud() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Latitud",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        prefixIcon: const Icon(Icons.numbers),
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
  return Container(
    child: ElevatedButton(
      onPressed: () {},
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
