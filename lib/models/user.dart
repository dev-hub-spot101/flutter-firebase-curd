import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  String username;
  String password;
  String age;
  String address;
  bool validated;

  User(
      {required this.id,
      required this.username,
      required this.password,
      required this.age,
      required this.address,
      required this.validated});

  factory User.create(
      {required String username,
      required String password,
      required String age,
      required String address}) {
    final id = username + password;
    return User(
        id: id,
        username: username,
        password: password,
        age: age,
        address: address,
        validated: false);
  }

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return User(
        id: data?['id'],
        username: data?['username'],
        password: data?['password'],
        age: data?['age'],
        address: data?['address'],
        validated: data?['validated']);
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json?['id'],
        username: json?['username'],
        password: json?['password'],
        age: json?['age'],
        address: json?['address'],
        validated: json?['validated']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "username": username,
      "password": password,
      "age": age,
      "address": address,
      "validated": validated,
    };
  }
}
