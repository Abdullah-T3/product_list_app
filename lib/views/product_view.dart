import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/viewModel/product_cubit.dart';
import 'package:product_list_app/viewModel/product_state.dart';
import 'package:product_list_app/widgets/product_item.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    // Call fetchProducts when the widget is built
    context.read<ProductCubit>().fetchProducts();

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductError) {
          return Center(child: Text(state.message));
        } else if (state is ProductLoaded) {
          if (state.products.isEmpty) {
            return const Center(child: Text('No products available.'));
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ProductItem(product: product);
            },
          );
        } else if (state is ProductInitial) {
          return const Center(child: Text('Initial State')); // Handle ProductInitial if needed
        } else {
          return const Center(child: Text('Unexpected state')); // Catch-all for unknown states
        }
      },
    );
  }
}
