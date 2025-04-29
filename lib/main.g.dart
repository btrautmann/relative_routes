// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$root];

RouteBase get $root => GoRouteData.$route(
  path: '/',

  factory: $RootExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: 'branch_one',

      factory: $BranchOneExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'relative_one',

          factory: $RelativeOneExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'relative_two',

              factory: $RelativeTwoExtension._fromState,
            ),
          ],
        ),
      ],
    ),
    GoRouteData.$route(
      path: 'branch_two',

      factory: $BranchTwoExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'relative_one',

          factory: $RelativeOneExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'relative_two',

              factory: $RelativeTwoExtension._fromState,
            ),
          ],
        ),
      ],
    ),
  ],
);

extension $RootExtension on Root {
  static Root _fromState(GoRouterState state) => Root();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BranchOneExtension on BranchOne {
  static BranchOne _fromState(GoRouterState state) => BranchOne();

  String get location => GoRouteData.$location('/branch_one');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RelativeOneExtension on RelativeOne {
  static RelativeOne _fromState(GoRouterState state) => RelativeOne();

  String get location => GoRouteData.$location('relative_one');
  String get relativeLocation => './$location';

  void goRelative(BuildContext context) => context.go(relativeLocation);

  Future<T?> pushRelative<T>(BuildContext context) =>
      context.push<T>(relativeLocation);

  void pushReplacementRelative(BuildContext context) =>
      context.pushReplacement(relativeLocation);

  void replaceRelative(BuildContext context) =>
      context.replace(relativeLocation);
}

extension $RelativeTwoExtension on RelativeTwo {
  static RelativeTwo _fromState(GoRouterState state) => RelativeTwo();

  String get location => GoRouteData.$location('relative_two');
  String get relativeLocation => './$location';

  void goRelative(BuildContext context) => context.go(relativeLocation);

  Future<T?> pushRelative<T>(BuildContext context) =>
      context.push<T>(relativeLocation);

  void pushReplacementRelative(BuildContext context) =>
      context.pushReplacement(relativeLocation);

  void replaceRelative(BuildContext context) =>
      context.replace(relativeLocation);
}

extension $BranchTwoExtension on BranchTwo {
  static BranchTwo _fromState(GoRouterState state) => BranchTwo();

  String get location => GoRouteData.$location('/branch_two');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
