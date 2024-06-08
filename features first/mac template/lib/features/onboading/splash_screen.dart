import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../core/navigation/app_routes.dart';
import '../../core/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GetIt getIt = GetIt.I;

  _splash() async {
    await Future.delayed(const Duration(seconds: 2), () {});

    final userToken = await userLocalStorage.getToken();
    if (context.mounted) {
      userToken == null
          ? context.go(AppRoutes.auth)
          : context.go(AppRoutes.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    _splash();
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text('App Template')),
      ),
    );
  }
}
