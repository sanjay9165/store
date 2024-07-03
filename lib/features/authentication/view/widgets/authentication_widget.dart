import 'package:store/utilities/common_exports.dart';

class AuthenticationWidget extends StatelessWidget {
  const AuthenticationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            AppIcons.bgImage,
          ),
        ),
      ),
      child: SizedBox(
        height: context.getScreenHeight(1),
        width: context.getScreenWidth(1),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 34,
          ),
          child: AuthenticationTab(
            signinWidget: SigninForm(),
            sinupWidget: SignupForm(),
          ),
        ),
      ),
    );
  }
}
