import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('es')];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Gold Roundtables'**
  String get appTitle;

  /// No description provided for @actionContinue.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get actionContinue;

  /// No description provided for @actionCancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get actionCancel;

  /// No description provided for @actionConfirm.
  ///
  /// In es, this message translates to:
  /// **'Confirmar'**
  String get actionConfirm;

  /// No description provided for @actionAccept.
  ///
  /// In es, this message translates to:
  /// **'Aceptar'**
  String get actionAccept;

  /// No description provided for @actionSave.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get actionSave;

  /// No description provided for @actionRetry.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get actionRetry;

  /// No description provided for @actionClose.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get actionClose;

  /// No description provided for @actionBack.
  ///
  /// In es, this message translates to:
  /// **'Volver'**
  String get actionBack;

  /// No description provided for @actionNext.
  ///
  /// In es, this message translates to:
  /// **'Siguiente'**
  String get actionNext;

  /// No description provided for @actionDone.
  ///
  /// In es, this message translates to:
  /// **'Listo'**
  String get actionDone;

  /// No description provided for @actionEdit.
  ///
  /// In es, this message translates to:
  /// **'Editar'**
  String get actionEdit;

  /// No description provided for @actionDelete.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get actionDelete;

  /// No description provided for @actionShare.
  ///
  /// In es, this message translates to:
  /// **'Compartir'**
  String get actionShare;

  /// No description provided for @actionSearch.
  ///
  /// In es, this message translates to:
  /// **'Buscar'**
  String get actionSearch;

  /// No description provided for @actionGoHome.
  ///
  /// In es, this message translates to:
  /// **'Ir al inicio'**
  String get actionGoHome;

  /// No description provided for @tooltipBack.
  ///
  /// In es, this message translates to:
  /// **'Volver'**
  String get tooltipBack;

  /// No description provided for @tooltipClose.
  ///
  /// In es, this message translates to:
  /// **'Cerrar'**
  String get tooltipClose;

  /// No description provided for @tooltipMenu.
  ///
  /// In es, this message translates to:
  /// **'Menú'**
  String get tooltipMenu;

  /// No description provided for @tooltipIncrease.
  ///
  /// In es, this message translates to:
  /// **'Aumentar'**
  String get tooltipIncrease;

  /// No description provided for @tooltipDecrease.
  ///
  /// In es, this message translates to:
  /// **'Disminuir'**
  String get tooltipDecrease;

  /// No description provided for @tooltipShowPassword.
  ///
  /// In es, this message translates to:
  /// **'Mostrar'**
  String get tooltipShowPassword;

  /// No description provided for @loading.
  ///
  /// In es, this message translates to:
  /// **'Cargando…'**
  String get loading;

  /// No description provided for @confirmDialogDefaultTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Quieres continuar?'**
  String get confirmDialogDefaultTitle;

  /// No description provided for @toastSaved.
  ///
  /// In es, this message translates to:
  /// **'Guardado'**
  String get toastSaved;

  /// No description provided for @errorGeneric.
  ///
  /// In es, this message translates to:
  /// **'Algo salió mal. Inténtalo de nuevo.'**
  String get errorGeneric;

  /// No description provided for @errorNetwork.
  ///
  /// In es, this message translates to:
  /// **'No hay conexión con el servidor. Revisa tu internet.'**
  String get errorNetwork;

  /// No description provided for @errorTimeout.
  ///
  /// In es, this message translates to:
  /// **'El servidor tardó demasiado en responder. Inténtalo de nuevo.'**
  String get errorTimeout;

  /// No description provided for @errorUnauthorized.
  ///
  /// In es, this message translates to:
  /// **'Tu sesión terminó. Vuelve a ingresar.'**
  String get errorUnauthorized;

  /// No description provided for @errorForbidden.
  ///
  /// In es, this message translates to:
  /// **'No tienes permiso para hacer esto.'**
  String get errorForbidden;

  /// No description provided for @errorNotFound.
  ///
  /// In es, this message translates to:
  /// **'No encontramos lo que buscas.'**
  String get errorNotFound;

  /// No description provided for @errorConflict.
  ///
  /// In es, this message translates to:
  /// **'Estos datos cambiaron mientras tanto. Actualiza e inténtalo otra vez.'**
  String get errorConflict;

  /// No description provided for @errorValidation.
  ///
  /// In es, this message translates to:
  /// **'Revisa los datos e inténtalo otra vez.'**
  String get errorValidation;

  /// No description provided for @errorServer.
  ///
  /// In es, this message translates to:
  /// **'El servidor tuvo un problema. Inténtalo más tarde.'**
  String get errorServer;

  /// No description provided for @errorStateTitle.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar esto'**
  String get errorStateTitle;

  /// No description provided for @emptyStateTitle.
  ///
  /// In es, this message translates to:
  /// **'Todavía no hay nada aquí'**
  String get emptyStateTitle;

  /// No description provided for @notFoundTitle.
  ///
  /// In es, this message translates to:
  /// **'Esta página no existe'**
  String get notFoundTitle;

  /// No description provided for @notFoundMessage.
  ///
  /// In es, this message translates to:
  /// **'Puede que el enlace esté incompleto o que la página se haya movido.'**
  String get notFoundMessage;

  /// No description provided for @connectivityOnline.
  ///
  /// In es, this message translates to:
  /// **'En línea'**
  String get connectivityOnline;

  /// No description provided for @connectivityOffline.
  ///
  /// In es, this message translates to:
  /// **'Sin conexión'**
  String get connectivityOffline;

  /// No description provided for @offlineBanner.
  ///
  /// In es, this message translates to:
  /// **'Sin conexión · {detail}'**
  String offlineBanner(String detail);

  /// No description provided for @offlineDetailOnlineOnly.
  ///
  /// In es, this message translates to:
  /// **'esta sección necesita internet'**
  String get offlineDetailOnlineOnly;

  /// No description provided for @offlineDetailSavedLocally.
  ///
  /// In es, this message translates to:
  /// **'lo que respondas se guarda en este teléfono'**
  String get offlineDetailSavedLocally;

  /// No description provided for @syncPending.
  ///
  /// In es, this message translates to:
  /// **'Pendiente'**
  String get syncPending;

  /// No description provided for @syncSyncing.
  ///
  /// In es, this message translates to:
  /// **'Sincronizando'**
  String get syncSyncing;

  /// No description provided for @syncSynced.
  ///
  /// In es, this message translates to:
  /// **'Sincronizado'**
  String get syncSynced;

  /// No description provided for @syncSyncedLate.
  ///
  /// In es, this message translates to:
  /// **'Sincronizado tarde'**
  String get syncSyncedLate;

  /// No description provided for @syncUnavailable.
  ///
  /// In es, this message translates to:
  /// **'Sincronización no disponible'**
  String get syncUnavailable;

  /// No description provided for @syncNever.
  ///
  /// In es, this message translates to:
  /// **'Aún no se ha sincronizado'**
  String get syncNever;

  /// No description provided for @syncPendingCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{Nada pendiente} =1{1 cambio pendiente} other{{count} cambios pendientes}}'**
  String syncPendingCount(int count);

  /// No description provided for @syncLastSynced.
  ///
  /// In es, this message translates to:
  /// **'Última sincronización: {time}'**
  String syncLastSynced(String time);

  /// No description provided for @syncStaleWarning.
  ///
  /// In es, this message translates to:
  /// **'Hay respuestas sin sincronizar desde hace más de 24 horas. Conéctate a internet.'**
  String get syncStaleWarning;

  /// No description provided for @roleAdministrator.
  ///
  /// In es, this message translates to:
  /// **'Administrador'**
  String get roleAdministrator;

  /// No description provided for @roleCoordinator.
  ///
  /// In es, this message translates to:
  /// **'Coordinador'**
  String get roleCoordinator;

  /// No description provided for @roleFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Facilitador'**
  String get roleFacilitator;

  /// No description provided for @roleMember.
  ///
  /// In es, this message translates to:
  /// **'Miembro'**
  String get roleMember;

  /// No description provided for @stageOpen.
  ///
  /// In es, this message translates to:
  /// **'Abrir'**
  String get stageOpen;

  /// No description provided for @stageAttendance.
  ///
  /// In es, this message translates to:
  /// **'Lista'**
  String get stageAttendance;

  /// No description provided for @stageFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento'**
  String get stageFollowUp;

  /// No description provided for @stageCurrentValue.
  ///
  /// In es, this message translates to:
  /// **'Valor'**
  String get stageCurrentValue;

  /// No description provided for @stageCommitment.
  ///
  /// In es, this message translates to:
  /// **'Compromiso'**
  String get stageCommitment;

  /// No description provided for @stageClosing.
  ///
  /// In es, this message translates to:
  /// **'Cierre'**
  String get stageClosing;

  /// No description provided for @attendancePresent.
  ///
  /// In es, this message translates to:
  /// **'Presente'**
  String get attendancePresent;

  /// No description provided for @attendanceLate.
  ///
  /// In es, this message translates to:
  /// **'Tarde'**
  String get attendanceLate;

  /// No description provided for @attendanceExcused.
  ///
  /// In es, this message translates to:
  /// **'Justificado'**
  String get attendanceExcused;

  /// No description provided for @attendanceAbsent.
  ///
  /// In es, this message translates to:
  /// **'Ausente'**
  String get attendanceAbsent;

  /// No description provided for @assessmentFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento'**
  String get assessmentFollowUp;

  /// No description provided for @assessmentCurrentValue.
  ///
  /// In es, this message translates to:
  /// **'Valor actual'**
  String get assessmentCurrentValue;

  /// No description provided for @healthOnTrack.
  ///
  /// In es, this message translates to:
  /// **'Al día'**
  String get healthOnTrack;

  /// No description provided for @healthAtRisk.
  ///
  /// In es, this message translates to:
  /// **'En riesgo'**
  String get healthAtRisk;

  /// No description provided for @healthOffTrack.
  ///
  /// In es, this message translates to:
  /// **'Retrasada'**
  String get healthOffTrack;

  /// No description provided for @healthUnknown.
  ///
  /// In es, this message translates to:
  /// **'Sin datos'**
  String get healthUnknown;

  /// No description provided for @scoreLabel.
  ///
  /// In es, this message translates to:
  /// **'Puntaje'**
  String get scoreLabel;

  /// No description provided for @scoreHint.
  ///
  /// In es, this message translates to:
  /// **'Elige un número del 1 al 10. El 5 no se permite.'**
  String get scoreHint;

  /// No description provided for @scoreLow.
  ///
  /// In es, this message translates to:
  /// **'Bajo'**
  String get scoreLow;

  /// No description provided for @scoreHigh.
  ///
  /// In es, this message translates to:
  /// **'Alto'**
  String get scoreHigh;

  /// No description provided for @scoreLockedSemantics.
  ///
  /// In es, this message translates to:
  /// **'5, no disponible'**
  String get scoreLockedSemantics;

  /// No description provided for @scoreFiveExplanation.
  ///
  /// In es, this message translates to:
  /// **'El 5 no se permite: elige un poco más arriba o un poco más abajo.'**
  String get scoreFiveExplanation;

  /// No description provided for @scorePicked.
  ///
  /// In es, this message translates to:
  /// **'Elegiste {score}'**
  String scorePicked(int score);

  /// No description provided for @scoreSemantics.
  ///
  /// In es, this message translates to:
  /// **'Puntaje {score}'**
  String scoreSemantics(int score);

  /// No description provided for @seatsCount.
  ///
  /// In es, this message translates to:
  /// **'{count}/{max} lugares'**
  String seatsCount(int count, int max);

  /// No description provided for @seatsOverCapacity.
  ///
  /// In es, this message translates to:
  /// **'La mesa tiene más de {max} lugares'**
  String seatsOverCapacity(int max);

  /// No description provided for @contextChipLabel.
  ///
  /// In es, this message translates to:
  /// **'Estás como'**
  String get contextChipLabel;

  /// No description provided for @counterSemantics.
  ///
  /// In es, this message translates to:
  /// **'{label}: {value}'**
  String counterSemantics(String label, int value);

  /// No description provided for @dropdownHint.
  ///
  /// In es, this message translates to:
  /// **'Elige una opción'**
  String get dropdownHint;

  /// No description provided for @validationRequired.
  ///
  /// In es, this message translates to:
  /// **'Este campo es obligatorio.'**
  String get validationRequired;

  /// No description provided for @validationEmail.
  ///
  /// In es, this message translates to:
  /// **'Escribe un correo válido, por ejemplo nombre@correo.com.'**
  String get validationEmail;

  /// No description provided for @validationPhone.
  ///
  /// In es, this message translates to:
  /// **'Escribe el número con el código de país, por ejemplo +52 55 1234 5678.'**
  String get validationPhone;

  /// No description provided for @validationPersonName.
  ///
  /// In es, this message translates to:
  /// **'Escribe un nombre válido, solo con letras.'**
  String get validationPersonName;

  /// No description provided for @validationScore.
  ///
  /// In es, this message translates to:
  /// **'Elige un número del 1 al 10.'**
  String get validationScore;

  /// No description provided for @validationScoreFive.
  ///
  /// In es, this message translates to:
  /// **'El 5 no se permite.'**
  String get validationScoreFive;

  /// No description provided for @validationTooShort.
  ///
  /// In es, this message translates to:
  /// **'Escribe al menos {min} caracteres.'**
  String validationTooShort(int min);

  /// No description provided for @validationInviteCode.
  ///
  /// In es, this message translates to:
  /// **'El código tiene 6 letras o números.'**
  String get validationInviteCode;

  /// No description provided for @navHome.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get navHome;

  /// No description provided for @homeTitle.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get homeTitle;

  /// No description provided for @homeOpenGallery.
  ///
  /// In es, this message translates to:
  /// **'Ver galería de componentes'**
  String get homeOpenGallery;

  /// No description provided for @galleryTitle.
  ///
  /// In es, this message translates to:
  /// **'Galería de componentes'**
  String get galleryTitle;

  /// No description provided for @galleryThemeLight.
  ///
  /// In es, this message translates to:
  /// **'Claro'**
  String get galleryThemeLight;

  /// No description provided for @galleryThemeDark.
  ///
  /// In es, this message translates to:
  /// **'Oscuro'**
  String get galleryThemeDark;

  /// No description provided for @gallerySectionButtons.
  ///
  /// In es, this message translates to:
  /// **'Botones'**
  String get gallerySectionButtons;

  /// No description provided for @gallerySectionStatus.
  ///
  /// In es, this message translates to:
  /// **'Estados'**
  String get gallerySectionStatus;

  /// No description provided for @gallerySectionAvatars.
  ///
  /// In es, this message translates to:
  /// **'Avatares y roles'**
  String get gallerySectionAvatars;

  /// No description provided for @gallerySectionFeedback.
  ///
  /// In es, this message translates to:
  /// **'Avisos'**
  String get gallerySectionFeedback;

  /// No description provided for @gallerySectionScore.
  ///
  /// In es, this message translates to:
  /// **'Puntaje'**
  String get gallerySectionScore;

  /// No description provided for @gallerySectionForms.
  ///
  /// In es, this message translates to:
  /// **'Formularios'**
  String get gallerySectionForms;

  /// No description provided for @gallerySectionStates.
  ///
  /// In es, this message translates to:
  /// **'Carga, vacío y error'**
  String get gallerySectionStates;

  /// No description provided for @gallerySectionTable.
  ///
  /// In es, this message translates to:
  /// **'Tabla de datos'**
  String get gallerySectionTable;

  /// No description provided for @gallerySectionDialogs.
  ///
  /// In es, this message translates to:
  /// **'Diálogos'**
  String get gallerySectionDialogs;

  /// No description provided for @galleryPrimary.
  ///
  /// In es, this message translates to:
  /// **'Principal'**
  String get galleryPrimary;

  /// No description provided for @gallerySecondary.
  ///
  /// In es, this message translates to:
  /// **'Secundario'**
  String get gallerySecondary;

  /// No description provided for @galleryDanger.
  ///
  /// In es, this message translates to:
  /// **'Peligro'**
  String get galleryDanger;

  /// No description provided for @galleryOfflineAction.
  ///
  /// In es, this message translates to:
  /// **'Sin internet'**
  String get galleryOfflineAction;

  /// No description provided for @galleryShowToast.
  ///
  /// In es, this message translates to:
  /// **'Mostrar aviso'**
  String get galleryShowToast;

  /// No description provided for @galleryShowDialog.
  ///
  /// In es, this message translates to:
  /// **'Abrir diálogo'**
  String get galleryShowDialog;

  /// No description provided for @galleryShowSheet.
  ///
  /// In es, this message translates to:
  /// **'Abrir hoja inferior'**
  String get galleryShowSheet;

  /// No description provided for @galleryFieldName.
  ///
  /// In es, this message translates to:
  /// **'Nombre completo'**
  String get galleryFieldName;

  /// No description provided for @galleryFieldEmail.
  ///
  /// In es, this message translates to:
  /// **'Correo'**
  String get galleryFieldEmail;

  /// No description provided for @galleryFieldPhone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get galleryFieldPhone;

  /// No description provided for @galleryFieldInvite.
  ///
  /// In es, this message translates to:
  /// **'Código de invitación'**
  String get galleryFieldInvite;

  /// No description provided for @galleryFieldCountry.
  ///
  /// In es, this message translates to:
  /// **'País'**
  String get galleryFieldCountry;

  /// No description provided for @galleryFieldConsent.
  ///
  /// In es, this message translates to:
  /// **'Acepto recibir recordatorios'**
  String get galleryFieldConsent;

  /// No description provided for @galleryFieldSeats.
  ///
  /// In es, this message translates to:
  /// **'Lugares'**
  String get galleryFieldSeats;

  /// No description provided for @galleryColumnName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get galleryColumnName;

  /// No description provided for @galleryColumnRole.
  ///
  /// In es, this message translates to:
  /// **'Rol'**
  String get galleryColumnRole;

  /// No description provided for @galleryColumnStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado'**
  String get galleryColumnStatus;

  /// No description provided for @galleryInfoMessage.
  ///
  /// In es, this message translates to:
  /// **'La mesa está en: Seguimiento'**
  String get galleryInfoMessage;

  /// No description provided for @galleryWarningMessage.
  ///
  /// In es, this message translates to:
  /// **'Rodrigo lleva 31 horas sin sincronizar.'**
  String get galleryWarningMessage;

  /// No description provided for @galleryErrorMessage.
  ///
  /// In es, this message translates to:
  /// **'No se pudo guardar. Tus respuestas siguen en este teléfono.'**
  String get galleryErrorMessage;

  /// No description provided for @navSettings.
  ///
  /// In es, this message translates to:
  /// **'Ajustes'**
  String get navSettings;

  /// No description provided for @contextChipPlatform.
  ///
  /// In es, this message translates to:
  /// **'Plataforma'**
  String get contextChipPlatform;

  /// No description provided for @homeNoContextTitle.
  ///
  /// In es, this message translates to:
  /// **'Elige cómo quieres entrar'**
  String get homeNoContextTitle;

  /// No description provided for @homeNoContextMessage.
  ///
  /// In es, this message translates to:
  /// **'Todavía no tienes una mesa u organización activa. Cuando entres con una invitación, aparecerá aquí.'**
  String get homeNoContextMessage;

  /// No description provided for @homeNoSessionTitle.
  ///
  /// In es, this message translates to:
  /// **'No hay una sesión programada'**
  String get homeNoSessionTitle;

  /// No description provided for @homeNoSessionMessage.
  ///
  /// In es, this message translates to:
  /// **'Cuando tu mesa tenga una próxima sesión, la verás aquí.'**
  String get homeNoSessionMessage;

  /// No description provided for @homeKickerNextSession.
  ///
  /// In es, this message translates to:
  /// **'Próxima sesión'**
  String get homeKickerNextSession;

  /// No description provided for @homeSessionOpenNow.
  ///
  /// In es, this message translates to:
  /// **'En curso'**
  String get homeSessionOpenNow;

  /// No description provided for @homeSessionDay.
  ///
  /// In es, this message translates to:
  /// **'{date}'**
  String homeSessionDay(DateTime date);

  /// No description provided for @homeSessionWhen.
  ///
  /// In es, this message translates to:
  /// **'{day} · {time}'**
  String homeSessionWhen(String day, String time);

  /// No description provided for @homeValueLine.
  ///
  /// In es, this message translates to:
  /// **'Valor {number} · {name}'**
  String homeValueLine(int number, String name);

  /// No description provided for @homeFollowUpLine.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento de: {name}'**
  String homeFollowUpLine(String name);

  /// No description provided for @homeOpenSession.
  ///
  /// In es, this message translates to:
  /// **'Abrir sesión'**
  String get homeOpenSession;

  /// No description provided for @homeContinueSession.
  ///
  /// In es, this message translates to:
  /// **'Continuar sesión'**
  String get homeContinueSession;

  /// No description provided for @homeEnterSession.
  ///
  /// In es, this message translates to:
  /// **'Entrar a la sesión'**
  String get homeEnterSession;

  /// No description provided for @homeHealthInactive.
  ///
  /// In es, this message translates to:
  /// **'Inactiva'**
  String get homeHealthInactive;

  /// No description provided for @homeHealthCompleted.
  ///
  /// In es, this message translates to:
  /// **'Completada'**
  String get homeHealthCompleted;

  /// No description provided for @homeLastCommitmentKicker.
  ///
  /// In es, this message translates to:
  /// **'Tu último compromiso'**
  String get homeLastCommitmentKicker;

  /// No description provided for @homeNoCommitment.
  ///
  /// In es, this message translates to:
  /// **'Aún no tienes un compromiso. Aparecerá aquí después de tu primera sesión.'**
  String get homeNoCommitment;

  /// No description provided for @homeCommitmentKept.
  ///
  /// In es, this message translates to:
  /// **'Lo cumpliste'**
  String get homeCommitmentKept;

  /// No description provided for @homeCommitmentPartial.
  ///
  /// In es, this message translates to:
  /// **'Cumplido a medias'**
  String get homeCommitmentPartial;

  /// No description provided for @homeCommitmentNotKept.
  ///
  /// In es, this message translates to:
  /// **'No se cumplió'**
  String get homeCommitmentNotKept;

  /// No description provided for @homeCommitmentToReview.
  ///
  /// In es, this message translates to:
  /// **'Se revisa en la próxima sesión'**
  String get homeCommitmentToReview;

  /// No description provided for @homeProgressKicker.
  ///
  /// In es, this message translates to:
  /// **'Tu camino'**
  String get homeProgressKicker;

  /// No description provided for @homeProgressEmpty.
  ///
  /// In es, this message translates to:
  /// **'Aún no hay valores completados.'**
  String get homeProgressEmpty;

  /// No description provided for @homeProgressValues.
  ///
  /// In es, this message translates to:
  /// **'{done} de {total} valores'**
  String homeProgressValues(int done, int total);

  /// No description provided for @homeModuleLabel.
  ///
  /// In es, this message translates to:
  /// **'Módulo {number} · {name}'**
  String homeModuleLabel(int number, String name);

  /// No description provided for @homeKpiKicker.
  ///
  /// In es, this message translates to:
  /// **'Resumen de tus mesas'**
  String get homeKpiKicker;

  /// No description provided for @homeKpiEmpty.
  ///
  /// In es, this message translates to:
  /// **'Todavía no hay datos para mostrar.'**
  String get homeKpiEmpty;

  /// No description provided for @homeKpiValues.
  ///
  /// In es, this message translates to:
  /// **'Valores completados'**
  String get homeKpiValues;

  /// No description provided for @homeKpiImprovement.
  ///
  /// In es, this message translates to:
  /// **'Mejora estimada'**
  String get homeKpiImprovement;

  /// No description provided for @homeKpiAttendance.
  ///
  /// In es, this message translates to:
  /// **'Asistencia'**
  String get homeKpiAttendance;

  /// No description provided for @homeKpiTablesActive.
  ///
  /// In es, this message translates to:
  /// **'Mesas activas'**
  String get homeKpiTablesActive;

  /// No description provided for @homeKpiTablesDelayed.
  ///
  /// In es, this message translates to:
  /// **'Mesas retrasadas'**
  String get homeKpiTablesDelayed;

  /// No description provided for @homeKpiViewAll.
  ///
  /// In es, this message translates to:
  /// **'Ver el tablero completo'**
  String get homeKpiViewAll;

  /// No description provided for @homeInvitesPending.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{No hay invitaciones pendientes} =1{1 invitación pendiente} other{{count} invitaciones pendientes}}'**
  String homeInvitesPending(int count);

  /// No description provided for @notificationsSessionReminder.
  ///
  /// In es, this message translates to:
  /// **'Tu sesión de la mesa es pronto.'**
  String get notificationsSessionReminder;

  /// No description provided for @notificationsCommitmentNudge.
  ///
  /// In es, this message translates to:
  /// **'Recuerda tu compromiso de esta semana.'**
  String get notificationsCommitmentNudge;

  /// No description provided for @notificationsStageOpened.
  ///
  /// In es, this message translates to:
  /// **'El facilitador abrió una nueva etapa.'**
  String get notificationsStageOpened;

  /// No description provided for @notificationsGeneric.
  ///
  /// In es, this message translates to:
  /// **'Tienes un aviso nuevo.'**
  String get notificationsGeneric;

  /// No description provided for @notificationsUnsyncedTitle.
  ///
  /// In es, this message translates to:
  /// **'Tienes respuestas sin sincronizar'**
  String get notificationsUnsyncedTitle;

  /// No description provided for @notificationsUnsyncedDetail.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 cambio lleva más de 24 horas sin enviarse} other{{count} cambios llevan más de 24 horas sin enviarse}}. Conéctate a internet para enviarlos.'**
  String notificationsUnsyncedDetail(int count);

  /// No description provided for @notificationsTitle.
  ///
  /// In es, this message translates to:
  /// **'Notificaciones'**
  String get notificationsTitle;

  /// No description provided for @notificationsIntro.
  ///
  /// In es, this message translates to:
  /// **'Elige qué avisos quieres recibir en este dispositivo.'**
  String get notificationsIntro;

  /// No description provided for @notificationsPushTitle.
  ///
  /// In es, this message translates to:
  /// **'Avisos de la mesa'**
  String get notificationsPushTitle;

  /// No description provided for @notificationsPushSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Recordatorio de la sesión, recordatorio de tu compromiso y cuando se abre una etapa.'**
  String get notificationsPushSubtitle;

  /// No description provided for @notificationsForegroundTitle.
  ///
  /// In es, this message translates to:
  /// **'Mostrar avisos dentro de la app'**
  String get notificationsForegroundTitle;

  /// No description provided for @notificationsForegroundSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Un mensaje breve cuando llega un aviso mientras usas la app.'**
  String get notificationsForegroundSubtitle;

  /// No description provided for @notificationsUnsyncedSwitchTitle.
  ///
  /// In es, this message translates to:
  /// **'Alerta de datos sin sincronizar'**
  String get notificationsUnsyncedSwitchTitle;

  /// No description provided for @notificationsUnsyncedSwitchSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Te avisamos si tus respuestas llevan más de 24 horas sin enviarse.'**
  String get notificationsUnsyncedSwitchSubtitle;

  /// No description provided for @notificationsUnsupportedTitle.
  ///
  /// In es, this message translates to:
  /// **'Los avisos no están disponibles aquí'**
  String get notificationsUnsupportedTitle;

  /// No description provided for @notificationsUnsupportedDetail.
  ///
  /// In es, this message translates to:
  /// **'Este navegador o esta versión de la app no puede recibir avisos. Las alertas dentro de la app siguen funcionando.'**
  String get notificationsUnsupportedDetail;

  /// No description provided for @notificationsDeniedTitle.
  ///
  /// In es, this message translates to:
  /// **'Los avisos están bloqueados'**
  String get notificationsDeniedTitle;

  /// No description provided for @notificationsDeniedDetail.
  ///
  /// In es, this message translates to:
  /// **'Actívalos en los ajustes de tu dispositivo o navegador para recibir recordatorios.'**
  String get notificationsDeniedDetail;

  /// No description provided for @notificationsAskTitle.
  ///
  /// In es, this message translates to:
  /// **'Activa los avisos'**
  String get notificationsAskTitle;

  /// No description provided for @notificationsAskDetail.
  ///
  /// In es, this message translates to:
  /// **'Así te recordamos la sesión y tu compromiso a tiempo.'**
  String get notificationsAskDetail;

  /// No description provided for @notificationsAllow.
  ///
  /// In es, this message translates to:
  /// **'Permitir avisos'**
  String get notificationsAllow;

  /// No description provided for @settingsTitle.
  ///
  /// In es, this message translates to:
  /// **'Ajustes'**
  String get settingsTitle;

  /// No description provided for @settingsOfflineDetail.
  ///
  /// In es, this message translates to:
  /// **'tu perfil se puede editar con internet'**
  String get settingsOfflineDetail;

  /// No description provided for @settingsProfileUnavailable.
  ///
  /// In es, this message translates to:
  /// **'Perfil no disponible'**
  String get settingsProfileUnavailable;

  /// No description provided for @settingsEditProfile.
  ///
  /// In es, this message translates to:
  /// **'Editar mis datos'**
  String get settingsEditProfile;

  /// No description provided for @settingsNotifications.
  ///
  /// In es, this message translates to:
  /// **'Notificaciones'**
  String get settingsNotifications;

  /// No description provided for @settingsSyncKicker.
  ///
  /// In es, this message translates to:
  /// **'Sincronización'**
  String get settingsSyncKicker;

  /// No description provided for @settingsAboutKicker.
  ///
  /// In es, this message translates to:
  /// **'Acerca de'**
  String get settingsAboutKicker;

  /// No description provided for @settingsVersion.
  ///
  /// In es, this message translates to:
  /// **'Versión {version} ({build})'**
  String settingsVersion(String version, String build);

  /// No description provided for @settingsSignOut.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get settingsSignOut;

  /// No description provided for @settingsSignOutFailed.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cerrar tu sesión. Inténtalo de nuevo.'**
  String get settingsSignOutFailed;

  /// No description provided for @settingsSignOutPendingTitle.
  ///
  /// In es, this message translates to:
  /// **'Tienes cambios sin enviar'**
  String get settingsSignOutPendingTitle;

  /// No description provided for @settingsSignOutPendingDetail.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 cambio se enviará} other{{count} cambios se enviarán}} cuando vuelvas a entrar con tu cuenta y tengas internet.'**
  String settingsSignOutPendingDetail(int count);

  /// No description provided for @settingsSignOutConfirmTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Cerrar sesión?'**
  String get settingsSignOutConfirmTitle;

  /// No description provided for @settingsSignOutConfirmMessage.
  ///
  /// In es, this message translates to:
  /// **'Tendrás que volver a entrar para ver tus mesas.'**
  String get settingsSignOutConfirmMessage;

  /// No description provided for @settingsSignOutConfirmPending.
  ///
  /// In es, this message translates to:
  /// **'Tus cambios sin enviar se guardan en este dispositivo y se enviarán cuando vuelvas a entrar con la misma cuenta.'**
  String get settingsSignOutConfirmPending;

  /// No description provided for @profileEditTitle.
  ///
  /// In es, this message translates to:
  /// **'Mis datos'**
  String get profileEditTitle;

  /// No description provided for @profileEditIntro.
  ///
  /// In es, this message translates to:
  /// **'Estos datos los ve tu facilitador o coordinador. No los verificamos.'**
  String get profileEditIntro;

  /// No description provided for @profileEditFirstName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get profileEditFirstName;

  /// No description provided for @profileEditLastName.
  ///
  /// In es, this message translates to:
  /// **'Apellido'**
  String get profileEditLastName;

  /// No description provided for @profileEditPosition.
  ///
  /// In es, this message translates to:
  /// **'Cargo (opcional)'**
  String get profileEditPosition;

  /// No description provided for @profileEditPhone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono (opcional)'**
  String get profileEditPhone;

  /// No description provided for @profileEditPhoneHelper.
  ///
  /// In es, this message translates to:
  /// **'Con el código de país, por ejemplo +52 55 1234 5678'**
  String get profileEditPhoneHelper;

  /// No description provided for @profileEditEmailNote.
  ///
  /// In es, this message translates to:
  /// **'Correo: {email}. Para cambiarlo, pídeselo a tu coordinador.'**
  String profileEditEmailNote(String email);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
