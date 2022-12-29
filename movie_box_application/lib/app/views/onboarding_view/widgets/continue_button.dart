import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/core/data/local/shared_manager.dart';
import 'package:movie_box_application/product/provider/onboarding_provider.dart';
import 'package:movie_box_application/app/routes/navigator_routes.dart';
import 'package:provider/provider.dart';
import '../../../../core/data/local/shared_keys.dart';

class ContinueButton extends StatefulWidget {
  const ContinueButton({super.key});

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: context.watch<OnBoardingProvider>().isChecked
            ? () async {
                await _saveLoginControl();
                if (mounted) {
                  Navigator.of(context)
                      .pushReplacementNamed(NavigateRoutes.homepage.name);
                }
              }
            : null,
        child: const Text(
          'continue',
        ).tr());
  }

  Future<void> _saveLoginControl() async {
    await SharedManager.instance
        .setStringValue(SharedKeys.isLoginControl, 'true');
  }
}
