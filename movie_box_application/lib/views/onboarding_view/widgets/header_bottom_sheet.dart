import 'package:flutter/material.dart';

class HeaderBottomSheet extends StatelessWidget {
  const HeaderBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Stack(
        children: [
          Divider(
            indent: MediaQuery.of(context).size.width * 0.32,
            endIndent: MediaQuery.of(context).size.width * 0.32,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.015,
            top: 0,
            right: MediaQuery.of(context).size.width * 0.01,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.close_outlined),
            ),
          )
        ],
      ),
    );
  }
}
