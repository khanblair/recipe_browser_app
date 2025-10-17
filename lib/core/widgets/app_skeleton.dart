import 'package:flutter/material.dart';

class AppSkeleton extends StatelessWidget {
  const AppSkeleton({super.key, this.height = 16, this.width = double.infinity, this.radius = 8});

  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
