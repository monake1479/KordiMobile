import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kordi_mobile/collections/controllers/collections_filter/collections_filter_bloc.dart';
import 'package:kordi_mobile/collections/models/collections_models.dart';
import 'package:kordi_mobile/collections/utils/collection_status_converter.dart';
import 'package:kordi_mobile/core/utils/date_time_converter.dart';

part 'edit_collection_form_event.dart';
part 'edit_collection_form_state.dart';

part 'edit_collection_form_bloc.freezed.dart';

@injectable
class EditCollectionFormBloc
    extends Bloc<EditCollectionFormEvent, EditCollectionFormState> {
  EditCollectionFormBloc(
    this._collectionsFilterBloc,
  ) : super(EditCollectionFormState.initial()) {
    on<_Reset>(_reset);
    on<_SetInitial>(_setInitialCollection);
    on<_SetUserId>(_setUserId);
    on<_SetName>(_setName);
    on<_SetDescription>(_setDescription);
    on<_SetPhoto>(_setPhoto);
    on<_CheckValidation>(_checkValidation);
  }
  final CollectionsFilterBloc _collectionsFilterBloc;
  void _reset(_Reset event, Emitter<EditCollectionFormState> emit) {
    emit(EditCollectionFormState.initial());
  }

  void _setInitialCollection(
    _SetInitial event,
    Emitter<EditCollectionFormState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    final Collection? collection = _collectionsFilterBloc.getById(event.id);
    if (collection == null) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        isLoading: false,
        id: collection.id,
        name: collection.title,
        description: collection.description,
        startTime: collection.startTime,
        endTime: collection.endTime,
        completedTime: collection.completedTime,
        // image: collection.image,
        status: collection.status,
        userId: collection.userId,
        comments: collection.comments,
      ),
    );
  }

  void _setUserId(
    _SetUserId event,
    Emitter<EditCollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        userId: event.userId,
      ),
    );
  }

  void _setName(
    _SetName event,
    Emitter<EditCollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        name: event.name,
      ),
    );
  }

  void _setDescription(
    _SetDescription event,
    Emitter<EditCollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  void _setPhoto(
    _SetPhoto event,
    Emitter<EditCollectionFormState> emit,
  ) {
    emit(
      state.copyWith(
          // image: event.photo,
          ),
    );
  }

  void _checkValidation(
    _CheckValidation event,
    Emitter<EditCollectionFormState> emit,
  ) {
    if (state.name.isEmpty || state.description.isEmpty) {
      emit(state.copyWith(validationError: true));
      return;
    }
    emit(state.copyWith(validationError: false));
  }
}
