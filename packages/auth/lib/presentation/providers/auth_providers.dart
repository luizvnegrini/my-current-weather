import 'package:external_dependencies/external_dependencies.dart';

import '../../domain/domain.dart';

final localStorageRepository =
    Provider.autoDispose<ILocalStorageRepository>((_) {
  throw UnimplementedError('localStorageRepository must be overridden');
});
