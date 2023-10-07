import 'package:flutter/material.dart';
import 'package:flutter_authentication/authService.dart';
import 'package:flutter_authentication/user-provider.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  final AuthService authService = AuthService();
  Header({super.key});

  @override
  Widget build(BuildContext context) {
    signOut(Function setUser) async {
      await authService.signOut();
      setUser(null);
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route route) => false);
    }

    void _showCustomPopup(BuildContext context, String? username, String? email,
        Function setUser) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            contentPadding: EdgeInsets.zero,
            content: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: EdgeInsets.zero,
                child: SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      // Purple half
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 150,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                colors: [
                                  Colors.purple[900]!,
                                  Colors.purple[800]!,
                                  Colors.purple[400]!
                                ]),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                      // White half
                      Positioned(
                        top: 100,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Username: $username',
                                  style: const TextStyle(fontSize: 14)),
                              Text('Email: $email',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[700])),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  signOut(setUser);
                                  Navigator.of(context)
                                      .pop(); // Close the popup
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple[900],
                                  elevation: 2,
                                ),
                                child: const Text('Logout'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Image in the center
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Image.asset(
                            'images/user.png',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Consumer<UserProvider>(builder: (context, value, child) {
      return Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.purple[900]!,
            Colors.purple[800]!,
            Colors.purple[400]!
          ]),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/home'),
                child: const Text(
                  'My Next Read',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => _showCustomPopup(context,
                    value.user?.displayName, value.user?.email, value.setUser),
              )
            ],
          ),
        ),
      );
    });
  }
}
