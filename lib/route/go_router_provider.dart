import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shell_route/features/cart/presentation/ui/cart_screen.dart';
import 'package:shell_route/features/dashboard/presentation/ui/dashboard_screen.dart';
import 'package:shell_route/features/home/presentation/ui/home_screen.dart';
import 'package:shell_route/features/setting/presentation/ui/setting_screen.dart';
import 'package:shell_route/route/route_error_screen.dart';

import 'named_route.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) =>
            DashBoardScreen(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            path: '/',
            name: home,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomeScreen(key: state.pageKey),
              );
            },
          ),
          GoRoute(
            path: '/cart',
            name: cart,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: CartScreen(key: state.pageKey),
              );
            },
          ),
          GoRoute(
            path: '/setting',
            name: setting,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: SettingScreen(key: state.pageKey),
              );
            },
          ),
        ],
      )
    ],
    errorBuilder: (context, state) => RouteErrorScreen(
      errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});
