import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/homeScreen.dart';
import 'pages/loginScreen.dart';
import 'utils/routes.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      // home: HomeScreen(),
      initialRoute: Routes.homeRoute,
      routes: {
        Routes.homeRoute: (context) => HomeScreen(),
        Routes.loginRoute: (context) => LoginScreen()
      },
    );
  }
}
