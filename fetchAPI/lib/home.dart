import 'package:fetchAPI/model/CostExchange.dart';
import 'package:fetchAPI/model/Movie.dart';
import 'package:fetchAPI/model/Result.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Future<Result> futureAlbum;
  Future<CostExchange> futureCost;
  List<Movie> listMovie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    futureAlbum = fetchAlbum();
    futureCost = fetchCoin();
  }

  Future<Result> fetchAlbum() async {
    final response = await http.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=bbc473cc53a42cbc333fea4235662554&language=en-US&page=2');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Result.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<CostExchange> fetchCoin() async {
    final response = await http.get(
        'https://v6.exchangerate-api.com/v6/cbf0914ccecd4f9914f17833/latest/EUR');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return CostExchange.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("HOME"),
        ),
        body: FutureBuilder<CostExchange>(
          future: futureCost,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
//              listMovie = snapshot.data.results;
//              return _listMovie();
              print(snapshot);
              if (snapshot.data != null) {
                print("saas${snapshot.data.result}");
              }
              print(snapshot.requireData);
              return Text(snapshot.data.conversionRates.aED.toString());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  _listMovie() {
    return SingleChildScrollView(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listMovie.length,
          itemBuilder: (BuildContext _context, int i) {
            return Container(
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                listMovie[i].title,
                textAlign: TextAlign.center,
              ),
              alignment: Alignment.center,
            );
          }),
    );
  }

  onHandleClick(String name) {
    print("abc");
  }
}
