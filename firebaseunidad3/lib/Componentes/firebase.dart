import 'package:cloud_firestore/cloud_firestore.dart';

List Capitanes = [];
List Coordenada = [];
List Equipos = [];
List Equipo_Has = [];
List Estadio = [];

void getCapitanes() async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Capitanes');

  QuerySnapshot query = await collectionReference.get();

  if (query.docs.length != 0) {
    for (var docs in query.docs) {
      Capitanes.add(docs.data());
    }
  }

  CollectionReference collectionReference2 =
      FirebaseFirestore.instance.collection('Coordenadas');

  QuerySnapshot query2 = await collectionReference2.get();

  if (query2.docs.length != 0) {
    for (var docs in query2.docs) {
      Coordenada.add(docs.data());
    }
  }

  CollectionReference collectionReference3 =
      FirebaseFirestore.instance.collection('Equipo');

  QuerySnapshot query3 = await collectionReference3.get();

  if (query3.docs.length != 0) {
    for (var docs in query3.docs) {
      Equipos.add(docs.data());
    }
  }

  CollectionReference collectionReference4 =
      FirebaseFirestore.instance.collection('Equipo_Has_Estadio');

  QuerySnapshot query4 = await collectionReference4.get();

  if (query4.docs.length != 0) {
    for (var docs in query4.docs) {
      Equipo_Has.add(docs.data());
    }
  }

  CollectionReference collectionReference5 =
      FirebaseFirestore.instance.collection('Estadio');

  QuerySnapshot query5 = await collectionReference5.get();

  if (query5.docs.length != 0) {
    for (var docs in query5.docs) {
      Estadio.add(docs.data());
    }
  }
}
