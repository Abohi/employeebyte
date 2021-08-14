import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_route/app_route.gr.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}
final _appRouter = AppRouter();
class MyApp extends HookWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}

