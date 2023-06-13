import 'package:flutter/material.dart';
import 'package:mostre/models/poster.dart';
import 'package:mostre/theme/theme.dart';

class PopularCard extends StatelessWidget {
  final Poster poster;
  PopularCard(this.poster);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Card(
        color: backgroundColor2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                poster.imagePoster,
                fit: BoxFit.cover,
                width: 200,
                height: 250,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              poster.name,
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Text(
              poster.creator,
              style:
                  secondaryTextStyle.copyWith(fontSize: 14, fontWeight: bold),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
