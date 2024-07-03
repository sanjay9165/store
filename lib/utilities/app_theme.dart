import 'package:store/utilities/common_exports.dart';

class AppTheme {
  factory AppTheme() => _singleton;

  static final AppTheme _singleton = AppTheme._internal();

  AppTheme._internal();

  ThemeData get light => ThemeData(
        primaryColor: AppColors.primaryColor,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryColor),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.euclidMedium,
            color: AppColors.darkGunmetal,
          ),
          displaySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.euclidRegular,
            color: AppColors.darkGunmetal,
          ),
          displayMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.euclidRegular,
            color: AppColors.darkGunmetal,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.euclidMedium,
            color: AppColors.darkGunmetal,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize:
                const MaterialStatePropertyAll(Size(double.maxFinite, 50)),
            overlayColor:
                MaterialStatePropertyAll(Colors.black.withOpacity(0.03)),
            shape: const MaterialStatePropertyAll(ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))),
            foregroundColor: const MaterialStatePropertyAll(Color(0xFF000000)),
            backgroundColor:
                const MaterialStatePropertyAll(AppColors.primaryColor),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontFamily: AppFonts.euclidBold,
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          isDense: true,
          errorStyle: const TextStyle(
            fontSize: 14,
            fontFamily: AppFonts.euclidRegular,
            color: AppColors.error,
            fontWeight: FontWeight.w400,
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: AppFonts.euclidRegular,
            color: AppColors.gray,
            fontWeight: FontWeight.w400,
          ),
          labelStyle: const TextStyle(
            fontSize: 16,
            fontFamily: AppFonts.euclidMedium,
            color: AppColors.darkGunmetal,
            fontWeight: FontWeight.w500,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.error.withOpacity(0.16),
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: AppColors.darkGunmetal.withOpacity(0.16),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: AppColors.darkGunmetal.withOpacity(0.16),
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: AppColors.error.withOpacity(0.16),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(
              color: AppColors.darkGunmetal.withOpacity(0.16),
              width: 1,
            ),
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelPadding: EdgeInsets.zero,
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          labelColor: AppColors.darkGunmetal,
          unselectedLabelColor: AppColors.white,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 2,
              color: AppColors.darkGunmetal,
            ),
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16,
            letterSpacing: 0.78,
            fontWeight: FontWeight.w700,
            color: Color(0xFF000000),
            fontFamily: AppFonts.euclidBold,
          ),
          labelStyle: TextStyle(
            fontSize: 16,
            letterSpacing: 0.78,
            fontWeight: FontWeight.w700,
            color: Color(0xFF51585D),
            fontFamily: AppFonts.euclidBold,
          ),
        ),
      );
}
