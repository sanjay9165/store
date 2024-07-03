import 'package:store/utilities/common_exports.dart';

class TabOption extends StatelessWidget {
  final int value;
  final String title;
  final bool active;
  final VoidCallback onTab;
  const TabOption(
      {super.key,
      required this.value,
      required this.title,
      required this.onTab,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: active ? AppColors.primaryColor : Colors.transparent,
                width: 2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: context.textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
