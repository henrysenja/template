import 'package:flutter/material.dart';
import 'package:template/src/pages/album_page.dart';
import 'package:template/src/pages/auth_page.dart';
import 'package:template/src/pages/detail_album_page.dart';
import 'package:template/src/pages/home_page.dart';
import 'package:template/src/pages/login_page.dart';
import 'package:template/src/pages/second_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => const AuthPage());
    case '/dashboard':
      return MaterialPageRoute(builder: (_) => const HomePage());
    case '/album':
      return MaterialPageRoute(builder: (_) => const AlbumPage());
    case '/login':
      return MaterialPageRoute(builder: (_) => const LoginPage());
    case '/details':
      final args = settings.arguments as DetailsArgs;
      return MaterialPageRoute(builder: (_) => DetailsPage(id: args.userId));
    case '/second':
      return MaterialPageRoute(builder: (_) => const SecondScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
