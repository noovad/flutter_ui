import 'package:flutter_svg/svg.dart';

abstract class AppIcons {
  static final SvgPicture icCancel = SvgPicture.asset(
    'src/shared/icons/ic_cancel.svg',
    package: 'jekoneng_flutter_ui',
  );

  static final SvgPicture icCancelDisabled = SvgPicture.asset(
    'src/shared/icons/ic_cancel_disabled.svg',
    package: 'jekoneng_flutter_ui',
  );
}
