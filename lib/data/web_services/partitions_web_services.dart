import 'package:dio/dio.dart';
import 'package:shopping_new/constants/strings.dart';
import 'package:shopping_new/data/models/paritions.dart';
import 'package:shopping_new/data/web_services/partition_api_client.dart';
class PartitionsWebServices{
  late Dio dio;
  late PartitionApiClient partitionApiClient;
 late List<Datum> datumList;

  PartitionsWebServices(){

    dio = Dio();
    partitionApiClient = PartitionApiClient(dio);
  }
  Future<List<Datum>> getAllPartions() async{
    var datumList;

      partitionApiClient.getAllPartitions().then((value) => {
        datumList = value.data

      });
      print("datass :"+datumList.length.toString());
      return datumList;

  }
}