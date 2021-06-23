import 'package:flutter/material.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/artical_model.dart';

import 'article_view.dart';
class CategoryNews extends StatefulWidget {

  final String categoty;
  CategoryNews({this.categoty});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticalModel> articles = new List<ArticalModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCateNews();
  }


  getCateNews() async{
    NewsforCategoryClass newsClass = NewsforCategoryClass();
    await newsClass.getNews(widget.categoty);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("The Guardian" , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            Text(" News" , style: TextStyle(
              color: Colors.white,

            ),),
          ],
        ),
        centerTitle: true,
      ),
      body:  _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )  :SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(

                    ),
                    itemBuilder: (context, index){
                      return BlogTile(
                        imageURL: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageURL, title, desc, url;
  BlogTile({@required this.imageURL,@required this.title, @required this.desc, @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticalView(
          blogURL: url,
        )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageURL)),
            SizedBox(height: 10,),
            Text(title, style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w800
            ),),
            SizedBox(height: 10,),
            Text(desc, style: TextStyle(
                fontSize: 12, color: Colors.blue
            ),),
          ],
        ),
      ),
    );
  }
}