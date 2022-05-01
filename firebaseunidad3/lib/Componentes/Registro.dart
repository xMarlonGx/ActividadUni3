import 'package:flutter/material.dart';

Widget registro() {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Usuario(),
          Correo(),
          Password(),
          Nombre(),
          Apellido(),
          botones()
        ],
      ),
    ),
  );
}

Widget Usuario() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
      autocorrect: true,
      decoration: InputDecoration(
        hintText: "Usuario",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        prefixIcon: const Icon(
          Icons.email,
        ),
      ),
    ),
  );
}

Widget Password() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        prefixIcon: const Icon(Icons.password),
      ),
    ),
  );
}

Widget Correo() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Correo",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        prefixIcon: const Icon(Icons.person),
      ),
    ),
  );
}

Widget Nombre() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
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

Widget Apellido() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Apellido",
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