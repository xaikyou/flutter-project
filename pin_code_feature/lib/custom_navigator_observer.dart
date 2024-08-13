import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  final Set<String> _activeRoutes = {};

  List<String> get activeRoutes => _activeRoutes.toList();

  @override
  void didPush(Route route, Route? previousRoute) {
    _activeRoutes.add(route.settings.name ?? '');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _activeRoutes.remove(route.settings.name ?? '');
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (oldRoute != null) {
      _activeRoutes.remove(oldRoute.settings.name ?? '');
    }
    if (newRoute != null) {
      _activeRoutes.add(newRoute.settings.name ?? '');
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  bool isRouteActive(String routeName) {
    return _activeRoutes.contains(routeName);
  }
}
