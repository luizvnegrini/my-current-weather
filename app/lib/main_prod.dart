import 'app.dart';
import 'core/config/flavors/flavors.dart';

Future<void> main() async {
  F.appFlavor = Flavor.prod;
  Startup.run();
}
