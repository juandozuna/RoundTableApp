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

  /// No description provided for @homeWelcome.
  ///
  /// In es, this message translates to:
  /// **'Te damos la bienvenida a Gold Roundtables'**
  String get homeWelcome;

  /// No description provided for @homeFoundationReady.
  ///
  /// In es, this message translates to:
  /// **'La base de la aplicación está lista. Aquí aparecerán tus mesas y sesiones.'**
  String get homeFoundationReady;

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

  /// No description provided for @navAccount.
  ///
  /// In es, this message translates to:
  /// **'Cuenta'**
  String get navAccount;

  /// No description provided for @authAppTagline.
  ///
  /// In es, this message translates to:
  /// **'Mesas de valores'**
  String get authAppTagline;

  /// No description provided for @authBrandHeadline.
  ///
  /// In es, this message translates to:
  /// **'Una sola puerta para todas tus mesas.'**
  String get authBrandHeadline;

  /// No description provided for @authBrandBody.
  ///
  /// In es, this message translates to:
  /// **'Entra con Google, Apple o Facebook. Si te invitaron, usa tu código o escanea el QR y confirma a qué te unes.'**
  String get authBrandBody;

  /// No description provided for @authBrandFooter.
  ///
  /// In es, this message translates to:
  /// **'Iglesia Casa del Altísimo · Organizaciones y mesas'**
  String get authBrandFooter;

  /// No description provided for @authGateTitle.
  ///
  /// In es, this message translates to:
  /// **'Entra a tu mesa'**
  String get authGateTitle;

  /// No description provided for @authGateSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Usa la cuenta que ya tienes. Sin contraseñas nuevas.'**
  String get authGateSubtitle;

  /// No description provided for @authGateFine.
  ///
  /// In es, this message translates to:
  /// **'Solo Google, Apple o Facebook. No se usa SMS ni teléfono para entrar.'**
  String get authGateFine;

  /// No description provided for @authProviderGoogle.
  ///
  /// In es, this message translates to:
  /// **'Google'**
  String get authProviderGoogle;

  /// No description provided for @authProviderApple.
  ///
  /// In es, this message translates to:
  /// **'Apple'**
  String get authProviderApple;

  /// No description provided for @authProviderFacebook.
  ///
  /// In es, this message translates to:
  /// **'Facebook'**
  String get authProviderFacebook;

  /// No description provided for @authProviderContinue.
  ///
  /// In es, this message translates to:
  /// **'Continuar con {provider}'**
  String authProviderContinue(String provider);

  /// No description provided for @authProviderJoinWith.
  ///
  /// In es, this message translates to:
  /// **'Unirme con {provider}'**
  String authProviderJoinWith(String provider);

  /// No description provided for @authSigningIn.
  ///
  /// In es, this message translates to:
  /// **'Conectando con {provider}…'**
  String authSigningIn(String provider);

  /// No description provided for @authInvitedDivider.
  ///
  /// In es, this message translates to:
  /// **'¿Te invitaron?'**
  String get authInvitedDivider;

  /// No description provided for @authHaveInviteCode.
  ///
  /// In es, this message translates to:
  /// **'Tengo un código de invitación'**
  String get authHaveInviteCode;

  /// No description provided for @authScanQr.
  ///
  /// In es, this message translates to:
  /// **'Escanear QR'**
  String get authScanQr;

  /// No description provided for @authNoticeCancelledTitle.
  ///
  /// In es, this message translates to:
  /// **'Cancelaste el inicio de sesión'**
  String get authNoticeCancelledTitle;

  /// No description provided for @authNoticeCancelledDetail.
  ///
  /// In es, this message translates to:
  /// **'No se hizo ningún cambio. Puedes intentarlo de nuevo.'**
  String get authNoticeCancelledDetail;

  /// No description provided for @authNoticeOfflineTitle.
  ///
  /// In es, this message translates to:
  /// **'Necesitas internet para entrar'**
  String get authNoticeOfflineTitle;

  /// No description provided for @authNoticeOfflineDetail.
  ///
  /// In es, this message translates to:
  /// **'El primer inicio de sesión en este teléfono requiere conexión. Después, tu sesión de mesa sigue funcionando sin internet.'**
  String get authNoticeOfflineDetail;

  /// No description provided for @authNoticeCredentialsTitle.
  ///
  /// In es, this message translates to:
  /// **'Correo o contraseña incorrectos.'**
  String get authNoticeCredentialsTitle;

  /// No description provided for @authNoticeNotConfiguredTitle.
  ///
  /// In es, this message translates to:
  /// **'Esta versión no está conectada al servidor'**
  String get authNoticeNotConfiguredTitle;

  /// No description provided for @authNoticeNotConfiguredDetail.
  ///
  /// In es, this message translates to:
  /// **'Falta la configuración de Supabase en esta compilación.'**
  String get authNoticeNotConfiguredDetail;

  /// No description provided for @authNoticeFailedTitle.
  ///
  /// In es, this message translates to:
  /// **'No pudimos iniciar tu sesión'**
  String get authNoticeFailedTitle;

  /// No description provided for @authNoticeFailedDetail.
  ///
  /// In es, this message translates to:
  /// **'Inténtalo de nuevo en unos momentos.'**
  String get authNoticeFailedDetail;

  /// No description provided for @authDevTitle.
  ///
  /// In es, this message translates to:
  /// **'Acceso de desarrollo'**
  String get authDevTitle;

  /// No description provided for @authDevHint.
  ///
  /// In es, this message translates to:
  /// **'Solo en compilaciones locales. Entra con una cuenta de prueba.'**
  String get authDevHint;

  /// No description provided for @authDevCreate.
  ///
  /// In es, this message translates to:
  /// **'Crear cuenta de prueba nueva'**
  String get authDevCreate;

  /// No description provided for @authStepSemantics.
  ///
  /// In es, this message translates to:
  /// **'Paso {current} de {total}: {label}'**
  String authStepSemantics(int current, int total, String label);

  /// No description provided for @authAccessResolving.
  ///
  /// In es, this message translates to:
  /// **'Preparando tu espacio…'**
  String get authAccessResolving;

  /// No description provided for @authAccessFailedTitle.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar tu cuenta'**
  String get authAccessFailedTitle;

  /// No description provided for @authAccessOfflineTitle.
  ///
  /// In es, this message translates to:
  /// **'Necesitas internet para entrar'**
  String get authAccessOfflineTitle;

  /// No description provided for @authAccessOfflineBody.
  ///
  /// In es, this message translates to:
  /// **'La primera vez que entras en este teléfono hace falta conexión. Después, tu sesión de mesa sigue funcionando sin internet.'**
  String get authAccessOfflineBody;

  /// No description provided for @authNoRoleTitle.
  ///
  /// In es, this message translates to:
  /// **'Todavía no tienes un rol asignado'**
  String get authNoRoleTitle;

  /// No description provided for @authNoRoleBody.
  ///
  /// In es, this message translates to:
  /// **'Tu cuenta existe, pero nadie te ha asignado a una organización o mesa. Cuando ocurra, actualiza esta pantalla y verás tu espacio.'**
  String get authNoRoleBody;

  /// No description provided for @authDeactivatedTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu cuenta está desactivada'**
  String get authDeactivatedTitle;

  /// No description provided for @authDeactivatedBody.
  ///
  /// In es, this message translates to:
  /// **'No puedes entrar por ahora. Habla con el coordinador de tu organización o con Casa del Altísimo.'**
  String get authDeactivatedBody;

  /// No description provided for @authUnknownTitle.
  ///
  /// In es, this message translates to:
  /// **'No encontramos tu cuenta'**
  String get authUnknownTitle;

  /// No description provided for @authUnknownBody.
  ///
  /// In es, this message translates to:
  /// **'Entraste, pero esta cuenta no está registrada ni tiene invitación. Las cuentas se crean cuando alguien te invita.'**
  String get authUnknownBody;

  /// No description provided for @authRefresh.
  ///
  /// In es, this message translates to:
  /// **'Actualizar'**
  String get authRefresh;

  /// No description provided for @authSignOut.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get authSignOut;

  /// No description provided for @authPickerKicker.
  ///
  /// In es, this message translates to:
  /// **'Primer acceso en este teléfono'**
  String get authPickerKicker;

  /// No description provided for @authPickerTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Con qué rol entras hoy?'**
  String get authPickerTitle;

  /// No description provided for @authPickerBody.
  ///
  /// In es, this message translates to:
  /// **'Tienes varios roles, {name}. Recordaremos tu elección y podrás cambiar desde el chip de arriba, en cualquier pantalla.'**
  String authPickerBody(String name);

  /// No description provided for @authPickerBodyAnonymous.
  ///
  /// In es, this message translates to:
  /// **'Tienes varios roles. Recordaremos tu elección y podrás cambiar desde el chip de arriba, en cualquier pantalla.'**
  String get authPickerBodyAnonymous;

  /// No description provided for @authPickerNotMe.
  ///
  /// In es, this message translates to:
  /// **'No soy {name}'**
  String authPickerNotMe(String name);

  /// No description provided for @authContextPlatform.
  ///
  /// In es, this message translates to:
  /// **'Plataforma'**
  String get authContextPlatform;

  /// No description provided for @authContextAdministratorDesc.
  ///
  /// In es, this message translates to:
  /// **'Todas las organizaciones'**
  String get authContextAdministratorDesc;

  /// No description provided for @authContextCoordinatorDesc.
  ///
  /// In es, this message translates to:
  /// **'Mesas y facilitadores de tu organización'**
  String get authContextCoordinatorDesc;

  /// No description provided for @authContextFacilitatorDesc.
  ///
  /// In es, this message translates to:
  /// **'Diriges esta mesa y agregas integrantes'**
  String get authContextFacilitatorDesc;

  /// No description provided for @authContextMemberDesc.
  ///
  /// In es, this message translates to:
  /// **'Participas en esta mesa'**
  String get authContextMemberDesc;

  /// No description provided for @authContextSwitchTitle.
  ///
  /// In es, this message translates to:
  /// **'Cambiar de contexto'**
  String get authContextSwitchTitle;

  /// No description provided for @authContextSwitchHint.
  ///
  /// In es, this message translates to:
  /// **'Un solo inicio de sesión, varios roles.'**
  String get authContextSwitchHint;

  /// No description provided for @authContextChange.
  ///
  /// In es, this message translates to:
  /// **'Cambiar contexto'**
  String get authContextChange;

  /// No description provided for @authContextSwitched.
  ///
  /// In es, this message translates to:
  /// **'Ahora: {role} · {scope}'**
  String authContextSwitched(String role, String scope);

  /// No description provided for @authAccountTitle.
  ///
  /// In es, this message translates to:
  /// **'Cuenta'**
  String get authAccountTitle;

  /// No description provided for @authAccountLinked.
  ///
  /// In es, this message translates to:
  /// **'Vinculada con {provider}'**
  String authAccountLinked(String provider);

  /// No description provided for @authAccountPhone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono de contacto'**
  String get authAccountPhone;

  /// No description provided for @authAccountPhoneUnverified.
  ///
  /// In es, this message translates to:
  /// **'Sin verificar'**
  String get authAccountPhoneUnverified;

  /// No description provided for @authAccountContexts.
  ///
  /// In es, this message translates to:
  /// **'Tus contextos'**
  String get authAccountContexts;

  /// No description provided for @authAccountCurrent.
  ///
  /// In es, this message translates to:
  /// **'Actual'**
  String get authAccountCurrent;

  /// No description provided for @authSignOutTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Cerrar sesión?'**
  String get authSignOutTitle;

  /// No description provided for @authSignOutBody.
  ///
  /// In es, this message translates to:
  /// **'Volverás a la puerta de entrada. Tus datos ya están sincronizados.'**
  String get authSignOutBody;

  /// No description provided for @authSignOutUnsyncedTitle.
  ///
  /// In es, this message translates to:
  /// **'Este teléfono tiene datos sin sincronizar'**
  String get authSignOutUnsyncedTitle;

  /// No description provided for @authSignOutUnsyncedBody.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 cambio está guardado solo en este teléfono.} other{{count} cambios están guardados solo en este teléfono.}}'**
  String authSignOutUnsyncedBody(int count);

  /// No description provided for @authSignOutSync.
  ///
  /// In es, this message translates to:
  /// **'Sincronizar y salir'**
  String get authSignOutSync;

  /// No description provided for @authSignOutSyncing.
  ///
  /// In es, this message translates to:
  /// **'Sincronizando…'**
  String get authSignOutSyncing;

  /// No description provided for @authSignOutOfflineHint.
  ///
  /// In es, this message translates to:
  /// **'Sin conexión: conéctate para sincronizar primero.'**
  String get authSignOutOfflineHint;

  /// No description provided for @authSignOutKeep.
  ///
  /// In es, this message translates to:
  /// **'Salir y conservar los datos'**
  String get authSignOutKeep;

  /// No description provided for @authSignOutKeepHint.
  ///
  /// In es, this message translates to:
  /// **'Se quedan guardados aquí y se envían cuando vuelvas a entrar con esta cuenta.'**
  String get authSignOutKeepHint;

  /// No description provided for @authSignOutErase.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Salir y borrar 1 cambio} other{Salir y borrar {count} cambios}}'**
  String authSignOutErase(int count);

  /// No description provided for @authSignOutEraseConfirmTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Borrar los datos de este teléfono?'**
  String get authSignOutEraseConfirmTitle;

  /// No description provided for @authSignOutEraseConfirmBody.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Se perderá 1 cambio que no se ha enviado.} other{Se perderán {count} cambios que no se han enviado.}} No se puede deshacer.'**
  String authSignOutEraseConfirmBody(int count);

  /// No description provided for @authSignOutEraseConfirmAction.
  ///
  /// In es, this message translates to:
  /// **'Sí, borrar y salir'**
  String get authSignOutEraseConfirmAction;

  /// No description provided for @authSignOutSyncTimeout.
  ///
  /// In es, this message translates to:
  /// **'No se pudo sincronizar a tiempo. Revisa tu conexión e inténtalo de nuevo.'**
  String get authSignOutSyncTimeout;

  /// No description provided for @authSignOutFailed.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cerrar la sesión. Inténtalo de nuevo.'**
  String get authSignOutFailed;

  /// No description provided for @navInvites.
  ///
  /// In es, this message translates to:
  /// **'Invitaciones'**
  String get navInvites;

  /// No description provided for @invitesStepCode.
  ///
  /// In es, this message translates to:
  /// **'Código'**
  String get invitesStepCode;

  /// No description provided for @invitesStepConfirm.
  ///
  /// In es, this message translates to:
  /// **'Confirmar'**
  String get invitesStepConfirm;

  /// No description provided for @invitesStepProfile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get invitesStepProfile;

  /// No description provided for @invitesCodeTitle.
  ///
  /// In es, this message translates to:
  /// **'Código de invitación'**
  String get invitesCodeTitle;

  /// No description provided for @invitesCodeHeadline.
  ///
  /// In es, this message translates to:
  /// **'Escribe tu código'**
  String get invitesCodeHeadline;

  /// No description provided for @invitesCodeSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Son 6 caracteres. Te lo envió quien te invitó, por WhatsApp o en persona.'**
  String get invitesCodeSubtitle;

  /// No description provided for @invitesCodeHint.
  ///
  /// In es, this message translates to:
  /// **'Sin distinguir mayúsculas. Puedes pegarlo.'**
  String get invitesCodeHint;

  /// No description provided for @invitesCodeSemantics.
  ///
  /// In es, this message translates to:
  /// **'Código de invitación, 6 caracteres'**
  String get invitesCodeSemantics;

  /// No description provided for @invitesCodeNotFoundAttempts.
  ///
  /// In es, this message translates to:
  /// **'No encontramos ese código. Revisa letras y números ({remaining, plural, =0{sin intentos} =1{te queda 1 intento} other{te quedan {remaining} intentos}}).'**
  String invitesCodeNotFoundAttempts(int remaining);

  /// No description provided for @invitesCodeLockedTitle.
  ///
  /// In es, this message translates to:
  /// **'Demasiados intentos'**
  String get invitesCodeLockedTitle;

  /// No description provided for @invitesCodeLocked.
  ///
  /// In es, this message translates to:
  /// **'Espera 60 segundos o escanea el QR.'**
  String get invitesCodeLocked;

  /// No description provided for @invitesPreferQr.
  ///
  /// In es, this message translates to:
  /// **'Prefiero escanear el QR'**
  String get invitesPreferQr;

  /// No description provided for @invitesChecking.
  ///
  /// In es, this message translates to:
  /// **'Comprobando código…'**
  String get invitesChecking;

  /// No description provided for @invitesScanTitle.
  ///
  /// In es, this message translates to:
  /// **'Escanear QR'**
  String get invitesScanTitle;

  /// No description provided for @invitesScanHeadline.
  ///
  /// In es, this message translates to:
  /// **'Escanea el QR'**
  String get invitesScanHeadline;

  /// No description provided for @invitesScanSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Quien te invitó puede mostrarte el QR en su teléfono.'**
  String get invitesScanSubtitle;

  /// No description provided for @invitesPasteSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Pega el enlace que te enviaron o escribe el código de 6 caracteres.'**
  String get invitesPasteSubtitle;

  /// No description provided for @invitesScanWebTitle.
  ///
  /// In es, this message translates to:
  /// **'La cámara funciona en la app del teléfono'**
  String get invitesScanWebTitle;

  /// No description provided for @invitesScanWebBody.
  ///
  /// In es, this message translates to:
  /// **'En computadora no escaneamos QR. Copia el enlace de la invitación y pégalo aquí.'**
  String get invitesScanWebBody;

  /// No description provided for @invitesPasteLink.
  ///
  /// In es, this message translates to:
  /// **'Pegar enlace o código'**
  String get invitesPasteLink;

  /// No description provided for @invitesTypeCode.
  ///
  /// In es, this message translates to:
  /// **'Escribir el código'**
  String get invitesTypeCode;

  /// No description provided for @invitesCameraDeniedTitle.
  ///
  /// In es, this message translates to:
  /// **'No podemos usar la cámara'**
  String get invitesCameraDeniedTitle;

  /// No description provided for @invitesCameraDeniedBody.
  ///
  /// In es, this message translates to:
  /// **'El permiso está desactivado. Actívalo en los ajustes del teléfono o escribe el código.'**
  String get invitesCameraDeniedBody;

  /// No description provided for @invitesCameraUnavailableBody.
  ///
  /// In es, this message translates to:
  /// **'La cámara no está disponible ahora. Escribe el código.'**
  String get invitesCameraUnavailableBody;

  /// No description provided for @invitesCameraRetry.
  ///
  /// In es, this message translates to:
  /// **'Volver a pedir permiso'**
  String get invitesCameraRetry;

  /// No description provided for @invitesQrNotInviteTitle.
  ///
  /// In es, this message translates to:
  /// **'Ese QR no es una invitación'**
  String get invitesQrNotInviteTitle;

  /// No description provided for @invitesQrNotInviteBody.
  ///
  /// In es, this message translates to:
  /// **'Escaneaste un código que no es de Gold Roundtables. Intenta de nuevo o escribe el código de 6 caracteres.'**
  String get invitesQrNotInviteBody;

  /// No description provided for @invitesPreviewBar.
  ///
  /// In es, this message translates to:
  /// **'Vista previa'**
  String get invitesPreviewBar;

  /// No description provided for @invitesPreviewHeadline.
  ///
  /// In es, this message translates to:
  /// **'Esto es a lo que te unes'**
  String get invitesPreviewHeadline;

  /// No description provided for @invitesPreviewSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Revisa los datos antes de vincular tu cuenta.'**
  String get invitesPreviewSubtitle;

  /// No description provided for @invitesInvitedBy.
  ///
  /// In es, this message translates to:
  /// **'Te invitó'**
  String get invitesInvitedBy;

  /// No description provided for @invitesFieldOrganization.
  ///
  /// In es, this message translates to:
  /// **'Organización'**
  String get invitesFieldOrganization;

  /// No description provided for @invitesFieldTable.
  ///
  /// In es, this message translates to:
  /// **'Mesa'**
  String get invitesFieldTable;

  /// No description provided for @invitesFieldYourRole.
  ///
  /// In es, this message translates to:
  /// **'Tu rol'**
  String get invitesFieldYourRole;

  /// No description provided for @invitesFieldInvitee.
  ///
  /// In es, this message translates to:
  /// **'Invitada/o'**
  String get invitesFieldInvitee;

  /// No description provided for @invitesFieldExpires.
  ///
  /// In es, this message translates to:
  /// **'Vence'**
  String get invitesFieldExpires;

  /// No description provided for @invitesConfirmWithAccount.
  ///
  /// In es, this message translates to:
  /// **'Confirma con tu cuenta · se vincula a esta invitación'**
  String get invitesConfirmWithAccount;

  /// No description provided for @invitesJoinAs.
  ///
  /// In es, this message translates to:
  /// **'Unirme como {role}'**
  String invitesJoinAs(String role);

  /// No description provided for @invitesSignedInWith.
  ///
  /// In es, this message translates to:
  /// **'Sesión iniciada con {provider}'**
  String invitesSignedInWith(String provider);

  /// No description provided for @invitesUseAnotherAccount.
  ///
  /// In es, this message translates to:
  /// **'Usar otra cuenta'**
  String get invitesUseAnotherAccount;

  /// No description provided for @invitesNeedInternetToJoin.
  ///
  /// In es, this message translates to:
  /// **'Necesitas internet para unirte'**
  String get invitesNeedInternetToJoin;

  /// No description provided for @invitesOfflineJoin.
  ///
  /// In es, this message translates to:
  /// **'para entrar y unirte necesitas internet'**
  String get invitesOfflineJoin;

  /// No description provided for @invitesAuthCancelledTitle.
  ///
  /// In es, this message translates to:
  /// **'Cancelaste el inicio de sesión'**
  String get invitesAuthCancelledTitle;

  /// No description provided for @invitesAuthCancelledDetail.
  ///
  /// In es, this message translates to:
  /// **'No se vinculó nada. Puedes intentarlo de nuevo.'**
  String get invitesAuthCancelledDetail;

  /// No description provided for @invitesProfileBar.
  ///
  /// In es, this message translates to:
  /// **'Tu perfil'**
  String get invitesProfileBar;

  /// No description provided for @invitesProfileHeadline.
  ///
  /// In es, this message translates to:
  /// **'Confirma tu perfil'**
  String get invitesProfileHeadline;

  /// No description provided for @invitesProfileSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Quien te invitó ya registró algunos datos. Corrígelos si hace falta.'**
  String get invitesProfileSubtitle;

  /// No description provided for @invitesLinkedAccount.
  ///
  /// In es, this message translates to:
  /// **'Cuenta vinculada'**
  String get invitesLinkedAccount;

  /// No description provided for @invitesLinkedPill.
  ///
  /// In es, this message translates to:
  /// **'Vinculada'**
  String get invitesLinkedPill;

  /// No description provided for @invitesAppleHiddenTitle.
  ///
  /// In es, this message translates to:
  /// **'Ocultaste tu correo con Apple'**
  String get invitesAppleHiddenTitle;

  /// No description provided for @invitesAppleHiddenBody.
  ///
  /// In es, this message translates to:
  /// **'Para avisos usaremos el correo que registró quien te invitó. Tu cuenta queda vinculada igual.'**
  String get invitesAppleHiddenBody;

  /// No description provided for @invitesPhoneUnverified.
  ///
  /// In es, this message translates to:
  /// **'Sin verificar: solo es un dato de contacto, no sirve para entrar.'**
  String get invitesPhoneUnverified;

  /// No description provided for @invitesConfirmAndEnter.
  ///
  /// In es, this message translates to:
  /// **'Confirmar y entrar'**
  String get invitesConfirmAndEnter;

  /// No description provided for @invitesFieldFirstName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get invitesFieldFirstName;

  /// No description provided for @invitesFieldLastName.
  ///
  /// In es, this message translates to:
  /// **'Apellido'**
  String get invitesFieldLastName;

  /// No description provided for @invitesFieldPositionOptional.
  ///
  /// In es, this message translates to:
  /// **'Cargo (opcional)'**
  String get invitesFieldPositionOptional;

  /// No description provided for @invitesFieldEmail.
  ///
  /// In es, this message translates to:
  /// **'Correo'**
  String get invitesFieldEmail;

  /// No description provided for @invitesFieldPhone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get invitesFieldPhone;

  /// No description provided for @invitesFieldPhoneOptional.
  ///
  /// In es, this message translates to:
  /// **'Teléfono (opcional)'**
  String get invitesFieldPhoneOptional;

  /// No description provided for @invitesFieldRole.
  ///
  /// In es, this message translates to:
  /// **'Rol'**
  String get invitesFieldRole;

  /// No description provided for @invitesWelcomeTitle.
  ///
  /// In es, this message translates to:
  /// **'Listo, {name}'**
  String invitesWelcomeTitle(String name);

  /// No description provided for @invitesWelcomeBody.
  ///
  /// In es, this message translates to:
  /// **'Ya tienes lugar en {scope} como {role}.'**
  String invitesWelcomeBody(String scope, String role);

  /// No description provided for @invitesWelcomeAccountLinked.
  ///
  /// In es, this message translates to:
  /// **'Cuenta de {provider} vinculada'**
  String invitesWelcomeAccountLinked(String provider);

  /// No description provided for @invitesWelcomeAccountLinkedGeneric.
  ///
  /// In es, this message translates to:
  /// **'Cuenta vinculada'**
  String get invitesWelcomeAccountLinkedGeneric;

  /// No description provided for @invitesWelcomeProfileConfirmed.
  ///
  /// In es, this message translates to:
  /// **'Perfil confirmado'**
  String get invitesWelcomeProfileConfirmed;

  /// No description provided for @invitesWelcomeContext.
  ///
  /// In es, this message translates to:
  /// **'Contexto: {context}'**
  String invitesWelcomeContext(String context);

  /// No description provided for @invitesWelcomeEnter.
  ///
  /// In es, this message translates to:
  /// **'Entrar'**
  String get invitesWelcomeEnter;

  /// No description provided for @invitesWelcomeEnterTable.
  ///
  /// In es, this message translates to:
  /// **'Entrar a mi mesa'**
  String get invitesWelcomeEnterTable;

  /// No description provided for @invitesTryAnotherCode.
  ///
  /// In es, this message translates to:
  /// **'Probar otro código'**
  String get invitesTryAnotherCode;

  /// No description provided for @invitesBackToGate.
  ///
  /// In es, this message translates to:
  /// **'Volver a la puerta'**
  String get invitesBackToGate;

  /// No description provided for @invitesSignIn.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get invitesSignIn;

  /// No description provided for @invitesExpiredTitle.
  ///
  /// In es, this message translates to:
  /// **'Esta invitación venció'**
  String get invitesExpiredTitle;

  /// No description provided for @invitesExpiredBody.
  ///
  /// In es, this message translates to:
  /// **'Pídele a quien te invitó que te envíe una nueva.'**
  String get invitesExpiredBody;

  /// No description provided for @invitesUsedTitle.
  ///
  /// In es, this message translates to:
  /// **'Esta invitación ya se usó'**
  String get invitesUsedTitle;

  /// No description provided for @invitesUsedBody.
  ///
  /// In es, this message translates to:
  /// **'Otra cuenta ya aceptó este código. Si eres tú, inicia sesión con el mismo proveedor que usaste.'**
  String get invitesUsedBody;

  /// No description provided for @invitesRevokedTitle.
  ///
  /// In es, this message translates to:
  /// **'Esta invitación fue revocada'**
  String get invitesRevokedTitle;

  /// No description provided for @invitesRevokedBody.
  ///
  /// In es, this message translates to:
  /// **'Quien te invitó la canceló. Si crees que es un error, habla con esa persona.'**
  String get invitesRevokedBody;

  /// No description provided for @invitesNotFoundTitle.
  ///
  /// In es, this message translates to:
  /// **'No encontramos esa invitación'**
  String get invitesNotFoundTitle;

  /// No description provided for @invitesNotFoundBody.
  ///
  /// In es, this message translates to:
  /// **'Revisa las letras y los números o pídele el enlace de nuevo a quien te invitó.'**
  String get invitesNotFoundBody;

  /// No description provided for @invitesLinkedTitle.
  ///
  /// In es, this message translates to:
  /// **'Esa cuenta ya está vinculada a otro miembro'**
  String get invitesLinkedTitle;

  /// No description provided for @invitesLinkedBody.
  ///
  /// In es, this message translates to:
  /// **'Tu cuenta de este proveedor pertenece a otra persona en la plataforma. Usa otra cuenta o pide ayuda a quien te invitó.'**
  String get invitesLinkedBody;

  /// No description provided for @invitesIdentityLinkedTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu cuenta ya tiene lugar aquí'**
  String get invitesIdentityLinkedTitle;

  /// No description provided for @invitesIdentityLinkedBody.
  ///
  /// In es, this message translates to:
  /// **'Esta cuenta ya está vinculada a otra persona de esta organización. Entra con ella desde la puerta.'**
  String get invitesIdentityLinkedBody;

  /// No description provided for @invitesUnavailableTitle.
  ///
  /// In es, this message translates to:
  /// **'Esta invitación ya no está disponible'**
  String get invitesUnavailableTitle;

  /// No description provided for @invitesGenericFailureTitle.
  ///
  /// In es, this message translates to:
  /// **'No pudimos completar la invitación'**
  String get invitesGenericFailureTitle;

  /// No description provided for @invitesProblemNotFound.
  ///
  /// In es, this message translates to:
  /// **'No encontramos ese código. Revisa letras y números.'**
  String get invitesProblemNotFound;

  /// No description provided for @invitesProblemExpired.
  ///
  /// In es, this message translates to:
  /// **'Esta invitación venció. Pide una nueva a quien te invitó.'**
  String get invitesProblemExpired;

  /// No description provided for @invitesProblemRevoked.
  ///
  /// In es, this message translates to:
  /// **'Esta invitación fue revocada.'**
  String get invitesProblemRevoked;

  /// No description provided for @invitesProblemAlreadyUsed.
  ///
  /// In es, this message translates to:
  /// **'Esta invitación ya se usó.'**
  String get invitesProblemAlreadyUsed;

  /// No description provided for @invitesProblemLinkedElsewhere.
  ///
  /// In es, this message translates to:
  /// **'Esa cuenta ya está vinculada a otra persona.'**
  String get invitesProblemLinkedElsewhere;

  /// No description provided for @invitesProblemIdentityLinkedElsewhere.
  ///
  /// In es, this message translates to:
  /// **'Tu cuenta ya está vinculada a otra persona de esta organización.'**
  String get invitesProblemIdentityLinkedElsewhere;

  /// No description provided for @invitesProblemUnavailable.
  ///
  /// In es, this message translates to:
  /// **'Esta invitación ya no está disponible. Habla con tu coordinador o con Casa del Altísimo.'**
  String get invitesProblemUnavailable;

  /// No description provided for @invitesProblemTableFull.
  ///
  /// In es, this message translates to:
  /// **'La mesa ya tiene 9 personas, incluido el facilitador.'**
  String get invitesProblemTableFull;

  /// No description provided for @invitesProblemTableHasFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Esta mesa ya tiene facilitador.'**
  String get invitesProblemTableHasFacilitator;

  /// No description provided for @invitesProblemPendingExists.
  ///
  /// In es, this message translates to:
  /// **'Ya hay una invitación pendiente para esta persona. Reenvíala o revócala desde Invitaciones.'**
  String get invitesProblemPendingExists;

  /// No description provided for @invitesProblemPersonAlreadyLinked.
  ///
  /// In es, this message translates to:
  /// **'Esta persona ya tiene una cuenta vinculada. Agrégala directamente a la mesa.'**
  String get invitesProblemPersonAlreadyLinked;

  /// No description provided for @invitesProblemOffline.
  ///
  /// In es, this message translates to:
  /// **'Sin conexión: necesitas internet para esto.'**
  String get invitesProblemOffline;

  /// No description provided for @invitesManagerTitle.
  ///
  /// In es, this message translates to:
  /// **'Invitaciones'**
  String get invitesManagerTitle;

  /// No description provided for @invitesInviteAction.
  ///
  /// In es, this message translates to:
  /// **'Invitar'**
  String get invitesInviteAction;

  /// No description provided for @invitesSearchLabel.
  ///
  /// In es, this message translates to:
  /// **'Buscar invitaciones'**
  String get invitesSearchLabel;

  /// No description provided for @invitesSearchHint.
  ///
  /// In es, this message translates to:
  /// **'Nombre o correo'**
  String get invitesSearchHint;

  /// No description provided for @invitesFilterAll.
  ///
  /// In es, this message translates to:
  /// **'Todas'**
  String get invitesFilterAll;

  /// No description provided for @invitesStatusPending.
  ///
  /// In es, this message translates to:
  /// **'Pendiente'**
  String get invitesStatusPending;

  /// No description provided for @invitesStatusAccepted.
  ///
  /// In es, this message translates to:
  /// **'Aceptada'**
  String get invitesStatusAccepted;

  /// No description provided for @invitesStatusExpired.
  ///
  /// In es, this message translates to:
  /// **'Vencida'**
  String get invitesStatusExpired;

  /// No description provided for @invitesStatusRevoked.
  ///
  /// In es, this message translates to:
  /// **'Revocada'**
  String get invitesStatusRevoked;

  /// No description provided for @invitesColumnPerson.
  ///
  /// In es, this message translates to:
  /// **'Persona'**
  String get invitesColumnPerson;

  /// No description provided for @invitesColumnRoleScope.
  ///
  /// In es, this message translates to:
  /// **'Rol · Ámbito'**
  String get invitesColumnRoleScope;

  /// No description provided for @invitesColumnStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado'**
  String get invitesColumnStatus;

  /// No description provided for @invitesColumnDetail.
  ///
  /// In es, this message translates to:
  /// **'Detalle'**
  String get invitesColumnDetail;

  /// No description provided for @invitesDetailExpires.
  ///
  /// In es, this message translates to:
  /// **'Vence el {date}'**
  String invitesDetailExpires(String date);

  /// No description provided for @invitesDetailAccepted.
  ///
  /// In es, this message translates to:
  /// **'Aceptó el {date}'**
  String invitesDetailAccepted(String date);

  /// No description provided for @invitesDetailExpired.
  ///
  /// In es, this message translates to:
  /// **'Venció el {date}'**
  String invitesDetailExpired(String date);

  /// No description provided for @invitesDetailRevoked.
  ///
  /// In es, this message translates to:
  /// **'Revocada el {date}'**
  String invitesDetailRevoked(String date);

  /// No description provided for @invitesShareAction.
  ///
  /// In es, this message translates to:
  /// **'Compartir'**
  String get invitesShareAction;

  /// No description provided for @invitesRenewAction.
  ///
  /// In es, this message translates to:
  /// **'Renovar'**
  String get invitesRenewAction;

  /// No description provided for @invitesRevokeAction.
  ///
  /// In es, this message translates to:
  /// **'Revocar'**
  String get invitesRevokeAction;

  /// No description provided for @invitesNoActions.
  ///
  /// In es, this message translates to:
  /// **'Sin acciones'**
  String get invitesNoActions;

  /// No description provided for @invitesSelectedCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 seleccionada} other{{count} seleccionadas}}'**
  String invitesSelectedCount(int count);

  /// No description provided for @invitesSelectAll.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar todas'**
  String get invitesSelectAll;

  /// No description provided for @invitesUnselectAll.
  ///
  /// In es, this message translates to:
  /// **'Quitar selección'**
  String get invitesUnselectAll;

  /// No description provided for @invitesClearSelection.
  ///
  /// In es, this message translates to:
  /// **'Limpiar'**
  String get invitesClearSelection;

  /// No description provided for @invitesRevokeConfirmTitleOne.
  ///
  /// In es, this message translates to:
  /// **'¿Revocar la invitación de {name}?'**
  String invitesRevokeConfirmTitleOne(String name);

  /// No description provided for @invitesRevokeConfirmTitleMany.
  ///
  /// In es, this message translates to:
  /// **'¿Revocar {count} invitaciones?'**
  String invitesRevokeConfirmTitleMany(int count);

  /// No description provided for @invitesRevokeConfirmBody.
  ///
  /// In es, this message translates to:
  /// **'El enlace, el código y el QR dejarán de funcionar y se libera el lugar en la mesa. No se puede deshacer; puedes crear otra invitación.'**
  String get invitesRevokeConfirmBody;

  /// No description provided for @invitesRevokeConfirmAction.
  ///
  /// In es, this message translates to:
  /// **'Sí, revocar'**
  String get invitesRevokeConfirmAction;

  /// No description provided for @invitesToastRenewed.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Invitación renovada con un código nuevo} other{{count} invitaciones renovadas}}'**
  String invitesToastRenewed(int count);

  /// No description provided for @invitesToastRevoked.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Invitación revocada. Lugar liberado.} other{{count} invitaciones revocadas}}'**
  String invitesToastRevoked(int count);

  /// No description provided for @invitesEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Aún no has invitado a nadie'**
  String get invitesEmptyTitle;

  /// No description provided for @invitesEmptyBody.
  ///
  /// In es, this message translates to:
  /// **'Registra a la primera persona y comparte su invitación.'**
  String get invitesEmptyBody;

  /// No description provided for @invitesEmptyAction.
  ///
  /// In es, this message translates to:
  /// **'Invitar a la primera persona'**
  String get invitesEmptyAction;

  /// No description provided for @invitesFilterEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Nada con este filtro'**
  String get invitesFilterEmptyTitle;

  /// No description provided for @invitesFilterEmptyBody.
  ///
  /// In es, this message translates to:
  /// **'No hay invitaciones que coincidan con la búsqueda o el estado elegido.'**
  String get invitesFilterEmptyBody;

  /// No description provided for @invitesFilterShowAll.
  ///
  /// In es, this message translates to:
  /// **'Ver todas'**
  String get invitesFilterShowAll;

  /// No description provided for @invitesOfflineList.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar las invitaciones. Invitaciones y administración solo funcionan con internet; tu sesión de mesa no se ve afectada.'**
  String get invitesOfflineList;

  /// No description provided for @invitesDeniedTitle.
  ///
  /// In es, this message translates to:
  /// **'No tienes permiso para esto'**
  String get invitesDeniedTitle;

  /// No description provided for @invitesDeniedBody.
  ///
  /// In es, this message translates to:
  /// **'Con tu rol no puedes invitar personas. Pídele a tu facilitador o coordinador que lo haga.'**
  String get invitesDeniedBody;

  /// No description provided for @invitesFormBar.
  ///
  /// In es, this message translates to:
  /// **'Nueva invitación'**
  String get invitesFormBar;

  /// No description provided for @invitesFormKicker.
  ///
  /// In es, this message translates to:
  /// **'Nueva invitación'**
  String get invitesFormKicker;

  /// No description provided for @invitesFormHeadline.
  ///
  /// In es, this message translates to:
  /// **'Registra a la persona'**
  String get invitesFormHeadline;

  /// No description provided for @invitesFormSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Primero se registra; después se comparte el enlace, el código o el QR.'**
  String get invitesFormSubtitle;

  /// No description provided for @invitesRoleMemberDesc.
  ///
  /// In es, this message translates to:
  /// **'Responde en una mesa'**
  String get invitesRoleMemberDesc;

  /// No description provided for @invitesRoleFacilitatorDesc.
  ///
  /// In es, this message translates to:
  /// **'Dirige una mesa y responde como participante'**
  String get invitesRoleFacilitatorDesc;

  /// No description provided for @invitesRoleCoordinatorDesc.
  ///
  /// In es, this message translates to:
  /// **'Crea mesas y facilitadores en su organización'**
  String get invitesRoleCoordinatorDesc;

  /// No description provided for @invitesRoleOnlyStaff.
  ///
  /// In es, this message translates to:
  /// **'Solo Coordinador o Administrador'**
  String get invitesRoleOnlyStaff;

  /// No description provided for @invitesRoleLockedToast.
  ///
  /// In es, this message translates to:
  /// **'Con tu rol solo puedes invitar integrantes a tu mesa.'**
  String get invitesRoleLockedToast;

  /// No description provided for @invitesRoleFacilitatorTaken.
  ///
  /// In es, this message translates to:
  /// **'Esta mesa ya tiene facilitador'**
  String get invitesRoleFacilitatorTaken;

  /// No description provided for @invitesFacilitatorOwnTable.
  ///
  /// In es, this message translates to:
  /// **'Como facilitador solo agregas integrantes a tu mesa.'**
  String get invitesFacilitatorOwnTable;

  /// No description provided for @invitesTableFull.
  ///
  /// In es, this message translates to:
  /// **'Mesa llena · {taken} de {max}'**
  String invitesTableFull(int taken, int max);

  /// No description provided for @invitesSeatsFree.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Queda 1 lugar} other{Quedan {count} lugares}}'**
  String invitesSeatsFree(int count);

  /// No description provided for @invitesSeatsRule.
  ///
  /// In es, this message translates to:
  /// **'Las mesas tienen de 3 a 9 personas; el facilitador cuenta y cada invitación pendiente reserva un lugar.'**
  String get invitesSeatsRule;

  /// No description provided for @invitesNoSeatsTitle.
  ///
  /// In es, this message translates to:
  /// **'No hay lugares libres'**
  String get invitesNoSeatsTitle;

  /// No description provided for @invitesNoSeatsBody.
  ///
  /// In es, this message translates to:
  /// **'Elige otra mesa o revoca una invitación pendiente para liberar un lugar.'**
  String get invitesNoSeatsBody;

  /// No description provided for @invitesScopeKicker.
  ///
  /// In es, this message translates to:
  /// **'Alcance'**
  String get invitesScopeKicker;

  /// No description provided for @invitesScopeWholeOrganization.
  ///
  /// In es, this message translates to:
  /// **'Toda la organización {name}'**
  String invitesScopeWholeOrganization(String name);

  /// No description provided for @invitesScopeCoordinatorNote.
  ///
  /// In es, this message translates to:
  /// **'Un coordinador no ocupa lugar en una mesa.'**
  String get invitesScopeCoordinatorNote;

  /// No description provided for @invitesWhatTheyGet.
  ///
  /// In es, this message translates to:
  /// **'Qué recibirá'**
  String get invitesWhatTheyGet;

  /// No description provided for @invitesWhatTheyGetBody.
  ///
  /// In es, this message translates to:
  /// **'Un enlace, un código de 6 caracteres y un QR. Al usarlos, entra con Google, Apple o Facebook y esa cuenta queda vinculada. Vence en {days} días.'**
  String invitesWhatTheyGetBody(int days);

  /// No description provided for @invitesFormOfflineTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin conexión'**
  String get invitesFormOfflineTitle;

  /// No description provided for @invitesFormOfflineBody.
  ///
  /// In es, this message translates to:
  /// **'No puedes crear invitaciones hasta volver a conectarte.'**
  String get invitesFormOfflineBody;

  /// No description provided for @invitesCreateAction.
  ///
  /// In es, this message translates to:
  /// **'Crear invitación'**
  String get invitesCreateAction;

  /// No description provided for @invitesShareBar.
  ///
  /// In es, this message translates to:
  /// **'Compartir invitación'**
  String get invitesShareBar;

  /// No description provided for @invitesShareKicker.
  ///
  /// In es, this message translates to:
  /// **'Invitación creada'**
  String get invitesShareKicker;

  /// No description provided for @invitesShareHeadline.
  ///
  /// In es, this message translates to:
  /// **'Comparte con {name}'**
  String invitesShareHeadline(String name);

  /// No description provided for @invitesShareMessage.
  ///
  /// In es, this message translates to:
  /// **'Hola {name}, te invito a Gold Roundtables ({scope}). Entra aquí: {link} o usa el código {code}. Vence el {date}.'**
  String invitesShareMessage(
    String name,
    String scope,
    String link,
    String code,
    String date,
  );

  /// No description provided for @invitesShareMissingTitle.
  ///
  /// In es, this message translates to:
  /// **'No encontramos esta invitación'**
  String get invitesShareMissingTitle;

  /// No description provided for @invitesCodeKicker.
  ///
  /// In es, this message translates to:
  /// **'Código'**
  String get invitesCodeKicker;

  /// No description provided for @invitesLinkKicker.
  ///
  /// In es, this message translates to:
  /// **'Enlace'**
  String get invitesLinkKicker;

  /// No description provided for @invitesWhatsapp.
  ///
  /// In es, this message translates to:
  /// **'WhatsApp'**
  String get invitesWhatsapp;

  /// No description provided for @invitesWhatsappUnavailable.
  ///
  /// In es, this message translates to:
  /// **'No pudimos abrir WhatsApp. Copia el enlace y envíalo por otro medio.'**
  String get invitesWhatsappUnavailable;

  /// No description provided for @invitesCopyLink.
  ///
  /// In es, this message translates to:
  /// **'Copiar enlace'**
  String get invitesCopyLink;

  /// No description provided for @invitesCopyCode.
  ///
  /// In es, this message translates to:
  /// **'Copiar código'**
  String get invitesCopyCode;

  /// No description provided for @invitesCopiedLink.
  ///
  /// In es, this message translates to:
  /// **'Enlace copiado'**
  String get invitesCopiedLink;

  /// No description provided for @invitesCopiedCode.
  ///
  /// In es, this message translates to:
  /// **'Código copiado'**
  String get invitesCopiedCode;

  /// No description provided for @invitesShowBigQr.
  ///
  /// In es, this message translates to:
  /// **'Mostrar QR grande'**
  String get invitesShowBigQr;

  /// No description provided for @invitesBigQrTitle.
  ///
  /// In es, this message translates to:
  /// **'QR para {name}'**
  String invitesBigQrTitle(String name);

  /// No description provided for @invitesBigQrHint.
  ///
  /// In es, this message translates to:
  /// **'Muéstralo en persona. Se escanea desde la puerta de entrada.'**
  String get invitesBigQrHint;

  /// No description provided for @invitesQrSemantics.
  ///
  /// In es, this message translates to:
  /// **'Código QR de la invitación'**
  String get invitesQrSemantics;

  /// No description provided for @invitesInviteAnother.
  ///
  /// In es, this message translates to:
  /// **'Invitar a otra persona'**
  String get invitesInviteAnother;

  /// No description provided for @invitesViewAll.
  ///
  /// In es, this message translates to:
  /// **'Ver todas las invitaciones'**
  String get invitesViewAll;
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
