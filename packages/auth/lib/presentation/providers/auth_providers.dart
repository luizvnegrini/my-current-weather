import 'package:auth/auth.dart';
import 'package:external_dependencies/external_dependencies.dart';

import '../../domain/domain.dart';

List<Override> authProviders(IAuthState state) => [
      localStorageRepository.overrideWithValue(state.localStorageRepository),
    ];

final localStorageRepository =
    Provider.autoDispose<ILocalStorageRepository>((_) {
  throw UnimplementedError('localStorageRepository must be overridden');
});
