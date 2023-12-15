import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:thesis_application_v1/auth/auth.dart';
import 'package:thesis_application_v1/components/my_button.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            // BU Logo
            ? Image.asset(
                "assets/images/bu_animation.gif",
                height: 250,
                width: 250,
              )
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "You Only Park Once",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Bicol University",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: LottieBuilder.network(
                          "https://lottie.host/4d3c4e1e-0c5f-41f0-b857-f5f6f1a016d8/D6dncd8NEH.json"),
                    ),
                    const Text(
                      "Detecting Parking Space Availability using YOLO Object Detection and Marker-Based Technology",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    MyButton(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AuthPage(),
                          ),
                        );
                      },
                      text: "Get Started",
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
