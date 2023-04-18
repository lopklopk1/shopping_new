import 'package:dio/dio.dart';
import 'package:shopping_new/constants/strings.dart';
import 'package:shopping_new/data/models/paritions.dart';
import 'package:shopping_new/data/web_services/partitions_web_services.dart';
import "dart:io";
import "dart:async";

import '../web_services/partition_api_client.dart';

class PartitionsRepository{
  late Dio client;
  late PartitionApiClient partitionApiClient;
  late List<Datum> datumList;

  PartitionsRepository(){
    BaseOptions options = BaseOptions(
      baseUrl: base_url,
      connectTimeout: Duration(seconds: 20 * 1000),
      sendTimeout: Duration(seconds: 20 *1000),
    );
    client = Dio(options);
    partitionApiClient = PartitionApiClient(client);

  }

   Future<List<Datum>> getAllPartitions() async{
     Response? response;
     response = await client.get("all-categories");

     final partitions = List<Datum>.of(
       response.data['data'].map<Datum>(
             (json) => Datum(
               categoryId: json["category_id"],
               categoryName: json["category_name"],
               categoryImage: json["category_image"]
         ),
       ),
     );

     return partitions;

   }

}