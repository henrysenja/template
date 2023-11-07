import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/local_provider.dart';
import 'package:template/src/api_connector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends ConsumerWidget {
  static const routeName = '/dashboard';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = Navigator.of(context);
    final api = ApiConnector();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
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
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  nav.pushNamed('/album');
                },
                child: const Text("Album")),
            ElevatedButton(
                onPressed: () {
                  api.logOut().then((_) {
                    nav.pushNamedAndRemoveUntil('/', (route) => true);
                  });
                },
                child: const Text("Logout"))
          ],
        ),
      ),
     );

  }
   void setLocale(Locale newLocale, WidgetRef ref) {
    ref.read(localeProvider).setLocale(newLocale);
  }
}
