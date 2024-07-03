import 'package:store/utilities/common_exports.dart';

class AuthenticationTab extends StatelessWidget {
  final Widget signinWidget;
  final Widget sinupWidget;
  const AuthenticationTab({
    super.key,
    required this.signinWidget,
    required this.sinupWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AuthenticationService().tabValue,
      builder: (context, value, child) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 180),
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Divider(thickness: 2),
              ),
              Row(
                children: [
                  TabOption(
                    value: value,
                    active: value == 0,
                    title: "Sign in",
                    onTab: () => AuthenticationService().tabValue.value = 0,
                  ),
                  const SizedBox(width: 35),
                  TabOption(
                    active: value == 1,
                    value: value,
                    title: "Sign up",
                    onTab: () => AuthenticationService().tabValue.value = 1,
                  ),
                ],
              ),
            ],
          ),
          Expanded(child: value == 0 ? signinWidget : sinupWidget)
        ]);
      },
    );
  }
}
