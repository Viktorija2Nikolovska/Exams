import 'package:exams/homeExam.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'main.dart';



class MyLoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<MyLoginPage> {


  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  String email = "user@gmail.com";
  String password = "123";

  Future checkLogin()async{
    if (emailController.text == email && passController.text == password) {
      
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', emailController.text);
     
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(),),);
       ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login successful')));
  
    }else{
         ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Username & Password Invalid!')));
 
    }
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Login',style: TextStyle(fontSize: 25 ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(labelText:'Username'),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passController,
              decoration: InputDecoration(labelText:'Password'),),
          ),
          SizedBox(height: 10,),
          MaterialButton(
            color: Colors.pink,
            onPressed: (){
            checkLogin();
          },child: Text('Login',style: TextStyle(color: Colors.white)),),
        ],
      ),
    );
  }
}




// // save() async {
// //   await MyApp.init();
// //   localStorage.setString('email', emailController.text.toString());
// //   localStorage.setString('password', pwdController.text.toString());

// // }