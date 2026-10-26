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

  /// No description provided for @sessionSharedNavLabel.
  ///
  /// In es, this message translates to:
  /// **'Sesión'**
  String get sessionSharedNavLabel;

  /// No description provided for @sessionSharedLoading.
  ///
  /// In es, this message translates to:
  /// **'Preparando tu mesa…'**
  String get sessionSharedLoading;

  /// No description provided for @sessionSharedPillLive.
  ///
  /// In es, this message translates to:
  /// **'En vivo'**
  String get sessionSharedPillLive;

  /// No description provided for @sessionSharedPillOnline.
  ///
  /// In es, this message translates to:
  /// **'En línea'**
  String get sessionSharedPillOnline;

  /// No description provided for @sessionSharedPillOffline.
  ///
  /// In es, this message translates to:
  /// **'Sin internet'**
  String get sessionSharedPillOffline;

  /// No description provided for @sessionSharedPillSyncing.
  ///
  /// In es, this message translates to:
  /// **'Sincronizando'**
  String get sessionSharedPillSyncing;

  /// No description provided for @sessionSharedPillPending.
  ///
  /// In es, this message translates to:
  /// **'Por sincronizar'**
  String get sessionSharedPillPending;

  /// No description provided for @sessionSharedTimerCaption.
  ///
  /// In es, this message translates to:
  /// **'Tiempo · informativo'**
  String get sessionSharedTimerCaption;

  /// No description provided for @sessionSharedTimerOver.
  ///
  /// In es, this message translates to:
  /// **'Pasó de {minutes} min · solo informativo'**
  String sessionSharedTimerOver(int minutes);

  /// No description provided for @sessionSharedTimerLimit.
  ///
  /// In es, this message translates to:
  /// **'/ {limit}'**
  String sessionSharedTimerLimit(String limit);

  /// No description provided for @sessionSharedUnavailableTitle.
  ///
  /// In es, this message translates to:
  /// **'Aún no hay una sesión en este teléfono'**
  String get sessionSharedUnavailableTitle;

  /// No description provided for @sessionSharedUnavailableMessage.
  ///
  /// In es, this message translates to:
  /// **'Conéctate a internet una vez para descargar tu mesa y la sesión de esta semana.'**
  String get sessionSharedUnavailableMessage;

  /// No description provided for @sessionSharedNotTodayTitle.
  ///
  /// In es, this message translates to:
  /// **'Hoy no hay sesión'**
  String get sessionSharedNotTodayTitle;

  /// No description provided for @sessionSharedNotTodayMessage.
  ///
  /// In es, this message translates to:
  /// **'Tu próxima sesión es {when}.'**
  String sessionSharedNotTodayMessage(String when);

  /// No description provided for @sessionSharedCancelledTitle.
  ///
  /// In es, this message translates to:
  /// **'Sesión cancelada'**
  String get sessionSharedCancelledTitle;

  /// No description provided for @sessionSharedCancelledMessage.
  ///
  /// In es, this message translates to:
  /// **'Esta sesión se canceló. Tu facilitador te avisará la nueva fecha.'**
  String get sessionSharedCancelledMessage;

  /// No description provided for @sessionSharedValueLabel.
  ///
  /// In es, this message translates to:
  /// **'Valor {number} · {name}'**
  String sessionSharedValueLabel(int number, String name);

  /// No description provided for @sessionSharedNoticeSavedOnDevice.
  ///
  /// In es, this message translates to:
  /// **'Guardado en este teléfono · pendiente de sincronizar'**
  String get sessionSharedNoticeSavedOnDevice;

  /// No description provided for @sessionSharedNoticeReconnected.
  ///
  /// In es, this message translates to:
  /// **'Conexión restablecida · sincronizando…'**
  String get sessionSharedNoticeReconnected;

  /// No description provided for @sessionSharedStaleWarning.
  ///
  /// In es, this message translates to:
  /// **'Llevas {hours} h sin sincronizar. Tu teléfono puede estar hasta 7 días sin conexión. Conéctate pronto para no perder tus respuestas.'**
  String sessionSharedStaleWarning(int hours);

  /// No description provided for @sessionSharedRejectedTitle.
  ///
  /// In es, this message translates to:
  /// **'Algunas respuestas no se pudieron enviar'**
  String get sessionSharedRejectedTitle;

  /// No description provided for @sessionSharedSyncNow.
  ///
  /// In es, this message translates to:
  /// **'Sincronizar ahora'**
  String get sessionSharedSyncNow;

  /// No description provided for @sessionSharedAttendanceAuto.
  ///
  /// In es, this message translates to:
  /// **'Asistencia automática'**
  String get sessionSharedAttendanceAuto;
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
