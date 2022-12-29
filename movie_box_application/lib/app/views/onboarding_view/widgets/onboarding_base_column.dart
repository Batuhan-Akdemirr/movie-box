import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/app/views/onboarding_view/widgets/privacy_policy_description.dart';

class OnBoardingBaseColumn extends StatelessWidget {
  const OnBoardingBaseColumn({super.key});

  @override
  Widget build(BuildContext context) {
    const String movie = 'Movie Box';
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
          child: Center(
            child: Text(
              movie,
              style: Theme.of(context).textTheme.headline3?.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.60),
          child: Text(
            'privacy_policy_description',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ).tr(),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          child: const PrivacyPolicyRead(),
        ),
      ],
    );
  }
}
