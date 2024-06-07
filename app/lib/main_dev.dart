import 'app.dart';
import 'core/config/flavors/flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.dev;
  Startup.run();
}
