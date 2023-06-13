// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:mostre/models/movie.dart';
import 'package:mostre/theme/theme.dart';
import 'package:mostre/widgets/header_button.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  DetailPage(this.movie);

  @override
  Widget movieCard() {
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.network(
                movie.imageUrl,
                fit: BoxFit.cover,
                width: 300,
                height: 400,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget movieTitle() {
    return Container(
      margin: EdgeInsets.only(left: defaultMargin, right: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.name,
            style:
                primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                movie.creator,
                style: secondaryTextStyle.copyWith(
                    fontSize: 18, fontWeight: regular),
              ),
              Spacer(),
              Text(
                '${movie.rating.toString()}',
                style: secondaryTextStyle.copyWith(
                    fontSize: 18, fontWeight: regular),
              ),
              Icon(
                Icons.star_rate_rounded,
                color: Colors.yellow[900],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget categories() {
    return Container(
      margin: EdgeInsets.only(
          top: defaultMargin, left: defaultMargin, right: defaultMargin),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 12),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: secondaryColor),
            child: Text(
              movie.genre,
              style: primaryTextStyle.copyWith(fontWeight: regular),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget description() {
    return Container(
      margin: EdgeInsets.only(
          top: defaultMargin - 15, left: defaultMargin, right: defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Synopsis',
            style:
                primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            movie.description,
            style: primaryTextStyle.copyWith(fontWeight: regular, fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: ListView(
        children: [
          HeaderButton(),
          movieCard(),
          movieTitle(),
          categories(),
          description()
        ],
      )),
    );
  }
}
