enum Flavor {
  dev,
  stage,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Aawash Dev';
      case Flavor.stage:
        return 'Aawash Stage';
      case Flavor.prod:
        return 'Aawash';
      default:
        return 'title';
    }
  }

}
