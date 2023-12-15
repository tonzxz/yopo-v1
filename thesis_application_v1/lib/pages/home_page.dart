import 'dart:math';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:thesis_application_v1/pages/landing_page.dart';
import 'package:thesis_application_v1/components/my_button.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  // Map
  final Map<int, String> imageMap = {
    1: 'assets/images/bucs1.png',
    2: 'assets/images/bucs2.png',
    3: 'assets/images/bucs3.png',
    4: 'assets/images/bucs4.png',
    5: 'assets/images/bucs5.png',
    6: 'assets/images/bucs6.png',
    7: 'assets/images/bucs7.png',
    8: 'assets/images/bucs8.png',
  };

  String getRandomParkingNumber() {
    // random numbers
    int randomNumber = Random().nextInt(imageMap.length) + 1;

    // Retrieve the corresponding image asset path
    return imageMap[randomNumber] ??
        'assets/images/bucs.png'; // original parking slot
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
                const SizedBox(height: 140),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        'CS Registrar',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              getRandomParkingNumber(), // random image
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => FirstPage(),
                                ),
                              );
                            },
                            text: "Retry",
                          ),
                          const SizedBox(width: 15),
                          MyButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LandingPage(),
                                ),
                              );
                            },
                            text: "Done!",
                          ),
                        ],
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

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  // Map
  final Map<int, String> imageMap = {
    1: 'assets/images/buce1.png',
    2: 'assets/images/buce2.png',
    3: 'assets/images/buce3.png',
    4: 'assets/images/buce4.png',
    5: 'assets/images/buce5.png',
    6: 'assets/images/buce6.png',
    7: 'assets/images/buce7.png',
    8: 'assets/images/buce8.png',
  };

  String getRandomParkingNumber() {
    // generate random number
    int randomNumber = Random().nextInt(imageMap.length) + 1;

    // Retrieve the corresponding image asset path
    return imageMap[randomNumber] ??
        'assets/images/buce.png'; // default image - original map without cars
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
                const SizedBox(height: 140),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        'College of Education',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              getRandomParkingNumber(), // Get a random image
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => FirstPage(),
                                ),
                              );
                            },
                            text: "Retry",
                          ),
                          const SizedBox(width: 15),
                          MyButton(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LandingPage(),
                                ),
                              );
                            },
                            text: "Done!",
                          ),
                        ],
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _recognizedText = "";
  bool _isListening = false;

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  // Define a function to map input strings to pages
  Widget? getPageForText(String text) {
    switch (text) {
      case "College of Nursing":
      case "college of nursing":
      case "Nursing":
      case "nursing":
      case "College of Science":
      case "college of science":
      case "Science":
      case "science":
      case "Registrar":
      case "registrar":
        return FirstPage();
      case "College of Education":
      case "college of education":
      case "college of medicine":
      case "College of Medicine":
      case "Education":
      case "Medicine":
      case "education":
      case "medicine":
      case "Library":
      case "library":
        return SecondPage();
      default:
        return null; // Return null if there's no match
    }
  }

  void navigateToOtherPage(String text) {
    final page = getPageForText(text);
    if (page != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    } else {
      // Handle the case when the input text doesn't match any known page
      // ignore: avoid_print
      print("Page not found for text: $text");
    }
  }

  @override
  void initState() {
    super.initState();
    startListening();
  }

  void startListening() async {
    if (await _speech.initialize()) {
      setState(() {
        _isListening = true;
        _recognizedText = "";
        _speech.listen(onResult: (result) {
          setState(() {
            _recognizedText = result.recognizedWords;
            navigateToOtherPage(
                _recognizedText); // Check for navigation conditions here
          });
        });
      });
    }
  }

  @override
  void dispose() {
    if (_isListening) {
      _speech.stop();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 18, 0, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: IconButton(
                        onPressed: () {
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
                          fontWeight: FontWeight.w900,
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
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: LottieBuilder.network(
                  "https://lottie.host/ea1839ae-7b0f-49b2-9f91-0b7e15d06919/dxYdvNWblL.json",
                ),
              ),
              const SizedBox(height: 30),

              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      'Searching for:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black, // Customize the color as needed
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _recognizedText, // Display _recognizedText, or an empty string if it's null
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors
                            .orange.shade600, // Customize the color as needed
                      ),
                    ),
                  ),
                ],
              )

              // Add the Lottie animation here
            ],
          ),
        ),
      ),
    );
  }
}
