import 'package:flutter/material.dart';
import 'package:tp1/screens/library_screen.dart';
import '../../widgets/input_decoration.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>(); // cle globale pour valider form

  // Controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  // Méthode pour choisir la date de naissance
  Future<void> _selectBirthDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _birthdateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up'), centerTitle: true),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Image.asset(
                "assets/images/insat_logo.png",
                width: 350,
                height: 150,
              ),
            ),

            // 2. Username
            TextFormField(
              controller: _usernameController,
              decoration: customInputDecoration(
                "username",
                "Enter your username",
                const Icon(Icons.person_3_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'UserName should not be empty';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 3. Email
            TextFormField(
              controller: _emailController,
              decoration: customInputDecoration(
                "Email",
                "Enter Your Email",
                const Icon(Icons.email_outlined),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email should not be empty";
                }
                if (!value.contains('@')) {
                  return 'Invalid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 4. Password
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: customInputDecoration(
                "Password",
                "Enter Your password",
                const Icon(Icons.password_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 5. Birthdate
            TextFormField(
              controller: _birthdateController,
              readOnly: true,
              onTap: () => _selectBirthDate(context),
              decoration: customInputDecoration(
                "Birth Date",
                "Select your birth date",
                const Icon(Icons.calendar_today_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your birth date';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 6. Address
            TextFormField(
              controller: _addressController,
              decoration: customInputDecoration(
                "Address",
                "Enter your address",
                const Icon(Icons.home_outlined),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  String username = _usernameController.text;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Sign Up Successful'),
                        content: Text('Welcome, $username!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LibraryScreen(),
                                ),
                              );
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
