ROUTER and THEME
- packages: go_router, collection(for browser tab title), url_strategy(for removing # in url which shows because this is SPA)
- files: config folder, main.dart

SPLASH SCREEN
- packages: flutter_native_splash
- files flutter_native_splash.yaml && assets/images/splash_screen.png
- in main.dart in main() 
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  FlutterNativeSplash.remove();

FlutterNativeSplash.remove();
- run command: **dart run flutter_native_splash:create**
