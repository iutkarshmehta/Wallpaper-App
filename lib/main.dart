/*import 'package:flutter/material.dart';

import 'screens/category_detail_screen.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: Wallpaper(),
    );
  }
}*/

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:image_fromapi/screens/category_detail_screen.dart';
import 'package:image_fromapi/screens/category_list_screen.dart';
import 'package:image_fromapi/screens/image_detail_screen.dart';
import 'package:image_fromapi/screens/login_screen.dart';
import 'package:image_fromapi/screens/signup_screen.dart';

void main() {
  final routerDelegate = BeamerDelegate(
      locationBuilder: RoutesLocationBuilder(routes: {
        '/': (context, state, data) => const LoginScreen(),
        '/login_screen': (context, state, data) => const LoginScreen(),
        '/signup_screen': (context, state, data) => const SignupScreen(),
        '/category_list_screen': (context, state, data) => const CategoryList(),
        '/category_detail_screen': (context, state, data) => const Wallpaper(),
        '/image_detail_screen': (context, state, data) =>
        const Fullscreen(imageurl: ''),

  }));
  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routeInformationParser: BeamerParser(),
    routerDelegate: routerDelegate,
  ));
}
