


// typedef GoRouterRedirect = FutureOr<String?> Function(
//     BuildContext context, GoRouterState state);

///TODO: implement redirect
class AuthGuard {
  // final routerProvider = Provider((ref) {
  //   return _routeConfig(redirect: (context, state) {
  //     // final authState = ref.read(currentUserProvider);
  //     //if (authState.isLoading || authState.hasError) return null;

  //     // final isAuthenticated = authState.valueOrNull != null;
  //     final isAuthenticated = false;

  //     if (!isAuthenticated) {
  //       return AuthRoutes.login;
  //     }

  //     // return null;
  //   });
  // });
}

// class AuthGuard extends NavigatorObserver {
//   @override
//   void didPush(Route route, Route? previousRoute) {
//     super.didPush(route, previousRoute);
//     _checkRoute(route);
//   }

//   @override
//   void didReplace({Route? newRoute, Route? oldRoute}) {
//     super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
//     if (newRoute != null) {
//       _checkRoute(newRoute);
//     }
//   }

//   @override
//   void didPop(Route route, Route? previousRoute) {
//     super.didPop(route, previousRoute);
//     if (previousRoute != null) {
//       _checkRoute(previousRoute);
//     }
//   }

//   void _checkRoute(Route route) {
//     if (route.settings.name != null &&
//         !route.settings.name!.contains(AuthRoutes.login)) {
//       bool isAuthenticated = _isAuthenticated();

//       if (!isAuthenticated) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           Navigator.of(route.navigator!.context).pushReplacementNamed(
//             AuthRoutes.login,
//           );
//         });
//       }
//     }

//     ///TODO: complete packages readme
//   }

//   bool _isAuthenticated() {
//     ///TODO: implement isAuthenticated and use here
//     return false;
//   }
// }
