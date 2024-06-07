enum Flavor {
  dev,
  hml,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'My Current Weather dev';
      case Flavor.hml:
        return 'My Current Weather  hml';
      case Flavor.prod:
      default:
        return 'My Current Weather ';
    }
  }
}
