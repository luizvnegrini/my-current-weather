import 'dart:async';

import 'package:auth/presentation/presentation.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

import '../core.dart';

typedef GoRouterRedirect = FutureOr<String?> Function(
  BuildContext context,
  GoRouterState state,
);

Provider<GoRouter> getRouter(List<RouteBase> routes) {
  return Provider(
    (ref) {
      return _routeConfig(
        routes: routes,
        redirect: (_, state) {
          final localStorage = ref.read(localStorageRepository);
          final isAuthenticating = state.matchedLocation == AuthRoutes.login;

          if (!localStorage.isAuthenticated && !isAuthenticating) {
            return AuthRoutes.login;
          }

          return null;
        },
      );
    },
  );
}

GoRouter _routeConfig({
  required List<RouteBase> routes,
  GoRouterRedirect? redirect,
}) =>
    GoRouter(
      redirect: redirect,
      routes: routes,
    );
