int categoryNumber = 0;
var categoryBank;

class QuoteCategory {
  final String categoryName;
  String image;

  QuoteCategory({required this.categoryName, required this.image});
}

List<QuoteCategory> getAllCategories() => [
      QuoteCategory(
        categoryName: 'Education',
        image: 'assets/images/sch.jpg',
      ),
      QuoteCategory(
        categoryName: 'Career ',
        image: 'assets/images/work.jpg',
      ),
      QuoteCategory(
        categoryName: 'Family ',
        image: 'assets/images/fam.jpg',
      ),
      QuoteCategory(
        categoryName: 'Love ',
        image: 'assets/images/luv.jpg',
      ),
      QuoteCategory(
        categoryName: 'Friends',
        image: 'assets/images/friend.jpg',
      ),
      QuoteCategory(
        categoryName: 'Happiness',
        image: 'assets/images/laugh.jpg',
      ),
      QuoteCategory(
        categoryName: 'Sadness',
        image: 'assets/images/sad.jpg',
      ),
      QuoteCategory(
        categoryName: 'Funny',
        image: 'assets/images/fun.jpg',
      ),
    ];

getAllCategory(categoryNumber) {
  return categoryBank[categoryNumber].categoryName;
}
