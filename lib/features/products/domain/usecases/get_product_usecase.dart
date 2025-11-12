import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_sales_app/core/errors/failures.dart';
import 'package:flutter_clean_architecture_sales_app/features/products/domain/entities/product_entity.dart';
import 'package:flutter_clean_architecture_sales_app/features/products/domain/repositories/product_repository_interface.dart';

class GetProductUsecase {
  final ProductRepositoryInterface repository;

  GetProductUsecase({required this.repository});

  // recuperar un recuperar
  Future<Either<Failure, ProductEntity>?> execute({
    required int productId,
  }) async {
    // obtener el producto por medio de la clase abstracta
    return await repository.getProduct(productId);
  }
}
