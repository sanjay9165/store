import 'package:store/utilities/common_exports.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final Widget? prefix;
  final String placeholder;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final List<TextInputFormatter>? format;
  final FormFieldValidator<String>? onValidate;

  const AppTextField({
    super.key,
    this.format,
    this.onValidate,
    required this.title,
    required this.controller,
    required this.placeholder,
    required this.keyboardType,
    this.prefix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: onValidate,
      controller: controller,
      inputFormatters: format,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: title, hintText: placeholder, prefix: prefix),
    );
  }
}
