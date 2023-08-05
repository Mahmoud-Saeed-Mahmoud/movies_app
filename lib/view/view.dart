import 'package:flutter/material.dart';

import 'mobile/pages/home_page.dart';

class DisplayView extends StatelessWidget {
  const DisplayView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return size < 600 ? const MobileHomePage() : Container();
  }
}
