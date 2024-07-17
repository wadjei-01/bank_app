import 'package:flutter_svg/svg.dart';
import 'package:template_app/core/res/gen/assets.gen.dart';

class ImageUtils {
  static String logo = Assets.images.logo;
  static String linePattern = Assets.images.linePattern;
  static String chipDesign = Assets.images.chipDesign;

  static void svgPrecacheImage() {
    final cacheSvgImages = [
      /// Specify the all the svg image to cache
      ImageUtils.logo,
      ImageUtils.linePattern,
      ImageUtils.chipDesign,
    ];

    for (String element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
    }
  }
}
