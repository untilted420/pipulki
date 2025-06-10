import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matule/layers/data/local/shared_preferences/preferences_model.dart';
import 'package:matule/layers/presentation/screens/delivery/checkout_screen.dart';
import 'package:matule/layers/presentation/screens/details_shoes_screen.dart';
import 'package:matule/layers/presentation/screens/category/category_all_screen.dart';
import 'package:matule/layers/presentation/screens/category/category_outdoor_screen.dart';
import 'package:matule/layers/presentation/screens/category/category_running_screen.dart';
import 'package:matule/layers/presentation/screens/category/category_tennis_screen.dart';
import 'package:matule/layers/presentation/screens/favorite_screen.dart';
import 'package:matule/layers/presentation/screens/home_screen.dart';
import 'package:matule/layers/presentation/screens/basket_screen.dart';
import 'package:matule/layers/presentation/screens/map/map_screen.dart';
import 'package:matule/layers/presentation/screens/onboard/onboard_have_power_screen.dart';
import 'package:matule/layers/presentation/screens/onboard/onboard_start_screen.dart';
import 'package:matule/layers/presentation/screens/onboard/onboard_welcome_screen.dart';
import 'package:matule/layers/presentation/screens/search/search_res_screen.dart';
import 'package:matule/layers/presentation/screens/search/search_screen.dart';
import 'package:matule/layers/presentation/shared/ui/cards/notification_card.dart';
import 'package:matule/layers/presentation/screens/no_auth/forgot_pass.dart';
import 'package:matule/layers/presentation/screens/notification_screen.dart';
import 'package:matule/layers/presentation/screens/popular_screen.dart';
import 'package:matule/layers/presentation/screens/profile_screen.dart';
import 'package:matule/layers/presentation/screens/no_auth/register_screen.dart';
import 'package:matule/layers/presentation/screens/root_screen.dart';
// 2tfd
import 'package:matule/layers/presentation/shared/store/root_store.dart';
import 'package:matule/layers/presentation/screens/no_auth/signin_screen.dart';
import 'package:matule/layers/presentation/screens/test_screen.dart';
import 'package:matule/layers/presentation/screens/no_auth/verif_screen.dart';

class Routing {
  GoRouter get router => GoRouter(
    initialLocation: '/',
    redirect: (context, state) async {
      bool isInit = await PreferencesModel().getIsInit();
      if (!isInit) {
        PreferencesModel().initStorage();
        return '/signin';
      } else {
        return null;
      }
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder:
            (context, state, navigationShell) =>
                RootScreen(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/', 
                builder: (context, state) => HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'all',
                    builder: (context, state) => CategoryAllScreen(),
                  ),
                  GoRoute(
                    path: 'outdoor',
                    builder: (context, state) => CategoryOutdoorScreen(),
                  ),
                  GoRoute(
                    path: 'tennis',
                    builder: (context, state) => CategoryTennisScreen(),
                  ),
                  GoRoute(
                    path: 'running',
                    builder: (context, state) => CategoryRunningScreen(),
                  ),
                ]
                ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/favorite',
                builder: (context, state) => FavoriteScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                // 2tfd
                path: '/notification',
                builder: (context, state) => NotificationScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/basket', 
        builder: (context, state) => BasketScreen(),
        routes: [
          GoRoute(
            path: 'checkout',
            builder: (context, state) => CheckoutScreen(),
          )
        ]
        ),

      //for full screen
      GoRoute(
        path: '/details_shoes',
        builder:
            (context, state) => DetailsShoesScreen(
              name: (state.extra as Map<String, dynamic>)['name'],
              price: (state.extra as Map<String, dynamic>)['price'],
              id: (state.extra as Map<String, dynamic>)['id'],
              category: (state.extra as Map<String, dynamic>)['category'],
            ),
      ),
      GoRoute(path: '/popular', builder: (context, state) => PopularScreen()),
      GoRoute(path: '/search', builder: (context, state) => SearchScreen(), routes: [
        GoRoute(path: 'search_res_screen', builder: (context, state) => SearchResScreen(name: state.extra.toString()),)
      ]),
      // GoRoute(
      //   path: '/map',
      //   builder: (context, state) => MapScreen(),
      // ),

      //no auth
      GoRoute(
        path: '/signin',
        builder: (context, state) => SigninScreen(),
        routes: [
          GoRoute(
            path: 'reg',
            builder: (context, state) => RegisterScreen(),
            routes: [
              GoRoute(
                path: 'forgot',
                builder: (context, state) => ForgotPass(),
                routes: [
                  GoRoute(
                    path: 'verif',
                    builder: (context, state) => VerifScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      // onboard
      GoRoute(
        path: '/onboard',
        builder: (context, state) => OnboardWelcomeScreen(),
        routes: [
          GoRoute(
            path: 'start',

            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: OnboardStartScreen(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  return FadeTransition(
                    opacity: CurveTween(
                      curve: Curves.easeIn,
                    ).animate(animation),
                    child: child,
                  );
                },
              );
            },

            builder: (context, state) => OnboardStartScreen(),
            routes: [
              GoRoute(
                path: 'have_power',
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    key: state.pageKey,
                    child: OnboardHavePowerScreen(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      return FadeTransition(
                        opacity: CurveTween(
                          curve: Curves.easeIn,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  );
                },
                builder: (context, state) => OnboardHavePowerScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
