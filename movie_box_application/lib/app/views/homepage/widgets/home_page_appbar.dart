import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomePageAppBar({
    Key? key,
  }) : super(key: key);

  final String _movie = 'Movie Box';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        _movie,
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              debugPrint('Go to search page');
            },
            icon: const Icon(Icons.search))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
