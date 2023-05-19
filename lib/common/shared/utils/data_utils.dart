import 'dart:convert';

import 'package:bom_hamburguer/common/common.dart';
import 'package:bom_hamburguer/home/home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Saving model into Storage
///
/// This data needs to be consuming using an endpoint
///
/// **(this is just an example to use the date in the app)**
Future<void> saveUserData() async {
  final mainProducts = [
    const ProductDTO(
      id: 1,
      name: 'Sandwich Burger',
      price: 5,
      image:
          'https://www.cocinavital.mx/wp-content/uploads/2017/10/sandwich-burguer-1.jpg',
      type: ProductType.main,
    ),
    const ProductDTO(
      id: 2,
      name: 'Sandwich Egg',
      price: 4.50,
      image:
          'https://www.simplyrecipes.com/thmb/5KEzbHplXxqFntM-jqrI0QdExR4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Simply-Recipes-Easy-Egg-Salad-Sandwich-LEAD-22-8ecbb89abda34a84b649ff4c44bab525.JPG',
      type: ProductType.main,
    ),
    const ProductDTO(
      id: 3,
      name: 'Sandwich Bacon',
      price: 7,
      image:
          'https://static.toiimg.com/thumb/57407393.cms?imgsize=77196&width=800&height=800',
      type: ProductType.main,
    ),
  ];

  final additionProducts = [
    const ProductDTO(
      id: 4,
      name: 'Fries',
      price: 2,
      image:
          'https://www.allrecipes.com/thmb/JZsbJ8XNPxkbDk_hwHz-KI7nSKk=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/219634-chef-johns-french-fries-DDMFS-4x3-338dec7976fc4d75bb3e2c18ff6a6e95.jpg',
      type: ProductType.addition,
    ),
    const ProductDTO(
      id: 5,
      name: 'Soft drink',
      price: 2.50,
      image:
          'https://www.seoulbirdsoju.com/uploads/1/4/0/3/140373826/s304085215686159596_p18_i1_w612.jpeg',
      type: ProductType.addition,
    ),
  ];

  final discounts = [
    DiscountRuleDTO(
      products: [
        mainProducts[0],
        additionProducts[0],
        additionProducts[1],
      ],
      discount: 20,
    ),
    DiscountRuleDTO(
      products: [
        mainProducts[1],
        additionProducts[0],
        additionProducts[1],
      ],
      discount: 20,
    ),
    DiscountRuleDTO(
      products: [
        mainProducts[2],
        additionProducts[0],
        additionProducts[1],
      ],
      discount: 20,
    ),
    DiscountRuleDTO(
      products: [
        mainProducts[0],
        additionProducts[1],
      ],
      discount: 15,
    ),
    DiscountRuleDTO(
      products: [
        mainProducts[1],
        additionProducts[1],
      ],
      discount: 15,
    ),
    DiscountRuleDTO(
      products: [
        mainProducts[2],
        additionProducts[1],
      ],
      discount: 15,
    ),
    DiscountRuleDTO(
      products: [
        mainProducts[0],
        additionProducts[0],
      ],
      discount: 10,
    ),
    DiscountRuleDTO(
      products: [
        mainProducts[1],
        additionProducts[0],
      ],
      discount: 10,
    ),
    DiscountRuleDTO(
      products: [
        mainProducts[2],
        additionProducts[0],
      ],
      discount: 10,
    ),
  ];

  final catalog = CatalogDTO(
    products: [...mainProducts, ...additionProducts],
    discounts: discounts,
  );

  final catalogJson = json.encode(catalog);

  await const FlutterSecureStorage().write(
    key: 'catalogKey',
    value: catalogJson,
  );
}
