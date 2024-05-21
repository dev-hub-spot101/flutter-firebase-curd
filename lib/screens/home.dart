import 'package:firebasecurd/constants/collection.dart';
import 'package:firebasecurd/screens/create.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<dynamic> result = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    fetchData();
  }

  fetchData() async {
    _isLoading = true;
    final db = FirebaseFirestore.instance;
    var snap = await db.collection(Collection.users).get();
    print(snap);
    List<dynamic> resultdata = snap.docs.map((doc) => doc.data()).toList();
    print(resultdata);
    setState(() {
      _isLoading = false;
      result = resultdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        centerTitle: false,
        title: Text("Home",
            style: TextStyle(
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateScreen()))
                    .then((data) => fetchData());
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: result.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.person),
                title: Text(result[index]['username']),
                subtitle: Text(result[index]['address']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreateScreen(user: result[index])))
                              .then((data) => fetchData());
                        },
                        icon: Icon(Icons.edit, color: Colors.blue)),
                    IconButton(
                        onPressed: () {
                          deleteDialog(context, result[index]['id']);
                        },
                        icon: Icon(Icons.delete, color: Colors.red))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  deleteDialog(BuildContext context, id) {
    print(id);
    return showDialog(
      context: context,
      builder: (param) {
        return AlertDialog(
          title: const Text(
            "Are you sure to delete!",
            style: TextStyle(color: Colors.teal, fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final db = FirebaseFirestore.instance;
                await db.collection(Collection.users).doc(id).delete();
                await fetchData();
                Navigator.pop(context);
              },
              child: const Text("Delete"),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16)),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16)),
            )
          ],
        );
      },
    );
  }
}
