import 'package:flutter_svg/svg.dart';
import 'package:models/models.dart';
import 'package:template_app/core/res/gen/assets.gen.dart';

extension CardServiceExtension on CardService {
  SvgPicture getLogo(double width) =>
      {
        CardService.mastercard: SvgPicture.asset(
          Assets.images.mastercardLogo,
          width: width,
        ),
        CardService.visa: SvgPicture.asset(
          Assets.images.visaLogo,
          width: width,
        )
      }[this] ??
      SvgPicture.asset(Assets.images.visaLogo);
}
