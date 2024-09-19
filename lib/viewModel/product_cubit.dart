

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/model/ProductModel.dart';
import 'package:product_list_app/viewModel/product_state.dart';
import 'package:http/http.dart' as http;

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {

        List<ProductModel> products = productModelFromJson(response.body);
        emit(ProductLoaded(products));
      } else {
        emit(ProductError('Failed to load products'));
      }
    } catch (e) {
      emit(ProductError('An error occurred: $e'));
    }
  }
}
