import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/product/provider/onboarding_provider.dart';
import 'package:movie_box_application/views/onboarding_view/widgets/custom_sheet.dart';
import 'package:provider/provider.dart';

class PrivacyPolicyRead extends StatelessWidget {
  const PrivacyPolicyRead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.zero,
          child: Checkbox(
              value: context.read<OnBoardingProvider>().isChecked,
              onChanged: (value) {
                context.read<OnBoardingProvider>().checking(value);
              },
              activeColor: context.watch<OnBoardingProvider>().activeColor),
        ),
        InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const CustomSheet();
                  });
            },
            child: Text(
              'privacy_policy',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.green,
                  ),
            ).tr()),
      ],
    );
  }
}
