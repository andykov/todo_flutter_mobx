import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_mobx/screens/login_screen.dart';
import 'package:todo_flutter_mobx/stores/login_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<LoginStore>(
      create: (_) => LoginStore(),
      // dispose: (_, store) => store.dispose(),
      child: MaterialApp(
        title: 'MobX Tutorial',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.deepPurpleAccent,
          scaffoldBackgroundColor: Colors.deepPurpleAccent
        ),
        home: LoginScreen(),
      ),
    );
  }
}
