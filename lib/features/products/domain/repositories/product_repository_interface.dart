import "package:dartz/dartz.dart";
import "package:flutter_clean_architecture_sales_app/core/errors/failures.dart";
import "package:flutter_clean_architecture_sales_app/features/products/domain/entities/product_entity.dart"; // programación funcional

abstract class ProductRepositoryInterface {
  // Métodos abstractos para luego implementar
  Future<Either<Failure, ProductEntity>> getProduct(int productId);
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
