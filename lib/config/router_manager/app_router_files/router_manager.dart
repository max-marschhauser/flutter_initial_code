import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';
import 'app_routes/main_routes.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class APPRouterManager {
  APPRouterManager._privateConstructor();

  static final APPRouterManager shared = APPRouterManager._privateConstructor();

  final GoRouter router = GoRouter(
    initialLocation: appAppRoutes.rootPath,
    debugLogDiagnostics: kDebugMode,
    navigatorKey: rootNavigatorKey,
    // refreshListenable: AppManager.shared.userMe,
    routes: [
      APPMainRoute.main.goRoute,
    ],
    redirect: (BuildContext context, GoRouterState state) {
      if (state.fullPath == APPMainRoute.main.fullPath || state.fullPath == appAppRoutes.rootPath || state.fullPath == "") {
        return APPMainRoute.main.fullPath;
      }
      return null;
    },
  );
}
