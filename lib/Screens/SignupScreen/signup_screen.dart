import 'package:flutter/material.dart';
import 'package:tp1/Widgets/custom_input_decoration.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "/signup";

  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> currentKey = GlobalKey();

  String username = "";
  String email = "";
  String password = "";
  String address = "";
  String birthdate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignUp")),
      body: Form(
        key: currentKey,
        child: ListView(
          padding: EdgeInsets.all(12),
          children: [
            // IMAGE
            Image.asset("assets/images/insat_logo.png"),

            // USERNAME
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: CustomInputDecoration(
                  "UserName",
                  "Enter your User Name",
                  Icon(Icons.person),
                ).customInputDecoration(),
                onSaved: (v) => username = v!,
              ),
            ),

            // EMAIL
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: CustomInputDecoration(
                  "Email",
                  "Enter your Email",
                  Icon(Icons.email_outlined),
                ).customInputDecoration(),
                onSaved: (v) => email = v!,
              ),
            ),

            // PASSWORD
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                obscureText: true,
                decoration: CustomInputDecoration(
                  "Password",
                  "Enter your Password",
                  Icon(Icons.lock_outline),
                ).customInputDecoration(),
                onSaved: (v) => password = v!,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: CustomInputDecoration(
                  "Birthdate",
                  "Enter your Birthdate",
                  Icon(Icons.calendar_today),
                ).customInputDecoration(),
                onSaved: (v) => birthdate = v!,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: CustomInputDecoration(
                  "Address",
                  "Enter your Address",
                  Icon(Icons.location_on),
                ).customInputDecoration(),
                onSaved: (v) => address = v!,
              ),
            ),

            // SUBMIT BUTTON
            ElevatedButton(
              onPressed: () {
                if (currentKey.currentState!.validate()) {
                  currentKey.currentState!.save();
                }
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
