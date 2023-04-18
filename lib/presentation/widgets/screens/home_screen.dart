import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_new/business_logic/cubit/partitions_cubit.dart';

import '../../../data/models/paritions.dart';
import '../../../data/web_services/partition_api_client.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key,});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool run = true;
 late PartitionApiClient partitionApiClient;
 late  Dio dio;



  _HomeScreenState();



  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }
 Widget _buildBlocWidget(){
    return BlocBuilder<PartitionsCubit,PartitionsState>(builder: (context,state){
      if (state is PartitionsLoaded) {
        final partitions = state.partitionlist;

        return buildLoadedWidgets(partitions);

      }else{
     return Center(child: CircularProgressIndicator(),);
      }

    });
  }
  Widget buildLoadedWidgets(List<Datum> datalist){
    return GridView.builder(
        itemCount: datalist.length,
        scrollDirection: Axis.vertical,
        physics: AlwaysScrollableScrollPhysics(),

        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 1.0,)
        ,itemBuilder: (BuildContext context, int index) {
      return  Card(
            elevation: 15,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Container(
              padding: EdgeInsets.all(7),
              alignment: Alignment.center,
              height: 170,
              child: Text(datalist[index].categoryName,style: TextStyle(color: Colors.white
                  ,fontSize: 17),textAlign: TextAlign.center,),
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,

                  image: NetworkImage(datalist[index].categoryImage,),
                  fit: BoxFit.cover,

                  colorFilter:
                  ColorFilter.mode(Colors.black.withOpacity(0.5),
                      BlendMode.darken),
                )
              ),


            )

          );

    }
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  _buildBlocWidget()
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
