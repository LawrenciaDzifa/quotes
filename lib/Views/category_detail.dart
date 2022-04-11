import 'package:flutter/material.dart';
import 'package:quotes/Modules/wp_api.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({Key? key}) : super(key: key);

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  //late Future<List> futureData;

  @override
  // void initState() {
  //   super.initState();
  //   futureData = fetchQuoteDetail();
  // }

  @override
  Widget build(BuildContext context) {
    //apiCalls();

    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          //backgroundColor: Colors.transparent,
          title: Text('Love'),
          elevation: 0,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: Column(children: [
          // Container(
          //   height: MediaQuery.of(context).size.height / 3,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage('assets/images/luv.jpg'),
          //         fit: BoxFit.cover),
          //   ),
          //   child: Center(
          //     child: Text(
          //       'Love',
          //       style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          //     ),
          //   ),
          // ),
          Expanded(
            child: FutureBuilder<List>(
                future: fetchQuoteDetail(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: false,
                        itemCount: snapshot.data!.length,
                        //itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          Map wpquotesDetail = snapshot.data![index];
                          var imageurl = wpquotesDetail['x_featured_media'];
                          return Container(
                            height: MediaQuery.of(context).size.height / 6,
                            //color: Colors.grey[200],
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: imageurl != null
                                  ? DecorationImage(
                                      image: NetworkImage(imageurl),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.7),
                                          BlendMode.darken),
                                    )
                                  : DecorationImage(
                                      image: AssetImage(
                                          'assets/images/placeholder-image.png'),
                                      fit: BoxFit.cover,
                                      // colorFilter: ColorFilter.mode(
                                      //     Colors.black.withOpacity(0.6),
                                      //     BlendMode.darken),
                                    ),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Center(
                                child: Text(
                                  wpquotesDetail['title']['rendered'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else
                    return Center(child: CircularProgressIndicator());
                }),
          ),
          SizedBox(
            height: 30,
          )
        ]));
  }
}
