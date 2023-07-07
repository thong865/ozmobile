import 'package:flutter/material.dart';
import 'package:ozmobile/screens/terms/term_screen.dart';
import 'package:ozmobile/themes/light_theme.dart';
import 'package:ozmobile/themes/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      // supportedLocales: L10n.all,
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      // ],
      home: TermScreen(),
    );
  }
}
