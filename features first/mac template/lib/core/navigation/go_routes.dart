import 'package:go_router/go_router.dart';

import '../../features/authentication/presentation/views/auth_screen.dart';
import '../../features/dashbaord/presentation/views/dashboard_screen.dart';
import '../../features/onboading/page_404.dart';
import '../../features/onboading/splash_screen.dart';
import 'app_routes.dart';

final goRouter = GoRouter(
  errorBuilder: (context, state) => const Page404(),
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.auth,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: AppRoutes.dashboard,
      builder: (context, state) => const DashboardScreen(),
    ),
  ],
);
