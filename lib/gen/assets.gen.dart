/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsAvatarsGen {
  const $AssetsAvatarsGen();

  /// File path: assets/avatars/female_avatar.svg
  SvgGenImage get femaleAvatar =>
      const SvgGenImage('assets/avatars/female_avatar.svg');

  /// File path: assets/avatars/male_avatar.svg
  SvgGenImage get maleAvatar =>
      const SvgGenImage('assets/avatars/male_avatar.svg');

  /// List of all assets
  List<SvgGenImage> get values => [femaleAvatar, maleAvatar];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/github_logo.svg
  SvgGenImage get githubLogo =>
      const SvgGenImage('assets/icons/github_logo.svg');

  /// File path: assets/icons/linkedin_logo.png
  AssetGenImage get linkedinLogo =>
      const AssetGenImage('assets/icons/linkedin_logo.png');

  /// File path: assets/icons/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/icons/logo.png');

  /// List of all assets
  List<dynamic> get values => [githubLogo, linkedinLogo, logo];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/authentication.svg
  SvgGenImage get authentication =>
      const SvgGenImage('assets/images/authentication.svg');

  /// File path: assets/images/camera.svg
  SvgGenImage get camera => const SvgGenImage('assets/images/camera.svg');

  /// File path: assets/images/change_password.svg
  SvgGenImage get changePassword =>
      const SvgGenImage('assets/images/change_password.svg');

  /// File path: assets/images/exception.svg
  SvgGenImage get exception => const SvgGenImage('assets/images/exception.svg');

  /// File path: assets/images/join.svg
  SvgGenImage get join => const SvgGenImage('assets/images/join.svg');

  /// File path: assets/images/welcoming.svg
  SvgGenImage get welcoming => const SvgGenImage('assets/images/welcoming.svg');

  /// List of all assets
  List<SvgGenImage> get values =>
      [authentication, camera, changePassword, exception, join, welcoming];
}

class Assets {
  Assets._();

  static const $AssetsAvatarsGen avatars = $AssetsAvatarsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
