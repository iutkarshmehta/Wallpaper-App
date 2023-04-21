import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('Please login to your account'),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              buildEmailField(),
              const SizedBox(
                height: 20,
              ),
              buildPasswordField(),
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

  Widget buildEmailField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
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

  Widget buildSubmitButtonField() {
    return SizedBox(
      width: 500,
      height: 55,
      child: ElevatedButton(onPressed: () {
        context.beamToNamed('/category_list_screen');
      }, child: const Text('Submit')),
    );
  }

  Widget buildLoginField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Dont have an account ?'),
        TextButton(
            onPressed: () {
              context.beamToNamed('/signup_screen');
            },
            child: const Text('Register')),
      ],
    );
  }
}
