import 'package:kordi_mobile/gen/l10n.dart';

class ResponseCodeConverter {
  static String convert(String? errorCode) {
    switch (errorCode) {
      case 'user.bad.credentials':
        return S.current.responseUserBadCredentials;
      case 'user.not.found':
        return S.current.responseUserNotFound;
      case 'user.not.verified.email':
        return S.current.responseUserNotVerifiedEmail;
      case 'user.not.verified.phone':
        return S.current.responseUserNotVerifiedPhone;
      case 'user.already.verified':
        return S.current.responseUserAlreadyVerified;
      case 'user.username.exists':
        return S.current.responseUserUsernameExists;
      case 'user.email.exists':
        return S.current.responseUserEmailExists;
      case 'user.phone.exists':
        return S.current.responseUserPhoneExists;
      case 'email.not.valid':
        return S.current.responseEmailNotValid;
      case 'user.not.collection.owner':
        return S.current.responseUserNotCollectionOwner;
      case 'user.not.found.with.given.token':
        return S.current.responseUserNotFoundWithGivenToken;
      case 'user_bad_credentials':
        return S.current.responseUserBadCredentials;
      case 'password.too.short':
        return S.current.responsePasswordTooShort;
      case 'email.already.exists':
        return S.current.responseEmailAlreadyExists;
      case 'phone.already.exists':
        return S.current.responsePhoneAlreadyExists;
      case 'email.already.confirmed':
        return S.current.responseEmailAlreadyConfirmed;
      case 'phone.already.confirmed':
        return S.current.responsePhoneAlreadyConfirmed;
      case 'password.old.password.not.match':
        return S.current.responsePasswordOldPasswordNotMatch;
      case 'collection.item.current.bigger.than.max':
        return S.current.responseCollectionItemCurrentBiggerThanMaximum;

      default:
        return S.current.defaultExceptionMessage;
    }
  }
}
