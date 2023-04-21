import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //By default text is aligned in center of the appbar
        //centerTitle : false is used remove the above property
        //hence alignment of the text in appbar can be done
        backgroundColor: Colors.purple,
        centerTitle: false,
        title: const Text(
          'Wallpapers',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: formKey,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Please enter details to register'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              buildNameField(),
              const SizedBox(
                height: 20,
              ),
              buildEmailField(),
              const SizedBox(
                height: 20,
              ),
              buildMobileNumberField(),
              const SizedBox(
                height: 20,
              ),
              buildPasswordField(),
              const SizedBox(
                height: 20,
              ),
              buildConfirmPasswordField(),
              const SizedBox(
                height: 20,
              ),
              buildSubmitButtonField(),
              const SizedBox(
                height: 20,
              ),
              buildLoginField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Name',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (!RegExp(r"[a-z A-Z]").hasMatch(value!)) {
          return 'Wrong Name Format,Try Again';
        }
      },
    );
  }

  Widget buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (!RegExp(r"[a-z 0-9]+@+[a-z]").hasMatch(value!)) {
          return 'Wrong Email Format,Try Again';
        }
      },
    );
  }

  Widget buildMobileNumberField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Mobile',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (!RegExp(r"[a-z A-Z]").hasMatch(value!)) {
          return 'Wrong Mobile Number Format,Try Again';
        }
      },
    );
  }

  Widget buildPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildConfirmPasswordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget buildSubmitButtonField() {
    return SizedBox(
      width: 500,
      height: 60,
      child: ElevatedButton(
          onPressed: () {
            submitForm();
          },
          child: const Text('Submit')),
    );
  }

  Widget buildLoginField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account ?'),
        TextButton(
            onPressed: () {
              context.beamToNamed('/login_screen');
            },
            child: const Text('Login')),
      ],
    );
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {}
  }
}
