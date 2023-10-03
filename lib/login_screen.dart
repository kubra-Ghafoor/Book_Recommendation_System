import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'authService.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

   @override
  Widget build(BuildContext context) {
     signIn() async {
    final User? user=await authService.signIn(
    emailController.text,
    passwordController.text);
      if(user != null) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign IN")));
      }

      // Navigate to the HomeScreen after successful login
    Navigator.pushReplacementNamed(context, '/home');

  }

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.purple[900]!, Colors.purple[800]!, Colors.purple[400]!]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80,),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 60,),
                       AnimatedOpacity(
  opacity: 1.0, 
  duration: const Duration(seconds: 1), 
  curve: Curves.easeInOut, 
  child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(88, 22, 94, 0.298),
          blurRadius: 20,
          offset: Offset(0, 10),
        )
      ],
    ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                ),
                                child: TextField(
                                  controller: emailController, 
                                  decoration: const InputDecoration(
                                    hintText: "Email or Phone number",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                                ),
                                child: TextField(
                                  controller: passwordController, 
                                  decoration: const InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                        const SizedBox(height: 20.0),
                        Column(
  children: [
    ElevatedButton(
      onPressed: () {
        signIn();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 2,
        minimumSize: const Size(200, 50),
      ),
      child: const Text(
        "Login",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
    const Text(
      'Forgot Password?',
      style: TextStyle(color: Colors.blueGrey),
    ),
  ],
),

                        const SizedBox(height: 10.0),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text(
                            "Don't have an account? Sign Up",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}