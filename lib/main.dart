import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:performx/2_application/core/localization/lcoale_provider.dart';
import 'package:performx/l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '2_application/core/services/theme_service.dart';
import '2_application/pages/advice/advice_page.dart';
import 'injection.dart' as di;
import 'theme.dart'; // di = dependency injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // await EasyLocalization.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeService>(
        create: (_) => ThemeService(),
      ),
      ChangeNotifierProvider<LocaleProvider>(
        create: (_) => LocaleProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      final provider = Provider.of<LocaleProvider>(context);
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.support,
        locale: provider.locale,
        // localizationsDelegates: context.localizationDelegates,
        // supportedLocales: context.supportedLocales,

        // locale: context.locale,
        home: const AdvicerPageWrapperProvider(),
      );
    });
  }
}
