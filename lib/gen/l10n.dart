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

  /// `Field required`
  String get fieldRequiredErrorLabel {
    return Intl.message(
      'Field required',
      name: 'fieldRequiredErrorLabel',
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

  /// `Basic collection information`
  String get createCollectionFirstStepTitle {
    return Intl.message(
      'Basic collection information',
      name: 'createCollectionFirstStepTitle',
      desc: '',
      args: [],
    );
  }

  /// `Step 1 of 4`
  String get createCollectionFirstStepSubtitle {
    return Intl.message(
      'Step 1 of 4',
      name: 'createCollectionFirstStepSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Please provide basic information about your collection`
  String get createCollectionFirstStepInformation {
    return Intl.message(
      'Please provide basic information about your collection',
      name: 'createCollectionFirstStepInformation',
      desc: '',
      args: [],
    );
  }

  /// `Collection name*`
  String get createCollectionFirstStepNameFormTextLabel {
    return Intl.message(
      'Collection name*',
      name: 'createCollectionFirstStepNameFormTextLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection description*`
  String get createCollectionFirstStepDescriptionFormTextLabel {
    return Intl.message(
      'Collection description*',
      name: 'createCollectionFirstStepDescriptionFormTextLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection end date`
  String get createCollectionFirstStepEndDateFormTextLabel {
    return Intl.message(
      'Collection end date',
      name: 'createCollectionFirstStepEndDateFormTextLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection photo`
  String get createCollectionFirstStepPhotoLabel {
    return Intl.message(
      'Collection photo',
      name: 'createCollectionFirstStepPhotoLabel',
      desc: '',
      args: [],
    );
  }

  /// `Tap image above to add photo`
  String get createCollectionFirstStepPhotoHintLabel {
    return Intl.message(
      'Tap image above to add photo',
      name: 'createCollectionFirstStepPhotoHintLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all required fields, indicated by *`
  String get createCollectionFirstStepValidationHint {
    return Intl.message(
      'Please fill all required fields, indicated by *',
      name: 'createCollectionFirstStepValidationHint',
      desc: '',
      args: [],
    );
  }

  /// `Next step`
  String get createCollectionFirstStepNextStepButtonLabel {
    return Intl.message(
      'Next step',
      name: 'createCollectionFirstStepNextStepButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection addresses`
  String get createCollectionSecondStepTitle {
    return Intl.message(
      'Collection addresses',
      name: 'createCollectionSecondStepTitle',
      desc: '',
      args: [],
    );
  }

  /// `Step 2 of 4`
  String get createCollectionSecondStepSubtitle {
    return Intl.message(
      'Step 2 of 4',
      name: 'createCollectionSecondStepSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get createCollectionSecondStepCityLabel {
    return Intl.message(
      'City',
      name: 'createCollectionSecondStepCityLabel',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get createCollectionSecondStepAddressLabel {
    return Intl.message(
      'Address',
      name: 'createCollectionSecondStepAddressLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please provide addresses where donates can be stored`
  String get createCollectionSecondStepInformation {
    return Intl.message(
      'Please provide addresses where donates can be stored',
      name: 'createCollectionSecondStepInformation',
      desc: '',
      args: [],
    );
  }

  /// `Add address`
  String get createCollectionSecondStepAddAddressButtonLabel {
    return Intl.message(
      'Add address',
      name: 'createCollectionSecondStepAddAddressButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Next step`
  String get createCollectionSecondStepNextStepButtonLabel {
    return Intl.message(
      'Next step',
      name: 'createCollectionSecondStepNextStepButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection items`
  String get createCollectionThirdStepTitle {
    return Intl.message(
      'Collection items',
      name: 'createCollectionThirdStepTitle',
      desc: '',
      args: [],
    );
  }

  /// `Step 3 of 4`
  String get createCollectionThirdStepSubtitle {
    return Intl.message(
      'Step 3 of 4',
      name: 'createCollectionThirdStepSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get createCollectionThirdStepNameLabel {
    return Intl.message(
      'Name',
      name: 'createCollectionThirdStepNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get createCollectionThirdStepCategoryLabel {
    return Intl.message(
      'Category',
      name: 'createCollectionThirdStepCategoryLabel',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get createCollectionThirdStepTypeLabel {
    return Intl.message(
      'Type',
      name: 'createCollectionThirdStepTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Maximum quantity`
  String get createCollectionThirdStepMaximumLabel {
    return Intl.message(
      'Maximum quantity',
      name: 'createCollectionThirdStepMaximumLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please provide items that collection needs`
  String get createCollectionThirdStepInformation {
    return Intl.message(
      'Please provide items that collection needs',
      name: 'createCollectionThirdStepInformation',
      desc: '',
      args: [],
    );
  }

  /// `Add item`
  String get createCollectionThirdStepAddItemButtonLabel {
    return Intl.message(
      'Add item',
      name: 'createCollectionThirdStepAddItemButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Next step`
  String get createCollectionThirdStepNextStepButtonLabel {
    return Intl.message(
      'Next step',
      name: 'createCollectionThirdStepNextStepButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get createCollectionFourthStepTitle {
    return Intl.message(
      'Congratulations!',
      name: 'createCollectionFourthStepTitle',
      desc: '',
      args: [],
    );
  }

  /// `Step 4 of 4`
  String get createCollectionFourthStepSubtitle {
    return Intl.message(
      'Step 4 of 4',
      name: 'createCollectionFourthStepSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully created collection!`
  String get createCollectionFourthStepInformation {
    return Intl.message(
      'You have successfully created collection!',
      name: 'createCollectionFourthStepInformation',
      desc: '',
      args: [],
    );
  }

  /// `You can still edit it later.`
  String get createCollectionFourthStepSecondInformation {
    return Intl.message(
      'You can still edit it later.',
      name: 'createCollectionFourthStepSecondInformation',
      desc: '',
      args: [],
    );
  }

  /// `To collections`
  String get createCollectionFourthStepButtonLabel {
    return Intl.message(
      'To collections',
      name: 'createCollectionFourthStepButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add item`
  String get collectionItemDialogAddTitle {
    return Intl.message(
      'Add item',
      name: 'collectionItemDialogAddTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit item`
  String get collectionItemDialogEditTitle {
    return Intl.message(
      'Edit item',
      name: 'collectionItemDialogEditTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name*`
  String get collectionItemDialogNameFormLabelText {
    return Intl.message(
      'Name*',
      name: 'collectionItemDialogNameFormLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Category*`
  String get collectionItemDialogCategoryFormLabelText {
    return Intl.message(
      'Category*',
      name: 'collectionItemDialogCategoryFormLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Type*`
  String get collectionItemDialogTypeFormLabelText {
    return Intl.message(
      'Type*',
      name: 'collectionItemDialogTypeFormLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Maximum quantity*`
  String get collectionItemDialogMaximumFormLabelText {
    return Intl.message(
      'Maximum quantity*',
      name: 'collectionItemDialogMaximumFormLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get collectionItemDialogFieldsEmptyErrorLabel {
    return Intl.message(
      'Please fill all fields',
      name: 'collectionItemDialogFieldsEmptyErrorLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get collectionItemDialogCancelButtonLabel {
    return Intl.message(
      'Cancel',
      name: 'collectionItemDialogCancelButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get collectionItemDialogAddButtonLabel {
    return Intl.message(
      'Add',
      name: 'collectionItemDialogAddButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Edit address`
  String get collectionAddressDialogEditTitle {
    return Intl.message(
      'Edit address',
      name: 'collectionAddressDialogEditTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add address`
  String get collectionAddressDialogAddTitle {
    return Intl.message(
      'Add address',
      name: 'collectionAddressDialogAddTitle',
      desc: '',
      args: [],
    );
  }

  /// `City*`
  String get collectionAddressDialogCityFormLabelText {
    return Intl.message(
      'City*',
      name: 'collectionAddressDialogCityFormLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Street*`
  String get collectionAddressDialogStreetFormLabelText {
    return Intl.message(
      'Street*',
      name: 'collectionAddressDialogStreetFormLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get collectionAddressDialogFieldsEmptyErrorLabel {
    return Intl.message(
      'Please fill all fields',
      name: 'collectionAddressDialogFieldsEmptyErrorLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get collectionAddressDialogCancelButtonLabel {
    return Intl.message(
      'Cancel',
      name: 'collectionAddressDialogCancelButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get collectionAddressDialogAddButtonLabel {
    return Intl.message(
      'Add',
      name: 'collectionAddressDialogAddButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add address`
  String get collectionEditLocationsTileAddButtonLabel {
    return Intl.message(
      'Add address',
      name: 'collectionEditLocationsTileAddButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Add item`
  String get collectionEditItemListAddButtonLabel {
    return Intl.message(
      'Add item',
      name: 'collectionEditItemListAddButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get collectionDetailsDescriptionLabel {
    return Intl.message(
      'Description',
      name: 'collectionDetailsDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Locations where you can donate`
  String get collectionDetailsLocationsLabel {
    return Intl.message(
      'Locations where you can donate',
      name: 'collectionDetailsLocationsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cannot open address in browser.`
  String get collectionDetailsAddressesUrlException {
    return Intl.message(
      'Cannot open address in browser.',
      name: 'collectionDetailsAddressesUrlException',
      desc: '',
      args: [],
    );
  }

  /// `User not provide any locations.`
  String get collectionDetailsLocationsEmptyState {
    return Intl.message(
      'User not provide any locations.',
      name: 'collectionDetailsLocationsEmptyState',
      desc: '',
      args: [],
    );
  }

  /// `Items list`
  String get collectionDetailsItemListTitle {
    return Intl.message(
      'Items list',
      name: 'collectionDetailsItemListTitle',
      desc: '',
      args: [],
    );
  }

  /// `Items isn't provided yet.`
  String get collectionDetailsItemListEmptyState {
    return Intl.message(
      'Items isn\'t provided yet.',
      name: 'collectionDetailsItemListEmptyState',
      desc: '',
      args: [],
    );
  }

  /// `Type: {type}`
  String collectionDetailsItemTypeLabel(String type) {
    return Intl.message(
      'Type: $type',
      name: 'collectionDetailsItemTypeLabel',
      desc: 'Item type label',
      args: [type],
    );
  }

  /// `Current: {current}`
  String collectionDetailsItemCurrentLabel(String current) {
    return Intl.message(
      'Current: $current',
      name: 'collectionDetailsItemCurrentLabel',
      desc: 'Item current label',
      args: [current],
    );
  }

  /// `Maximum: {maximum}`
  String collectionDetailsItemMaximumLabel(String maximum) {
    return Intl.message(
      'Maximum: $maximum',
      name: 'collectionDetailsItemMaximumLabel',
      desc: 'Item maximum label',
      args: [maximum],
    );
  }

  /// `Donate:`
  String get collectionDetailsItemDonateLabel {
    return Intl.message(
      'Donate:',
      name: 'collectionDetailsItemDonateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get collectionEditSaveButtonLabel {
    return Intl.message(
      'Save',
      name: 'collectionEditSaveButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get collectionEditNameLabel {
    return Intl.message(
      'Name',
      name: 'collectionEditNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection name*`
  String get collectionEditNameFormLabelText {
    return Intl.message(
      'Collection name*',
      name: 'collectionEditNameFormLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get collectionEditDescriptionLabel {
    return Intl.message(
      'Description',
      name: 'collectionEditDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Collection description*`
  String get collectionEditDescriptionFormLabelText {
    return Intl.message(
      'Collection description*',
      name: 'collectionEditDescriptionFormLabelText',
      desc: '',
      args: [],
    );
  }

  /// `Items list`
  String get collectionEditItemListTitle {
    return Intl.message(
      'Items list',
      name: 'collectionEditItemListTitle',
      desc: '',
      args: [],
    );
  }

  /// `You need to add donation needs to your collection`
  String get collectionEditItemListEmptyState {
    return Intl.message(
      'You need to add donation needs to your collection',
      name: 'collectionEditItemListEmptyState',
      desc: '',
      args: [],
    );
  }

  /// `Type: {type}`
  String collectionEditItemTypeLabel(String type) {
    return Intl.message(
      'Type: $type',
      name: 'collectionEditItemTypeLabel',
      desc: 'Item type label',
      args: [type],
    );
  }

  /// `Current: {current}`
  String collectionEditItemCurrentLabel(String current) {
    return Intl.message(
      'Current: $current',
      name: 'collectionEditItemCurrentLabel',
      desc: 'Item current label',
      args: [current],
    );
  }

  /// `Maximum: {maximum}`
  String collectionEditItemMaximumLabel(String maximum) {
    return Intl.message(
      'Maximum: $maximum',
      name: 'collectionEditItemMaximumLabel',
      desc: 'Item maximum label',
      args: [maximum],
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

  /// `Something went wrong, please try again later.`
  String get defaultExceptionMessage {
    return Intl.message(
      'Something went wrong, please try again later.',
      name: 'defaultExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `You are not authorized to perform this action.`
  String get unauthorizedExceptionMessage {
    return Intl.message(
      'You are not authorized to perform this action.',
      name: 'unauthorizedExceptionMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please, try again later.\nRestart the app and contact with us to report issue.`
  String get errorPageDescription {
    return Intl.message(
      'Please, try again later.\nRestart the app and contact with us to report issue.',
      name: 'errorPageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Collection with id {collectionId} not found.`
  String collectionNotFoundError(String collectionId) {
    return Intl.message(
      'Collection with id $collectionId not found.',
      name: 'collectionNotFoundError',
      desc: 'Error message when collection with given id not found.',
      args: [collectionId],
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

  /// `Food`
  String get collectionItemCategoryFoodName {
    return Intl.message(
      'Food',
      name: 'collectionItemCategoryFoodName',
      desc: '',
      args: [],
    );
  }

  /// `Clothes`
  String get collectionItemCategoryClothesName {
    return Intl.message(
      'Clothes',
      name: 'collectionItemCategoryClothesName',
      desc: '',
      args: [],
    );
  }

  /// `Animals`
  String get collectionItemCategoryAnimalsName {
    return Intl.message(
      'Animals',
      name: 'collectionItemCategoryAnimalsName',
      desc: '',
      args: [],
    );
  }

  /// `Children`
  String get collectionItemCategoryChildrenName {
    return Intl.message(
      'Children',
      name: 'collectionItemCategoryChildrenName',
      desc: '',
      args: [],
    );
  }

  /// `Electronic`
  String get collectionItemCategoryElectronicName {
    return Intl.message(
      'Electronic',
      name: 'collectionItemCategoryElectronicName',
      desc: '',
      args: [],
    );
  }

  /// `Medicines`
  String get collectionItemCategoryMedicinesName {
    return Intl.message(
      'Medicines',
      name: 'collectionItemCategoryMedicinesName',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get collectionItemCategoryOtherName {
    return Intl.message(
      'Other',
      name: 'collectionItemCategoryOtherName',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get collectionItemTypeWeightName {
    return Intl.message(
      'Weight',
      name: 'collectionItemTypeWeightName',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get collectionItemTypeAmountName {
    return Intl.message(
      'Amount',
      name: 'collectionItemTypeAmountName',
      desc: '',
      args: [],
    );
  }

  /// `Unlimited`
  String get collectionItemTypeUnlimitedName {
    return Intl.message(
      'Unlimited',
      name: 'collectionItemTypeUnlimitedName',
      desc: '',
      args: [],
    );
  }

  /// `kg`
  String get collectionItemTypeUnitSuffixKg {
    return Intl.message(
      'kg',
      name: 'collectionItemTypeUnitSuffixKg',
      desc: '',
      args: [],
    );
  }

  /// `pcs`
  String get collectionItemTypeUnitSuffixPieces {
    return Intl.message(
      'pcs',
      name: 'collectionItemTypeUnitSuffixPieces',
      desc: '',
      args: [],
    );
  }

  /// `In progress`
  String get collectionStatusInProgressName {
    return Intl.message(
      'In progress',
      name: 'collectionStatusInProgressName',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get collectionStatusCompletedName {
    return Intl.message(
      'Completed',
      name: 'collectionStatusCompletedName',
      desc: '',
      args: [],
    );
  }

  /// `Archived`
  String get collectionStatusArchivedName {
    return Intl.message(
      'Archived',
      name: 'collectionStatusArchivedName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get verificationTypeEmailName {
    return Intl.message(
      'Email',
      name: 'verificationTypeEmailName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get verificationTypePhoneName {
    return Intl.message(
      'Phone',
      name: 'verificationTypePhoneName',
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
