import 'package:flutter/material.dart';
import 'package:learn30/models/apiData.dart';
import 'package:learn30/widgets/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String stringResponce = "";
Map mapResponce = {};
List dataResponse = [];

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  String url = "https://api-telly-tell.herokuapp.com/movies/rahul.verma";

  List<MovieModel> movieModel = [];
  List<RatingModel> ratingModel = [];
  List<ActorModel> actorModel = [];
  Future apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    mapResponce = json.decode(response.body);
    dataResponse = mapResponce["data"];

    for (var movie in dataResponse) {
      if (!movie["Ratings"].isEmpty) {
        RatingModel rating = RatingModel(
            imDb: movie["imDb"],
            metacritic: movie['metacritic'],
            theMovieDb: movie['theMovieDb'],
            rottenTomatoes: movie['rottenTomatoes'],
            filmAffinity: movie['filmAffinity']);

        ratingModel.add(rating);
      }

      if (!movie["Actors_list"].isEmpty) {
        for (var actor in movie["Actors_list"]) {
          ActorModel actorDetails = ActorModel(
            name: actor['name'],
            asCharacter: actor['asCharacter'],
            image: actor['image'],
          );
          actorModel.add(actorDetails);
        }
      }

      MovieModel movieDetails = MovieModel(
          ratings: ratingModel,
          description: movie['description'],
          live: movie['live'],
          thumbnail: movie["thumbnail"],
          launchDate: movie['launchDate'],
          video: movie['video'],
          directors: movie['directors'],
          year: movie['year'],
          image: movie['image'],
          genres: movie['genres'],
          languages: movie['languages'],
          runtimeStr: movie['runtimeStr'],
          plot: movie['plot'],
          writers: movie['writers'],
          title: movie['title'],
          actors: actorModel,
          banner: movie['banner']);
      movieModel.add(movieDetails);
    }
    print(movieModel);
    // return movieModel;
  }

  bool isbtnPressed = false;

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 9,
                crossAxisSpacing: 6,
                crossAxisCount: (Orientation == Orientation.portrait) ? 3 : 2),
            itemCount: movieModel.length,
            itemBuilder: (context, i) {
              return Card(
                child: GridTile(
                    child: Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: 200,
                  child: Column(
                    children: [
                      (movieModel[i].image.toString() != "")
                          ? Image.network(
                              movieModel[i].image.toString(),
                              width: 210,
                              height: 160,
                            )
                          : Container(),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [Text(movieModel[i].title.toString())],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
              );
            }),
      ),
      drawer: const MyDrawer(),
    );
  }
}








        // child: (mapResponce['data'].toString() == "null")
        //     ? const CircularProgressIndicator()
        //     : Column(
        //         children: [
        //           Text(dataResponse[0].toString()),
        //           const SizedBox(
        //             height: 15,
        //           ),
        //           Image.network(dataResponse[0]["image"].toString()),
        //         ],
        //       ),
        // child: Center(
        //   child: Column(
        //     children: [
        //       TextButton(
        //         onPressed: () {
        //           apiCall();
        //           isbtnPressed = true;
        //         },
        //         child: const Text("knsdk"),
        //       ),
        //       isbtnPressed
        //           ? Text(movieModel[0].banner.toString())
        //           : const Text(""),
        //     ],
        //   ),
        // ),