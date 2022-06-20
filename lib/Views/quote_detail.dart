import 'package:flutter/material.dart';
import 'package:quotes/Modules/quote_category.dart';
import 'package:quotes/Modules/wp_api.dart';
import 'package:quotes/Widgets/quote_card.dart';
import 'package:quotes/post_model.dart';

class QuoteDetails extends StatefulWidget {
  const QuoteDetails({Key? key}) : super(key: key);

  @override
  _QuoteDetailsState createState() => _QuoteDetailsState();
}

class _QuoteDetailsState extends State<QuoteDetails> {
  // late List<QuoteCategory> _allCategories;
  // int index = categoryNumber;

  @override
  void initState() {
    super.initState();
    WpApi().fetchQuoteDetail();
  }

  @override
  Widget build(BuildContext context) {
    final wpquotesDetail = WpApi().fetchQuoteDetail();
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
      body: Container(
        child: FutureBuilder<List<PostModel>>(
            future: WpApi().fetchQuoteDetail(),
            builder: (context, snapshot) {
              if (snapshot.hasData == false) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(child: QuoteCard());
              }
            }),
      ),

      // allQuoteDetails.length == 0
      //     ? Center(child: CircularProgressIndicator())
      //     : ListView.builder(
      //         itemBuilder: (context, index) {
      //           return Column(
      //             children: [
      //               Container(
      //                 height: MediaQuery.of(context).size.height / 3,
      //                 // decoration: BoxDecoration(
      //                 //   image: DecorationImage(
      //                 //       image: AssetImage(imageurl), fit: BoxFit.cover),
      //                 // ),
      //                 child: Center(
      //                   child: Text(
      //                     allQuoteDetails[index].content,
      //                     style: TextStyle(
      //                         fontSize: 40, fontWeight: FontWeight.w500),
      //                   ),
      //                 ),
      //               ),
      //               //SizedBox(height: 50),
      //               Padding(
      //                 padding:
      //                     EdgeInsets.symmetric(horizontal: 10, vertical: 150),
      //                 child: Container(
      //                   decoration: BoxDecoration(
      //                     // color: Colors.white,
      //                     borderRadius: BorderRadius.circular(15),
      //                     // boxShadow: [
      //                     //   BoxShadow(
      //                     //     color: Colors.grey.shade200,
      //                     //     blurRadius: 5.0, // soften the shadow
      //                     //     spreadRadius: 5.0, //extend the shadow
      //                     //     offset: Offset(
      //                     //       2, // Move to right 10  horizontally
      //                     //       2.0, // Move to bottom 10 Vertically
      //                     //     ),
      //                     //   )
      //                     // ],
      //                   ),
      //                   child: Text(
      //                     'Lorem ipsum dolor amet, consectetur adipiscing elit.'
      //                         .toUpperCase(),
      //                     style: TextStyle(
      //                       fontSize: 25,
      //                     ),
      //                     textAlign: TextAlign.center,
      //                   ),
      //                 ),
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   IconButton(
      //                     onPressed: () {},
      //                     icon: Icon(Icons.favorite_border),
      //                     iconSize: 35,
      //                   ),
      //                   IconButton(
      //                     onPressed: () {},
      //                     icon: Icon(Icons.share),
      //                     iconSize: 35,
      //                   ),
      //                 ],
      //               ),
      //               // Divider(
      //               //   thickness: 0.7,
      //               // )
      //             ],
      //           );
      //         },
      //       )
    );
  }
}
