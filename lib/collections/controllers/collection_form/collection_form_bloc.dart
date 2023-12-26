import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collections/controllers/get_collections/get_collections_cubit.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/utils/collection_status_converter.dart';
import 'package:kordi_mobile/core/utils/date_time_converter.dart';
import 'package:kordi_mobile/dependency_injection.dart';

part 'collection_form_event.dart';
part 'collection_form_state.dart';

part 'collection_form_bloc.freezed.dart';

@LazySingleton()
class CollectionFormBloc
    extends Bloc<CollectionFormEvent, CollectionFormState> {
  CollectionFormBloc(this._getCollectionsCubit)
      : super(CollectionFormState.initial()) {
    on<_Reset>(_reset);
    on<_SetInitialCollection>(_setInitialCollection);
  }
  final GetCollectionsCubit _getCollectionsCubit;
  void _reset(_Reset event, Emitter<CollectionFormState> emit) {
    emit(CollectionFormState.initial());
  }

  void _setInitialCollection(
    _SetInitialCollection event,
    Emitter<CollectionFormState> emit,
  ) {
    final Collection? collection =
        _getCollectionsCubit.getById(event.collectionId);
    if (collection == null) {
      return;
    }
    emit(
      state.copyWith(
        id: collection.id,
        title: collection.title,
        description: collection.description,
        startTime: collection.startTime,
        endTime: collection.endTime,
        completedTime: collection.completedTime,
        // image: collection.image,
        status: collection.status,
        userId: collection.userId,
        addresses: collection.addresses,
        items: collection.items,
        comments: collection.comments,
      ),
    );
  }

  @override
  Future<void> close() async {
    getIt.resetLazySingleton<CollectionFormBloc>();
    return super.close();
  }
}
