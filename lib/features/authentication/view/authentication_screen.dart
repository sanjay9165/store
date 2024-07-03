import 'package:store/utilities/common_exports.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) {
        if (current is AuthenticationInitial) {
          return false;
        }
        return true;
      },
      listener: (context, state) {
        if (state is AuthenticationLoading) {
          context.showAppGeneralDialog(
              child: const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ));
        }

        if (state is AuthenticationError) {
          context.pop();
          context.showAppSnackBar(title: state.errorMessage);
        }

        if (state is AuthenticationSuccess) {
          context.pop();
          context.showAppSnackBar(title: state.message);
          context.pushNamedAndRemoveUntil(Routes.home);
        }
      },
      buildWhen: (previous, current) => current is AuthenticationInitial,
      builder: (context, state) {
        if (state is AuthenticationInitial) {
          return const AuthenticationWidget();
        }

        return const SizedBox();
      },
    ));
  }
}
