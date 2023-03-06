import 'package:flutter/material.dart';
import 'package:quotes/post_by_category.dart';
import 'package:html/parser.dart';
import 'package:share_plus/share_plus.dart';

class QuoteDetails extends StatefulWidget {
  const QuoteDetails({ required this.quote});
  final PostByCategory quote;
  @override
  _QuoteDetailsState createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: Color(0xffcadeed),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: widget.quote.xFeaturedMedia == null
                    ? DecorationImage(
                        image:
                            AssetImage('assets/images/placeholder-image.png'),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: NetworkImage(widget.quote.xFeaturedMedia!),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.darken),
                      ),
                color: Color(0xffcadeed),
              ),
              child: Center(
                child: Text(
                  widget.quote.title!.rendered.toString(),
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffcadeed),
                  ),
                  textAlign: TextAlign.center,
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
                  parse(widget.quote.content!.rendered!).documentElement!.text,
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
                    onPressed: () {
                      // add to favorite
                      // likeQuote(quoteId, userId);
                    },
                    icon: Icon(Icons.favorite_border),
                    iconSize: 35,
                  ),
                  IconButton(
                    onPressed: () {
                      // share the quote
                      Share.share(
                          '${widget.quote.title!.rendered.toString()} \n\n ${parse(widget.quote.content!.rendered!).documentElement!.text}');
                    },
                    icon: Icon(Icons.share),
                    iconSize: 35,
                  ),
                ],
              ),
            ),
          ],
        ));

    //
  }
}
