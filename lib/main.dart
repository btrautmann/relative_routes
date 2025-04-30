import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taconic_annotation/taconic_annotation.dart';

part 'main.g.dart';

enum Squad { coreUx, growth, moneyMovement, platform }

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

@DeepLinkConfig(exportability: ShouldExport(firstAvailableVersion: '1.0.0'), name: 'Root', owner: Squad.coreUx)
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

@DeepLinkConfig(exportability: ShouldExport(firstAvailableVersion: '1.0.0'), name: 'BranchOne', owner: Squad.coreUx)
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

@DeepLinkConfig(exportability: ShouldExport(firstAvailableVersion: '1.0.0'), name: 'BranchTwo', owner: Squad.coreUx)
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

@DeepLinkConfig(exportability: ShouldExport(firstAvailableVersion: '1.0.0'), name: 'RelativeOne', owner: Squad.coreUx)
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

@DeepLinkConfig(exportability: ShouldExport(firstAvailableVersion: '1.0.0'), name: 'RelativeTwo', owner: Squad.coreUx)
class RelativeTwo extends GoRouteData {
  final String? param;

  RelativeTwo({this.param});

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
