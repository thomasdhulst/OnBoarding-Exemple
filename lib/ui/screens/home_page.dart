import 'package:flutter/material.dart';
import 'package:on_boarding_exemple/ui/screens/sign_up_page.dart';
import 'package:on_boarding_exemple/ui/widgets/circle.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Circle(
            size: 200,
            left: -50,
            top: -70,
          ),
          Circle(
            size: 100,
            right: 50,
            top: 70,
          ),
          Circle(
            size: 75,
            left: 50,
            bottom: 70,
          ),
          Circle(
            size: 200,
            right: -50,
            bottom: -70,
          ),
          SignUpPage(),
        ],
      ),
    );
  }
}
