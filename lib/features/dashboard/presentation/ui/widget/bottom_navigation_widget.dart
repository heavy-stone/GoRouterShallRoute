import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shell_route/features/dashboard/presentation/controller/dashboard_controller.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  ConsumerState<BottomNavigationWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(dashboardControllerProvider);

    return BottomNavigationBar(
      currentIndex: position,
      onTap: (index) => _onTap(index),
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home_work),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.shopify),
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.settings),
          icon: Icon(Icons.settings_applications),
          label: 'Setting',
        ),
      ],
    );
  }

  void _onTap(int index) {
    ref.read(dashboardControllerProvider.notifier).setPosition(index);

    switch (index) {
      case 0:
        context.go('location');
        break;
      case 1:
        context.go('location');
        break;
      case 2:
        context.go('location');
        break;
      default:
    }
  }
}
