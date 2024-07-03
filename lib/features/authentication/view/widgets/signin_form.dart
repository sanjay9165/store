import 'package:store/utilities/common_exports.dart';

class SigninForm extends StatelessWidget {
  SigninForm({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: SigninForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 35),
            AppTextField(
              title: "E-mail",
              placeholder: "Enter your email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onValidate: (String? value) {
                if (value!.isEmpty) {
                  return "Email is required";
                }

                if (!value.emailValidation) {
                  return "Email is not valid";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            AppTextField(
              title: "Password",
              placeholder: "Enter your password",
              controller: passwordController,
              keyboardType: TextInputType.text,
              onValidate: (String? value) {
                if (value!.isEmpty) {
                  return "Password is required";
                }
                if (!value.isValidPassword) {
                  return "Password is not valid";
                }
                return null;
              },
            ),
            const SizedBox(height: 45),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if (SigninForm.formKey.currentState!.validate()) {
                    context.read<AuthenticationBloc>().add(SigninEvent(
                        email: emailController.text,
                        password: passwordController.text));
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      fontFamily: AppFonts.euclidRegular),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                style: context.textTheme.displaySmall!.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 50),
            const SigninOption()
          ],
        ),
      ),
    );
  }
}
