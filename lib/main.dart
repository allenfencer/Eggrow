import 'package:eggrow_app/providers/door_function_provider.dart';
import 'package:eggrow_app/providers/fan_function_provider.dart';
import 'package:eggrow_app/providers/light_function_providers.dart';
import 'package:eggrow_app/views/authentication_screen/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LightFunctionProvider()),
    ChangeNotifierProvider(create: (_) => DoorFunctionProvider()),
    ChangeNotifierProvider(create: (_) => FanFunctionProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eggrow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          )),
      home: const LoginScreen(),
    );
  }
}
