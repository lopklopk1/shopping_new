import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping_new/data/repositories/partitions_repository.dart';

import '../../data/models/paritions.dart';

part 'partitions_state.dart';

class PartitionsCubit extends Cubit<PartitionsState> {
  final PartitionsRepository partitionsRepository;
  List<Datum>?partitions;

  PartitionsCubit({required this.partitionsRepository}) : super(PartitionsInitial()){
    getPartitions();

  }

  void getPartitions() async {
    try {
      final movies = await partitionsRepository.getAllPartitions();
      emit(PartitionsLoaded(movies));
    } catch (e) {
    }
  }
}
