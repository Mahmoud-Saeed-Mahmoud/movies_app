import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/theme_mode_provider.dart';

class ThemeModeSwitcher extends ConsumerWidget {
  const ThemeModeSwitcher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return SizedBox.square(
      dimension: 50.0,
      child: IconButton(
        onPressed: () => ref.read(themeModeProvider.notifier).toggleThemeMode(),
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            final rotateAnimation =
                Tween<double>(begin: 0.0, end: 1.0).animate(animation);
            final reverseAnimation =
                Tween<double>(begin: 1.0, end: 0.0).animate(animation);
            return RotationTransition(
              turns: themeMode == ThemeMode.dark
                  ? rotateAnimation
                  : reverseAnimation,
              child: FadeTransition(
                opacity: animation,
                child: child,
              ),
            );
          },
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              fit: StackFit.expand,
              children: [
                // Show the current child.
                if (currentChild != null)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: currentChild,
                    ),
                  ),
                // Show the previous children in a stack.
                ...previousChildren.map(
                  (child) {
                    return Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: IgnorePointer(child: child),
                      ),
                    );
                  },
                ),
              ],
            );
          },
          switchInCurve: Curves.easeOutExpo,
          switchOutCurve: Curves.easeInExpo,
          child: ref.watch(themeModeProvider) == ThemeMode.light
              ? const Icon(
                  Icons.nightlight_round,
                  key: ValueKey(1),
                )
              : const Icon(
                  Icons.wb_sunny,
                  key: ValueKey(2),
                ),
        ),
      ),
    );
  }
}
