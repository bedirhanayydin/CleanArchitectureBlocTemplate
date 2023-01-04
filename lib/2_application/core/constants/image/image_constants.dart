class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  String toPng(String name) => 'assets/image/$name.png';
  String toSvg(String name) => 'assets/svg/$name.svg';

  // String get btn_menu => toSvg('btn-menu');
  // String get search => toSvg('btn-search');
}
