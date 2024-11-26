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
        return 'AAWASH Dev';
      case Flavor.stage:
        return 'AAWASH Stage';
      case Flavor.prod:
        return 'AAWASH';
      default:
        return 'title';
    }
  }

}
