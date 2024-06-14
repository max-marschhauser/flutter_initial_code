import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common_router_files/element_routes.dart';
import '../app_route.dart';
import '../app_routes.dart';

enum APPHomeRoute with MainGRRouteSegment {
  home,
  home2,
  ;

  @override
  String get path {
    switch (this) {
      case home:
      case home2:
        return name;
    }
  }

  @override
  String get localization {
    switch (this) {
      case home:
      case home2:
        return "browser title";
    }
  }

  @override
  List<APPHomeRoute> get subRoutes {
    switch (this) {
      case home:
        return [home2];
      case home2:
        return [];
    }
  }

  List<MainGRRouteSegment> get rootRoutes => [
        home,
      ];

  String get goRoutePath => rootRoutes.contains(this) ? "/$path" : path;

  @override
  String get fullPath => getFullPath(APPHomeRoute.values);

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
          case home:
            return NoTransitionPage(
              child: Title(
                title: appAppRoutes.browserTitleFromFullPath(state.fullPath ?? appAppRoutes.rootPath) ?? '',
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                    onTap: () {
                      context.go(APPHomeRoute.home2.fullPath);
                    },
                    child: const Text("app route widget")),
              ),
            );
          case home2:
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
