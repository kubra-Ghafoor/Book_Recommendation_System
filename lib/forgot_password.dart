import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Colors.purple[900]!, Colors.purple[800]!, Colors.purple[400]!],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(10.0),
          constraints: BoxConstraints(maxHeight: 250,maxWidth: 450), // Set maximum width for the container
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(88, 22, 94, 0.298),
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            children: <Widget>[
             
             Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: TextField(
    controller: emailController,
    decoration: InputDecoration(
      hintText: "Email or Phone number",
      hintStyle: TextStyle(color: Colors.grey),
       enabledBorder: UnderlineInputBorder( //<-- SEE HERE
      borderSide: BorderSide(
          width: 3, color: Colors.grey), 
          
    ),

border: InputBorder.none,

      
    ),
  ),
),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'We have sent an email to recover your password. Please check your email.',
                        ),
                      ),
                    );
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Error: $error',
                        ),
                      ),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Decreased border radius
                  ),
                  elevation: 2,
                  minimumSize: Size(260, 55), // Decreased button size
                ),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
