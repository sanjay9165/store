import 'package:store/utilities/common_exports.dart';

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      bool value = LocalService().isUserLogedIn();

      if (!value) {
        context.pushNamed(Routes.authenticationScreen);
      } else {
        context.pushNamedAndRemoveUntil(Routes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
