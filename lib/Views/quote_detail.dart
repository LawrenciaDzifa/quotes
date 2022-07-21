import 'package:flutter/material.dart';
import 'package:quotes/Modules/quote_category.dart';
import 'package:quotes/Modules/wp_api.dart';
import 'package:quotes/Widgets/quote_card.dart';
import 'package:quotes/post_by_category.dart';
import 'package:quotes/post_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';

class QuoteDetails extends StatefulWidget {
  const QuoteDetails({Key? key, required this.quote}) : super(key: key);
  final PostByCategory quote;
  @override
  _QuoteDetailsState createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {
  @override
  void initState() {
    super.initState();
    // WpApi().fetchQuoteDetail();
  }

  @override
  Widget build(BuildContext context) {
    // final wpquotesDetail = WpApi().fetchQuoteDetail();
    // var imageurl = wpquotesDetail.xFeaturedMedia;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              height: MediaQuery.of(context).size.height / 2.6,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: widget.quote.xFeaturedMedia == null
                    ? DecorationImage(
                        image:
                            AssetImage('assets/images/placeholder-image.png'),
                        fit: BoxFit.cover)
                    : DecorationImage(
                        image: NetworkImage(widget.quote.xFeaturedMedia!),
                        fit: BoxFit.cover,
                      ),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                  stops: [0.0, 1],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Center(
                child: Text(
                  widget.quote.title!.rendered.toString(),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            //SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
              child: Container(
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.shade200,
                  //     blurRadius: 5.0, // soften the shadow
                  //     spreadRadius: 5.0, //extend the shadow
                  //     offset: Offset(
                  //       2, // Move to right 10  horizontally
                  //       2.0, // Move to bottom 10 Vertically
                  //     ),
                  //   )
                  // ],
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
            // Divider(
            //   thickness: 0.7,
            // )
          ],
        ));

    //
  }
}
