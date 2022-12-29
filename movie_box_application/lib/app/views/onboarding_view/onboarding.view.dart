import 'package:flutter/material.dart';
import 'package:movie_box_application/product/image_path.dart';
import 'package:movie_box_application/app/views/onboarding_view/widgets/continue_button.dart';
import 'package:movie_box_application/app/views/onboarding_view/widgets/onboarding_base_column.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: _bodyContainerDecoration(),
        child: const OnBoardingBaseColumn(),
      ),
      floatingActionButton: const ContinueButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  BoxDecoration _bodyContainerDecoration() {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              ImagePath.instance.onBoardingPage,
            ),
            fit: BoxFit.fill));
  }
}
