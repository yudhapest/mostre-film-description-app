import 'package:flutter/material.dart';
import 'package:mostre/theme/theme.dart';

class HeaderButton extends StatefulWidget {
  @override
  _HeaderButtonState createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: defaultMargin, right: defaultMargin, left: defaultMargin),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          Spacer(),
          Text(
            'Detail Movie',
            style:
                primaryTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              setState(() {
                isClicked = !isClicked;
              });
            },
            icon: Icon(
              isClicked ? Icons.bookmark_added : Icons.bookmark_add_outlined,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
