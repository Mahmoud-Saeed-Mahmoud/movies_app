import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        FontWeight,
        MaterialPageRoute,
        MediaQuery,
        Navigator,
        Offset,
        PageRouteBuilder,
        ScaffoldMessenger,
        ScaleTransition,
        SlideTransition,
        SnackBar,
        Text,
        TextStyle,
        Theme,
        ThemeData,
        Tween,
        Widget;

extension ContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double calculateResponsiveFontSize(double baseFontSize) {
    // Calculate the responsive font size based on the screen width
    if (screenWidth < 600) {
      return baseFontSize * 0.8; // Use a smaller font size for smaller screens
    } else if (screenWidth < 1200) {
      return baseFontSize * 1.0; // Use the base font size for medium screens
    } else {
      return baseFontSize * 1.2; // Use a larger font size for larger screens
    }
  }

  void showSnackBar(String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(message),
      ),
    );
  }

  ThemeData get currentTheme => Theme.of(this);

  Color get textColor => currentTheme.colorScheme.onSurface;

  TextStyle get responsiveMovieTitleStyle {
    const baseFontSize = 23.0; // Set your base font size here
    final responsiveFontSize = calculateResponsiveFontSize(baseFontSize);

    final currentTheme = Theme.of(this);
    final textColor = currentTheme
        .colorScheme.onSurface; // Use the current theme's text color

    return TextStyle(
      fontSize: responsiveFontSize,
      fontWeight: FontWeight.bold,
      color: textColor,
    );
  }

  void pushScreen(Widget widget) {
    Navigator.of(this).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => widget,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final slideAnimation = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation);

          final scaleAnimation = Tween<double>(
            begin: 0.3,
            end: 1.0,
          ).animate(animation);

          return SlideTransition(
            position: slideAnimation,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushAndReplaceScreen(Widget widget) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
