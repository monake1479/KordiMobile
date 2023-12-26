import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kordi_mobile/collections/controllers/collection_form/collection_form_bloc.dart';
import 'package:kordi_mobile/core/navigation/kordi_router.dart';
import 'package:kordi_mobile/dependency_injection.dart';

part 'package:kordi_mobile/collections/pages/create_collection_first_step.dart';
part 'package:kordi_mobile/collections/pages/create_collection_second_step.dart';
part 'package:kordi_mobile/collections/pages/create_collection_third_step.dart';
part 'package:kordi_mobile/collections/pages/create_collection_fourth_step.dart';

class CreateCollectionPage extends StatelessWidget {
  const CreateCollectionPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CollectionFormBloc>(
      create: (context) => getIt.get<CollectionFormBloc>()
        ..add(
          CollectionFormEvent.reset(),
        ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => CollectionPageRoute().go(context),
          ),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
