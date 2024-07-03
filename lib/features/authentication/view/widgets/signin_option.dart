import 'package:store/utilities/common_exports.dart';

class SigninOption extends StatelessWidget {
  const SigninOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            Positioned(
              top: -10,
              left: context.getScreenWidth(0.28),
              right: context.getScreenWidth(0.28),
              child: ColoredBox(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Or signin with",
                    style:
                        context.textTheme.displaySmall!.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppIcons.facebookIcon),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(AppIcons.googleIcon),
            ),
            Image.asset(AppIcons.appleIcon),
          ],
        ),
        const SizedBox(height: 25),
        Center(
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: "Don't have a Account? ",
                  style: context.textTheme.titleMedium),
              WidgetSpan(
                child: InkWell(
                  onTap: () => AuthenticationService().tabValue.value = 1,
                  child: Text(
                    "Sign up",
                    style: context.textTheme.titleMedium!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
