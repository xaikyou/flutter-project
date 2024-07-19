import 'package:cubit_login/presentation/widgets/text_button_widget.dart';
import 'package:cubit_login/presentation/widgets/icon_button_widget.dart';
import 'package:cubit_login/presentation/widgets/text_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool errorSignIn = false;

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: usernameController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (_) {
      setState(() {
        errorSignIn = true;
      });
    }
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // set gradient background
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.blue.shade300,
              ],
            ),
          ),

          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // welcome quote
                    const SizedBox(height: 50),
                    const Text(
                      'Welcome.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    const Text(
                      'Glad to see you!',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // username textfield
                    TextFieldWidget(
                      controller: usernameController,
                      hintText: 'Email address or phone number',
                      obscureText: false,
                      onSubmitted: signUserIn,
                    ),

                    // password textfield
                    TextFieldWidget(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      onSubmitted: () => signUserIn(),
                    ),

                    // Error message
                    if (errorSignIn)
                      Text(
                        'Email or password did not match.',
                        style: TextStyle(
                          color: Colors.red.shade700,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    const SizedBox(height: 20),

                    // login button
                    TextButtonWidget(
                      textButton: 'Log in',
                      beginColor: Colors.blueAccent,
                      endColor: Colors.blue.shade300,
                      size: const Size(double.infinity, 50),
                      onTap: () => signUserIn(),
                    ),

                    // forget password button
                    const Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          'Forgotten password?',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),

                    // or continue with
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                        Text('\tOr continue with\t'),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Google + Facebook + Twitter sign
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButtonWidget(
                          iconButton: '../assets/GoogleIcon.png',
                          size: const Size.square(90),
                          onTap: () {},
                        ),
                        IconButtonWidget(
                          iconButton: '../assets/FacebookIcon.png',
                          size: const Size.square(90),
                          onTap: () {},
                        ),
                        IconButtonWidget(
                          iconButton: '../assets/TwitterIcon.png',
                          size: const Size.square(90),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),

                    // register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?\t'),
                        Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
