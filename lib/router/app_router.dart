import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/splash_screen.dart';
// import '../screens/onboarding_screen.dart';
// import '../screens/login_screen.dart';
// import '../screens/choose_bot_screen.dart';
// import '../screens/chat_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    // GoRoute(
    //   path: '/onboarding',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const OnboardingScreen();
    //   },
    // ),
    // GoRoute(
    //   path: '/login',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const LoginScreen();
    //   },
    // ),
    // GoRoute(
    //   path: '/choose-bot',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return const ChooseBotScreen();
    //   },
    // ),
    // GoRoute(
    //   path: '/chat',
    //   builder: (BuildContext context, GoRouterState state) {
    //     final botId = state.uri.queryParameters['bot'] ?? 'friend';
    //     return ChatScreen(botId: botId);
    //   },
    // ),
  ],
);
