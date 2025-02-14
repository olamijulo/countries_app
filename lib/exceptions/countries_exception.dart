// ignore_for_file: public_member_api_docs, sort_constructors_first
class CountriesException implements Exception {
  final String? message;
  CountriesException({
    this.message,
  });

  @override
  String toString() => 'CountriesException(message: $message)';
}
