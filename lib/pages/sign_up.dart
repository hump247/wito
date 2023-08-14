import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'sing_in.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _selectedItem = 'Arusha';
  String? selectedGender;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _acceptTerms = false;

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate() || !_acceptTerms) {
      return;
    }

    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String phoneNumber = _phoneNumberController.text;
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;
    final String gender = _genderController.text;
    final String region = _regionController.text;

    final url = Uri.parse('http://3.109.82.192/api/auth/register/');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
      'password2': confirmPassword,
      'gender': gender,
      'region': region,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        // Registration successful
        // Perform necessary actions (e.g., save token, navigate to home screen)
        print('Registration successful');
      } else {
        // Registration failed
        // Display error message to the user
        print('Registration failed: ${response.body}');
      }
    } catch (error) {
      // Error occurred during the request
      // Display error message to the user
      print('An error occurred: $error');
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _genderController.dispose();
    _regionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff0070ac),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 69, 40, 0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 61.0,
                      right: 10.0,
                    ),
                  ),
                  const SizedBox(height: 45.0),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/logo/Logo.png',
                          height: 99,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    'Tafadhali jaza taarifa zako',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 15.0),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffeaf2f2),
                        filled: true,
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Jina la kwanza',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffeaf2f2),
                        filled: true,
                        prefixIcon: const Icon(Icons.person),
                        hintText: 'Jina la mwisho',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffeaf2f2),
                        filled: true,
                        prefixIcon: const Icon(Icons.phone),
                        hintText: 'Namba ya Simu',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^0\d{9}$').hasMatch(value)) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffeaf2f2),
                        filled: true,
                        prefixIcon: const Icon(Icons.email),
                        labelText: 'Barua pepe',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter vaili email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Mkoa',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(

                            color: Colors.white,
                            height: 50,
                            child: DropdownButton<String>(
                              value: _selectedItem,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedItem = newValue!;
                                });
                              },
                              items: <String>[
                                'Arusha',
                                'Dodoma',
                                'Mwanza',
                                'Singida'
                              ]
                                  .map<DropdownMenuItem<String>>(
                                    (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Jinsia:',
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                      SizedBox(width: 45),
                      Radio(
                        value: 'male',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        },
                      ),
                      Text('Me',style: TextStyle(color: Colors.white),),
                      Radio(

                        value: 'female',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        },
                      ),
                      Text('Ke',style: TextStyle(fontSize: 16,color: Colors.white),),
                      SizedBox(width: 1),

                    ],
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
                        labelText: 'Nenosiri',
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
                  const SizedBox(height: 5.0),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: const Color(0xffeaf2f2),
                        filled: true,
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Rudia nenosiri',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 0.0),
                  Row(
                    children: [
                      Checkbox(
                        value: _acceptTerms,
                        onChanged: (value) {
                          setState(() {
                            _acceptTerms = value!;
                          });
                        },
                      ),
                      const Text(
                        'Kubali',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Masharti na Sheria'),
                                content: Text(
                                  'Hapa ni sehemu ya masharti na sheria. Soma kwa makini na ukubali kabla ya kuendelea.',
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Sawa'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          'Vigezo na Masharti',
                          style: TextStyle(color: Colors.white30),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 0.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        registerUser();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0070ac),
                      ),
                      child: const Text(
                        'Jisajili',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const SignIn()));
                    },
                    child: const Text(
                      'Je, una akaunti? INGIA',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void registerUser() async {
    if (_formKey.currentState?.validate() ?? false) {
      final url = 'http://3.109.82.192/api/auth/register/';
      final firstName = _firstNameController.text;
      final lastName = _lastNameController.text;
      final phoneNumber = _phoneNumberController.text;
      final email = _emailController.text;
      final password = _passwordController.text;
      final gender = _genderController.text;
      final region = _regionController.text;

      final requestBody = {
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'email': email,
        'password': password,
        'password2': password,
        'gender': gender,
        'region': region,
      };

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        // User registration successful
        final responseBody = jsonDecode(response.body);
        final accountNumber = responseBody['account_number'];
        final message =
            'Thank you for registering. Your account number has been sent to your phone number ($phoneNumber).';

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Registration Successful'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(message),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Account Number: $accountNumber'),
                      IconButton(
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: accountNumber));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                Text('Account number copied to clipboard')),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SignIn()));
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );

        print('User registered successfully');
      } else {
        // User registration failed
        final responseBody = jsonDecode(response.body);
        print(responseBody);
      }
    }
  }
}
