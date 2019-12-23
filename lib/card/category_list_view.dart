import 'package:flutter/material.dart';
import 'package:senja/constants/theme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:senja/models/product.dart';
import 'package:senja/scoped-model/products_model.dart';
import 'package:senja/card/card_widget/bestseller_card.dart';

class CategoryListView extends StatefulWidget {
  final bool isVertical;
  final String categoryList;
  CategoryListView({this.isVertical, this.categoryList});
  @override
  State<StatefulWidget> createState() {
    return CategoryListViewState();
  }
}

class CategoryListViewState extends State<CategoryListView> {

  bool showminus = false;
  
  Widget _buildBestSellerItems(BuildContext context, int position, Product product,
      ProductsModel model) {
    return BestSellerCard(model: model,product: product,);
    // _buildBestSellerCard(context, product, model);
  }

  Widget _buildBestSellerList(List<Product> products, ProductsModel model) {
    Widget productCard;
    if (products.length > 0) {
      productCard = Container(
        padding: EdgeInsets.only(left: 8, top: 0),
        height: 250,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              _buildBestSellerItems(context, index, products.where((a) => a.categoryName == widget.categoryList).toList()[index], model),
          scrollDirection: Axis.horizontal,
          itemCount: products.where((a) =>a.categoryName == widget.categoryList).length,
        ),
      );
    } else {
      productCard = Center(child: Text("No Products Found!"));
    }
    return productCard;
  }

  Widget _buildBestSellerListVertical(List<Product> products, ProductsModel model) {
    Widget productCard;
    if (products.length > 0) {
      productCard = Container(
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => _buildBestSellerItems(context, index, products.where((a) => a.categoryName == widget.categoryList).toList()[index], model),
          // scrollDirection: isVertical? Axis.horizontal : Axis.vertical,
          itemCount: products.where((a) =>a.categoryName == widget.categoryList).length,
        ),
      );
    } else {
      productCard = Center(child: Text('NO, PRODUCTS FOUND :( '));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    return new ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return widget.isVertical
            ? _buildBestSellerList(model.products, model)
            : _buildBestSellerListVertical(model.products, model);
      },
    );
  }
}
