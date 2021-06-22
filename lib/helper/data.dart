import 'package:flutter_news/models/category_model.dart';

List<CategoryModel> getcategories(){

  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  //1st
  categoryModel = new CategoryModel();
  categoryModel.categoryname = "Business";
  categoryModel.imageURL= "https://images.unsplash.com/photo-1611095969382-19fbe23cebff?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryname = "Science";
  categoryModel.imageURL= "https://images.unsplash.com/photo-1581093588401-fbb62a02f120?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryname = "Politics";
  categoryModel.imageURL= "https://images.unsplash.com/photo-1555848962-6e79363ec58f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=976&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryname = "Nature";
  categoryModel.imageURL= "https://images.unsplash.com/photo-1588392382834-a891154bca4d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.categoryname = "Sports";
  categoryModel.imageURL= "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);


  return category;


}