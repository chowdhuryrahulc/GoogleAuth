import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startgoogle/loginWithoutProvider/liginx.dart';
import 'package:startgoogle/login_page.dart';

import 'google_login_controller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => X(),
            child: LoginPage(),
          )
        ],
        child: MaterialApp(
          title: 'flutter',
          theme: ThemeData(primarySwatch: Colors.purple),
          home: Logonx(),
        ));
  }
}
