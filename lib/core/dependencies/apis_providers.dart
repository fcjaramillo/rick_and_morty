import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/core/api/api_utils.dart';

final clientProvider = Provider((ref) => Dio());

final ramApiProvider = Provider(
  (ref) => ApiUtils(
    client: ref.watch(clientProvider),
    host: 'rickandmortyapi.com',
    tokenAuthorization: '',
  ),
);
