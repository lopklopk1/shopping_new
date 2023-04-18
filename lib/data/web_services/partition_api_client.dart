import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:shopping_new/constants/strings.dart';

import '../models/paritions.dart';
part 'partition_api_client.g.dart';

@RestApi(baseUrl: base_url)
abstract class PartitionApiClient{
  factory PartitionApiClient(Dio dio, {String baseUrl})= _PartitionApiClient;

  @GET("all-categories")
  Future<AllCategories> getAllPartitions();


}