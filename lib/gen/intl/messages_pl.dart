// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static String m0(current) => "Dostarczone: ${current}";

  static String m1(maximum) => "Cel: ${maximum}";

  static String m2(type) => "Typ: ${type}";

  static String m3(collectionId) =>
      "Zbiórka o id ${collectionId} nie znaleziona.";

  static String m4(daysLeft) => "${daysLeft} dni pozostało do końca";

  static String m5(username) => "Cześć, ${username}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutPageTitle": MessageLookupByLibrary.simpleMessage("Strona o nas"),
        "appName": MessageLookupByLibrary.simpleMessage("Kordi mobile"),
        "changePasswordPageChangePasswordButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zmień hasło"),
        "changePasswordPageDialogButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "changePasswordPageDialogSubTitleLabel":
            MessageLookupByLibrary.simpleMessage(
                "Przejdź do strony logowania i zaloguj się ponownie swoim nowym hasłem."),
        "changePasswordPageDialogTitleLabel":
            MessageLookupByLibrary.simpleMessage("Hasło zmienione!"),
        "changePasswordPageOldPasswordErrorTextField":
            MessageLookupByLibrary.simpleMessage(
                "Aktualne hasło nie może być puste"),
        "changePasswordPageOldPasswordHintTextField":
            MessageLookupByLibrary.simpleMessage("Wprowadz aktualne hasło"),
        "changePasswordPageOldPasswordLabelTextField":
            MessageLookupByLibrary.simpleMessage("Aktualne hasło"),
        "changePasswordPagePasswordErrorTextField":
            MessageLookupByLibrary.simpleMessage(
                "Nowe hasło nie może być puste"),
        "changePasswordPagePasswordHintTextField":
            MessageLookupByLibrary.simpleMessage("Wprowadź nowe hasło"),
        "changePasswordPagePasswordLabelTextField":
            MessageLookupByLibrary.simpleMessage("Nowe hasło"),
        "collectionDetailsAddressesUrlException":
            MessageLookupByLibrary.simpleMessage(
                "Nie można otworzyć linku. Spróbuj ponownie później."),
        "collectionDetailsDescriptionLabel":
            MessageLookupByLibrary.simpleMessage("Opis"),
        "collectionDetailsItemCurrentLabel": m0,
        "collectionDetailsItemDonateLabel":
            MessageLookupByLibrary.simpleMessage("Przekaż: "),
        "collectionDetailsItemListEmptyState":
            MessageLookupByLibrary.simpleMessage(
                "Użytkownik nie dodał jeszcze żadnych przedmiotów."),
        "collectionDetailsItemListTitle":
            MessageLookupByLibrary.simpleMessage("Lista przedmiotów"),
        "collectionDetailsItemMaximumLabel": m1,
        "collectionDetailsItemTypeLabel": m2,
        "collectionDetailsLocationsEmptyState":
            MessageLookupByLibrary.simpleMessage(
                "Użytkownik nie dodał jeszcze żadnych lokalizacji."),
        "collectionDetailsLocationsLabel": MessageLookupByLibrary.simpleMessage(
            "Lokalizacje do których możesz oddać przedmioty"),
        "collectionNotFoundError": m3,
        "collectionPageDaysLeft": m4,
        "collectionPageEmptyState": MessageLookupByLibrary.simpleMessage(
            "Nie ma jeszcze żadnych kolekcji lub podany filtr nie zwrócił żadnych wyników."),
        "collectionPageEmptyStateButtonLabel":
            MessageLookupByLibrary.simpleMessage("Pobierz wszystkie kolekcje"),
        "collectionPageLoadMoreButtonLabel":
            MessageLookupByLibrary.simpleMessage("Pobierz więcej..."),
        "collectionPageLocations":
            MessageLookupByLibrary.simpleMessage("Lokalizacje"),
        "collectionPageProgress":
            MessageLookupByLibrary.simpleMessage("Postęp kolekcji:"),
        "collectionPageTitle": MessageLookupByLibrary.simpleMessage("Kolekcje"),
        "drawerAboutButtonLabel": MessageLookupByLibrary.simpleMessage("O nas"),
        "drawerChangeLanguageButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zmień język"),
        "drawerChangePasswordButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zmień hasło"),
        "drawerCollectionButtonLabel":
            MessageLookupByLibrary.simpleMessage("Kolekcje"),
        "drawerGreetings":
            MessageLookupByLibrary.simpleMessage("Cześć, użytkowniku!"),
        "drawerSignInButtonLabel":
            MessageLookupByLibrary.simpleMessage("Logowanie"),
        "drawerSignOutButtonLabel":
            MessageLookupByLibrary.simpleMessage("Wyloguj się"),
        "drawerSignUpButtonLabel":
            MessageLookupByLibrary.simpleMessage("Rejestracja"),
        "drawerUserGreetings": m5,
        "errorPageDescription": MessageLookupByLibrary.simpleMessage(
            "Spróbuj ponownie później.\nZresetuj aplikacje i skontaktuj się z nami, aby zgłosić błąd."),
        "exceptionDialogButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "exceptionDialogTitle":
            MessageLookupByLibrary.simpleMessage("Kordi napotkał problem..."),
        "filterDialogApplyButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zatwierdź"),
        "filterDialogCategoryTitle":
            MessageLookupByLibrary.simpleMessage("Wybierz kategorię:"),
        "filterDialogCityLabelText":
            MessageLookupByLibrary.simpleMessage("Miasto"),
        "filterDialogCloseButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zamknij"),
        "filterDialogItemNameLabelText":
            MessageLookupByLibrary.simpleMessage("Przedmiot"),
        "filterDialogStreetLabelText":
            MessageLookupByLibrary.simpleMessage("Ulica"),
        "filterDialogTitle":
            MessageLookupByLibrary.simpleMessage("Opcje filtrowania"),
        "filterDialogTitleLabelText":
            MessageLookupByLibrary.simpleMessage("Nazwa"),
        "kordiScaffoldTitle":
            MessageLookupByLibrary.simpleMessage("KORDI Mobile"),
        "signInPageFlushbarLabel":
            MessageLookupByLibrary.simpleMessage("Zalogowano!"),
        "signInPagePasswordErrorTextField":
            MessageLookupByLibrary.simpleMessage("Hasło nie może być puste"),
        "signInPagePasswordHintTextField":
            MessageLookupByLibrary.simpleMessage("Wprowadź hasło"),
        "signInPagePasswordLabelTextField":
            MessageLookupByLibrary.simpleMessage("Hasło"),
        "signInPageSignInButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zaloguj się"),
        "signInPageSignUpButtonLabel1":
            MessageLookupByLibrary.simpleMessage("Nie masz konta? "),
        "signInPageSignUpButtonLabel2":
            MessageLookupByLibrary.simpleMessage("Zarejestruj się"),
        "signInPageUsernameErrorTextField":
            MessageLookupByLibrary.simpleMessage(
                "Nazwa użytkownika nie może być pusta"),
        "signInPageUsernameHintTextField":
            MessageLookupByLibrary.simpleMessage("Wprowadź nazwę użytkownika"),
        "signInPageUsernameLabelTextField":
            MessageLookupByLibrary.simpleMessage("Nazwa użytkownika"),
        "signUpPageAlreadyHaveAccountLabel":
            MessageLookupByLibrary.simpleMessage("Masz już konto? "),
        "signUpPageEmailErrorTextField":
            MessageLookupByLibrary.simpleMessage("Email nie może być pusty"),
        "signUpPageEmailHintTextField":
            MessageLookupByLibrary.simpleMessage("Wprowadź email"),
        "signUpPageEmailLabelTextField":
            MessageLookupByLibrary.simpleMessage("Email"),
        "signUpPageFirstNameErrorTextField":
            MessageLookupByLibrary.simpleMessage("Imię nie może być puste"),
        "signUpPageFirstNameHintTextField":
            MessageLookupByLibrary.simpleMessage("Wprowadź imię"),
        "signUpPageFirstNameLabelTextField":
            MessageLookupByLibrary.simpleMessage("Imię"),
        "signUpPageFlushbarLabel":
            MessageLookupByLibrary.simpleMessage("Zarejestrowano!"),
        "signUpPageLastNameErrorTextField":
            MessageLookupByLibrary.simpleMessage("Nazwisko nie może być puste"),
        "signUpPageLastNameHintTextField":
            MessageLookupByLibrary.simpleMessage("Wprowadź nazwisko"),
        "signUpPageLastNameLabelTextField":
            MessageLookupByLibrary.simpleMessage("Nazwisko"),
        "signUpPagePasswordErrorTextField":
            MessageLookupByLibrary.simpleMessage("Hasło nie może być puste"),
        "signUpPagePasswordHintTextField":
            MessageLookupByLibrary.simpleMessage("Wprowadź hasło"),
        "signUpPagePasswordLabelTextField":
            MessageLookupByLibrary.simpleMessage("Hasło"),
        "signUpPagePhoneNumberErrorTextField":
            MessageLookupByLibrary.simpleMessage(
                "Numer telefonu musi mieć 9 znaków"),
        "signUpPagePhoneNumberHintTextField":
            MessageLookupByLibrary.simpleMessage("Wprowadź numer telefonu"),
        "signUpPagePhoneNumberLabelTextField":
            MessageLookupByLibrary.simpleMessage("Numer telefonu"),
        "signUpPageSignInButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zaloguj się"),
        "signUpPageSignUpButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zarejestruj"),
        "signUpPageUsernameErrorTextField":
            MessageLookupByLibrary.simpleMessage(
                "Nazwa użytkownika nie może być pusta"),
        "signUpPageUsernameHintTextField":
            MessageLookupByLibrary.simpleMessage("Wprowadź nazwę użytkownika"),
        "signUpPageUsernameLabelTextField":
            MessageLookupByLibrary.simpleMessage("Nazwa użytkownika"),
        "signUpPageVerificationTypeLabel":
            MessageLookupByLibrary.simpleMessage("Wybierz sposób weryfikacji"),
        "verificationCodePageButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "verificationCodePageDescription": MessageLookupByLibrary.simpleMessage(
            "Wysłaliśmy kod weryfikacyjny na twój adres email/numer telefonu. Wprowadź kod w polu poniżej."),
        "verificationCodePageFlushbarLabel":
            MessageLookupByLibrary.simpleMessage("Kod wysłany!"),
        "verificationCodePageResendCodeButtonLabel":
            MessageLookupByLibrary.simpleMessage("Nie masz kodu? "),
        "verificationCodePageResendCodeButtonLabel2":
            MessageLookupByLibrary.simpleMessage("Wyślij ponownie"),
        "verificationCodePageSuccessDialogButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "verificationCodePageSuccessDialogSubtitle":
            MessageLookupByLibrary.simpleMessage(
                "Udało ci się zweryfikować konto!"),
        "verificationCodePageSuccessDialogTitle":
            MessageLookupByLibrary.simpleMessage("Sukces!"),
        "verificationCodePageTextfieldCodeError":
            MessageLookupByLibrary.simpleMessage("Kod musi mieć 6 znaków"),
        "verificationCodePageTextfieldCodeHint":
            MessageLookupByLibrary.simpleMessage("Kod"),
        "verificationCodePageTextfieldCodeLabel":
            MessageLookupByLibrary.simpleMessage("Wprowadź kod weryfikacyjny"),
        "verificationCodePageTextfieldUsernameError":
            MessageLookupByLibrary.simpleMessage(
                "Nazwa użytkownika nie może być pusta"),
        "verificationCodePageTextfieldUsernameHint":
            MessageLookupByLibrary.simpleMessage("Nazwa użytkownika"),
        "verificationCodePageTextfieldUsernameLabel":
            MessageLookupByLibrary.simpleMessage("Wprowadź nazwa użytkownika"),
        "verificationCodePageTitle":
            MessageLookupByLibrary.simpleMessage("Ostatni krok!")
      };
}
