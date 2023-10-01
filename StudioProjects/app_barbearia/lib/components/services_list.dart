import 'package:app_barbearia/components/card_service.dart';
import 'package:app_barbearia/model/service.dart';
import 'package:flutter/material.dart';

class ServicesList extends StatelessWidget {
  final List<Service> services;

  ServicesList(this.services);

  @override
  Widget build(BuildContext context) {
     return ListView.builder(
      
      scrollDirection: Axis.horizontal,
      itemCount: services.length,
      itemBuilder: (ctx, index) {
        final pr = services[index];
          return Container(
            width: 190,
            height: 160,
            child: Card(
              elevation: 6,
              margin: const EdgeInsets.fromLTRB(5, 30, 5, 80),
              color: Color(0xFF3E3E3E),
              child: CardService(
                  name: pr.name,
                  imageProduct: pr.imageProduct,
                  price: pr.price,
              ),
            ),
          );
      },
    );
  }
}