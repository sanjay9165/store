import 'package:store/utilities/common_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await AuthenticationService().signOut();
                await LocalService().clear().whenComplete(() {
                  AuthenticationService().tabValue.value = 0;
                  context.read<AuthenticationBloc>().add(const SignoutEvent());
                  context.pushNamedAndRemoveUntil(Routes.authenticationScreen);
                });
              },
              icon: const Icon(Icons.logout, color: AppColors.white))
        ],
      ),
    );
  }
}
