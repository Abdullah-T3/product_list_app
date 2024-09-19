import 'package:flutter/material.dart';
import 'package:product_list_app/Responsive/UiComponanets/InfoWidget.dart';
import 'package:product_list_app/Responsive/models/DeviceInfo.dart';
import 'package:product_list_app/model/ProductModel.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Infowidget(
      builder: (BuildContext context, Deviceinfo deviceinfo) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.blue.shade200, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: deviceinfo.localWidth * 0.02),
            child: Column(
              children: [
                Stack(
                  children: [
                    product.image != null
                        ? Container(
                            padding:
                                EdgeInsets.all(deviceinfo.localHeight * 0.02),
                            height: deviceinfo.localHeight * 0.35,
                            width: deviceinfo.localWidth,
                            child: Image.network(product.image!),
                          )
                        : const Placeholder(),
                    Positioned(
                      top: 5,
                      left: deviceinfo.orientation == Orientation.landscape ?  deviceinfo.screenWidth * 0.378 : deviceinfo.localWidth * 0.68,
                      child: IconButton(
                        style: IconButton.styleFrom(
                          shape: const CircleBorder(),
                          shadowColor: Colors.black,
                          surfaceTintColor: Colors.white,
                          highlightColor: Colors.black12,
                          elevation: 3,
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: deviceinfo.orientation == Orientation.landscape ?  deviceinfo.screenHeight* 0.14 : deviceinfo.localHeight * 0.12,
                          shadows: const [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: deviceinfo.orientation == Orientation.landscape ?  deviceinfo.screenWidth* 0.14: deviceinfo.localWidth * 0.18),
                  child: Text(
                    product.title!,
                    textAlign: TextAlign.start,
                    style:  TextStyle(
                     fontSize: deviceinfo.orientation == Orientation.landscape ?  deviceinfo.screenHeight* 0.06:deviceinfo.localWidth* 0.07,
                      fontWeight: FontWeight.bold,
                      
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:deviceinfo.orientation==  Orientation.landscape? deviceinfo.localWidth * 0.01 :deviceinfo.screenWidth * 0.02),
                  child: Text(
                    product.description!,
                    style:  TextStyle(
                      fontSize: deviceinfo.orientation == Orientation.landscape ?  deviceinfo.screenHeight* 0.06:deviceinfo.localWidth* 0.07 ,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "EGP ${product.price}",
                      style: TextStyle(fontSize:deviceinfo.orientation == Orientation.landscape ?  deviceinfo.screenHeight* 0.06: deviceinfo.localHeight * 0.08),
                    ),
                    SizedBox(width: deviceinfo.localWidth * 0.15),
                    Text(
                      product.price.toString(),
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.lineThrough,
                          fontSize:deviceinfo.orientation == Orientation.landscape ?  deviceinfo.screenHeight* 0.06: deviceinfo.localHeight * 0.07),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Review ""(${product.rating!.rate!.toString()}) ",style: TextStyle(fontSize:deviceinfo.orientation == Orientation.landscape ?  deviceinfo.screenHeight* 0.06: deviceinfo.localHeight* 0.08),),
                     Icon(
                      Icons.star,
                      size:deviceinfo.orientation == Orientation.landscape ?  deviceinfo.screenHeight *0.1 : deviceinfo.localHeight * 0.15,
                      color: Colors.amber,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left:deviceinfo.orientation == Orientation.landscape ?  deviceinfo.screenWidth * 0.19 : deviceinfo.localWidth * 0.05),
                      child: IconButton(
                          style: IconButton.styleFrom(
                              hoverColor: Colors.white,
                              surfaceTintColor: Colors.white,
                              highlightColor: Colors.black26,
                              elevation: 3,
                              shape: const CircleBorder(),
                              backgroundColor: const Color(0xFF004086)),
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: deviceinfo.screenWidth * 0.06,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
