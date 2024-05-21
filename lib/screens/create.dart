import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecurd/constants/collection.dart';
import 'package:firebasecurd/models/user.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  final Map<String, dynamic>? user;
  const CreateScreen({super.key, this.user});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _usernameCrt = TextEditingController();
  final _passwordCrt = TextEditingController();
  final _ageCrt = TextEditingController();
  final _addressCrt = TextEditingController();
  late User _user;

  void createUser(User user) async {
    final db = FirebaseFirestore.instance;
    try {
      await db
          .collection(Collection.users)
          .withConverter(
              fromFirestore: User.fromFirestore,
              toFirestore: (value, options) {
                return user.toFirestore();
              })
          .doc(user.id)
          .set(user);

      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  void updateUser(User user) async {
    final db = FirebaseFirestore.instance;
    try {
      await db.collection(Collection.users).doc(widget.user!['id']).delete();
      await db
          .collection(Collection.users)
          .withConverter(
              fromFirestore: User.fromFirestore,
              toFirestore: (value, options) {
                return user.toFirestore();
              })
          .doc(user.id)
          .set(user);

      Navigator.pop(context);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.user);
    if (widget.user != null && widget.user!['id'] != "") {
      // setState(() {
      //   _usernameCrt.text = widget.user!['username'];
      //   _passwordCrt.text = widget.user!['password'];
      //   _ageCrt.text = widget.user!['age'];
      //   _addressCrt.text = widget.user!['address'];
      // });
      _usernameCrt.text = widget.user!['username'];
      _passwordCrt.text = widget.user!['password'];
      _ageCrt.text = widget.user!['age'];
      _addressCrt.text = widget.user!['address'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user != null && widget.user!['id'] != ""
            ? "Edit"
            : "Create"),
        centerTitle: false,
        elevation: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
              keyboardType: TextInputType.text,
              controller: _usernameCrt,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
              keyboardType: TextInputType.text,
              obscureText: true,
              controller: _passwordCrt,
              autocorrect: false,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Age"),
              keyboardType: TextInputType.number,
              controller: _ageCrt,
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Address"),
              keyboardType: TextInputType.number,
              controller: _addressCrt,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _user = User.create(
                        username: _usernameCrt.text,
                        password: _passwordCrt.text,
                        age: _ageCrt.text,
                        address: _addressCrt.text);
                    if (widget.user != null && widget.user!['id'] != "") {
                      updateUser(_user);
                    } else {
                      createUser(_user);
                    }
                  });
                },
                child: Text(widget.user != null && widget.user!['id'] != ""
                    ? "Update"
                    : "Create"))
          ],
        ),
      ),
    );
  }
}
