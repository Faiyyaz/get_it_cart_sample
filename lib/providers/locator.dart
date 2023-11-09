import '../services/cart_service.dart';
import '../services/product_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => ProductService());
  getIt.registerLazySingleton(() => CartService());
}
