import 'package:flutter/material.dart';
import 'package:quotes/Models/wp_api.dart';
import 'package:quotes/Views/home.dart';
import 'package:quotes/Views/quote_detail.dart';
import 'package:quotes/category_model.dart';
import 'package:quotes/post_by_category.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({Key? key, required this.category}) : super(key: key);
  final CategoryModel category;

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.category.name!),
        elevation: 0.0,
        leading: BackButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<PostByCategory>>(
              future: WpApi().fetchQuoteByCategory(widget.category.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data == null) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: Text(
                        'No posts available now, please check back later',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  );
                }
                if (snapshot.data!.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Center(
                      child: Text(
                        'No posts available now, please check back later',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: false,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final wpquotesDetail = snapshot.data![index];
                      var imageurl = wpquotesDetail.xFeaturedMedia;
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      QuoteDetails(quote: wpquotesDetail)));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          margin: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: imageurl != null
                                ? DecorationImage(
                                    image: NetworkImage(imageurl),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.5),
                                        BlendMode.darken),
                                  )
                                : DecorationImage(
                                    image: AssetImage(
                                        'assets/images/placeholder-image.png'),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.7),
                                        BlendMode.darken),
                                  ),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Center(
                              child: Text(
                                wpquotesDetail.title!.rendered!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
