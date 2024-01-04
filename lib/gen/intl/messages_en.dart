// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(current) => "Current: ${current}";

  static String m1(maximum) => "Maximum: ${maximum}";

  static String m2(type) => "Type: ${type}";

  static String m3(current) => "Current: ${current}";

  static String m4(maximum) => "Maximum: ${maximum}";

  static String m5(type) => "Type: ${type}";

  static String m6(collectionId) =>
      "Collection with id ${collectionId} not found.";

  static String m7(daysLeft) => "${daysLeft} days left until the end";

  static String m8(username) => "Hello, ${username}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutPageTitle": MessageLookupByLibrary.simpleMessage("About page"),
        "appName": MessageLookupByLibrary.simpleMessage("Kordi mobile"),
        "changePasswordPageChangePasswordButtonLabel":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "changePasswordPageDialogButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "changePasswordPageDialogSubTitleLabel":
            MessageLookupByLibrary.simpleMessage(
                "Please, sign in again with new password."),
        "changePasswordPageDialogTitleLabel":
            MessageLookupByLibrary.simpleMessage("Password changed!"),
        "changePasswordPageOldPasswordErrorTextField":
            MessageLookupByLibrary.simpleMessage(
                "Old password cannot be empty"),
        "changePasswordPageOldPasswordHintTextField":
            MessageLookupByLibrary.simpleMessage("Enter your old password"),
        "changePasswordPageOldPasswordLabelTextField":
            MessageLookupByLibrary.simpleMessage("Old password"),
        "changePasswordPagePasswordErrorTextField":
            MessageLookupByLibrary.simpleMessage("Password cannot be empty"),
        "changePasswordPagePasswordHintTextField":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "changePasswordPagePasswordLabelTextField":
            MessageLookupByLibrary.simpleMessage("Password"),
        "collectionDetailsAddressesUrlException":
            MessageLookupByLibrary.simpleMessage(
                "Cannot open address in browser."),
        "collectionDetailsDescriptionLabel":
            MessageLookupByLibrary.simpleMessage("Description"),
        "collectionDetailsItemCurrentLabel": m0,
        "collectionDetailsItemDonateLabel":
            MessageLookupByLibrary.simpleMessage("Donate:"),
        "collectionDetailsItemListEmptyState":
            MessageLookupByLibrary.simpleMessage("Items isn\'t provided yet."),
        "collectionDetailsItemListTitle":
            MessageLookupByLibrary.simpleMessage("Items list"),
        "collectionDetailsItemMaximumLabel": m1,
        "collectionDetailsItemTypeLabel": m2,
        "collectionDetailsLocationsEmptyState":
            MessageLookupByLibrary.simpleMessage(
                "User not provide any locations."),
        "collectionDetailsLocationsLabel": MessageLookupByLibrary.simpleMessage(
            "Locations where you can donate"),
        "collectionEditDescriptionFormLabelText":
            MessageLookupByLibrary.simpleMessage("Collection description*"),
        "collectionEditDescriptionLabel":
            MessageLookupByLibrary.simpleMessage("Description"),
        "collectionEditItemCurrentLabel": m3,
        "collectionEditItemListAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Add item"),
        "collectionEditItemListEmptyState":
            MessageLookupByLibrary.simpleMessage(
                "You need to add donation needs to your collection"),
        "collectionEditItemListTitle":
            MessageLookupByLibrary.simpleMessage("Items list"),
        "collectionEditItemMaximumLabel": m4,
        "collectionEditItemTypeLabel": m5,
        "collectionEditLocationsTileAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Add address"),
        "collectionEditNameFormLabelText":
            MessageLookupByLibrary.simpleMessage("Collection name*"),
        "collectionEditNameLabel": MessageLookupByLibrary.simpleMessage("Name"),
        "collectionEditSaveButtonLabel":
            MessageLookupByLibrary.simpleMessage("Save"),
        "collectionItemDialogAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Add"),
        "collectionItemDialogCancelButtonLabel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "collectionItemDialogCategoryFormLabelText":
            MessageLookupByLibrary.simpleMessage("Category*"),
        "collectionItemDialogFieldsEmptyErrorLabel":
            MessageLookupByLibrary.simpleMessage("Please fill all fields"),
        "collectionItemDialogMaximumFormLabelText":
            MessageLookupByLibrary.simpleMessage("Maximum quantity*"),
        "collectionItemDialogNameFormLabelText":
            MessageLookupByLibrary.simpleMessage("Name*"),
        "collectionItemDialogTitle":
            MessageLookupByLibrary.simpleMessage("Add item"),
        "collectionItemDialogTypeFormLabelText":
            MessageLookupByLibrary.simpleMessage("Type*"),
        "collectionNotFoundError": m6,
        "collectionPageDaysLeft": m7,
        "collectionPageEmptyState": MessageLookupByLibrary.simpleMessage(
            "No collections found or given filter result are empty."),
        "collectionPageEmptyStateButtonLabel":
            MessageLookupByLibrary.simpleMessage("Get initial collections"),
        "collectionPageLoadMoreButtonLabel":
            MessageLookupByLibrary.simpleMessage("Load more..."),
        "collectionPageLocations":
            MessageLookupByLibrary.simpleMessage("Locations"),
        "collectionPageProgress":
            MessageLookupByLibrary.simpleMessage("Collection progress:"),
        "collectionPageTitle":
            MessageLookupByLibrary.simpleMessage("Collection page"),
        "createCollectionFirstStepDescriptionFormTextLabel":
            MessageLookupByLibrary.simpleMessage("Collection description*"),
        "createCollectionFirstStepEndDateFormTextLabel":
            MessageLookupByLibrary.simpleMessage("Collection end date"),
        "createCollectionFirstStepInformation":
            MessageLookupByLibrary.simpleMessage(
                "Please provide basic information about your collection"),
        "createCollectionFirstStepNameFormTextLabel":
            MessageLookupByLibrary.simpleMessage("Collection name*"),
        "createCollectionFirstStepNextStepButtonLabel":
            MessageLookupByLibrary.simpleMessage("Next step"),
        "createCollectionFirstStepPhotoHintLabel":
            MessageLookupByLibrary.simpleMessage(
                "Tap image above to add photo"),
        "createCollectionFirstStepPhotoLabel":
            MessageLookupByLibrary.simpleMessage("Collection photo"),
        "createCollectionFirstStepSubtitle":
            MessageLookupByLibrary.simpleMessage("Step 1 of 4"),
        "createCollectionFirstStepTitle": MessageLookupByLibrary.simpleMessage(
            "Basic collection information"),
        "createCollectionFirstStepValidationHint":
            MessageLookupByLibrary.simpleMessage(
                "Please fill all required fields, indicated by *"),
        "createCollectionFourthStepButtonLabel":
            MessageLookupByLibrary.simpleMessage("To collections"),
        "createCollectionFourthStepInformation":
            MessageLookupByLibrary.simpleMessage(
                "You have successfully created collection!"),
        "createCollectionFourthStepSecondInformation":
            MessageLookupByLibrary.simpleMessage(
                "You can still edit it later."),
        "createCollectionFourthStepSubtitle":
            MessageLookupByLibrary.simpleMessage("Step 4 of 4"),
        "createCollectionFourthStepTitle":
            MessageLookupByLibrary.simpleMessage("Congratulations!"),
        "createCollectionSecondStepAddAddressButtonLabel":
            MessageLookupByLibrary.simpleMessage("Add address"),
        "createCollectionSecondStepAddressLabel":
            MessageLookupByLibrary.simpleMessage("Address"),
        "createCollectionSecondStepCityLabel":
            MessageLookupByLibrary.simpleMessage("City"),
        "createCollectionSecondStepInformation":
            MessageLookupByLibrary.simpleMessage(
                "Please provide addresses where donates can be stored"),
        "createCollectionSecondStepNextStepButtonLabel":
            MessageLookupByLibrary.simpleMessage("Next step"),
        "createCollectionSecondStepSubtitle":
            MessageLookupByLibrary.simpleMessage("Step 2 of 4"),
        "createCollectionSecondStepTitle":
            MessageLookupByLibrary.simpleMessage("Collection addresses"),
        "createCollectionThirdStepAddItemButtonLabel":
            MessageLookupByLibrary.simpleMessage("Add item"),
        "createCollectionThirdStepCategoryLabel":
            MessageLookupByLibrary.simpleMessage("Category"),
        "createCollectionThirdStepInformation":
            MessageLookupByLibrary.simpleMessage(
                "Please provide items that collection needs"),
        "createCollectionThirdStepMaximumLabel":
            MessageLookupByLibrary.simpleMessage("Maximum quantity"),
        "createCollectionThirdStepNameLabel":
            MessageLookupByLibrary.simpleMessage("Name"),
        "createCollectionThirdStepNextStepButtonLabel":
            MessageLookupByLibrary.simpleMessage("Next step"),
        "createCollectionThirdStepSubtitle":
            MessageLookupByLibrary.simpleMessage("Step 3 of 4"),
        "createCollectionThirdStepTitle":
            MessageLookupByLibrary.simpleMessage("Collection items"),
        "createCollectionThirdStepTypeLabel":
            MessageLookupByLibrary.simpleMessage("Type"),
        "drawerAboutButtonLabel": MessageLookupByLibrary.simpleMessage("About"),
        "drawerChangeLanguageButtonLabel":
            MessageLookupByLibrary.simpleMessage("Change language"),
        "drawerChangePasswordButtonLabel":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "drawerCollectionButtonLabel":
            MessageLookupByLibrary.simpleMessage("Collection"),
        "drawerGreetings": MessageLookupByLibrary.simpleMessage("Hello, user!"),
        "drawerSignInButtonLabel":
            MessageLookupByLibrary.simpleMessage("Sign in"),
        "drawerSignOutButtonLabel":
            MessageLookupByLibrary.simpleMessage("Sign out"),
        "drawerSignUpButtonLabel":
            MessageLookupByLibrary.simpleMessage("Sign up"),
        "drawerUserGreetings": m8,
        "errorPageDescription": MessageLookupByLibrary.simpleMessage(
            "Please, try again later.\nRestart the app and contact with us to report issue."),
        "exceptionDialogButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "exceptionDialogTitle":
            MessageLookupByLibrary.simpleMessage("Kordi occurred an error..."),
        "fieldRequiredErrorLabel":
            MessageLookupByLibrary.simpleMessage("Field required"),
        "filterDialogApplyButtonLabel":
            MessageLookupByLibrary.simpleMessage("Apply"),
        "filterDialogCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Choose category:"),
        "filterDialogCityLabelText":
            MessageLookupByLibrary.simpleMessage("City"),
        "filterDialogCloseButtonLabel":
            MessageLookupByLibrary.simpleMessage("Close"),
        "filterDialogItemNameLabelText":
            MessageLookupByLibrary.simpleMessage("Item name"),
        "filterDialogStreetLabelText":
            MessageLookupByLibrary.simpleMessage("Street"),
        "filterDialogTitle":
            MessageLookupByLibrary.simpleMessage("Filter options"),
        "filterDialogTitleLabelText":
            MessageLookupByLibrary.simpleMessage("Name"),
        "kordiScaffoldTitle":
            MessageLookupByLibrary.simpleMessage("KORDI Mobile"),
        "signInPageFlushbarLabel":
            MessageLookupByLibrary.simpleMessage("Signed in!"),
        "signInPagePasswordErrorTextField":
            MessageLookupByLibrary.simpleMessage("Password cannot be empty"),
        "signInPagePasswordHintTextField":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "signInPagePasswordLabelTextField":
            MessageLookupByLibrary.simpleMessage("Password"),
        "signInPageSignInButtonLabel":
            MessageLookupByLibrary.simpleMessage("Sign in"),
        "signInPageSignUpButtonLabel1":
            MessageLookupByLibrary.simpleMessage("No account? "),
        "signInPageSignUpButtonLabel2":
            MessageLookupByLibrary.simpleMessage("Sign up"),
        "signInPageUsernameErrorTextField":
            MessageLookupByLibrary.simpleMessage("Username cannot be empty"),
        "signInPageUsernameHintTextField":
            MessageLookupByLibrary.simpleMessage("Enter your username"),
        "signInPageUsernameLabelTextField":
            MessageLookupByLibrary.simpleMessage("Username"),
        "signUpPageAlreadyHaveAccountLabel":
            MessageLookupByLibrary.simpleMessage("Already have an account? "),
        "signUpPageEmailErrorTextField":
            MessageLookupByLibrary.simpleMessage("Email cannot be empty"),
        "signUpPageEmailHintTextField":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "signUpPageEmailLabelTextField":
            MessageLookupByLibrary.simpleMessage("Email"),
        "signUpPageFirstNameErrorTextField":
            MessageLookupByLibrary.simpleMessage("First name cannot be empty"),
        "signUpPageFirstNameHintTextField":
            MessageLookupByLibrary.simpleMessage("Enter your first name"),
        "signUpPageFirstNameLabelTextField":
            MessageLookupByLibrary.simpleMessage("First name"),
        "signUpPageFlushbarLabel":
            MessageLookupByLibrary.simpleMessage("Sign up successful!"),
        "signUpPageLastNameErrorTextField":
            MessageLookupByLibrary.simpleMessage("Last name cannot be empty"),
        "signUpPageLastNameHintTextField":
            MessageLookupByLibrary.simpleMessage("Enter your last name"),
        "signUpPageLastNameLabelTextField":
            MessageLookupByLibrary.simpleMessage("Last name"),
        "signUpPagePasswordErrorTextField":
            MessageLookupByLibrary.simpleMessage("Password cannot be empty"),
        "signUpPagePasswordHintTextField":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "signUpPagePasswordLabelTextField":
            MessageLookupByLibrary.simpleMessage("Password"),
        "signUpPagePhoneNumberErrorTextField":
            MessageLookupByLibrary.simpleMessage(
                "Phone number must be a 9 digit number"),
        "signUpPagePhoneNumberHintTextField":
            MessageLookupByLibrary.simpleMessage("Enter your phone number"),
        "signUpPagePhoneNumberLabelTextField":
            MessageLookupByLibrary.simpleMessage("Phone number"),
        "signUpPageSignInButtonLabel":
            MessageLookupByLibrary.simpleMessage("Sign in"),
        "signUpPageSignUpButtonLabel":
            MessageLookupByLibrary.simpleMessage("Sign up"),
        "signUpPageUsernameErrorTextField":
            MessageLookupByLibrary.simpleMessage("Username cannot be empty"),
        "signUpPageUsernameHintTextField":
            MessageLookupByLibrary.simpleMessage("Enter your username"),
        "signUpPageUsernameLabelTextField":
            MessageLookupByLibrary.simpleMessage("Username"),
        "signUpPageVerificationTypeLabel":
            MessageLookupByLibrary.simpleMessage("Pick verification type"),
        "verificationCodePageButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "verificationCodePageDescription": MessageLookupByLibrary.simpleMessage(
            "We sent verification code on your email/phone. Please insert it below."),
        "verificationCodePageFlushbarLabel":
            MessageLookupByLibrary.simpleMessage("Code resent!"),
        "verificationCodePageResendCodeButtonLabel":
            MessageLookupByLibrary.simpleMessage("Don\'t have the code? "),
        "verificationCodePageResendCodeButtonLabel2":
            MessageLookupByLibrary.simpleMessage("Resend code"),
        "verificationCodePageSuccessDialogButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "verificationCodePageSuccessDialogSubtitle":
            MessageLookupByLibrary.simpleMessage(
                "You have successfully verified your account!"),
        "verificationCodePageSuccessDialogTitle":
            MessageLookupByLibrary.simpleMessage("Success!"),
        "verificationCodePageTextfieldCodeError":
            MessageLookupByLibrary.simpleMessage(
                "Code must be a 6 digit number"),
        "verificationCodePageTextfieldCodeHint":
            MessageLookupByLibrary.simpleMessage("Code"),
        "verificationCodePageTextfieldCodeLabel":
            MessageLookupByLibrary.simpleMessage("Enter verification code"),
        "verificationCodePageTextfieldUsernameError":
            MessageLookupByLibrary.simpleMessage("Username cannot be empty"),
        "verificationCodePageTextfieldUsernameHint":
            MessageLookupByLibrary.simpleMessage("Username"),
        "verificationCodePageTextfieldUsernameLabel":
            MessageLookupByLibrary.simpleMessage("Enter username"),
        "verificationCodePageTitle":
            MessageLookupByLibrary.simpleMessage("Last step!")
      };
}
