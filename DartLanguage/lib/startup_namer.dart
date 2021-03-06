import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Startup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement buil

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "helle",
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(body: RandomWords()),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RandomWordsState();
  }
}

class _RandomWordsState extends State<RandomWords> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>(); // NEW
//  final _biggerFont = TextStyle(fontSize: 18.0);

  _pushSave() {
    Navigator.of(context).push(MaterialPageRoute<void>(
        // NEW lines from here...
        builder: (BuildContext context) {
      final tiles = _saved.map(
        (WordPair pair) {
          return ListTile(
            title: Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
        },
      );
      final divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
        ),
        body: ListView(children: divided),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    // TODO: implement build
//    return Text(wordPair.asCamelCase);
    return Scaffold(
      appBar: AppBar(
        title: Text("New App"),
        actions: [IconButton(icon: Icon(Icons.list), onPressed: _pushSave)],
      ),
      body: _buildSuggest(),
    );
  }

  Widget _buildSuggest() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }

          final int index = i ~/ 2;

          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asCamelCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        this.setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
