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
        "aboutPageAuthor": MessageLookupByLibrary.simpleMessage(
            "Mobile application author: Daniel Obłąk."),
        "aboutPageCopyRight":
            MessageLookupByLibrary.simpleMessage("© 2024 Daniel Obłąk"),
        "aboutPageExplanationDescriptionPartOne":
            MessageLookupByLibrary.simpleMessage(
                "The application utilizes a server part developed by Eng. Grzegorz Kucharski as part of his own engineering project. The code is available on the GitHub platform "),
        "aboutPageExplanationDescriptionPartTwo":
            MessageLookupByLibrary.simpleMessage(
                " The system allows users to register with two-step verification, log in, and change their password. Neither the server nor the presentation part includes changing user avatars, therefore, in the application, one can encounter default user avatars. Unregistered users have the ability to view all collections, but they cannot create a collection, edit collections, add comments, or donate to a given collection. Registered users can create collections, add comments, edit their own collections, donate to collections, and write and delete their own comments. "),
        "aboutPageGenesisDescription": MessageLookupByLibrary.simpleMessage(
            "The project was created for the purpose of an engineering thesis. The aim of the project was to develop a fully functional mobile application, based on the Flutter framework for Android and iOS devices."),
        "aboutPageGithub": MessageLookupByLibrary.simpleMessage("GitHub: "),
        "aboutPageIconsAndImages": MessageLookupByLibrary.simpleMessage(
            "Icons and images used in the application come from the following source:"),
        "aboutPageLinkedin": MessageLookupByLibrary.simpleMessage("Linkedin: "),
        "aboutPageProjectDescription": MessageLookupByLibrary.simpleMessage(
            "The project assumes material support for people affected by a crisis. In the Kordi service, users can create a collection for a specific purpose they describe. They clearly state what items they need and in what quantity. The application administrators do not verify in any way whether the declared donations have reached the needy. Everything happens among users. Kordi is merely a tool that facilitates the creation of such collections, and since there is no financial funding in the application, it cannot be considered fraudulent."),
        "aboutPageTitle": MessageLookupByLibrary.simpleMessage("About us"),
        "appName": MessageLookupByLibrary.simpleMessage("Kordi mobile"),
        "authTokenExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Your session has expired. Please, sign in again."),
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
        "collectionAddressDialogAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Add"),
        "collectionAddressDialogAddTitle":
            MessageLookupByLibrary.simpleMessage("Add address"),
        "collectionAddressDialogCancelButtonLabel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "collectionAddressDialogCityFormLabelText":
            MessageLookupByLibrary.simpleMessage("City*"),
        "collectionAddressDialogEditTitle":
            MessageLookupByLibrary.simpleMessage("Edit address"),
        "collectionAddressDialogFieldsEmptyErrorLabel":
            MessageLookupByLibrary.simpleMessage("Please fill all fields"),
        "collectionAddressDialogStreetFormLabelText":
            MessageLookupByLibrary.simpleMessage("Street*"),
        "collectionDetailsAddressesUrlException":
            MessageLookupByLibrary.simpleMessage(
                "Cannot open address in browser."),
        "collectionDetailsCommentDialogTitle":
            MessageLookupByLibrary.simpleMessage("Add comment"),
        "collectionDetailsCommentListAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Add comment"),
        "collectionDetailsCommentListEmptyState":
            MessageLookupByLibrary.simpleMessage("No comments yet."),
        "collectionDetailsCommentListFormErrorText":
            MessageLookupByLibrary.simpleMessage("Comment cannot be empty"),
        "collectionDetailsCommentListFormHintText":
            MessageLookupByLibrary.simpleMessage("Comment"),
        "collectionDetailsCommentListTitle":
            MessageLookupByLibrary.simpleMessage("Comments"),
        "collectionDetailsCommentListUnauthorizedState":
            MessageLookupByLibrary.simpleMessage(
                "You need to be signed in to add comment."),
        "collectionDetailsDescriptionLabel":
            MessageLookupByLibrary.simpleMessage("Description"),
        "collectionDetailsEndTimeLabel":
            MessageLookupByLibrary.simpleMessage("Collection will end at:"),
        "collectionDetailsItemCompletedLabel":
            MessageLookupByLibrary.simpleMessage("Completed!"),
        "collectionDetailsItemCurrentLabel": m0,
        "collectionDetailsItemDonateButtonLabel":
            MessageLookupByLibrary.simpleMessage("Donate"),
        "collectionDetailsItemDonateLabel":
            MessageLookupByLibrary.simpleMessage("Donate: "),
        "collectionDetailsItemListEmptyState":
            MessageLookupByLibrary.simpleMessage("Items isn\'t provided yet."),
        "collectionDetailsItemListTitle":
            MessageLookupByLibrary.simpleMessage("Items list"),
        "collectionDetailsItemListUnauthorizedState":
            MessageLookupByLibrary.simpleMessage(
                "You need to be signed in to donate items."),
        "collectionDetailsItemMaximumLabel": m1,
        "collectionDetailsItemTypeLabel": m2,
        "collectionDetailsLocationsEmptyState":
            MessageLookupByLibrary.simpleMessage(
                "User not provide any locations."),
        "collectionDetailsLocationsHint":
            MessageLookupByLibrary.simpleMessage("City, street"),
        "collectionDetailsLocationsLabel": MessageLookupByLibrary.simpleMessage(
            "Locations where you can donate"),
        "collectionEditDescriptionFormLabelText":
            MessageLookupByLibrary.simpleMessage("Collection description*"),
        "collectionEditDescriptionLabel":
            MessageLookupByLibrary.simpleMessage("Description"),
        "collectionEditEndTimeLabel":
            MessageLookupByLibrary.simpleMessage("End date"),
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
        "collectionItemCategoryAnimalsName":
            MessageLookupByLibrary.simpleMessage("Animals"),
        "collectionItemCategoryChildrenName":
            MessageLookupByLibrary.simpleMessage("Children"),
        "collectionItemCategoryClothesName":
            MessageLookupByLibrary.simpleMessage("Clothes"),
        "collectionItemCategoryElectronicName":
            MessageLookupByLibrary.simpleMessage("Electronic"),
        "collectionItemCategoryFoodName":
            MessageLookupByLibrary.simpleMessage("Food"),
        "collectionItemCategoryMedicinesName":
            MessageLookupByLibrary.simpleMessage("Medicines"),
        "collectionItemCategoryOtherName":
            MessageLookupByLibrary.simpleMessage("Other"),
        "collectionItemDialogAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Add"),
        "collectionItemDialogAddTitle":
            MessageLookupByLibrary.simpleMessage("Add item"),
        "collectionItemDialogCancelButtonLabel":
            MessageLookupByLibrary.simpleMessage("Cancel"),
        "collectionItemDialogCategoryFormLabelText":
            MessageLookupByLibrary.simpleMessage("Category*"),
        "collectionItemDialogCurrentFormLabelText":
            MessageLookupByLibrary.simpleMessage("Current quantity"),
        "collectionItemDialogEditButtonLabel":
            MessageLookupByLibrary.simpleMessage("Edit"),
        "collectionItemDialogEditTitle":
            MessageLookupByLibrary.simpleMessage("Edit item"),
        "collectionItemDialogFieldsEmptyErrorLabel":
            MessageLookupByLibrary.simpleMessage("Please fill all fields"),
        "collectionItemDialogMaximumFormLabelText":
            MessageLookupByLibrary.simpleMessage("Maximum quantity*"),
        "collectionItemDialogNameFormLabelText":
            MessageLookupByLibrary.simpleMessage("Name*"),
        "collectionItemDialogTypeFormLabelText":
            MessageLookupByLibrary.simpleMessage("Type*"),
        "collectionItemTypeAmountName":
            MessageLookupByLibrary.simpleMessage("Amount"),
        "collectionItemTypeUnitSuffixKg":
            MessageLookupByLibrary.simpleMessage("kg"),
        "collectionItemTypeUnitSuffixPieces":
            MessageLookupByLibrary.simpleMessage("pcs"),
        "collectionItemTypeUnlimitedName":
            MessageLookupByLibrary.simpleMessage("Unlimited"),
        "collectionItemTypeWeightName":
            MessageLookupByLibrary.simpleMessage("Weight"),
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
        "collectionStatusArchivedName":
            MessageLookupByLibrary.simpleMessage("Archived"),
        "collectionStatusCompletedName":
            MessageLookupByLibrary.simpleMessage("Completed"),
        "collectionStatusInProgressName":
            MessageLookupByLibrary.simpleMessage("In progress"),
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
        "createCollectionFirstStepPhotoDeleteButtonLabel":
            MessageLookupByLibrary.simpleMessage("Delete photo"),
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
        "defaultExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Something went wrong, please try again later."),
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
        "imagePickerCanceledByUserException":
            MessageLookupByLibrary.simpleMessage(
                "Image picking canceled by user."),
        "imagePickerFileTooBigException":
            MessageLookupByLibrary.simpleMessage("Image file is too big."),
        "imagePickerInsufficientPermissionException":
            MessageLookupByLibrary.simpleMessage(
                "Insufficient permission to access image."),
        "imagePickerUnexpectedException": MessageLookupByLibrary.simpleMessage(
            "Unexpected error occurred during image picking."),
        "imageTooBigDialogButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "imageTooBigDialogSubtitle": MessageLookupByLibrary.simpleMessage(
            "Please, choose smaller image."),
        "imageTooBigDialogTitle":
            MessageLookupByLibrary.simpleMessage("Image too big"),
        "kordiScaffoldTitle":
            MessageLookupByLibrary.simpleMessage("KORDI Mobile"),
        "navigationExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Navigation error occurred. Please, try again later."),
        "pickImageBottomSheetCameraTile":
            MessageLookupByLibrary.simpleMessage("Make a picture"),
        "pickImageBottomSheetDocumentsTile":
            MessageLookupByLibrary.simpleMessage("Pick image from documents"),
        "pickImageBottomSheetGalleryTile":
            MessageLookupByLibrary.simpleMessage("Pick image from gallery"),
        "responseCollectionItemCurrentBiggerThanMaximum":
            MessageLookupByLibrary.simpleMessage(
                "You cannot donate more than maximum amount."),
        "responseEmailAlreadyConfirmed": MessageLookupByLibrary.simpleMessage(
            "Provided email address is already confirmed."),
        "responseEmailAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "Provided email address is already taken."),
        "responseEmailNotValid": MessageLookupByLibrary.simpleMessage(
            "Provided email address is not valid."),
        "responsePasswordOldPasswordNotMatch":
            MessageLookupByLibrary.simpleMessage(
                "Provided old password is not valid."),
        "responsePasswordTooShort": MessageLookupByLibrary.simpleMessage(
            "Provided password is too short."),
        "responsePhoneAlreadyConfirmed": MessageLookupByLibrary.simpleMessage(
            "Provided phone number is already confirmed."),
        "responsePhoneAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "Provided phone number is already taken."),
        "responseUserAlreadyVerified": MessageLookupByLibrary.simpleMessage(
            "User was already verified, please sign in."),
        "responseUserBadCredentials": MessageLookupByLibrary.simpleMessage(
            "Provided user credentials are not valid."),
        "responseUserEmailExists": MessageLookupByLibrary.simpleMessage(
            "Provided email address is already taken."),
        "responseUserNotCollectionOwner": MessageLookupByLibrary.simpleMessage(
            "User is not collection owner."),
        "responseUserNotFound": MessageLookupByLibrary.simpleMessage(
            "User with given username not found."),
        "responseUserNotFoundWithGivenToken":
            MessageLookupByLibrary.simpleMessage(
                "User not found with given token."),
        "responseUserNotVerifiedEmail": MessageLookupByLibrary.simpleMessage(
            "User with given email is not verified."),
        "responseUserNotVerifiedPhone": MessageLookupByLibrary.simpleMessage(
            "User with given phone number is not verified."),
        "responseUserPhoneExists": MessageLookupByLibrary.simpleMessage(
            "Provided phone number is already taken."),
        "responseUserUsernameExists": MessageLookupByLibrary.simpleMessage(
            "Provided username is already taken."),
        "serverExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Server error occurred. Please, try again later."),
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
        "unauthorizedExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "You are not authorized to perform this action."),
        "userInformationExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Something went wrong with getting user information. Please, try again later."),
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
            MessageLookupByLibrary.simpleMessage("Last step!"),
        "verificationTypeEmailName":
            MessageLookupByLibrary.simpleMessage("Email"),
        "verificationTypePhoneName":
            MessageLookupByLibrary.simpleMessage("Phone")
      };
}
