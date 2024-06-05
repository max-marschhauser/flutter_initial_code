import '../common_router_files/element_routes.dart';
import '../common_router_files/main_route.dart';

class APPRoute with MainWBRoute, MainGRRoute {
  @override
  final String displayName;

  @override
  final String fullPath;

  @override
  final bool permission;

  @override
  final String segment;

  @override
  final bool showBreadcrumb;

  APPRoute({
    required this.displayName,
    required this.fullPath,
    required this.segment,
    this.permission = true,
    this.showBreadcrumb = true,
  });
}
