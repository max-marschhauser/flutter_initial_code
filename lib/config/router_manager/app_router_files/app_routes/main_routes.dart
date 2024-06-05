import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common_router_files/element_routes.dart';
import '../app_route.dart';
import '../app_routes.dart';

enum APPMainRoute with MainGRRouteSegment {
  main,
  main2,
  ;

  @override
  String get path {
    switch (this) {
      case main:
      case main2:
        return name;
    }
  }

  @override
  String get localization {
    switch (this) {
      case main:
      case main2:
        return "browser title";
    }
  }

  @override
  List<APPMainRoute> get subRoutes {
    switch (this) {
      case main:
        return [main2];
      case main2:
        return [];
    }
  }

  List<MainGRRouteSegment> get rootRoutes => [
        main,
      ];

  String get goRoutePath => rootRoutes.contains(this) ? "/$path" : path;

  @override
  String get fullPath => getFullPath(APPMainRoute.values);

  APPRoute get erRoute => APPRoute(
        displayName: localization,
        fullPath: fullPath,
        segment: path,
      );

  @override
  GoRoute get goRoute {
    return GoRoute(
      path: goRoutePath,
      pageBuilder: (context, state) {
        switch (this) {
          case main:
            return NoTransitionPage(
              child: Title(
                title: appAppRoutes.browserTitleFromFullPath(state.fullPath ?? appAppRoutes.rootPath) ?? '',
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                    onTap: () {
                      context.go(APPMainRoute.main2.fullPath);
                    },
                    child: const Text("app route widget")),
              ),
            );
          case main2:
            return NoTransitionPage(
              child: Title(
                title: appAppRoutes.browserTitleFromFullPath(state.fullPath ?? appAppRoutes.rootPath) ?? '',
                color: Theme.of(context).primaryColor,
                child: const Text("app2 route widget"),
              ),
            );
        }
      },
      routes: subRoutes.map((e) => e.goRoute).toList(),
    );
  }
}
