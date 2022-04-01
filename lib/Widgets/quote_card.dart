import 'package:flutter/material.dart';

class QuoteCard extends StatefulWidget {
  const QuoteCard({Key? key}) : super(key: key);

  @override
  _QuoteCardState createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.grey.shade50,
      child: Center(
        child: Text('HEY'),
      ),
    );
  }
}
