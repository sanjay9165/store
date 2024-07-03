import 'package:store/utilities/common_exports.dart';

void main() async {
  await AuthenticationService().initialiseApp();
  await LocalService().initLocal();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'store',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().light,
        initialRoute: Routes.storeApp,
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: NavigationService.generateRoute,
      ),
    );
  }
}
