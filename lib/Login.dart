import 'package:flutter/material.dart';
import 'package:login/database/cache_helper.dart';
import 'package:login/home.dart';

class LoginScreen extends StatefulWidget {
  static String routename = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obsecure = true;
  GlobalKey<FormState> key = GlobalKey();
  GlobalKey<FormState> key1 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/OIP.jpeg'),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: key,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Colors.blue),
                    prefixIcon: const Icon(
                      Icons.email_rounded,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter an email';
                    } else if (value.contains('@gmail.com') == false) {
                      return 'please enter a valid number';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: key1,
                child: TextFormField(
                  obscuringCharacter: "@",
                  obscureText: obsecure,
                  style: const TextStyle(color: Colors.amberAccent),
                  controller: password,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obsecure = !obsecure;
                          });
                        },
                        icon: obsecure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.blue),
                    prefixIcon: const Icon(
                      Icons.password,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                  validator: (value1) {
                    if (value1!.isEmpty) {
                      return 'please enter your password';
                    }

                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
              onPressed: () {
                if (key.currentState!.validate() &&
                    key1.currentState!.validate()) {
                  Cachehelper.savedate(key: 'email', value: email.text);
                  Cachehelper.savedate(key: 'password', value: password.text);

                  Navigator.pushNamed(context, Home.routename);
                }
              },
              minWidth: 300,
              height: 50,
              color: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200)),
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 25,
            ),
            RichText(
                text: const TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "dont have an account ?",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              TextSpan(
                  text: "sign in",
                  style: TextStyle(color: Colors.red, fontSize: 20)),
            ])),
          ],
        ),
      ),
    ));
  }
}
