import 'package:flutter/material.dart';

import 'config/router_manager/app_router_files/router_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: APPRouterManager.shared.router,
    );
  }
}
