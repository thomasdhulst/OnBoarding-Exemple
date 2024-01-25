import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:on_boarding_exemple/main.dart';
import 'package:on_boarding_exemple/router.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  get pageDecoration => const PageDecoration();

  get listPagesViewModel => [
        PageViewModel(
          title: "Title of first page",
          body:
              "Welcome to the app! Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et felis consectetur, convallis lectus sed, porttitor risus. Vestibulum vulputate sem. ",
          image: Center(
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(500)),
              child: Image.asset(
                "assets/image1.jpg",
                cacheHeight: 289,
                cacheWidth: 434,
                height: 289,
                width: 434,
              ),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Title of second page",
          body:
              "Consectetur adipiscing elit. Aenean in ex ligula. Nullam non neque posuere, consequat velit et, iaculis quam. Praesent eget mauris ac tellus. ",
          image: Center(
            child: Image.asset(
              "assets/image2.jpg",
              cacheHeight: 289,
              cacheWidth: 434,
              height: 289,
              width: 434,
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Title of last page",
          body:
              "Curabitur quis sodales nibh. Aliquam nec laoreet nisl. Cras convallis diam a dapibus efficitur. Aliquam vulputate scelerisque ex, sit amet sagittis ipsum pretium sed. Etiam sollicitudin. ",
          image: Center(
            child: Image.asset(
              "assets/image3.jpg",
              cacheHeight: 289,
              cacheWidth: 434,
              height: 289,
              width: 434,
            ),
          ),
          decoration: pageDecoration,
        )
      ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      showSkipButton: true,
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      onDone: () => _validateOnBoarding(context),
      baseBtnStyle: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: const Color.fromARGB(255, 199, 104, 216),
        foregroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }

  void _validateOnBoarding(BuildContext context) {
    context.go(ScreenPaths.home);
    settingsLogic.hasCompletedOnboarding = true;
  }
}
