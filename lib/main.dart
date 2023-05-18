import 'package:Eggrow/providers/clean_function_provider.dart';
import 'package:Eggrow/providers/door_function_provider.dart';
import 'package:Eggrow/providers/exhaust_function_provider.dart';
import 'package:Eggrow/providers/fan_function_provider.dart';
import 'package:Eggrow/providers/light_function_providers.dart';
import 'package:Eggrow/views/authentication_screen/login_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/text_theme.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LightFunctionProvider()),
    ChangeNotifierProvider(create: (_) => DoorFunctionProvider()),
    ChangeNotifierProvider(create: (_) => FanFunctionProvider()),
    ChangeNotifierProvider(create: (_) => ExhaustFunctionProvider()),
    ChangeNotifierProvider(create: (_) => CleanFunctionProvider())
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
        fontFamily: 'Product Sans',
        useMaterial3: true,
        primaryColor: TT.lightPurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
