import 'package:cubit_login/presentation/widgets/button_widget.dart';
import 'package:cubit_login/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                      hintText: 'username',
                      obscureText: false,
                    ),

                    // password textfield
                    TextFieldWidget(
                      controller: passwordController,
                      hintText: 'password',
                      obscureText: true,
                    ),

                    // forget password button
                    const Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // login button
                    ButtonWidget(
                      textButton: 'Login',
                      beginColor: Colors.blueAccent,
                      endColor: Colors.blue.shade300,
                      size: const Size(double.infinity, 50),
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
                        ButtonWidget(
                          textButton: 'G',
                          beginColor: Colors.red.shade300,
                          endColor: Colors.redAccent.shade700,
                          size: const Size.square(70),
                        ),
                        ButtonWidget(
                          textButton: 'F',
                          beginColor: Colors.blue.shade400,
                          endColor: Colors.blue.shade900,
                          size: const Size.square(70),
                        ),
                        const ButtonWidget(
                          textButton: 'X',
                          beginColor: Colors.black38,
                          endColor: Colors.black87,
                          size: Size.square(70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),

                    // register
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?\t'),
                        Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
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
