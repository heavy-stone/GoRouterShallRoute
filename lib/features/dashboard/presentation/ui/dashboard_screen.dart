import 'package:flutter/material.dart';
import 'package:shell_route/features/dashboard/presentation/ui/widget/bottom_navigation_widget.dart';

class DashBoardScreen extends StatefulWidget {
  final Widget child;
  const DashBoardScreen({required this.child, super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
