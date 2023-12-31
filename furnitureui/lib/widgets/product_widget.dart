import 'package:flutter/material.dart';
import 'package:furnitureui/common/color_constants.dart';
import 'package:furnitureui/screen/product_details_screen.dart';

import 'package:google_fonts/google_fonts.dart';

import '../model/product_model.dart';



class ProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductWidget({
    required this.productModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              productModel: productModel,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: <Widget>[
            Card(
              shadowColor: Colors.grey[300],
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade200,
                      Colors.white,
                    ],
                    stops: [0.1, 1],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      productModel.name,
                      style: GoogleFonts.varelaRound(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$' + productModel.price.toString(),
                      style: GoogleFonts.varelaRound(
                        color: ColorConstants.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -50,
              child: Hero(
                tag: productModel.id.toString(),
                child: Image.asset(
                  productModel.imagePath,
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
