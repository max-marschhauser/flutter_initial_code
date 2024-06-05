import '../common_router_files/element_routes.dart';
import '../common_router_files/main_route.dart';
import 'app_routes/main_routes.dart';

APPAppRoutes appAppRoutes = APPAppRoutes();

class APPAppRoutes with MainWBRoutes {
  @override
  final String rootPath = "/";

  @override
  List<MainWBRoute> get routes => [
        ...APPMainRoute.values.map((e) => e.erRoute),
      ];
}

APPElementsAppRoutes elementsAppRoutes = APPElementsAppRoutes();

class APPElementsAppRoutes with MainGRRoutes {
  @override
  String get rootPath => appAppRoutes.rootPath;

  @override
  List<MainGRRoute> get routes => appAppRoutes.routes.map((e) => e as MainGRRoute).toList();
}
