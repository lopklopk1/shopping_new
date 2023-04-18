part of 'partitions_cubit.dart';

@immutable
abstract class PartitionsState {}

class PartitionsInitial extends PartitionsState {

}
class PartitionsLoaded extends PartitionsState {
  final List<Datum> partitionlist;
  PartitionsLoaded(this.partitionlist);

}

