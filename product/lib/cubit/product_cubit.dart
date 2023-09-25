import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../model/api_return_value.dart';
import '../model/product_model.dart';
import '../services/product_services.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  getProduct() async {
    emit(ProductLoading());
    final ApiReturnValue<List<ProductModel>> res =
        await ProductServices().getAllProducts();
    if (res.value != null) {
      emit(ProductSuccess(res.value!));
    } else {
      emit(ProductFailed(res.message));
    }
  }
}
