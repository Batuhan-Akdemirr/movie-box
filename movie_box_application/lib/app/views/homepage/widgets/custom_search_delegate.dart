import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_box_application/app/views/search_view/search_view.dart';

class CustomSearchDelegate extends SearchDelegate {
  var box = Hive.box('movies');
  final String notAvailable = 'Not Available';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query.isEmpty ? null : query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (_nullControl(query) == true) {
      _saveMovies(query);
    }

    return const SearchView();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              var currentName = _findMovieIndexInHive(index);
              return ListTile(
                trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        box.deleteAt(box.length - index - 1);
                      });
                    },
                    icon: const Icon(Icons.delete_outline_outlined)),
                title: Text(currentName ?? notAvailable),
                onTap: () {
                  query = currentName;
                  showResults(context);
                },
              );
            });
      },
    );
  }

  bool _nullControl(String query) {
    if (query == '') {
      return false;
    } else {
      return true;
    }
  }

  _findMovieIndexInHive(int index) {
    return box.getAt(box.length - index - 1);
  }

  _saveMovies(String movieName) {
    _deleteFromHive(movieName);
    if (_checkSameMovieName(movieName)) {
      box.add(movieName);
    } else {
      int lastIndex = _findLastIndex(movieName);
      box.deleteAt(lastIndex);
      box.add(movieName);
    }
  }

  void _deleteFromHive(String movieName) {
    if (box.length >= 10) {
      if (!_checkSameMovieName(movieName)) {
        int lastIndex = _findLastIndex(movieName);
        box.deleteAt(lastIndex);
      } else {
        box.deleteAt(0);
        box.add(movieName);
      }
    }
  }

  bool _checkSameMovieName(String movieName) {
    return !box.values.contains(movieName);
  }

  int _findLastIndex(String movieNAme) {
    int lastIndex = 0;
    for (int i = box.length - 1; i >= 0; i--) {
      if (box.values.elementAt(i) == movieNAme) {
        lastIndex = i;
      }
    }
    return lastIndex;
  }
}
