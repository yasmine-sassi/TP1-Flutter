import 'package:flutter/material.dart';
import '../../widgets/custom_input_decoration.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> currentKey = GlobalKey<FormState>();

  String username = "";
  String email = "";
  String birthdate = "";
  String adresse = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF216BEB),
        title: const Text(
          "Store INSAT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: currentKey,
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            // IMAGE
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset("assets/images/insat_logo.png", width: 250),
            ),

            // USERNAME
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: CustomInputDecoration(
                  "UserName",
                  "Enter your UserName",
                  const Icon(Icons.person_3_outlined),
                ).customInputDecoration(),
                onSaved: (val) => username = val!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "UserName should not be empty";
                  }
                  return null;
                },
              ),
            ),

            // EMAIL
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: CustomInputDecoration(
                  "Email",
                  "Enter your Email",
                  const Icon(Icons.email_outlined),
                ).customInputDecoration(),
                onSaved: (val) => email = val!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email is required";
                  }
                  if (!value.contains("@")) {
                    return "Invalid email format";
                  }
                  return null;
                },
              ),
            ),

            // BIRTHDATE
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: CustomInputDecoration(
                  "Birthdate",
                  "Enter your Birthdate",
                  const Icon(Icons.calendar_month_outlined),
                ).customInputDecoration(),
                onSaved: (val) => birthdate = val!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Birthdate is required";
                  }
                  return null;
                },
              ),
            ),

            // ADRESSE
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: CustomInputDecoration(
                  "Adresse",
                  "Enter your Adresse",
                  const Icon(Icons.location_on_outlined),
                ).customInputDecoration(),
                onSaved: (val) => adresse = val!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Adresse is required";
                  }
                  return null;
                },
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
                  const Icon(Icons.lock_outline),
                ).customInputDecoration(),
                onSaved: (val) => password = val!,
                validator: (value) {
                  if (value!.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 20),

            // SUBMIT BUTTON
            ElevatedButton(
              onPressed: () {
                if (currentKey.currentState!.validate()) {
                  currentKey.currentState!.save();

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("SignUp"),
                        content: const Text(
                          "User added successfully! check your inbox",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
