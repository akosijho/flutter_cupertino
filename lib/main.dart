import 'package:cupertino_app/views/adding_tabs/Tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: Tabs(),
    );
  }
}

class SimpleCupertinoHomePage extends StatefulWidget {
  const SimpleCupertinoHomePage({super.key});

  @override
  _SimpleCupertinoHomePageState createState() =>
      _SimpleCupertinoHomePageState();
}

class _SimpleCupertinoHomePageState extends State<SimpleCupertinoHomePage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Chat App'),
        ),
        child: Center(
          child: Text('Hi!'),
        ));
  }
}
