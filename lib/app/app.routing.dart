import 'package:app_use/ui/screens/auth/login.screen.dart';
import 'package:app_use/ui/screens/auth/otp.screen.dart';
import 'package:app_use/ui/screens/auth/singup.screen.dart';
import 'package:app_use/ui/screens/auth/verification.infos.screen.dart';
import 'package:app_use/ui/screens/home/childreen/add.money.done.dart';
import 'package:app_use/ui/screens/home/childreen/add.money.screen.dart';
import 'package:app_use/ui/screens/home/home.screen.dart';
import 'package:get/get.dart';
import 'package:app_use/app/routes.dart';
import 'package:app_use/ui/screens/splash/splash.screen.dart';

class AppRouting {
  static final List<GetPage> appRoutes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: Routes.checkotp,
      page: () => const OtpCheckScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: Routes.homescreen,
      page: () => const HomeScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: Routes.verifiyInfo,
      page: () => const VerifyInfoScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: Routes.addmoney,
      page: () => const AddMoneyScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: Routes.transacdone,
      page: () => const TransaxtionDoneScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 350),
    )
  ];
}
