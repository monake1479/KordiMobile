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

  static String m3(current) => "Dostarczone: ${current}";

  static String m4(maximum) => "Cel: ${maximum}";

  static String m5(type) => "Typ: ${type}";

  static String m6(collectionId) =>
      "Zbiórka o id ${collectionId} nie znaleziona.";

  static String m7(daysLeft) => "${daysLeft} dni pozostało do końca";

  static String m8(username) => "Cześć, ${username}!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "aboutPageAuthor": MessageLookupByLibrary.simpleMessage(
            "Autor aplikacji mobilnej: Daniel Obłąk."),
        "aboutPageCopyRight":
            MessageLookupByLibrary.simpleMessage("© 2024 Daniel Obłąk"),
        "aboutPageExplanationDescriptionPartOne":
            MessageLookupByLibrary.simpleMessage(
                "Aplikacja wykorzystuje część serwerową wykonaną przez inż. Grzegorza Kucharskiego w ramach własnego projektu inżynieryjnego. Kod jest udostępniony na platformie GitHub "),
        "aboutPageExplanationDescriptionPartTwo":
            MessageLookupByLibrary.simpleMessage(
                " System w ramach obsługi użytkownika pozwala zarejestrować się z dwustopniową weryfikacją, zalogować się oraz zmienić hasło. Część serwerowa oraz prezentacyjna nie przewiduje zmian awatarów użytkownika, dlatego w aplikacji można spotkać domyślne awatary użytkowników. Niezalogowani użytkownicy mają możliwość przeglądania wszystkich zbiórek, lecz nie mogą oni sami stworzyć zbiórki, edytować zbiórek, dodawać komentarzy ani przekazywać darów na rzecz danej zbiórki. Zalogowani użytkownicy mogą tworzyć zbiórki, dodawać komentarze, edytować własne zbiórki, przekazywać dary do zbiórek oraz pisać komentarze i usuwać własne."),
        "aboutPageGenesisDescription": MessageLookupByLibrary.simpleMessage(
            "Projekt jest wykonany na potrzebę pracy inżynierskiej. Założeniem projektu było wykonanie w pełni funkcjonalnej aplikacji mobilnej, opartej na frameworku Flutter na telefony z systemem Android oraz iOS."),
        "aboutPageGithub": MessageLookupByLibrary.simpleMessage("GitHub: "),
        "aboutPageIconsAndImages": MessageLookupByLibrary.simpleMessage(
            "Wykorzystane ikony oraz obrazki pochodzą z serwisu:"),
        "aboutPageLinkedin": MessageLookupByLibrary.simpleMessage("Linkedin: "),
        "aboutPageProjectDescription": MessageLookupByLibrary.simpleMessage(
            "Projekt zakłada wsparcie rzeczowe dla osób dotkniętych kryzysem. W serwisie Kordi będą mogli założyć zbiórkę w ramach jakiegoś celu który zostanie przez nich opisany. Jasno określają jakich przedmiotów potrzebują i w jakiej ilości. Administratorzy aplikacji nie weryfikują w żaden sposób, czy zadeklarowane dary dotarły do osób potrzebujących. Wszystko dzieje się w ramach użytkowników. Kordi jest jedynie narzędziem który umożliwia tworzenie takich zbiórek, ze względu na to, że w aplikacji nie ma mowy o żadnym finansowaniu pieniężnym nie można mówić tutaj o oszustwach."),
        "aboutPageTitle": MessageLookupByLibrary.simpleMessage("O nas"),
        "appName": MessageLookupByLibrary.simpleMessage("Kordi mobile"),
        "authTokenExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Twoja sesja wygasła. Zaloguj się ponownie."),
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
        "changePasswordPagePasswordIsDifferent":
            MessageLookupByLibrary.simpleMessage(
                "Nowe hasło nie może być takie samo jak poprzednie."),
        "changePasswordPagePasswordLabelTextField":
            MessageLookupByLibrary.simpleMessage("Nowe hasło"),
        "collectionAddressDialogAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Dodaj"),
        "collectionAddressDialogAddTitle":
            MessageLookupByLibrary.simpleMessage("Dodaj adres"),
        "collectionAddressDialogCancelButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zamknij"),
        "collectionAddressDialogCityFormLabelText":
            MessageLookupByLibrary.simpleMessage("Miasto*"),
        "collectionAddressDialogEditTitle":
            MessageLookupByLibrary.simpleMessage("Edytuj adres"),
        "collectionAddressDialogFieldsEmptyErrorLabel":
            MessageLookupByLibrary.simpleMessage(
                "Wypelnij wszystkie wymagane pola"),
        "collectionAddressDialogStreetFormLabelText":
            MessageLookupByLibrary.simpleMessage("Ulica*"),
        "collectionDetailsAddressesUrlException":
            MessageLookupByLibrary.simpleMessage(
                "Nie można otworzyć linku. Spróbuj ponownie później."),
        "collectionDetailsCommentDialogTitle":
            MessageLookupByLibrary.simpleMessage("Dodaj komentarz"),
        "collectionDetailsCommentListAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Dodaj komentarz"),
        "collectionDetailsCommentListEmptyState":
            MessageLookupByLibrary.simpleMessage(
                "Nikt jeszcze nie skomentował tej kolekcji."),
        "collectionDetailsCommentListFormErrorText":
            MessageLookupByLibrary.simpleMessage(
                "Komentarz nie może być pusty"),
        "collectionDetailsCommentListFormHintText":
            MessageLookupByLibrary.simpleMessage("Komentarz"),
        "collectionDetailsCommentListTitle":
            MessageLookupByLibrary.simpleMessage("Komentarze"),
        "collectionDetailsCommentListUnauthorizedState":
            MessageLookupByLibrary.simpleMessage(
                "Musisz być zalogowany, aby skomentować kolekcję."),
        "collectionDetailsDescriptionLabel":
            MessageLookupByLibrary.simpleMessage("Opis"),
        "collectionDetailsEndTimeLabel":
            MessageLookupByLibrary.simpleMessage("Zbiórka kończy się:"),
        "collectionDetailsItemCompletedLabel":
            MessageLookupByLibrary.simpleMessage("Zakończono!"),
        "collectionDetailsItemCurrentLabel": m0,
        "collectionDetailsItemDonateButtonLabel":
            MessageLookupByLibrary.simpleMessage("Przekaż"),
        "collectionDetailsItemDonateLabel":
            MessageLookupByLibrary.simpleMessage("Przekaż: "),
        "collectionDetailsItemListEmptyState":
            MessageLookupByLibrary.simpleMessage(
                "Użytkownik nie dodał jeszcze żadnych przedmiotów."),
        "collectionDetailsItemListTitle":
            MessageLookupByLibrary.simpleMessage("Lista przedmiotów"),
        "collectionDetailsItemListUnauthorizedState":
            MessageLookupByLibrary.simpleMessage(
                "Musisz być zalogowany, aby przekazać przedmioty."),
        "collectionDetailsItemMaximumLabel": m1,
        "collectionDetailsItemTypeLabel": m2,
        "collectionDetailsLocationsEmptyState":
            MessageLookupByLibrary.simpleMessage(
                "Użytkownik nie dodał jeszcze żadnych lokalizacji."),
        "collectionDetailsLocationsHint":
            MessageLookupByLibrary.simpleMessage("Miasto, ulica"),
        "collectionDetailsLocationsLabel": MessageLookupByLibrary.simpleMessage(
            "Lokalizacje do których możesz oddać przedmioty"),
        "collectionEditDescriptionFormLabelText":
            MessageLookupByLibrary.simpleMessage("Opis kolekcji*"),
        "collectionEditDescriptionLabel":
            MessageLookupByLibrary.simpleMessage("Opis"),
        "collectionEditEndTimeLabel":
            MessageLookupByLibrary.simpleMessage("Data zakończenia"),
        "collectionEditItemCurrentLabel": m3,
        "collectionEditItemListAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Dodaj przedmiot"),
        "collectionEditItemListEmptyState":
            MessageLookupByLibrary.simpleMessage(
                "Musisz dodać przedmiot potrzebny dla tej kolekcji."),
        "collectionEditItemListTitle":
            MessageLookupByLibrary.simpleMessage("Lista przedmiotów"),
        "collectionEditItemMaximumLabel": m4,
        "collectionEditItemTypeLabel": m5,
        "collectionEditLocationsTileAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Dodaj adres"),
        "collectionEditNameFormLabelText":
            MessageLookupByLibrary.simpleMessage("Nazwa kolekcji*"),
        "collectionEditNameLabel":
            MessageLookupByLibrary.simpleMessage("Nazwa"),
        "collectionEditSaveButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zapisz"),
        "collectionItemCategoryAnimalsName":
            MessageLookupByLibrary.simpleMessage("Zwierzęta"),
        "collectionItemCategoryChildrenName":
            MessageLookupByLibrary.simpleMessage("Dzieci"),
        "collectionItemCategoryClothesName":
            MessageLookupByLibrary.simpleMessage("Ubrania"),
        "collectionItemCategoryElectronicName":
            MessageLookupByLibrary.simpleMessage("Elektronika"),
        "collectionItemCategoryFoodName":
            MessageLookupByLibrary.simpleMessage("Jedzenie"),
        "collectionItemCategoryMedicinesName":
            MessageLookupByLibrary.simpleMessage("Leki"),
        "collectionItemCategoryOtherName":
            MessageLookupByLibrary.simpleMessage("Inne"),
        "collectionItemDialogAddButtonLabel":
            MessageLookupByLibrary.simpleMessage("Dodaj"),
        "collectionItemDialogAddTitle":
            MessageLookupByLibrary.simpleMessage("Dodaj przedmiot"),
        "collectionItemDialogCancelButtonLabel":
            MessageLookupByLibrary.simpleMessage("Zamknij"),
        "collectionItemDialogCategoryFormLabelText":
            MessageLookupByLibrary.simpleMessage("Kategoria*"),
        "collectionItemDialogCurrentFormLabelText":
            MessageLookupByLibrary.simpleMessage("Aktualna ilość"),
        "collectionItemDialogEditButtonLabel":
            MessageLookupByLibrary.simpleMessage("Edytuj"),
        "collectionItemDialogEditTitle":
            MessageLookupByLibrary.simpleMessage("Edytuj przedmiot"),
        "collectionItemDialogFieldsEmptyErrorLabel":
            MessageLookupByLibrary.simpleMessage(
                "Wypelnij wszystkie wymagane pola"),
        "collectionItemDialogMaximumFormLabelText":
            MessageLookupByLibrary.simpleMessage("Maksimum*"),
        "collectionItemDialogNameFormLabelText":
            MessageLookupByLibrary.simpleMessage("Nazwa*"),
        "collectionItemDialogTypeFormLabelText":
            MessageLookupByLibrary.simpleMessage("Typ*"),
        "collectionItemTypeAmountName":
            MessageLookupByLibrary.simpleMessage("Ilość"),
        "collectionItemTypeUnitSuffixKg":
            MessageLookupByLibrary.simpleMessage("kg"),
        "collectionItemTypeUnitSuffixPieces":
            MessageLookupByLibrary.simpleMessage("szt"),
        "collectionItemTypeUnlimitedName":
            MessageLookupByLibrary.simpleMessage("Bez limitu"),
        "collectionItemTypeWeightName":
            MessageLookupByLibrary.simpleMessage("Waga"),
        "collectionNotFoundError": m6,
        "collectionPageDaysLeft": m7,
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
        "collectionStatusArchivedName":
            MessageLookupByLibrary.simpleMessage("Archiwizowana"),
        "collectionStatusCompletedName":
            MessageLookupByLibrary.simpleMessage("Skończonca"),
        "collectionStatusInProgressName":
            MessageLookupByLibrary.simpleMessage("Trwa"),
        "createCollectionFirstStepDescriptionFormTextLabel":
            MessageLookupByLibrary.simpleMessage("Opis kolekcji*"),
        "createCollectionFirstStepEndDateFormTextLabel":
            MessageLookupByLibrary.simpleMessage("Data zakończenia kolekcji"),
        "createCollectionFirstStepInformation":
            MessageLookupByLibrary.simpleMessage(
                "Prosimy o podanie podstawowych informacji o Twojej kolekcji"),
        "createCollectionFirstStepNameFormTextLabel":
            MessageLookupByLibrary.simpleMessage("Nazwa kolekcji*"),
        "createCollectionFirstStepNextStepButtonLabel":
            MessageLookupByLibrary.simpleMessage("Następny krok"),
        "createCollectionFirstStepPhotoDeleteButtonLabel":
            MessageLookupByLibrary.simpleMessage("Usuń zdjęcie"),
        "createCollectionFirstStepPhotoHintLabel":
            MessageLookupByLibrary.simpleMessage(
                "Dotknij obrazek powyżej, aby dodać zdjęcie"),
        "createCollectionFirstStepPhotoLabel":
            MessageLookupByLibrary.simpleMessage("Zdjęcie kolekcji"),
        "createCollectionFirstStepSubtitle":
            MessageLookupByLibrary.simpleMessage("Krok 1 z 4"),
        "createCollectionFirstStepTitle": MessageLookupByLibrary.simpleMessage(
            "Podstawowe informacje o zbiórce"),
        "createCollectionFirstStepValidationHint":
            MessageLookupByLibrary.simpleMessage(
                "Proszę wypełnij wszystkie pola oznaczone znakiem *"),
        "createCollectionFourthStepButtonLabel":
            MessageLookupByLibrary.simpleMessage("Do kolekcji"),
        "createCollectionFourthStepInformation":
            MessageLookupByLibrary.simpleMessage(
                "Udało Ci się stworzyć kolekcję!"),
        "createCollectionFourthStepSecondInformation":
            MessageLookupByLibrary.simpleMessage(
                "Wciąż możesz edytować swoją kolekcję później"),
        "createCollectionFourthStepSubtitle":
            MessageLookupByLibrary.simpleMessage("Krok 4 z 4"),
        "createCollectionFourthStepTitle":
            MessageLookupByLibrary.simpleMessage("Gratulacje!"),
        "createCollectionSecondStepAddAddressButtonLabel":
            MessageLookupByLibrary.simpleMessage("Dodaj adres"),
        "createCollectionSecondStepAddressLabel":
            MessageLookupByLibrary.simpleMessage("Adres"),
        "createCollectionSecondStepCityLabel":
            MessageLookupByLibrary.simpleMessage("Miasto"),
        "createCollectionSecondStepInformation":
            MessageLookupByLibrary.simpleMessage(
                "Proszę podaj adresy, w których będą znajdować się skrzynki na przedmioty"),
        "createCollectionSecondStepNextStepButtonLabel":
            MessageLookupByLibrary.simpleMessage("Następny krok"),
        "createCollectionSecondStepSubtitle":
            MessageLookupByLibrary.simpleMessage("Krok 2 z 4"),
        "createCollectionSecondStepTitle":
            MessageLookupByLibrary.simpleMessage("Adresy kolekcji"),
        "createCollectionThirdStepAddItemButtonLabel":
            MessageLookupByLibrary.simpleMessage("Dodaj przedmiot"),
        "createCollectionThirdStepCategoryLabel":
            MessageLookupByLibrary.simpleMessage("Kategoria"),
        "createCollectionThirdStepInformation":
            MessageLookupByLibrary.simpleMessage(
                "Proszę podaj przedmioty, które będą zbierane w tej kolekcji"),
        "createCollectionThirdStepMaximumLabel":
            MessageLookupByLibrary.simpleMessage("Cel"),
        "createCollectionThirdStepNameLabel":
            MessageLookupByLibrary.simpleMessage("Nazwa"),
        "createCollectionThirdStepNextStepButtonLabel":
            MessageLookupByLibrary.simpleMessage("Następny krok"),
        "createCollectionThirdStepSubtitle":
            MessageLookupByLibrary.simpleMessage("Krok 3 z 4"),
        "createCollectionThirdStepTitle":
            MessageLookupByLibrary.simpleMessage("Przedmioty kolekcji"),
        "createCollectionThirdStepTypeLabel":
            MessageLookupByLibrary.simpleMessage("Typ"),
        "defaultExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Coś poszło nie tak, spróbuj ponownie później."),
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
        "drawerUserGreetings": m8,
        "errorPageDescription": MessageLookupByLibrary.simpleMessage(
            "Spróbuj ponownie później.\nZresetuj aplikacje i skontaktuj się z nami, aby zgłosić błąd."),
        "exceptionDialogButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "exceptionDialogTitle":
            MessageLookupByLibrary.simpleMessage("Kordi napotkał problem..."),
        "fieldRequiredErrorLabel":
            MessageLookupByLibrary.simpleMessage("Pole wymagane"),
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
        "imagePickerCanceledByUserException":
            MessageLookupByLibrary.simpleMessage(
                "Wybieranie zdjęcia anulowane przez użytkownika."),
        "imagePickerFileTooBigException":
            MessageLookupByLibrary.simpleMessage("Zdjęcie jest za duże."),
        "imagePickerInsufficientPermissionException":
            MessageLookupByLibrary.simpleMessage(
                "Niewystarczające uprawnienia, aby uzyskać zdjęcie."),
        "imagePickerUnexpectedException": MessageLookupByLibrary.simpleMessage(
            "Niespodziewany błąd podczas wybierania zdjęcia."),
        "imageTooBigDialogButtonLabel":
            MessageLookupByLibrary.simpleMessage("OK"),
        "imageTooBigDialogSubtitle":
            MessageLookupByLibrary.simpleMessage("Wybierz mniejsze zdjęcie."),
        "imageTooBigDialogTitle":
            MessageLookupByLibrary.simpleMessage("Zdjęcie jest za duże"),
        "kordiScaffoldTitle":
            MessageLookupByLibrary.simpleMessage("KORDI Mobile"),
        "navigationExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Coś poszło nie tak z nawigacją. Spróbuj ponownie później."),
        "pickImageBottomSheetCameraTile":
            MessageLookupByLibrary.simpleMessage("Zrób zdjęcie"),
        "pickImageBottomSheetDocumentsTile":
            MessageLookupByLibrary.simpleMessage("Zdjęcie z dokumentów"),
        "pickImageBottomSheetGalleryTile":
            MessageLookupByLibrary.simpleMessage("Zdjęcie z galerii"),
        "responseCollectionItemCurrentBiggerThanMaximum":
            MessageLookupByLibrary.simpleMessage(
                "Nie można przekazać więcej niż maksymalna ilość zbiórki."),
        "responseEmailAlreadyConfirmed": MessageLookupByLibrary.simpleMessage(
            "Podany adres email jest już zweryfikowany."),
        "responseEmailAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "Podany adres email jest już zajęty."),
        "responseEmailNotValid": MessageLookupByLibrary.simpleMessage(
            "Podany adres email jest nieprawidłowy."),
        "responsePasswordOldPasswordNotMatch":
            MessageLookupByLibrary.simpleMessage(
                "Podane stare hasło nie pasuje do aktualnego hasła."),
        "responsePasswordTooShort": MessageLookupByLibrary.simpleMessage(
            "Podane hasło jest za krótkie."),
        "responsePhoneAlreadyConfirmed": MessageLookupByLibrary.simpleMessage(
            "Podany numer telefonu jest już zweryfikowany."),
        "responsePhoneAlreadyExists": MessageLookupByLibrary.simpleMessage(
            "Podany numer telefonu jest już zajęty."),
        "responseUserAlreadyVerified": MessageLookupByLibrary.simpleMessage(
            "Użytkownik jest już zweryfikowany. Zaloguj się."),
        "responseUserBadCredentials": MessageLookupByLibrary.simpleMessage(
            "Podane dane użytkownika są nieprawidłowe."),
        "responseUserEmailExists": MessageLookupByLibrary.simpleMessage(
            "Podany adres email jest już zajęty."),
        "responseUserNotCollectionOwner": MessageLookupByLibrary.simpleMessage(
            "Użytkownik nie jest właścicielem zbiórki."),
        "responseUserNotFound":
            MessageLookupByLibrary.simpleMessage("Użytkownik nie znaleziony."),
        "responseUserNotFoundWithGivenToken":
            MessageLookupByLibrary.simpleMessage(
                "Użytkownik nie znaleziony z podanym tokenem."),
        "responseUserNotVerifiedEmail": MessageLookupByLibrary.simpleMessage(
            "Użytkownik z podanym adresem email nie jest zweryfikowany."),
        "responseUserNotVerifiedPhone": MessageLookupByLibrary.simpleMessage(
            "Użytkownik z podanym numerem telefonu nie jest zweryfikowany."),
        "responseUserPhoneExists": MessageLookupByLibrary.simpleMessage(
            "Podany numer telefonu jest już zajęty."),
        "responseUserUsernameExists": MessageLookupByLibrary.simpleMessage(
            "Podany login jest już zajęty."),
        "serverExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Coś poszło nie tak po stronie serwera. Spróbuj ponownie później."),
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
        "unauthorizedExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Nie jesteś zalogowany. Zaloguj się i spróbuj ponownie."),
        "userInformationExceptionMessage": MessageLookupByLibrary.simpleMessage(
            "Coś poszło nie tak z pobieraniem informacji o użytkowniku. Spróbuj ponownie później."),
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
            MessageLookupByLibrary.simpleMessage("Ostatni krok!"),
        "verificationTypeEmailName":
            MessageLookupByLibrary.simpleMessage("Email"),
        "verificationTypePhoneName":
            MessageLookupByLibrary.simpleMessage("Telefon")
      };
}
