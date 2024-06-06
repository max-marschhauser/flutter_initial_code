ROUTER
- packages: go_router, collection(for browser tab title)
- files: config/router_manager
- in main.dart in build it needs MaterialApp.router with routerConfig: APPRouterManager.shared.router

THEME

SPLASH SCREEN
- packages: flutter_native_splash
- files flutter_native_splash.yaml && assets/images/splash_screen.png
- in main.dart in main() 
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();

FlutterNativeSplash.remove();
- run command: dart run flutter_native_splash:create
