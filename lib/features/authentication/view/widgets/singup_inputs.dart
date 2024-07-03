import 'package:store/utilities/common_exports.dart';

class SignupInputs extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController mobileController;
  const SignupInputs(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.mobileController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          title: "First Name",
          placeholder: "Enter your First Name",
          controller: firstNameController,
          keyboardType: TextInputType.text,
          onValidate: (String? value) {
            if (value!.isEmpty) {
              return "First Name is required";
            }

            return null;
          },
        ),
        const SizedBox(height: 30),
        AppTextField(
          title: "Last Name",
          placeholder: "Enter your Last Name",
          controller: lastNameController,
          keyboardType: TextInputType.text,
          onValidate: (String? value) {
            if (value!.isEmpty) {
              return "Last Name is required";
            }

            return null;
          },
        ),
        const SizedBox(height: 30),
        AppTextField(
          title: "Mobile Number",
          placeholder: "Enter your Mobile Number",
          controller: mobileController,
          keyboardType: TextInputType.number,
          prefix: const Text("+91 ",
              style: TextStyle(
                fontSize: 16,
                fontFamily: AppFonts.euclidMedium,
                color: AppColors.darkGunmetal,
                fontWeight: FontWeight.w500,
              )),
          onValidate: (String? value) {
            if (value!.isEmpty) {
              return "Mobile Number is required";
            }

            if (!value.isValidPhone) {
              return "Mobile Number is not valid";
            }

            return null;
          },
        ),
        const SizedBox(height: 30),
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
        const SizedBox(height: 30),
        AppTextField(
          title: "Confirm Password",
          placeholder: "Enter your Confirm password",
          controller: confirmPasswordController,
          keyboardType: TextInputType.text,
          onValidate: (String? value) {
            if (value!.isEmpty) {
              return "Confirm Password is required";
            }
            if (value != passwordController.text) {
              return "Confirm Password is not match";
            }
            return null;
          },
        ),
      ],
    );
  }
}
