import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/create_account.dart';
import '../custom_widgets/error_page.dart';
import '../features/home_screen.dart';
import '../features/help/more_info.dart';
import '../features/payment.dart';
import '../utils/constants.dart';
import '../utils/login_state.dart';

import '../features/profile/screen_profiles.dart';
import '../features/shopping/details.dart';

class MyRouter {
  final LoginState loginState;

  MyRouter(this.loginState);

  late final router = GoRouter(
    refreshListenable: loginState,
    debugLogDiagnostics: true,
    // urlPathStrategy: UrlPathStrategy.path,

    routes: [
      GoRoute(
        name: rootRouteName,
        path: '/',
        redirect: (context, state) =>
            state.namedLocation(homeRouteName, params: {'tab': 'shop'}),
      ),
      GoRoute(
        name: loginRouteName,
        path: '/profile',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const Login(),
        ),
      ),
      GoRoute(
        name: createAccountRouteName,
        path: '/create-account',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const CreateAccount(),
        ),
      ),
      GoRoute(
        name: homeRouteName,
        path: '/home/:tab(shop|cart|profile)',
        pageBuilder: (context, state) {
          final tab = state.params['tab']!;
          return MaterialPage<void>(
            key: state.pageKey,
            child: HomeScreen(tab: tab),
          );
        },
        routes: [
          GoRoute(
            name: subDetailsRouteName,
            path: 'details/:item',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: Details(description: state.params['item']!),
            ),
          ),
          GoRoute(
            name: profilePersonalRouteName,
            path: 'personal',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const PersonalInfo(),
            ),
          ),
          GoRoute(
            name: profilePaymentRouteName,
            path: 'payment',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const Payment(),
            ),
          ),
          GoRoute(
            name: profileSigninInfoRouteName,
            path: 'signin-info',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const SigninInfo(),
            ),
          ),
          GoRoute(
            name: profileMoreInfoRouteName,
            path: 'more-info',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const MoreInfo(),
            ),
          ),
        ],
      ),
      // forwarding routes to remove the need to put the 'tab' param in the code
      GoRoute(
        path: '/shop',
        redirect: (context, state) =>
            state.namedLocation(homeRouteName, params: {'tab': 'shop'}),
      ),
      GoRoute(
        path: '/cart',
        redirect: (context, state) =>
            state.namedLocation(homeRouteName, params: {'tab': 'cart'}),
      ),
      GoRoute(
        path: '/profile',
        redirect: (context, state) =>
            state.namedLocation(homeRouteName, params: {'tab': 'profile'}),
      ),
      GoRoute(
        name: detailsRouteName,
        path: '/details-redirector/:item',
        redirect: (context, state) => state.namedLocation(
          subDetailsRouteName,
          params: {'tab': 'shop', 'item': state.params['item']!},
        ),
      ),
      GoRoute(
        name: personalRouteName,
        path: '/profile-personal',
        redirect: (context, state) => state.namedLocation(
          profilePersonalRouteName,
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        name: paymentRouteName,
        path: '/profile-payment',
        redirect: (context, state) => state.namedLocation(
          profilePaymentRouteName,
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        name: signinInfoRouteName,
        path: '/profile-signin-info',
        redirect: (context, state) => state.namedLocation(
          profileSigninInfoRouteName,
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        name: moreInfoRouteName,
        path: '/profile-more-info',
        redirect: (context, state) => state.namedLocation(
          profileMoreInfoRouteName,
          params: {'tab': 'profile'},
        ),
      ),
    ],

    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorPage(error: state.error),
    ),

    // redirect to the profile page if the user is not logged in
    redirect: (context, state) {
      final loginLoc = state.namedLocation(loginRouteName);
      final loggingIn = state.subloc == loginLoc;
      final createAccountLoc = state.namedLocation(createAccountRouteName);
      final creatingAccount = state.subloc == createAccountLoc;
      final loggedIn = loginState.loggedIn;
      final rootLoc = state.namedLocation(rootRouteName);

      if (!loggedIn && !loggingIn && !creatingAccount) return loginLoc;
      if (loggedIn && (loggingIn || creatingAccount)) return rootLoc;
      return null;
    },
  );
}
