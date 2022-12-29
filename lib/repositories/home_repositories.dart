import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahadproject/servies/Dio_helper.dart';

 final productsProvider =FutureProvider((ref)=>ProductsRepository().getProducts());
 final  cartsProvider =FutureProvider((ref)=>CartsRepository().getCarts());
final  ElectronicsProvider =FutureProvider((ref)=>ElectronicsRepository().getElectronics());
final  JeweleryProvider =FutureProvider((ref)=>JeweleryRepository().getJewelery());
final  MensClothingProvider =FutureProvider((ref)=>MensClothingRepository().getMensClothing());
final WomensClothingProvider =FutureProvider((ref)=>WomensClothingRepository().getWomensClothing());
final  User1Provider =FutureProvider((ref)=>User1Repository().getUser1());




class ProductsRepository {

  Future<Response> getProducts() async {
    return await DioHelper.dio!.get('products');
  }

}
class CartsRepository {

  Future<Response> getCarts() async {
    return await DioHelper.dio!.get('carts');
  }

}
class ElectronicsRepository {

  Future<Response> getElectronics() async {
    return await DioHelper.dio!.get('products/category/electronics');
  }
}



  class JeweleryRepository {

    Future<Response> getJewelery() async {
      return await DioHelper.dio!.get('products/category/jewelery');
    }
  }
class MensClothingRepository {

  Future<Response> getMensClothing() async {
    return await DioHelper.dio!.get('products/category/men\'s clothing');
  }
}
class WomensClothingRepository {

  Future<Response> getWomensClothing() async {
    return await DioHelper.dio!.get('products/category/women\'s clothing');
  }
}

class User1Repository {

  Future<Response> getUser1() async {
    return await DioHelper.dio!.get('users/1');
  }
}







