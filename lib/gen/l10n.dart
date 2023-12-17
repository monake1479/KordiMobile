// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Kordi mobile`
  String get appName {
    return Intl.message(
      'Kordi mobile',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `KORDI Mobile`
  String get kordiScaffoldTitle {
    return Intl.message(
      'KORDI Mobile',
      name: 'kordiScaffoldTitle',
      desc: '',
      args: [],
    );
  }

  /// `Filter options`
  String get filterDialogTitle {
    return Intl.message(
      'Filter options',
      name: 'filterDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get filterDialogTitleLabelText {
    return Intl.message(
      'Name',
      name: 'filterDialogTitleLabelText',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get filterDialogCityLabelText {
    return Intl.message(
      'City',
      name: 'filterDialogCityLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get filterDialogStreetLabelText {
    return Intl.message(
      'Street',
      name: 'filterDialogStreetLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Item name`
  String get filterDialogItemNameLabelText {
    return Intl.message(
      'Item name',
      name: 'filterDialogItemNameLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Choose category:`
  String get filterDialogCategoryTitle {
    return Intl.message(
      'Choose category:',
      name: 'filterDialogCategoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get filterDialogCloseButtonLabel {
    return Intl.message(
      'Close',
      name: 'filterDialogCloseButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get filterDialogApplyButtonLabel {
    return Intl.message(
      'Apply',
      name: 'filterDialogApplyButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection page`
  String get collectionPageTitle {
    return Intl.message(
      'Collection page',
      name: 'collectionPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `No collections found or given filter result are empty.`
  String get collectionPageEmptyState {
    return Intl.message(
      'No collections found or given filter result are empty.',
      name: 'collectionPageEmptyState',
      desc: '',
      args: [],
    );
  }

  /// `Get initial collections`
  String get collectionPageEmptyStateButtonLabel {
    return Intl.message(
      'Get initial collections',
      name: 'collectionPageEmptyStateButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection progress:`
  String get collectionPageProgress {
    return Intl.message(
      'Collection progress:',
      name: 'collectionPageProgress',
      desc: '',
      args: [],
    );
  }

  /// `{daysLeft} days left until the end`
  String collectionPageDaysLeft(String daysLeft) {
    return Intl.message(
      '$daysLeft days left until the end',
      name: 'collectionPageDaysLeft',
      desc:
          'Collection page with progress bar and days left until the end of the collection.',
      args: [daysLeft],
    );
  }

  /// `Locations`
  String get collectionPageLocations {
    return Intl.message(
      'Locations',
      name: 'collectionPageLocations',
      desc: '',
      args: [],
    );
  }

  /// `Load more...`
  String get collectionPageLoadMoreButtonLabel {
    return Intl.message(
      'Load more...',
      name: 'collectionPageLoadMoreButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `About page`
  String get aboutPageTitle {
    return Intl.message(
      'About page',
      name: 'aboutPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Hello, {username}!`
  String drawerUserGreetings(String username) {
    return Intl.message(
      'Hello, $username!',
      name: 'drawerUserGreetings',
      desc: 'Welcome message on the main drawer',
      args: [username],
    );
  }

  /// `Hello, user!`
  String get drawerGreetings {
    return Intl.message(
      'Hello, user!',
      name: 'drawerGreetings',
      desc: 'Welcome message on the main drawer without username.',
      args: [],
    );
  }

  /// `Kordi occurred an error...`
  String get exceptionDialogTitle {
    return Intl.message(
      'Kordi occurred an error...',
      name: 'exceptionDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get exceptionDialogButtonLabel {
    return Intl.message(
      'OK',
      name: 'exceptionDialogButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get drawerSignInButtonLabel {
    return Intl.message(
      'Sign in',
      name: 'drawerSignInButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get drawerSignUpButtonLabel {
    return Intl.message(
      'Sign up',
      name: 'drawerSignUpButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection`
  String get drawerCollectionButtonLabel {
    return Intl.message(
      'Collection',
      name: 'drawerCollectionButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get drawerAboutButtonLabel {
    return Intl.message(
      'About',
      name: 'drawerAboutButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get drawerChangeLanguageButtonLabel {
    return Intl.message(
      'Change language',
      name: 'drawerChangeLanguageButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get drawerSignOutButtonLabel {
    return Intl.message(
      'Sign out',
      name: 'drawerSignOutButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get drawerChangePasswordButtonLabel {
    return Intl.message(
      'Change password',
      name: 'drawerChangePasswordButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get signUpPageUsernameLabelTextField {
    return Intl.message(
      'Username',
      name: 'signUpPageUsernameLabelTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get signUpPageUsernameHintTextField {
    return Intl.message(
      'Enter your username',
      name: 'signUpPageUsernameHintTextField',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be empty`
  String get signUpPageUsernameErrorTextField {
    return Intl.message(
      'Username cannot be empty',
      name: 'signUpPageUsernameErrorTextField',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get signUpPageFirstNameLabelTextField {
    return Intl.message(
      'First name',
      name: 'signUpPageFirstNameLabelTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your first name`
  String get signUpPageFirstNameHintTextField {
    return Intl.message(
      'Enter your first name',
      name: 'signUpPageFirstNameHintTextField',
      desc: '',
      args: [],
    );
  }

  /// `First name cannot be empty`
  String get signUpPageFirstNameErrorTextField {
    return Intl.message(
      'First name cannot be empty',
      name: 'signUpPageFirstNameErrorTextField',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get signUpPageLastNameLabelTextField {
    return Intl.message(
      'Last name',
      name: 'signUpPageLastNameLabelTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your last name`
  String get signUpPageLastNameHintTextField {
    return Intl.message(
      'Enter your last name',
      name: 'signUpPageLastNameHintTextField',
      desc: '',
      args: [],
    );
  }

  /// `Last name cannot be empty`
  String get signUpPageLastNameErrorTextField {
    return Intl.message(
      'Last name cannot be empty',
      name: 'signUpPageLastNameErrorTextField',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signUpPagePasswordLabelTextField {
    return Intl.message(
      'Password',
      name: 'signUpPagePasswordLabelTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get signUpPagePasswordHintTextField {
    return Intl.message(
      'Enter your password',
      name: 'signUpPagePasswordHintTextField',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get signUpPagePasswordErrorTextField {
    return Intl.message(
      'Password cannot be empty',
      name: 'signUpPagePasswordErrorTextField',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signUpPageEmailLabelTextField {
    return Intl.message(
      'Email',
      name: 'signUpPageEmailLabelTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get signUpPageEmailHintTextField {
    return Intl.message(
      'Enter your email',
      name: 'signUpPageEmailHintTextField',
      desc: '',
      args: [],
    );
  }

  /// `Email cannot be empty`
  String get signUpPageEmailErrorTextField {
    return Intl.message(
      'Email cannot be empty',
      name: 'signUpPageEmailErrorTextField',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get signUpPagePhoneNumberLabelTextField {
    return Intl.message(
      'Phone number',
      name: 'signUpPagePhoneNumberLabelTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get signUpPagePhoneNumberHintTextField {
    return Intl.message(
      'Enter your phone number',
      name: 'signUpPagePhoneNumberHintTextField',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be a 9 digit number`
  String get signUpPagePhoneNumberErrorTextField {
    return Intl.message(
      'Phone number must be a 9 digit number',
      name: 'signUpPagePhoneNumberErrorTextField',
      desc: '',
      args: [],
    );
  }

  /// `Pick verification type`
  String get signUpPageVerificationTypeLabel {
    return Intl.message(
      'Pick verification type',
      name: 'signUpPageVerificationTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUpPageSignUpButtonLabel {
    return Intl.message(
      'Sign up',
      name: 'signUpPageSignUpButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign up successful!`
  String get signUpPageFlushbarLabel {
    return Intl.message(
      'Sign up successful!',
      name: 'signUpPageFlushbarLabel',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get signUpPageAlreadyHaveAccountLabel {
    return Intl.message(
      'Already have an account? ',
      name: 'signUpPageAlreadyHaveAccountLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signUpPageSignInButtonLabel {
    return Intl.message(
      'Sign in',
      name: 'signUpPageSignInButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Last step!`
  String get verificationCodePageTitle {
    return Intl.message(
      'Last step!',
      name: 'verificationCodePageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter verification code`
  String get verificationCodePageTextfieldCodeLabel {
    return Intl.message(
      'Enter verification code',
      name: 'verificationCodePageTextfieldCodeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get verificationCodePageTextfieldCodeHint {
    return Intl.message(
      'Code',
      name: 'verificationCodePageTextfieldCodeHint',
      desc: '',
      args: [],
    );
  }

  /// `Code must be a 6 digit number`
  String get verificationCodePageTextfieldCodeError {
    return Intl.message(
      'Code must be a 6 digit number',
      name: 'verificationCodePageTextfieldCodeError',
      desc: '',
      args: [],
    );
  }

  /// `Enter username`
  String get verificationCodePageTextfieldUsernameLabel {
    return Intl.message(
      'Enter username',
      name: 'verificationCodePageTextfieldUsernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get verificationCodePageTextfieldUsernameHint {
    return Intl.message(
      'Username',
      name: 'verificationCodePageTextfieldUsernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be empty`
  String get verificationCodePageTextfieldUsernameError {
    return Intl.message(
      'Username cannot be empty',
      name: 'verificationCodePageTextfieldUsernameError',
      desc: '',
      args: [],
    );
  }

  /// `We sent verification code on your email/phone. Please insert it below.`
  String get verificationCodePageDescription {
    return Intl.message(
      'We sent verification code on your email/phone. Please insert it below.',
      name: 'verificationCodePageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Don't have the code? `
  String get verificationCodePageResendCodeButtonLabel {
    return Intl.message(
      'Don\'t have the code? ',
      name: 'verificationCodePageResendCodeButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get verificationCodePageResendCodeButtonLabel2 {
    return Intl.message(
      'Resend code',
      name: 'verificationCodePageResendCodeButtonLabel2',
      desc: '',
      args: [],
    );
  }

  /// `Code resent!`
  String get verificationCodePageFlushbarLabel {
    return Intl.message(
      'Code resent!',
      name: 'verificationCodePageFlushbarLabel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get verificationCodePageButtonLabel {
    return Intl.message(
      'OK',
      name: 'verificationCodePageButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get verificationCodePageSuccessDialogTitle {
    return Intl.message(
      'Success!',
      name: 'verificationCodePageSuccessDialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully verified your account!`
  String get verificationCodePageSuccessDialogSubtitle {
    return Intl.message(
      'You have successfully verified your account!',
      name: 'verificationCodePageSuccessDialogSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get verificationCodePageSuccessDialogButtonLabel {
    return Intl.message(
      'OK',
      name: 'verificationCodePageSuccessDialogButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get signInPageUsernameLabelTextField {
    return Intl.message(
      'Username',
      name: 'signInPageUsernameLabelTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get signInPageUsernameHintTextField {
    return Intl.message(
      'Enter your username',
      name: 'signInPageUsernameHintTextField',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot be empty`
  String get signInPageUsernameErrorTextField {
    return Intl.message(
      'Username cannot be empty',
      name: 'signInPageUsernameErrorTextField',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signInPagePasswordLabelTextField {
    return Intl.message(
      'Password',
      name: 'signInPagePasswordLabelTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get signInPagePasswordHintTextField {
    return Intl.message(
      'Enter your password',
      name: 'signInPagePasswordHintTextField',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get signInPagePasswordErrorTextField {
    return Intl.message(
      'Password cannot be empty',
      name: 'signInPagePasswordErrorTextField',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signInPageSignInButtonLabel {
    return Intl.message(
      'Sign in',
      name: 'signInPageSignInButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `No account? `
  String get signInPageSignUpButtonLabel1 {
    return Intl.message(
      'No account? ',
      name: 'signInPageSignUpButtonLabel1',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signInPageSignUpButtonLabel2 {
    return Intl.message(
      'Sign up',
      name: 'signInPageSignUpButtonLabel2',
      desc: '',
      args: [],
    );
  }

  /// `Signed in!`
  String get signInPageFlushbarLabel {
    return Intl.message(
      'Signed in!',
      name: 'signInPageFlushbarLabel',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get changePasswordPageOldPasswordLabelTextField {
    return Intl.message(
      'Old password',
      name: 'changePasswordPageOldPasswordLabelTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your old password`
  String get changePasswordPageOldPasswordHintTextField {
    return Intl.message(
      'Enter your old password',
      name: 'changePasswordPageOldPasswordHintTextField',
      desc: '',
      args: [],
    );
  }

  /// `Old password cannot be empty`
  String get changePasswordPageOldPasswordErrorTextField {
    return Intl.message(
      'Old password cannot be empty',
      name: 'changePasswordPageOldPasswordErrorTextField',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get changePasswordPagePasswordLabelTextField {
    return Intl.message(
      'Password',
      name: 'changePasswordPagePasswordLabelTextField',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get changePasswordPagePasswordHintTextField {
    return Intl.message(
      'Enter your password',
      name: 'changePasswordPagePasswordHintTextField',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get changePasswordPagePasswordErrorTextField {
    return Intl.message(
      'Password cannot be empty',
      name: 'changePasswordPagePasswordErrorTextField',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePasswordPageChangePasswordButtonLabel {
    return Intl.message(
      'Change password',
      name: 'changePasswordPageChangePasswordButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password changed!`
  String get changePasswordPageDialogTitleLabel {
    return Intl.message(
      'Password changed!',
      name: 'changePasswordPageDialogTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please, sign in again with new password.`
  String get changePasswordPageDialogSubTitleLabel {
    return Intl.message(
      'Please, sign in again with new password.',
      name: 'changePasswordPageDialogSubTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get changePasswordPageDialogButtonLabel {
    return Intl.message(
      'OK',
      name: 'changePasswordPageDialogButtonLabel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
