import 'package:flutter/material.dart';
import 'package:grisoft/dependency_injection.dart';
import 'package:grisoft/features/demo/presentation/pages/home_screen.dart';
import 'package:grisoft/features/demo/presentation/providers/link_short_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LinkShorterProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
