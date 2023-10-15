class ResponseCodeConverter {
  static String convert(String errorCode) {
    switch (errorCode) {
      case 'user.not.found':
        return 'User not found.';
      case 'user.not.verified.email':
        return 'User email not verified.';
      case 'user.not.verified.phone':
        return 'User phone not verified.';
      case 'user.already.verified':
        return 'User was already verified, please sign in.';
      case 'user.username.exists':
        return 'Provided username is already taken.';
      case 'user.email.exists':
        return 'Provided email address is already taken.';
      case 'user.phone.exists':
        return 'Provided phone number is already taken.';
      case 'email.not.valid':
        return 'Provided email address is not valid.';
      case 'user.not.collection.owner':
        return 'User is not collection owner.';
      case 'user.not.found.with.given.token':
        return 'User not found with given token.';
      case 'user_bad_credentials':
        return 'Provided user credentials are not valid.';
      case 'password.too.short':
        return 'Provided password is too short.';
      case 'email.already.exists':
        return 'Provided email address is already taken.';
      case 'phone.already.exists':
        return 'Provided phone number is already taken.';
      case 'password.too.short.':
        return 'Provided password is too short.';

      default:
        return 'Something went wrong. Please try again later.';
    }
  }
}
