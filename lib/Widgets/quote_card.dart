import 'package:flutter/material.dart';

class QuoteCard extends StatefulWidget {
  const QuoteCard({Key? key}) : super(key: key);

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/placeholder-image.png'),
                  fit: BoxFit.cover),
              gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.6),
              ], stops: [
                0.0,
                1
              ], begin: Alignment.topRight),
            ),
            child: Center(
              child: Text(
                'Post Title',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Just one small positive thought in the morning can change your whole day. Just one small positive thought in the morning can change your whole day',
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
                  iconSize: 35,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  iconSize: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
