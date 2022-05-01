import 'package:flutter/material.dart';
import 'package:firebaseunidad3/main.dart';

enum SingingCharacter { si, no }
SingingCharacter? _character = SingingCharacter.si;

class Equi extends StatefulWidget {
  Equi({Key? key}) : super(key: key);

  @override
  State<Equi> createState() => _EquipoState();
}

class _EquipoState extends State<Equi> {
  Widget Equi() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Entrenador(),
            Nombre(),
            Web(),
            EnprimeraText(),
            EnprimeraRadio(),
            botones()
          ],
        ),
      ),
    );
  }

  Widget EnprimeraRadio() {
    return Column(
      children: <Widget>[
        RadioListTile<SingingCharacter>(
          title: const Text('Si'),
          value: SingingCharacter.si,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('No'),
          value: SingingCharacter.no,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Equi();
  }
}

Widget Entrenador() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
      autocorrect: true,
      decoration: InputDecoration(
        hintText: "Entrenador",
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

Widget Web() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Web",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        prefixIcon: const Icon(Icons.auto_stories_outlined),
      ),
    ),
  );
}

Widget EnprimeraText() {
  return Padding(
    padding: const EdgeInsets.only(right: 235, top: 8),
    child: Text(
      "Esta en primera: ",
      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 100, 100, 100)),
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
