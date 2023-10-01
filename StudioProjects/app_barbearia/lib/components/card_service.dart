import 'package:flutter/material.dart';

class CardService extends StatelessWidget {
  final String? name;
  final double? price;
  final Image? imageProduct;
  
  const CardService({
    super.key,
    this.name,
    this.price,
    this.imageProduct,
    
    });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          
          // SizedBox(
          //   height: constraints.maxHeight * 0.05,
          // ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 120,
                child: imageProduct),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
//            color: Colors.white,
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: FittedBox(
                    alignment: Alignment.topLeft,
                    child: Text(
                      name!,
                      style: TextStyle(
                        color: Colors.orange[300],
                        fontFamily: 'Quicksand-Bold',
          //                      fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: FittedBox(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'R\$ ${price.toString()}',
                    style: TextStyle(
                      color: Colors.orange[300],
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}