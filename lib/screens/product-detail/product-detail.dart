import 'package:ecommerce_app/models/product_list_response.dart';
import 'package:ecommerce_app/screens/product-detail/components/body.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ProductDetailScreen extends StatelessWidget {
  static String routeName = '/product-details';
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final product = (arguments as ProductDetailArguments);
    Logger().i('product detail ${product.product.productName}');
    return Scaffold(
      body: Body(
        product: product.product,
      ),
    );
  }
}

class ProductDetailArguments {
  final Product product;

  ProductDetailArguments(this.product);
}
