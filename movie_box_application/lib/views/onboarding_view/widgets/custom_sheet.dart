import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_box_application/utils/extensions/context_extension.dart';
import 'package:movie_box_application/views/onboarding_view/widgets/header_bottom_sheet.dart';

class CustomSheet extends StatelessWidget {
  const CustomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: context.onlyTopPaddingNormal,
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderBottomSheet(),
            Padding(
              padding: context.onlyRightPaddingNormal,
              child: Text(
                'terms_privacy',
                style: Theme.of(context).textTheme.headline6,
              ).tr(),
            ),
            Padding(
              padding: context.onlyTopPaddingNormal +
                  context.horizontalPaddingNormal * 1.5,
              child: Align(
                alignment: Alignment.center,
                child:
                    const Text('terms_description', textAlign: TextAlign.center)
                        .tr(),
              ),
            ),
            Padding(
              padding: context.onlyTopPaddingNormal * 1.5,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('ok').tr(),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
