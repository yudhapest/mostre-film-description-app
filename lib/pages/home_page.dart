import 'package:flutter/material.dart';
import 'package:mostre/models/movie.dart';
import 'package:mostre/models/poster.dart';
import 'package:mostre/pages/detail_page.dart';
import 'package:mostre/provider/movie_provider.dart';
import 'package:mostre/theme/theme.dart';
import 'package:mostre/widgets/popular_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget header() {
    return Container(
      margin: EdgeInsets.only(
          top: defaultMargin, right: defaultMargin, left: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hi,Yudha',
            style:
                primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/foto.png',
            ),
            radius: 30,
          )
        ],
      ),
    );
  }

  @override
  Widget popular() {
    return Container(
      margin:
          EdgeInsets.only(top: 20, right: defaultMargin, left: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Poster Popular',
            style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: regular),
          ),
          Text(
            'See more',
            style:
                secondaryTextStyle.copyWith(fontSize: 16, fontWeight: regular),
          )
        ],
      ),
    );
  }

  @override
  Widget popularMovie() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            PopularCard(Poster(
                name: "Ready Player One",
                imagePoster: 'assets/ready_player.jpg',
                creator: "Steven Spielberg",
                rating: 5)),
            PopularCard(Poster(
                name: "Squid Game",
                imagePoster: 'assets/squid_game.png',
                creator: "Hwang Dong-hyuk",
                rating: 4)),
            PopularCard(Poster(
                name: "Joker",
                imagePoster: 'assets/joker.jpg',
                creator: "Todd Phillips",
                rating: 5)),
            PopularCard(Poster(
                name: "Avengers: Endgame",
                imagePoster: 'assets/avenger.jpg',
                creator: "Anthony Russo",
                rating: 4))
          ],
        ),
      ),
    );
  }

  @override
  Widget newMovieTitle() {
    return Container(
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, top: defaultMargin),
      child: Text(
        "New Movie",
        style: primaryTextStyle.copyWith(fontSize: 20, fontWeight: regular),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: ListView(
          children: [
            header(),
            popular(),
            popularMovie(),
            newMovieTitle(),
            Column(
              children: [
                Container(
                  child: FutureBuilder(
                      future: movieProvider.getRecommendedMovie(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Movie> data = snapshot.data;

                          return Column(
                            children:
                                data.map((item) => MovieCard(item)).toList(),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        )));
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;
  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 5, left: defaultMargin - 10, right: defaultMargin - 10),
      child: Card(
        color: backgroundColor2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return DetailPage(movie);
            }));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                    width: 130,
                    height: 130,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.name,
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      movie.description,
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: light),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
