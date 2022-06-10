import 'package:final_form/constant/colors.dart';
import 'package:final_form/screens/registration.dart';
import 'package:final_form/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 180,),
            Text("Login", style: TextStyle(color: Mycolor.orange, fontSize: 24)),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextForm(
                      textlabel: "email",
                      iconPrefix: Icon(Icons.email),
                      changelabel: Text("username"),
                    ),
                    TextForm(
                      textlabel: "password",
                      iconPrefix: Icon(Icons.lock),
                    ),
                    ElevatedButton(onPressed: login, child: Text("Login")),
                  ],
                )),
            SizedBox(height: MediaQuery.of(context).size.height*.4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Mycolor.orange,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            )
          ],
      ),
    ),
        ));
  }

  login() {
    if (formKey.currentState!.validate()) {
      return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: Text("hurray"),
          content: Row(
            children: [
              Text("Logged in succesful"),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Ok'))
            ],
          ),
        ),
      );
    }
    return null;
  }
}
