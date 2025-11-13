import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture_sales_app/features/products/domain/entities/product_entity.dart';
import 'package:flutter_clean_architecture_sales_app/features/products/domain/entities/rating_entity.dart';
import 'package:flutter_clean_architecture_sales_app/features/products/domain/repositories/product_repository_interface.dart';

import 'package:flutter_clean_architecture_sales_app/features/products/domain/usecases/get_product_usecase.dart';

// Paquete para simular la capa de datos
import 'package:mockito/mockito.dart';
// importar el paquete que permite hacer pruebas unitarias
import 'package:flutter_test/flutter_test.dart';

// mock para simular el repositorio
// Crear un mock del repositorio
class MockProductRepository extends Mock
    implements ProductRepositoryInterface {}

// metodo main
void main() {
  // Definar las variables necesarias para la prueba
  late GetProductUsecase usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    // Instanciar las variables necesarias
    mockProductRepository = MockProductRepository(); //Data
    usecase = GetProductUsecase(repository: mockProductRepository);
  });

  // Declarar datos de prueba
  const int testProductId = 1;

  const testProduct = ProductEntity(
    id: 1,
    title: 'Producto de prueba',
    price: 15.00,
    description: 'Descripción de prueba',
    category: 'Categoria',
    image: "",
    rating: RatingEntity(rate: 7.0, count: 2),
  );

  // definir el nombre el método para la prueba
  test(
    'Dado un id válido [When] se ejecuta el usecase [THEN] retorne ProductEntity y solo llame a getProduct',
    () async {
      when(
        mockProductRepository.getProduct(testProductId),
      ).thenAnswer((realInvocation) async => Right(testProduct));

      // resultado de la ejecución del caso de uso
      /// ejecuta el usecase y regresa el resultado se asigna en "result"
      final result = await usecase.execute(productId: testProductId);

      // comprobar la ejecución correcta del valor suministrado como parametro
      // expect: tiene argumentos, 2 obligatorios.
      // el primero: (actual): es valor que obtiene al ejeucutar el usecase.
      // el segundo (matcher): es el criterio que se desea verificar
      // y el tercer (reason): es opcional y proporciona una explicación adicional
      expect(result, const Right(testProduct));

      // asegura que se llamó al método "getProduct" correcto con el "id" requerido
      verify(mockProductRepository.getProduct(testProductId));

      // garantizar que no hubo llamadas extra al repositorio (unica)
      verifyNoMoreInteractions(mockProductRepository);
    },
  );
}
