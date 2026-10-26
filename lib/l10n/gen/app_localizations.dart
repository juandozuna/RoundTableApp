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

  /// No description provided for @sessionBoardFacilitatorLabel.
  ///
  /// In es, this message translates to:
  /// **'Facilitador'**
  String get sessionBoardFacilitatorLabel;

  /// No description provided for @sessionBoardTabBoard.
  ///
  /// In es, this message translates to:
  /// **'Dirigir la mesa'**
  String get sessionBoardTabBoard;

  /// No description provided for @sessionBoardTabMyAnswers.
  ///
  /// In es, this message translates to:
  /// **'Mis respuestas'**
  String get sessionBoardTabMyAnswers;

  /// No description provided for @sessionBoardTabMissing.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 paso pendiente} other{{count} pasos pendientes}}'**
  String sessionBoardTabMissing(int count);

  /// No description provided for @sessionBoardStageFollowUpShort.
  ///
  /// In es, this message translates to:
  /// **'Seguim.'**
  String get sessionBoardStageFollowUpShort;

  /// No description provided for @sessionBoardStageOpenTitle.
  ///
  /// In es, this message translates to:
  /// **'Apertura'**
  String get sessionBoardStageOpenTitle;

  /// No description provided for @sessionBoardStageAttendanceTitle.
  ///
  /// In es, this message translates to:
  /// **'Asistencia'**
  String get sessionBoardStageAttendanceTitle;

  /// No description provided for @sessionBoardStageValueTitle.
  ///
  /// In es, this message translates to:
  /// **'Valor actual'**
  String get sessionBoardStageValueTitle;

  /// No description provided for @sessionBoardStageNotYet.
  ///
  /// In es, this message translates to:
  /// **'Aún no: usa el botón de abajo para abrir esa etapa.'**
  String get sessionBoardStageNotYet;

  /// No description provided for @sessionBoardStageSemantics.
  ///
  /// In es, this message translates to:
  /// **'Etapa {number}: {name} ({state})'**
  String sessionBoardStageSemantics(int number, String name, String state);

  /// No description provided for @sessionBoardStateCurrent.
  ///
  /// In es, this message translates to:
  /// **'actual'**
  String get sessionBoardStateCurrent;

  /// No description provided for @sessionBoardStateDone.
  ///
  /// In es, this message translates to:
  /// **'completada'**
  String get sessionBoardStateDone;

  /// No description provided for @sessionBoardStatePending.
  ///
  /// In es, this message translates to:
  /// **'pendiente'**
  String get sessionBoardStatePending;

  /// No description provided for @sessionBoardKickerTableIsAt.
  ///
  /// In es, this message translates to:
  /// **'La mesa está en'**
  String get sessionBoardKickerTableIsAt;

  /// No description provided for @sessionBoardKickerSession.
  ///
  /// In es, this message translates to:
  /// **'Sesión'**
  String get sessionBoardKickerSession;

  /// No description provided for @sessionBoardClosedTitle.
  ///
  /// In es, this message translates to:
  /// **'Cerrada'**
  String get sessionBoardClosedTitle;

  /// No description provided for @sessionBoardViewingPrefix.
  ///
  /// In es, this message translates to:
  /// **'Viendo: {stage} · {detail}'**
  String sessionBoardViewingPrefix(String stage, String detail);

  /// No description provided for @sessionBoardBackToCurrent.
  ///
  /// In es, this message translates to:
  /// **'Viendo {stage} · volver a la etapa actual'**
  String sessionBoardBackToCurrent(String stage);

  /// No description provided for @sessionBoardSubtitleOpen.
  ///
  /// In es, this message translates to:
  /// **'{taken} de {max} lugares (facilitador incluido)'**
  String sessionBoardSubtitleOpen(int taken, int max);

  /// No description provided for @sessionBoardSubtitleAttendance.
  ///
  /// In es, this message translates to:
  /// **'{done} de {total} con asistencia marcada'**
  String sessionBoardSubtitleAttendance(int done, int total);

  /// No description provided for @sessionBoardSubtitleFollowUp.
  ///
  /// In es, this message translates to:
  /// **'{done} de {total} respondieron{noPrevious, plural, =0{} =1{ · 1 sin compromiso previo} other{ · {noPrevious} sin compromiso previo}}'**
  String sessionBoardSubtitleFollowUp(int done, int total, int noPrevious);

  /// No description provided for @sessionBoardSubtitleValue.
  ///
  /// In es, this message translates to:
  /// **'{done} de {total} completaron Valor actual{pending, plural, =0{} =1{ · 1 con compromiso pendiente} other{ · {pending} con compromiso pendiente}}'**
  String sessionBoardSubtitleValue(int done, int total, int pending);

  /// No description provided for @sessionBoardSubtitleAnswersClosed.
  ///
  /// In es, this message translates to:
  /// **'Respuestas cerradas · falta cerrar la sesión · {done} de {total}'**
  String sessionBoardSubtitleAnswersClosed(int done, int total);

  /// No description provided for @sessionBoardSubtitleClosed.
  ///
  /// In es, this message translates to:
  /// **'Sesión cerrada · {done} de {total} respuestas recibidas'**
  String sessionBoardSubtitleClosed(int done, int total);

  /// No description provided for @sessionBoardOfflineSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Sin internet: ves lo tuyo; el resto llega al sincronizar'**
  String get sessionBoardOfflineSubtitle;

  /// No description provided for @sessionBoardNoLiveData.
  ///
  /// In es, this message translates to:
  /// **'Sin datos en vivo'**
  String get sessionBoardNoLiveData;

  /// No description provided for @sessionBoardCaptionSeats.
  ///
  /// In es, this message translates to:
  /// **'lugares'**
  String get sessionBoardCaptionSeats;

  /// No description provided for @sessionBoardCaptionWithList.
  ///
  /// In es, this message translates to:
  /// **'con lista'**
  String get sessionBoardCaptionWithList;

  /// No description provided for @sessionBoardCaptionAnswered.
  ///
  /// In es, this message translates to:
  /// **'respondieron'**
  String get sessionBoardCaptionAnswered;

  /// No description provided for @sessionBoardCaptionCompleted.
  ///
  /// In es, this message translates to:
  /// **'completaron'**
  String get sessionBoardCaptionCompleted;

  /// No description provided for @sessionBoardCaptionResponses.
  ///
  /// In es, this message translates to:
  /// **'respuestas'**
  String get sessionBoardCaptionResponses;

  /// No description provided for @sessionBoardTableSemantics.
  ///
  /// In es, this message translates to:
  /// **'Mesa redonda: {count} de {max} lugares'**
  String sessionBoardTableSemantics(int count, int max);

  /// No description provided for @sessionBoardSeatUnmarked.
  ///
  /// In es, this message translates to:
  /// **'Sin marcar'**
  String get sessionBoardSeatUnmarked;

  /// No description provided for @sessionBoardSeatAnswered.
  ///
  /// In es, this message translates to:
  /// **'Respondió'**
  String get sessionBoardSeatAnswered;

  /// No description provided for @sessionBoardSeatPending.
  ///
  /// In es, this message translates to:
  /// **'Pendiente'**
  String get sessionBoardSeatPending;

  /// No description provided for @sessionBoardSeatOffline.
  ///
  /// In es, this message translates to:
  /// **'Sin red'**
  String get sessionBoardSeatOffline;

  /// No description provided for @sessionBoardSeatSyncing.
  ///
  /// In es, this message translates to:
  /// **'Sincroniz.'**
  String get sessionBoardSeatSyncing;

  /// No description provided for @sessionBoardSeatSaved.
  ///
  /// In es, this message translates to:
  /// **'Guardado'**
  String get sessionBoardSeatSaved;

  /// No description provided for @sessionBoardSeatSyncedLate.
  ///
  /// In es, this message translates to:
  /// **'Llegó tarde'**
  String get sessionBoardSeatSyncedLate;

  /// No description provided for @sessionBoardSeatSkipped.
  ///
  /// In es, this message translates to:
  /// **'Omitido'**
  String get sessionBoardSeatSkipped;

  /// No description provided for @sessionBoardSeatMissed.
  ///
  /// In es, this message translates to:
  /// **'No respondió'**
  String get sessionBoardSeatMissed;

  /// No description provided for @sessionBoardSeatProgress.
  ///
  /// In es, this message translates to:
  /// **'{done}/{total}'**
  String sessionBoardSeatProgress(int done, int total);

  /// No description provided for @sessionBoardLegendTitle.
  ///
  /// In es, this message translates to:
  /// **'Leyenda de la mesa'**
  String get sessionBoardLegendTitle;

  /// No description provided for @sessionBoardLegendOffline.
  ///
  /// In es, this message translates to:
  /// **'Sin red / guardado en su teléfono'**
  String get sessionBoardLegendOffline;

  /// No description provided for @sessionBoardLegendSyncedLate.
  ///
  /// In es, this message translates to:
  /// **'Sincronizó tarde'**
  String get sessionBoardLegendSyncedLate;

  /// No description provided for @sessionBoardLegendNote.
  ///
  /// In es, this message translates to:
  /// **'Corona = facilitador (también responde) · ●● = reflexión y compromiso dentro de Valor'**
  String get sessionBoardLegendNote;

  /// No description provided for @sessionBoardDockOpen.
  ///
  /// In es, this message translates to:
  /// **'Abrir sesión'**
  String get sessionBoardDockOpen;

  /// No description provided for @sessionBoardDockFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Abrir seguimiento'**
  String get sessionBoardDockFollowUp;

  /// No description provided for @sessionBoardDockValue.
  ///
  /// In es, this message translates to:
  /// **'Abrir valor actual'**
  String get sessionBoardDockValue;

  /// No description provided for @sessionBoardDockCloseAnswers.
  ///
  /// In es, this message translates to:
  /// **'Cerrar respuestas'**
  String get sessionBoardDockCloseAnswers;

  /// No description provided for @sessionBoardDockCloseSession.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get sessionBoardDockCloseSession;

  /// No description provided for @sessionBoardDockAnnounceOpen.
  ///
  /// In es, this message translates to:
  /// **'Anunciar: abrir sesión'**
  String get sessionBoardDockAnnounceOpen;

  /// No description provided for @sessionBoardDockAnnounceFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Anunciar: seguimiento'**
  String get sessionBoardDockAnnounceFollowUp;

  /// No description provided for @sessionBoardDockAnnounceValue.
  ///
  /// In es, this message translates to:
  /// **'Anunciar: valor actual'**
  String get sessionBoardDockAnnounceValue;

  /// No description provided for @sessionBoardDockAnnounceCloseAnswers.
  ///
  /// In es, this message translates to:
  /// **'Anunciar: cerrar respuestas'**
  String get sessionBoardDockAnnounceCloseAnswers;

  /// No description provided for @sessionBoardSessionClosed.
  ///
  /// In es, this message translates to:
  /// **'Sesión cerrada'**
  String get sessionBoardSessionClosed;

  /// No description provided for @sessionBoardMarkEveryonePresent.
  ///
  /// In es, this message translates to:
  /// **'Marcar a todos Presente'**
  String get sessionBoardMarkEveryonePresent;

  /// No description provided for @sessionBoardAnswerMyself.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Responder yo · falta 1 paso} other{Responder yo · faltan {count} pasos}}'**
  String sessionBoardAnswerMyself(int count);

  /// No description provided for @sessionBoardHintOpen.
  ///
  /// In es, this message translates to:
  /// **'Al abrir, los miembros ven la sesión en vivo.'**
  String get sessionBoardHintOpen;

  /// No description provided for @sessionBoardHintAttendance.
  ///
  /// In es, this message translates to:
  /// **'Marca a cada persona tocando su asiento.'**
  String get sessionBoardHintAttendance;

  /// No description provided for @sessionBoardHintFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Los miembros esperan hasta que abras la etapa.'**
  String get sessionBoardHintFollowUp;

  /// No description provided for @sessionBoardHintValue.
  ///
  /// In es, this message translates to:
  /// **'Valor actual incluye el compromiso. Al cerrar respuestas, los teléfonos en línea dejan de enviar.'**
  String get sessionBoardHintValue;

  /// No description provided for @sessionBoardHintClosing.
  ///
  /// In es, this message translates to:
  /// **'Respuestas cerradas. Cierra la sesión para enviar el resumen.'**
  String get sessionBoardHintClosing;

  /// No description provided for @sessionBoardHintVerbal.
  ///
  /// In es, this message translates to:
  /// **'Sin internet: los botones son guía verbal; cada teléfono avanza a su ritmo.'**
  String get sessionBoardHintVerbal;

  /// No description provided for @sessionBoardHintClosedPending.
  ///
  /// In es, this message translates to:
  /// **'Cerrada en este teléfono · pendiente de sincronizar'**
  String get sessionBoardHintClosedPending;

  /// No description provided for @sessionBoardHintClosedSynced.
  ///
  /// In es, this message translates to:
  /// **'Cierre sincronizado · los teléfonos que lleguen después se marcan “tarde”.'**
  String get sessionBoardHintClosedSynced;

  /// No description provided for @sessionBoardHintNotYet.
  ///
  /// In es, this message translates to:
  /// **'La sesión se puede abrir desde 12 horas antes: {when}.'**
  String sessionBoardHintNotYet(String when);

  /// No description provided for @sessionBoardVerbalTitle.
  ///
  /// In es, this message translates to:
  /// **'Guía verbal'**
  String get sessionBoardVerbalTitle;

  /// No description provided for @sessionBoardVerbalOpen.
  ///
  /// In es, this message translates to:
  /// **'Abrimos la mesa. Abran la app y esperen mis indicaciones.'**
  String get sessionBoardVerbalOpen;

  /// No description provided for @sessionBoardVerbalAttendance.
  ///
  /// In es, this message translates to:
  /// **'Yo marco la asistencia en mi teléfono. Digan “presente” cuando los nombre.'**
  String get sessionBoardVerbalAttendance;

  /// No description provided for @sessionBoardVerbalFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Abran Seguimiento: cuenten qué hicieron con su compromiso y califíquense en {previous}.'**
  String sessionBoardVerbalFollowUp(String previous);

  /// No description provided for @sessionBoardVerbalValue.
  ///
  /// In es, this message translates to:
  /// **'Abran Valor actual: {current}. Respondan, pónganse un puntaje (sin 5) y escriban su compromiso: qué, cuándo y cómo lo medirán.'**
  String sessionBoardVerbalValue(String current);

  /// No description provided for @sessionBoardVerbalClosing.
  ///
  /// In es, this message translates to:
  /// **'Cerramos respuestas. Guarden lo que falte; con internet se sincroniza solo. Ahora cierro la sesión.'**
  String get sessionBoardVerbalClosing;

  /// No description provided for @sessionBoardAttendanceMissing.
  ///
  /// In es, this message translates to:
  /// **'Falta marcar asistencia: {names}.'**
  String sessionBoardAttendanceMissing(String names);

  /// No description provided for @sessionBoardAttendanceTitle.
  ///
  /// In es, this message translates to:
  /// **'Asistencia · {name}'**
  String sessionBoardAttendanceTitle(String name);

  /// No description provided for @sessionBoardAttendanceHint.
  ///
  /// In es, this message translates to:
  /// **'Toca una opción. Puedes cambiarla después.'**
  String get sessionBoardAttendanceHint;

  /// No description provided for @sessionBoardAttendanceUnmarked.
  ///
  /// In es, this message translates to:
  /// **'Asistencia sin marcar'**
  String get sessionBoardAttendanceUnmarked;

  /// No description provided for @sessionBoardAttendanceAutoNote.
  ///
  /// In es, this message translates to:
  /// **'asistencia automática'**
  String get sessionBoardAttendanceAutoNote;

  /// No description provided for @sessionBoardNoPreviousNote.
  ///
  /// In es, this message translates to:
  /// **'sin compromiso previo'**
  String get sessionBoardNoPreviousNote;

  /// No description provided for @sessionBoardGoToMyAnswers.
  ///
  /// In es, this message translates to:
  /// **'Ir a Mis respuestas'**
  String get sessionBoardGoToMyAnswers;

  /// No description provided for @sessionBoardGoToTable.
  ///
  /// In es, this message translates to:
  /// **'Ir a la mesa'**
  String get sessionBoardGoToTable;

  /// No description provided for @sessionBoardMiniStage.
  ///
  /// In es, this message translates to:
  /// **'La mesa está en: {stage}'**
  String sessionBoardMiniStage(String stage);

  /// No description provided for @sessionBoardMiniStageWithCount.
  ///
  /// In es, this message translates to:
  /// **'La mesa está en: {stage} · {done}/{total}'**
  String sessionBoardMiniStageWithCount(String stage, int done, int total);

  /// No description provided for @sessionBoardConfirmCloseAnswersTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Cerrar respuestas ya?'**
  String get sessionBoardConfirmCloseAnswersTitle;

  /// No description provided for @sessionBoardConfirmOpenValueTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Abrir valor actual ya?'**
  String get sessionBoardConfirmOpenValueTitle;

  /// No description provided for @sessionBoardConfirmCloseTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Cerrar la sesión?'**
  String get sessionBoardConfirmCloseTitle;

  /// No description provided for @sessionBoardConfirmMineTitle.
  ///
  /// In es, this message translates to:
  /// **'Tus propias respuestas están incompletas'**
  String get sessionBoardConfirmMineTitle;

  /// No description provided for @sessionBoardConfirmMineBody.
  ///
  /// In es, this message translates to:
  /// **'Falta: {steps}. Si cierras ahora, ya no podrás enviarlas.'**
  String sessionBoardConfirmMineBody(String steps);

  /// No description provided for @sessionBoardConfirmEveryoneAnswered.
  ///
  /// In es, this message translates to:
  /// **'Todos los demás ya respondieron.'**
  String get sessionBoardConfirmEveryoneAnswered;

  /// No description provided for @sessionBoardConfirmPending.
  ///
  /// In es, this message translates to:
  /// **'Aún no responden: {names}.{mode, select, close{} other{ Podrán volver a la etapa anterior hasta que cierres respuestas.}}'**
  String sessionBoardConfirmPending(String names, String mode);

  /// No description provided for @sessionBoardConfirmCloseBody.
  ///
  /// In es, this message translates to:
  /// **'Se envía el resumen a la organización. Si algún teléfono sin red responde después, sus respuestas se aceptan y quedan marcadas “Sincronizado tarde”.'**
  String get sessionBoardConfirmCloseBody;

  /// No description provided for @sessionBoardConfirmCloseIncomplete.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Hay 1 persona con respuestas incompletas.} other{Hay {count} personas con respuestas incompletas.}}'**
  String sessionBoardConfirmCloseIncomplete(int count);

  /// No description provided for @sessionBoardAnswerNow.
  ///
  /// In es, this message translates to:
  /// **'Responder yo ahora'**
  String get sessionBoardAnswerNow;

  /// No description provided for @sessionBoardWait.
  ///
  /// In es, this message translates to:
  /// **'Esperar'**
  String get sessionBoardWait;

  /// No description provided for @sessionBoardCloseAnyway.
  ///
  /// In es, this message translates to:
  /// **'Cerrar de todos modos'**
  String get sessionBoardCloseAnyway;

  /// No description provided for @sessionBoardOpenNow.
  ///
  /// In es, this message translates to:
  /// **'Abrir ahora'**
  String get sessionBoardOpenNow;

  /// No description provided for @sessionBoardChipCurrent.
  ///
  /// In es, this message translates to:
  /// **'Actual'**
  String get sessionBoardChipCurrent;

  /// No description provided for @sessionBoardChipPrevious.
  ///
  /// In es, this message translates to:
  /// **'Anterior'**
  String get sessionBoardChipPrevious;

  /// No description provided for @sessionBoardInfoTitle.
  ///
  /// In es, this message translates to:
  /// **'Sesión de hoy'**
  String get sessionBoardInfoTitle;

  /// No description provided for @sessionBoardInfoTable.
  ///
  /// In es, this message translates to:
  /// **'Mesa'**
  String get sessionBoardInfoTable;

  /// No description provided for @sessionBoardInfoOrganization.
  ///
  /// In es, this message translates to:
  /// **'Organización'**
  String get sessionBoardInfoOrganization;

  /// No description provided for @sessionBoardInfoScheduled.
  ///
  /// In es, this message translates to:
  /// **'Programada'**
  String get sessionBoardInfoScheduled;

  /// No description provided for @sessionBoardInfoMaxMinutes.
  ///
  /// In es, this message translates to:
  /// **'{minutes} min máx.'**
  String sessionBoardInfoMaxMinutes(int minutes);

  /// No description provided for @sessionBoardInfoCurrentValue.
  ///
  /// In es, this message translates to:
  /// **'Valor actual'**
  String get sessionBoardInfoCurrentValue;

  /// No description provided for @sessionBoardInfoPreviousValue.
  ///
  /// In es, this message translates to:
  /// **'Valor anterior'**
  String get sessionBoardInfoPreviousValue;

  /// No description provided for @sessionBoardInfoSeats.
  ///
  /// In es, this message translates to:
  /// **'Lugares'**
  String get sessionBoardInfoSeats;

  /// No description provided for @sessionBoardInfoSeatsValue.
  ///
  /// In es, this message translates to:
  /// **'{taken} de {max} (facilitador incluido)'**
  String sessionBoardInfoSeatsValue(int taken, int max);

  /// No description provided for @sessionBoardActivityTitle.
  ///
  /// In es, this message translates to:
  /// **'En vivo · actividad'**
  String get sessionBoardActivityTitle;

  /// No description provided for @sessionBoardActivityEmpty.
  ///
  /// In es, this message translates to:
  /// **'Aún no hay actividad. Abre la sesión para empezar.'**
  String get sessionBoardActivityEmpty;

  /// No description provided for @sessionBoardActivityAnswered.
  ///
  /// In es, this message translates to:
  /// **'{name} respondió {step}'**
  String sessionBoardActivityAnswered(String name, String step);

  /// No description provided for @sessionBoardActivityAttendance.
  ///
  /// In es, this message translates to:
  /// **'Asistencia de {name} marcada'**
  String sessionBoardActivityAttendance(String name);

  /// No description provided for @sessionBoardActivityAutoAttendance.
  ///
  /// In es, this message translates to:
  /// **'{name} pasó a Presente (asistencia automática)'**
  String sessionBoardActivityAutoAttendance(String name);

  /// No description provided for @sessionBoardActivityLate.
  ///
  /// In es, this message translates to:
  /// **'sincronizado tarde'**
  String get sessionBoardActivityLate;

  /// No description provided for @sessionBoardSummaryPresent.
  ///
  /// In es, this message translates to:
  /// **'Presentes (incluye facilitador)'**
  String get sessionBoardSummaryPresent;

  /// No description provided for @sessionBoardSummaryPresentWithAbsent.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Presentes · 1 ausente} other{Presentes · {count} ausentes}}'**
  String sessionBoardSummaryPresentWithAbsent(int count);

  /// No description provided for @sessionBoardSummaryDuration.
  ///
  /// In es, this message translates to:
  /// **'Duración (meta {minutes}:00)'**
  String sessionBoardSummaryDuration(int minutes);

  /// No description provided for @sessionBoardSummaryFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento · prom. {average}'**
  String sessionBoardSummaryFollowUp(String average);

  /// No description provided for @sessionBoardSummaryValue.
  ///
  /// In es, this message translates to:
  /// **'Valor actual · prom. {average}'**
  String sessionBoardSummaryValue(String average);

  /// No description provided for @sessionBoardSummaryCommitments.
  ///
  /// In es, this message translates to:
  /// **'Compromisos recibidos (parte de Valor actual)'**
  String get sessionBoardSummaryCommitments;

  /// No description provided for @sessionBoardSummaryAutoTitle.
  ///
  /// In es, this message translates to:
  /// **'Asistencia automática'**
  String get sessionBoardSummaryAutoTitle;

  /// No description provided for @sessionBoardSummaryAutoBody.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 persona estaba Ausente, respondió y pasó a Presente.} other{{count} personas estaban Ausente, respondieron y pasaron a Presente.}}'**
  String sessionBoardSummaryAutoBody(int count);

  /// No description provided for @sessionBoardSummaryLateBody.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 respuesta llegó después del cierre. Se aceptó y quedó marcada.} other{{count} respuestas llegaron después del cierre. Se aceptaron y quedaron marcadas.}}'**
  String sessionBoardSummaryLateBody(int count);

  /// No description provided for @sessionBoardSummaryUnsyncedTitle.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Falta 1 respuesta por sincronizar} other{Faltan {count} respuestas por sincronizar}}'**
  String sessionBoardSummaryUnsyncedTitle(int count);

  /// No description provided for @sessionBoardSummaryUnsyncedBody.
  ///
  /// In es, this message translates to:
  /// **'Están en teléfonos sin conexión; el resumen se actualizará cuando lleguen.'**
  String get sessionBoardSummaryUnsyncedBody;

  /// No description provided for @sessionBoardErrorTransition.
  ///
  /// In es, this message translates to:
  /// **'Ese cambio de etapa no es posible ahora. Revisa el estado de la sesión.'**
  String get sessionBoardErrorTransition;

  /// No description provided for @sessionBoardErrorFinalized.
  ///
  /// In es, this message translates to:
  /// **'La sesión ya está cerrada.'**
  String get sessionBoardErrorFinalized;

  /// No description provided for @sessionBoardErrorNotFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Solo el facilitador de esta mesa puede controlar la sesión.'**
  String get sessionBoardErrorNotFacilitator;
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
