import 'package:cubit_login/presentation/widgets/text_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'You\'ve successfully logged in.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextButtonWidget(
              textButton: 'Back',
              beginColor: Colors.blueAccent,
              endColor: Colors.black,
              size: const Size.fromHeight(50),
              onTap: () {
                signUserOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
