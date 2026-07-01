import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/splash/splash_screen.dart';
import '../pages/onboarding/onboarding_screen.dart';
import '../pages/login/login_screen.dart';
import '../pages/chat/chat_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    // GoRoute(
    //   path: '/choose-bot',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const ChooseBotScreen();
    //   },
    // ),
    GoRoute(
      path: '/chat',
      builder: (BuildContext context, GoRouterState state) {
        final botId = state.uri.queryParameters['bot'] ?? 'friend';
        return ChatScreen(botId: botId);
      },
    ),
  ],
);
