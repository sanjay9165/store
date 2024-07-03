import 'package:store/utilities/common_exports.dart';

class Routes {
  static const String storeApp = "/";
  static const String home = "/home";
  static const String authenticationScreen = "/authenticationScreen";
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.storeApp:
        return MaterialPageRoute(builder: (_) => const StoreApp());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.authenticationScreen:
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
