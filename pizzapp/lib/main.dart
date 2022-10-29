import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Random Names generator', home: Widgettino());
  }
}

class Widgettino extends StatefulWidget {
  const Widgettino({super.key});

  @override
  State<Widgettino> createState() => _WidgettinoState();
}

class _WidgettinoState extends State<Widgettino> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  final _saved = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // NEW from here ...
      appBar: AppBar(
        title: const Text('Kawaii'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(36.0),
          itemBuilder: /*1*/ (context, i) {
            if (i.isOdd) return const Divider(); /*2*/

            final index = i ~/ 2; /*3*/
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10)); /*4*/
            }
            final alreadySaved = _saved.contains(_suggestions[index]);

            return ListTile(
              title: Text(_suggestions[index].asPascalCase, style: _biggerFont),
              
              trailing: 
                  Icon(
                CupertinoIcons.heart_circle_fill,
                color: alreadySaved ? Colors.pink : Colors.grey,
                semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
              ),
              
              onTap: () {
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(_suggestions[index]);
                  } else {
                    _saved.add(_suggestions[index]);
                  }
                });
              },
            );
          }),
    );
  }

  ////////////// Functions

  void _pushSaved() {
    Navigator.of(context).push(
      // Add lines from here...
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Cuorati'),
              backgroundColor: Colors.pink,
            ),
            body: ListView(children: divided),
          );
        },
      ), // ...to here.
    );
  }
}
