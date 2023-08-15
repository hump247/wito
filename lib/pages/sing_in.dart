import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wito_app/pages/sign_up.dart';
import 'package:wito_app/pages/verify.dart';
import 'package:wito_app/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../home_page_bottom.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final databaseReference = FirebaseDatabase.instance.reference();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
    void _checkCredentials() {
      String username = _numberController.text;
      String password = _passwordController.text;

      databaseReference.child('users').child(username).once().then((DatabaseEvent event) {
        DataSnapshot snapshot = event.snapshot;
        dynamic value = snapshot.value; // Cast to dynamic
        if (value != null && value is Map && value['password'] == password) {
          // Navigate to the next page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {showToast("Enter correct credentials");
        }
      });
    }


  @override
  void initState() {
    super.initState();
    _numberController.addListener(updateFormattedResult);
  }

  void updateFormattedResult() {
    String input = _numberController.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digit characters
    String formattedResult = '';

    if (input.isNotEmpty) {
      formattedResult += input.substring(0, input.length.clamp(0, 4));

      if (input.length > 4) {
        formattedResult += '-' + input.substring(4, input.length.clamp(4, 8));

        if (input.length > 8) {
          formattedResult += '-' + input.substring(8, input.length.clamp(8, 12));
        }
      }
    }

    setState(() {
      _numberController.value = _numberController.value.copyWith(
        text: formattedResult,
        selection: TextSelection.collapsed(offset: formattedResult.length),
      );
    });
  }


  final _formKey = GlobalKey<FormState>();






  /*Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      final accountNumber = _nidaNumberController.text.toString();
      final password = _passwordController.text.toString();

      // Authenticating User...
     // FirebaseAuth.instance.createUserWithEmailAndPassword(email: accountNumber, password: password)

      final url = Uri.parse('http://3.109.82.192/api/auth/');
      final headers = {'Content-Type': 'application/json'};
      final body = json.encode({
        'account_number': accountNumber,
        'password': password,
      });

      try {
        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);

          // Extract the access token and refresh token from the response
          final accessToken = responseData['access'];
          final refreshToken = responseData['refresh'];
          final csrfToken = responseData['csrf_token'];

          // Show success message and print the response
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Success'),
                content: Text('Login successful! Please verify your account:'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigate to the OTP screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => OtpScreen(accessToken: accessToken, refreshToken: refreshToken)),
                      );
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
          print(response.body);
        } else {
          final errorData = json.decode(response.body);

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error'),
                content: Text(errorData['detail']),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } catch (error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('An error occurred. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }*/
  void showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xff0070ac),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(45, 134, 45, 45),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(

                      children: [
                        SizedBox(

                          width: double.infinity,
                          child: Column(

                            children: [
                              Image.asset(
                                'assets/logo/Logo.png',
                                height: 90,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 50.0),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _numberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffeaf2f2),
                              filled: true,
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Namba ya akaunti',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'jaza Akaunti Namba';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: const Color(0xffeaf2f2),
                              filled: true,
                              prefixIcon: const Icon(Icons.lock),
                              hintText: 'Nenosiri',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                _checkCredentials();
                              },
                              child: Text('LOG IN'),
                            ),

                            const SizedBox(width: 10),

                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => Registration()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff0070ac),
                                    minimumSize: Size(85, 45)
                                ),
                                child: const Text(
                                  'Jisajili',
                                  style: TextStyle(fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Container(
                              decoration: BoxDecoration(

                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff0070ac),
                                    minimumSize: Size(15, 45)),
                                child: const Text(
                                  'Mgeni',
                                  style: TextStyle(fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 210),


                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center, // Center the column content vertically
                            children: [
                              const SizedBox(height: 217),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // Center the icon and text horizontally
                                  children: [
                                    Image.asset(
                                      'assets/logo/tanzania_flag.png',
                                      width: 13,
                                      height: 13,
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'WITO © 2023',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ));
  }
}
