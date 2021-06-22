import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/artical_model.dart';
import 'package:flutter_news/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticalModel> articles = new List<ArticalModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories =  getcategories();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" The Guardian"),
            Text(" News" , style: TextStyle(
              color: Colors.blue
            ),),
          ],
        ),
        centerTitle: true,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )  : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget> [
              //categories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index){
                    return CategoryTile(
                      imageURL: categories[index].imageURL,
                      categoryname: categories[index].categoryname,
                    );
                  },
                   ),
              ),

              //blogs

              Container(
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return BlogTile(
                          imageURL: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageURL, categoryname;
  CategoryTile({this.imageURL, this.categoryname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Stack(
          children:<Widget> [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(imageURL, width:120,height:60, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width:120,height:60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),

              ),

              child: Text(categoryname, style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageURL, title, desc;
  BlogTile({@required this.imageURL,@required this.title, @required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(imageURL),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
