import 'package:flutter/material.dart';

class District extends StatelessWidget {
  final String imageUrl;
  final String title;

  District({@required this.imageUrl, @required this.title});
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              //color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              border: Border.all(
                color: Colors.black,
                width: 0.3,
              ),
              image: DecorationImage(
                image: AssetImage(imageUrl), //NetworkImage(imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.linearToSrgbGamma(),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Colors.white,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5, 1],
                colors: [
                  Colors.grey.withOpacity(0.0),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
