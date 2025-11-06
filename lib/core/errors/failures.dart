import 'package:equatable/equatable.dart';

// clase base para definir distintos tipos de errores que se generen en la aplicación
// por ejemplo: ServerFailure, CacheFailure, ClientFailure, etc). lo que permite realizar
// una comparación y mantener centralizada la administracion de errores.
abstract class Failure extends Equatable {
  // contiene una lista que guarda los datos relacionados con el error (por ejemplo: mensaje, codigo, linea del error, etc.)
  final List<dynamic> properties;

  const Failure([this.properties = const <dynamic>[]]);

  // el método "props" devuelve el valor la variable "properties" lo que
  // indica que campos se usan para comparar objetos de tipo: "Failure"
  @override
  List<Object?> get props => properties;
}
