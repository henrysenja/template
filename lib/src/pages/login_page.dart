import 'package:flutter/material.dart';
import 'package:template/local_provider.dart';
import 'package:template/src/api_connector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/src/shared/tiny_circular_progress_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final helloWorldProvider = Provider((_) => 'Hello Login');

class LoginPage extends ConsumerStatefulWidget {
  static const routeName = '/login';

  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final locales = AppLocalizations.of(context)!;
    String titleValue = locales.helloWorld;
    final auth = ApiConnector();
    final nav = Navigator.of(context);
    bool isErrorUsername = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(titleValue.toString()),
        actions: [
          DropdownButton<Locale>(
            value: Localizations.localeOf(context),
            onChanged: (Locale? newLocale) {
              if (newLocale != null) {
                setLocale(newLocale, ref);
              }
            },
            items: AppLocalizations.supportedLocales
                .map<DropdownMenuItem<Locale>>((Locale locale) {
              return DropdownMenuItem<Locale>(
                value: locale,
                child: Text(locale.languageCode.toUpperCase()),
              );
            }).toList(),
          ),
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'images/logo.png', // Replace with your logo image path
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState != null &&
                      _formKey.currentState!.validate()) {
                    // Perform login logic here
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    auth.logIn(
                      username: username,
                      password: password,
                      onError: (m) {
                        if (m == 'invalid-username') {
                          setState(() {
                            isErrorUsername = true;
                          });
                        } else {
                          setState(() {
                            isErrorUsername = false;
                          });
                        }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(m),
                          duration: const Duration(seconds: 5),
                        ));
                      },
                      onSuccess: (_) {
                        nav.pushNamedAndRemoveUntil(
                            '/dashboard', (route) => false);
                      },
                    );

                    // if (username == 'example' && password == 'password') {
                    //   setState(() {
                    //     _errorText = 'Sukses login';
                    //   });
                    //   print('sukses logjin');
                    //   // Successful login
                    //   // Navigator.pushReplacement(
                    //   //   context,
                    //   //   MaterialPageRoute(
                    //   //     builder: (context) => HomeScreen(),
                    //   //   ),
                    //   // );
                    // } else {
                    //   // Failed login
                    //   setState(() {
                    //     _errorText = 'Invalid username or password';
                    //   });
                    // }
                  }
                },
                child: Visibility(
                  visible: isErrorUsername,
                  replacement: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: const TinyCircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setLocale(Locale newLocale, WidgetRef ref) {
    ref.read(localeProvider).setLocale(newLocale);
  }
}
