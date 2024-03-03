import 'package:flutter/material.dart';
import 'package:ngdemo10/services/pref_service.dart';

import '../models/user_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name="No name";
  User? user;
  List<User> userList = [
    User(id: 100, userName: 'Kozim'),
    User(id: 200, userName: 'Nozim'),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // User user = User(id: 111,userName: "Foziljon");
    // Prefs.storeUser(user);
    // loadUser();
    //Prefs.StoreName("Foziljon");
    //_loadName();
    
    Prefs.storeUserList(userList);
    loadUserList();

  }
  
  loadUserList()async{
    List? result =await Prefs.loadUserList();
   setState(() {
     user=result!.first;
   });
  }

  loadUser() async{
    User? result =await Prefs.loadUser();
    setState(() {
      user=result;
    });
  }

  _loadName() async{
    String result =await Prefs.loadName();
    setState(() {
      name=result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        title: Text("Shared Preferences",
          style: TextStyle(fontWeight: FontWeight.bold,
          color: Colors.white
          ),),
      ),
      body: Center(
        child: Text(
          user!=null? user!.toMap().toString():"no user"
        ),
      ),
    );
  }
}
