import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:matule/core/routing/routing.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'assets/localizstion',
      fallbackLocale: Locale('ru', 'RU'),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(247, 247, 249, 1),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(247, 247, 249, 1),
        ),
        primaryColor: Colors.white,
      ),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: Routing().router,
    );
  }
}
