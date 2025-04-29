import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'main.g.dart';

void main() {
  final router = GoRouter(routes: $appRoutes, debugLogDiagnostics: true);

  runApp(MainApp(router: router));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}

const relativeRoute = TypedRelativeGoRoute<RelativeOne>(
  path: 'relative_one',
  routes: [TypedRelativeGoRoute<RelativeTwo>(path: 'relative_two')],
);

@TypedGoRoute<Root>(
  path: '/',
  routes: [
    TypedGoRoute<BranchOne>(path: 'branch_one', routes: [relativeRoute]),
    TypedGoRoute<BranchTwo>(path: 'branch_two', routes: [relativeRoute]),
  ],
)
class Root extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Root', style: TextStyle(fontSize: 48)),
            ElevatedButton(onPressed: () => context.go('/branch_one'), child: Text('Branch One')),
            ElevatedButton(onPressed: () => context.go('/branch_two'), child: Text('Branch Two')),
          ],
        ),
      ),
    );
  }
}

class BranchOne extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BranchOne', style: TextStyle(fontSize: 48)),
            ElevatedButton(onPressed: () => RelativeOne().goRelative(context), child: Text('Relative')),
          ],
        ),
      ),
    );
  }
}

class BranchTwo extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('BranchTwo', style: TextStyle(fontSize: 48)),
            ElevatedButton(onPressed: () => RelativeOne().goRelative(context), child: Text('Relative')),
          ],
        ),
      ),
    );
  }
}

class RelativeOne extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('RelativeOne', style: TextStyle(fontSize: 48)),
            ElevatedButton(onPressed: () => RelativeTwo().goRelative(context), child: Text('RelativeTwo')),
          ],
        ),
      ),
    );
  }
}

class RelativeTwo extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('RelativeTwo', style: TextStyle(fontSize: 48)),
            ElevatedButton(onPressed: () => context.pop(), child: Text('Back')),
          ],
        ),
      ),
    );
  }
}
