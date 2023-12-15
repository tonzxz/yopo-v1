import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thesis_application_v1/components/my_card.dart';
import 'package:thesis_application_v1/pages/landing_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

// logout user

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Add the text "Choose a College"
                Padding(
                  padding: const EdgeInsets.fromLTRB(13, 18, 0, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: IconButton(
                          onPressed: () {
                            // Handle custom back action here
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(42),
                        child: Text(
                          "Which College?",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            // You can adjust the font size
                            fontWeight:
                                FontWeight.w900, // You can adjust the style
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: IconButton(
                          onPressed: logout,
                          icon: const Icon(Icons.logout),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
