import 'package:store/utilities/common_exports.dart';

class SignupForm extends StatelessWidget {
  SignupForm({
    super.key,
  });

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  static GlobalKey<FormState> formKeySignup = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: SignupForm.formKeySignup,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            SignupInputs(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              emailController: emailController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              mobileController: mobileController,
            ),
            const SizedBox(height: 45),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (SignupForm.formKeySignup.currentState!.validate()) {
                    context.read<AuthenticationBloc>().add(SignupEvent(
                          firstNameController.text,
                          lastNameController.text,
                          mobileController.text,
                          confirmPasswordController.text,
                          email: emailController.text,
                          password: passwordController.text,
                        ));
                  }
                },
                child: const Text(
                  "SignUp",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      fontFamily: AppFonts.euclidRegular),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Center(
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: "Already have a Account? ",
                      style: context.textTheme.titleMedium),
                  WidgetSpan(
                    child: InkWell(
                      onTap: () => AuthenticationService().tabValue.value = 0,
                      child: Text(
                        "Sign in",
                        style: context.textTheme.titleMedium!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
