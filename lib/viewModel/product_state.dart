
import 'package:flutter/material.dart';
import 'package:product_list_app/model/ProductModel.dart';



@immutable
sealed class ProductState {}

// Represents the initial state of the product
final class ProductInitial extends ProductState {}

// Represents the state when products are being loaded
final class ProductLoading extends ProductState {}

// Represents the state when products have been successfully loaded
final class ProductLoaded extends ProductState {
  final List<ProductModel> products;

  ProductLoaded(this.products);

  @override
  String toString() => 'ProductLoaded(products: $products)';
}

// Represents the state when there is an error loading products
final class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  String toString() => 'ProductError(message: $message)';
}
