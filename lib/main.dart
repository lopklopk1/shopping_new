import 'package:flutter/material.dart';
import 'package:shopping_new/app_router.dart';

void main() {
  runApp(ShoppingApp(appRouter: AppRouter(),));
}

class ShoppingApp extends StatelessWidget {
  
  const ShoppingApp({super.key,required this.appRouter});
  final AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoutes,

    );
  }
}

