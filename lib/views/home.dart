import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/artical_model.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/views/article_view.dart';

import 'category_view.dart';

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
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("The Guardian" , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            Text(" News" , style: TextStyle(
              color: Colors.white,

            ),),


          ]
        ),

        actions: <Widget>[

          TextButton.icon(
              icon: Icon(Icons.person, color: Colors.black,),
              label: Text('logout'),
            )
        ],

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

class CategoryTile extends StatelessWidget {
  final String imageURL, categoryname;
  CategoryTile({this.imageURL, this.categoryname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
           Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(
             categoty: categoryname.toLowerCase(),
           )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 15,top: 10),
        child: Stack(
          children:<Widget> [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CachedNetworkImage(
                  imageUrl: imageURL, width:110,height:50, fit: BoxFit.cover,)),
            Container(
              alignment: Alignment.center,
              width:120,height:60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),

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
              borderRadius: BorderRadius.circular(10),
                child: Image.network(imageURL)),
            SizedBox(height: 10,),
            Text(title, style: TextStyle(
              fontSize: 15,
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
