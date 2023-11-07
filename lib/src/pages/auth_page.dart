import 'package:flutter/material.dart';
import 'package:template/src/api_connector.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/';

  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  void initState() {
    super.initState();
    final auth = ApiConnector();

    auth.isLogin().then((loggedIn) {
      final nav = Navigator.of(context);
      if (loggedIn) {
        nav.pushNamedAndRemoveUntil('/dashboard', (route) => false);
      } else {
        nav.pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
