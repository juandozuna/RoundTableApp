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

  /// No description provided for @adminNavExplorer.
  ///
  /// In es, this message translates to:
  /// **'Mesas'**
  String get adminNavExplorer;

  /// No description provided for @adminAppBarTitle.
  ///
  /// In es, this message translates to:
  /// **'Administración'**
  String get adminAppBarTitle;

  /// No description provided for @auditStateScheduled.
  ///
  /// In es, this message translates to:
  /// **'programada'**
  String get auditStateScheduled;

  /// No description provided for @auditStateOpen.
  ///
  /// In es, this message translates to:
  /// **'abierta'**
  String get auditStateOpen;

  /// No description provided for @auditStateClosed.
  ///
  /// In es, this message translates to:
  /// **'cerrada'**
  String get auditStateClosed;

  /// No description provided for @auditStateCancelled.
  ///
  /// In es, this message translates to:
  /// **'cancelada'**
  String get auditStateCancelled;

  /// No description provided for @kpiNavReports.
  ///
  /// In es, this message translates to:
  /// **'Informes'**
  String get kpiNavReports;

  /// No description provided for @auditTitle.
  ///
  /// In es, this message translates to:
  /// **'Auditoría'**
  String get auditTitle;

  /// No description provided for @adminExplorerTitle.
  ///
  /// In es, this message translates to:
  /// **'Explorador'**
  String get adminExplorerTitle;

  /// No description provided for @adminMyOrganization.
  ///
  /// In es, this message translates to:
  /// **'Mi organización'**
  String get adminMyOrganization;

  /// No description provided for @adminPaletteTooltip.
  ///
  /// In es, this message translates to:
  /// **'Buscar o ejecutar (Ctrl+K)'**
  String get adminPaletteTooltip;

  /// No description provided for @adminDeniedTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin permiso'**
  String get adminDeniedTitle;

  /// No description provided for @adminDeniedAction.
  ///
  /// In es, this message translates to:
  /// **'Ir al explorador'**
  String get adminDeniedAction;

  /// No description provided for @adminDeniedRoleMessage.
  ///
  /// In es, this message translates to:
  /// **'Tu rol no incluye la administración. Si crees que es un error, pide acceso a una persona de la iglesia.'**
  String get adminDeniedRoleMessage;

  /// No description provided for @adminDeniedAdminOnlyMessage.
  ///
  /// In es, this message translates to:
  /// **'Esta acción es solo para el Administrador (personal de la iglesia).'**
  String get adminDeniedAdminOnlyMessage;

  /// No description provided for @adminDeniedOrganizationTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin permiso para esta organización'**
  String get adminDeniedOrganizationTitle;

  /// No description provided for @adminDeniedOrganizationMessage.
  ///
  /// In es, this message translates to:
  /// **'Tu rol de Coordinador solo ve y administra su propia organización. Esa organización pertenece a otro espacio.'**
  String get adminDeniedOrganizationMessage;

  /// No description provided for @adminDeniedTableTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin permiso para esta mesa'**
  String get adminDeniedTableTitle;

  /// No description provided for @adminDeniedTableMessage.
  ///
  /// In es, this message translates to:
  /// **'No encontramos esta mesa en tu organización. Puede que pertenezca a otro espacio.'**
  String get adminDeniedTableMessage;

  /// No description provided for @adminDeniedPersonTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin permiso para esta persona'**
  String get adminDeniedPersonTitle;

  /// No description provided for @adminDeniedPersonMessage.
  ///
  /// In es, this message translates to:
  /// **'No encontramos a esta persona en tu organización.'**
  String get adminDeniedPersonMessage;

  /// No description provided for @adminGoToMyOrganization.
  ///
  /// In es, this message translates to:
  /// **'Ir a mi organización'**
  String get adminGoToMyOrganization;

  /// No description provided for @adminGoToExplorer.
  ///
  /// In es, this message translates to:
  /// **'Ir al explorador'**
  String get adminGoToExplorer;

  /// No description provided for @adminBackToExplorer.
  ///
  /// In es, this message translates to:
  /// **'Volver al explorador'**
  String get adminBackToExplorer;

  /// No description provided for @adminAdministratorOnly.
  ///
  /// In es, this message translates to:
  /// **'Solo Administrador'**
  String get adminAdministratorOnly;

  /// No description provided for @adminOfflineFormTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin conexión'**
  String get adminOfflineFormTitle;

  /// No description provided for @adminOfflineFormDetail.
  ///
  /// In es, this message translates to:
  /// **'Puedes llenar el formulario, pero guardar requiere internet.'**
  String get adminOfflineFormDetail;

  /// No description provided for @adminCreate.
  ///
  /// In es, this message translates to:
  /// **'Crear'**
  String get adminCreate;

  /// No description provided for @adminCreateTable.
  ///
  /// In es, this message translates to:
  /// **'Crear mesa'**
  String get adminCreateTable;

  /// No description provided for @adminCreateOrganization.
  ///
  /// In es, this message translates to:
  /// **'Crear organización'**
  String get adminCreateOrganization;

  /// No description provided for @adminCreateLocation.
  ///
  /// In es, this message translates to:
  /// **'Crear ubicación'**
  String get adminCreateLocation;

  /// No description provided for @adminInvitePerson.
  ///
  /// In es, this message translates to:
  /// **'Invitar persona'**
  String get adminInvitePerson;

  /// No description provided for @adminInviteCoordinator.
  ///
  /// In es, this message translates to:
  /// **'Invitar coordinador'**
  String get adminInviteCoordinator;

  /// No description provided for @adminInviteFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Invitar facilitador'**
  String get adminInviteFacilitator;

  /// No description provided for @adminInviteMember.
  ///
  /// In es, this message translates to:
  /// **'Invitar miembro'**
  String get adminInviteMember;

  /// No description provided for @adminSaveChanges.
  ///
  /// In es, this message translates to:
  /// **'Guardar cambios'**
  String get adminSaveChanges;

  /// No description provided for @adminDensityCompact.
  ///
  /// In es, this message translates to:
  /// **'Compacta'**
  String get adminDensityCompact;

  /// No description provided for @adminDensityComfortable.
  ///
  /// In es, this message translates to:
  /// **'Cómoda'**
  String get adminDensityComfortable;

  /// No description provided for @adminEntityTables.
  ///
  /// In es, this message translates to:
  /// **'Mesas'**
  String get adminEntityTables;

  /// No description provided for @adminEntityOrganizations.
  ///
  /// In es, this message translates to:
  /// **'Organizaciones'**
  String get adminEntityOrganizations;

  /// No description provided for @adminEntityPeople.
  ///
  /// In es, this message translates to:
  /// **'Personas'**
  String get adminEntityPeople;

  /// No description provided for @adminViews.
  ///
  /// In es, this message translates to:
  /// **'Vistas'**
  String get adminViews;

  /// No description provided for @adminSaveView.
  ///
  /// In es, this message translates to:
  /// **'Guardar vista'**
  String get adminSaveView;

  /// No description provided for @adminSaveViewTitle.
  ///
  /// In es, this message translates to:
  /// **'Guardar vista'**
  String get adminSaveViewTitle;

  /// No description provided for @adminSaveViewName.
  ///
  /// In es, this message translates to:
  /// **'Nombre de la vista'**
  String get adminSaveViewName;

  /// No description provided for @adminViewSaved.
  ///
  /// In es, this message translates to:
  /// **'Vista «{name}» guardada'**
  String adminViewSaved(String name);

  /// No description provided for @adminDeleteViewTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar vista'**
  String get adminDeleteViewTitle;

  /// No description provided for @adminDeleteViewMessage.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar la vista «{name}»? Solo se borra en este dispositivo.'**
  String adminDeleteViewMessage(String name);

  /// No description provided for @adminDeleteViewTooltip.
  ///
  /// In es, this message translates to:
  /// **'Eliminar la vista {name}'**
  String adminDeleteViewTooltip(String name);

  /// No description provided for @adminViewAll.
  ///
  /// In es, this message translates to:
  /// **'Todas'**
  String get adminViewAll;

  /// No description provided for @adminViewDelayed.
  ///
  /// In es, this message translates to:
  /// **'Mesas retrasadas'**
  String get adminViewDelayed;

  /// No description provided for @adminViewLowAttendance.
  ///
  /// In es, this message translates to:
  /// **'Baja asistencia'**
  String get adminViewLowAttendance;

  /// No description provided for @adminViewSyncedLate.
  ///
  /// In es, this message translates to:
  /// **'Sincronizado tarde'**
  String get adminViewSyncedLate;

  /// No description provided for @adminViewPaused.
  ///
  /// In es, this message translates to:
  /// **'Pausadas / desactivadas'**
  String get adminViewPaused;

  /// No description provided for @adminViewWithoutTables.
  ///
  /// In es, this message translates to:
  /// **'Sin mesas'**
  String get adminViewWithoutTables;

  /// No description provided for @adminViewWithoutCoordinator.
  ///
  /// In es, this message translates to:
  /// **'Sin coordinador'**
  String get adminViewWithoutCoordinator;

  /// No description provided for @adminViewCoordinators.
  ///
  /// In es, this message translates to:
  /// **'Coordinadores'**
  String get adminViewCoordinators;

  /// No description provided for @adminViewFacilitators.
  ///
  /// In es, this message translates to:
  /// **'Facilitadores'**
  String get adminViewFacilitators;

  /// No description provided for @adminViewMembers.
  ///
  /// In es, this message translates to:
  /// **'Miembros'**
  String get adminViewMembers;

  /// No description provided for @adminViewPendingInvites.
  ///
  /// In es, this message translates to:
  /// **'Invitaciones pendientes'**
  String get adminViewPendingInvites;

  /// No description provided for @adminViewInactive.
  ///
  /// In es, this message translates to:
  /// **'Inactivos'**
  String get adminViewInactive;

  /// No description provided for @adminSearchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar {entity}…'**
  String adminSearchHint(String entity);

  /// No description provided for @adminFilters.
  ///
  /// In es, this message translates to:
  /// **'Filtros'**
  String get adminFilters;

  /// No description provided for @adminFiltersCount.
  ///
  /// In es, this message translates to:
  /// **'Filtros ({count})'**
  String adminFiltersCount(int count);

  /// No description provided for @adminFilterAll.
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get adminFilterAll;

  /// No description provided for @adminFilterCountry.
  ///
  /// In es, this message translates to:
  /// **'País'**
  String get adminFilterCountry;

  /// No description provided for @adminFilterOrganization.
  ///
  /// In es, this message translates to:
  /// **'Organización'**
  String get adminFilterOrganization;

  /// No description provided for @adminFilterLocation.
  ///
  /// In es, this message translates to:
  /// **'Ubicación'**
  String get adminFilterLocation;

  /// No description provided for @adminFilterFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Facilitador'**
  String get adminFilterFacilitator;

  /// No description provided for @adminFilterRole.
  ///
  /// In es, this message translates to:
  /// **'Rol'**
  String get adminFilterRole;

  /// No description provided for @adminFilterStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado'**
  String get adminFilterStatus;

  /// No description provided for @adminClearAll.
  ///
  /// In es, this message translates to:
  /// **'Limpiar todo'**
  String get adminClearAll;

  /// No description provided for @adminClearFilters.
  ///
  /// In es, this message translates to:
  /// **'Limpiar filtros'**
  String get adminClearFilters;

  /// No description provided for @adminClearFiltersAndView.
  ///
  /// In es, this message translates to:
  /// **'Limpiar filtros y vista'**
  String get adminClearFiltersAndView;

  /// No description provided for @adminShowResults.
  ///
  /// In es, this message translates to:
  /// **'Ver {count, plural, =1{1 resultado} other{{count} resultados}}'**
  String adminShowResults(int count);

  /// No description provided for @adminOrganizationLock.
  ///
  /// In es, this message translates to:
  /// **'Organización: {name}'**
  String adminOrganizationLock(String name);

  /// No description provided for @adminRemoveFilterTooltip.
  ///
  /// In es, this message translates to:
  /// **'Quitar el filtro {filter}'**
  String adminRemoveFilterTooltip(String filter);

  /// No description provided for @adminSelectRow.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar {name}'**
  String adminSelectRow(String name);

  /// No description provided for @adminSelection.
  ///
  /// In es, this message translates to:
  /// **'Selección'**
  String get adminSelection;

  /// No description provided for @adminCurrentView.
  ///
  /// In es, this message translates to:
  /// **'Vista actual'**
  String get adminCurrentView;

  /// No description provided for @adminSelected.
  ///
  /// In es, this message translates to:
  /// **'Seleccionadas'**
  String get adminSelected;

  /// No description provided for @adminSelectedCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 seleccionada} other{{count} seleccionadas}}'**
  String adminSelectedCount(int count);

  /// No description provided for @adminSelectionHint.
  ///
  /// In es, this message translates to:
  /// **'Marca filas para sumar sus KPIs aquí. Sin selección se resume la vista filtrada.'**
  String get adminSelectionHint;

  /// No description provided for @adminSelectionKpis.
  ///
  /// In es, this message translates to:
  /// **'KPIs de la selección'**
  String get adminSelectionKpis;

  /// No description provided for @adminSeeKpis.
  ///
  /// In es, this message translates to:
  /// **'Ver KPIs'**
  String get adminSeeKpis;

  /// No description provided for @adminRemoveFromSelection.
  ///
  /// In es, this message translates to:
  /// **'Quitar {name} de la selección'**
  String adminRemoveFromSelection(String name);

  /// No description provided for @adminClearSelection.
  ///
  /// In es, this message translates to:
  /// **'Limpiar selección'**
  String get adminClearSelection;

  /// No description provided for @adminOpenInReports.
  ///
  /// In es, this message translates to:
  /// **'Abrir en Informes'**
  String get adminOpenInReports;

  /// No description provided for @adminExportCsv.
  ///
  /// In es, this message translates to:
  /// **'Exportar CSV'**
  String get adminExportCsv;

  /// No description provided for @adminExportFailed.
  ///
  /// In es, this message translates to:
  /// **'No se pudo exportar el archivo.'**
  String get adminExportFailed;

  /// No description provided for @adminNoTablesToAggregate.
  ///
  /// In es, this message translates to:
  /// **'Sin mesas para sumar'**
  String get adminNoTablesToAggregate;

  /// No description provided for @adminLowAttendanceTables.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 mesa con asistencia menor al 70 %} other{{count} mesas con asistencia menor al 70 %}}'**
  String adminLowAttendanceTables(int count);

  /// No description provided for @adminLowAttendanceThreshold.
  ///
  /// In es, this message translates to:
  /// **'Umbral de alerta definido por la iglesia.'**
  String get adminLowAttendanceThreshold;

  /// No description provided for @adminTablesCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{Sin mesas} =1{1 mesa} other{{count} mesas}}'**
  String adminTablesCount(int count);

  /// No description provided for @adminPeopleCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{Sin personas} =1{1 persona} other{{count} personas}}'**
  String adminPeopleCount(int count);

  /// No description provided for @adminOrganizationsCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 organización} other{{count} organizaciones}}'**
  String adminOrganizationsCount(int count);

  /// No description provided for @adminTablesStatusBreakdown.
  ///
  /// In es, this message translates to:
  /// **'{active} activas · {delayed} retrasadas · {inactive} inactivas'**
  String adminTablesStatusBreakdown(int active, int delayed, int inactive);

  /// No description provided for @adminEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Aún no hay {entity}'**
  String adminEmptyTitle(String entity);

  /// No description provided for @adminEmptyMessage.
  ///
  /// In es, this message translates to:
  /// **'Crea la primera con el botón Crear para empezar a ver KPIs.'**
  String get adminEmptyMessage;

  /// No description provided for @adminNoResultsTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados'**
  String get adminNoResultsTitle;

  /// No description provided for @adminNoResultsMessage.
  ///
  /// In es, this message translates to:
  /// **'Ningún elemento coincide con esta vista y estos filtros.'**
  String get adminNoResultsMessage;

  /// No description provided for @adminRowsOfTotal.
  ///
  /// In es, this message translates to:
  /// **'{visible} de {total} · {selected, plural, =0{0 seleccionadas} =1{1 seleccionada} other{{selected} seleccionadas}}'**
  String adminRowsOfTotal(int visible, int total, int selected);

  /// No description provided for @adminDataUpdated.
  ///
  /// In es, this message translates to:
  /// **'Datos actualizados {time} · en línea'**
  String adminDataUpdated(String time);

  /// No description provided for @adminDataSavedReadOnly.
  ///
  /// In es, this message translates to:
  /// **'Datos guardados · solo lectura'**
  String get adminDataSavedReadOnly;

  /// No description provided for @adminColTable.
  ///
  /// In es, this message translates to:
  /// **'Mesa'**
  String get adminColTable;

  /// No description provided for @adminColCode.
  ///
  /// In es, this message translates to:
  /// **'Código'**
  String get adminColCode;

  /// No description provided for @adminColName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get adminColName;

  /// No description provided for @adminColOrganization.
  ///
  /// In es, this message translates to:
  /// **'Organización'**
  String get adminColOrganization;

  /// No description provided for @adminColLocation.
  ///
  /// In es, this message translates to:
  /// **'Ubicación'**
  String get adminColLocation;

  /// No description provided for @adminColOrganizationLocation.
  ///
  /// In es, this message translates to:
  /// **'Organización / ubicación'**
  String get adminColOrganizationLocation;

  /// No description provided for @adminColFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Facilitador'**
  String get adminColFacilitator;

  /// No description provided for @adminColSeats.
  ///
  /// In es, this message translates to:
  /// **'Plazas'**
  String get adminColSeats;

  /// No description provided for @adminColStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado'**
  String get adminColStatus;

  /// No description provided for @adminColAttendance.
  ///
  /// In es, this message translates to:
  /// **'Asistencia'**
  String get adminColAttendance;

  /// No description provided for @adminColValues.
  ///
  /// In es, this message translates to:
  /// **'Valores'**
  String get adminColValues;

  /// No description provided for @adminColImprovement.
  ///
  /// In es, this message translates to:
  /// **'Mejora'**
  String get adminColImprovement;

  /// No description provided for @adminColLate.
  ///
  /// In es, this message translates to:
  /// **'Tarde'**
  String get adminColLate;

  /// No description provided for @adminColKind.
  ///
  /// In es, this message translates to:
  /// **'Tipo'**
  String get adminColKind;

  /// No description provided for @adminColCountry.
  ///
  /// In es, this message translates to:
  /// **'País'**
  String get adminColCountry;

  /// No description provided for @adminColTables.
  ///
  /// In es, this message translates to:
  /// **'Mesas'**
  String get adminColTables;

  /// No description provided for @adminColPeople.
  ///
  /// In es, this message translates to:
  /// **'Personas'**
  String get adminColPeople;

  /// No description provided for @adminColPerson.
  ///
  /// In es, this message translates to:
  /// **'Persona'**
  String get adminColPerson;

  /// No description provided for @adminColRole.
  ///
  /// In es, this message translates to:
  /// **'Rol'**
  String get adminColRole;

  /// No description provided for @adminNoFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Sin facilitador'**
  String get adminNoFacilitator;

  /// No description provided for @adminWithoutCoordinator.
  ///
  /// In es, this message translates to:
  /// **'Sin coordinador'**
  String get adminWithoutCoordinator;

  /// No description provided for @adminWithoutTables.
  ///
  /// In es, this message translates to:
  /// **'Sin mesas'**
  String get adminWithoutTables;

  /// No description provided for @adminWithoutTable.
  ///
  /// In es, this message translates to:
  /// **'Sin mesa'**
  String get adminWithoutTable;

  /// No description provided for @adminPlatformStaff.
  ///
  /// In es, this message translates to:
  /// **'Equipo de la iglesia'**
  String get adminPlatformStaff;

  /// No description provided for @adminPersonKindUnassigned.
  ///
  /// In es, this message translates to:
  /// **'Sin asignar'**
  String get adminPersonKindUnassigned;

  /// No description provided for @adminLateCount.
  ///
  /// In es, this message translates to:
  /// **'Tarde {count}'**
  String adminLateCount(int count);

  /// No description provided for @adminAttendanceLow.
  ///
  /// In es, this message translates to:
  /// **'por debajo del umbral'**
  String get adminAttendanceLow;

  /// No description provided for @adminHealthActive.
  ///
  /// In es, this message translates to:
  /// **'Al día'**
  String get adminHealthActive;

  /// No description provided for @adminHealthDelayed.
  ///
  /// In es, this message translates to:
  /// **'Retrasada'**
  String get adminHealthDelayed;

  /// No description provided for @adminHealthInactive.
  ///
  /// In es, this message translates to:
  /// **'Inactiva'**
  String get adminHealthInactive;

  /// No description provided for @adminHealthCompleted.
  ///
  /// In es, this message translates to:
  /// **'Completada'**
  String get adminHealthCompleted;

  /// No description provided for @adminTableStatusActive.
  ///
  /// In es, this message translates to:
  /// **'Activa'**
  String get adminTableStatusActive;

  /// No description provided for @adminTableStatusPaused.
  ///
  /// In es, this message translates to:
  /// **'Pausada'**
  String get adminTableStatusPaused;

  /// No description provided for @adminTableStatusCompleted.
  ///
  /// In es, this message translates to:
  /// **'Completada'**
  String get adminTableStatusCompleted;

  /// No description provided for @adminTableStatusClosed.
  ///
  /// In es, this message translates to:
  /// **'Cerrada'**
  String get adminTableStatusClosed;

  /// No description provided for @adminOrgStatusActive.
  ///
  /// In es, this message translates to:
  /// **'Activa'**
  String get adminOrgStatusActive;

  /// No description provided for @adminOrgStatusPaused.
  ///
  /// In es, this message translates to:
  /// **'Pausada'**
  String get adminOrgStatusPaused;

  /// No description provided for @adminOrgStatusInactive.
  ///
  /// In es, this message translates to:
  /// **'Desactivada'**
  String get adminOrgStatusInactive;

  /// No description provided for @adminPersonStatusActive.
  ///
  /// In es, this message translates to:
  /// **'Activo'**
  String get adminPersonStatusActive;

  /// No description provided for @adminPersonStatusInvited.
  ///
  /// In es, this message translates to:
  /// **'Invitación pendiente'**
  String get adminPersonStatusInvited;

  /// No description provided for @adminPersonStatusInactive.
  ///
  /// In es, this message translates to:
  /// **'Inactivo'**
  String get adminPersonStatusInactive;

  /// No description provided for @adminOrgKindFoundation.
  ///
  /// In es, this message translates to:
  /// **'Fundación'**
  String get adminOrgKindFoundation;

  /// No description provided for @adminOrgKindSchool.
  ///
  /// In es, this message translates to:
  /// **'Colegio'**
  String get adminOrgKindSchool;

  /// No description provided for @adminOrgKindCompany.
  ///
  /// In es, this message translates to:
  /// **'Empresa'**
  String get adminOrgKindCompany;

  /// No description provided for @adminOrgKindChurch.
  ///
  /// In es, this message translates to:
  /// **'Iglesia'**
  String get adminOrgKindChurch;

  /// No description provided for @adminOrgKindCommunity.
  ///
  /// In es, this message translates to:
  /// **'Comunidad'**
  String get adminOrgKindCommunity;

  /// No description provided for @adminOrgKindOther.
  ///
  /// In es, this message translates to:
  /// **'Otro'**
  String get adminOrgKindOther;

  /// No description provided for @adminWeekday1.
  ///
  /// In es, this message translates to:
  /// **'Lunes'**
  String get adminWeekday1;

  /// No description provided for @adminWeekday2.
  ///
  /// In es, this message translates to:
  /// **'Martes'**
  String get adminWeekday2;

  /// No description provided for @adminWeekday3.
  ///
  /// In es, this message translates to:
  /// **'Miércoles'**
  String get adminWeekday3;

  /// No description provided for @adminWeekday4.
  ///
  /// In es, this message translates to:
  /// **'Jueves'**
  String get adminWeekday4;

  /// No description provided for @adminWeekday5.
  ///
  /// In es, this message translates to:
  /// **'Viernes'**
  String get adminWeekday5;

  /// No description provided for @adminWeekday6.
  ///
  /// In es, this message translates to:
  /// **'Sábado'**
  String get adminWeekday6;

  /// No description provided for @adminWeekday7.
  ///
  /// In es, this message translates to:
  /// **'Domingo'**
  String get adminWeekday7;

  /// No description provided for @adminPaletteHint.
  ///
  /// In es, this message translates to:
  /// **'Escribe una acción o destino…'**
  String get adminPaletteHint;

  /// No description provided for @adminPaletteActions.
  ///
  /// In es, this message translates to:
  /// **'Acciones'**
  String get adminPaletteActions;

  /// No description provided for @adminPaletteSavedViews.
  ///
  /// In es, this message translates to:
  /// **'Vistas guardadas'**
  String get adminPaletteSavedViews;

  /// No description provided for @adminPaletteGoTo.
  ///
  /// In es, this message translates to:
  /// **'Ir a'**
  String get adminPaletteGoTo;

  /// No description provided for @adminPaletteTables.
  ///
  /// In es, this message translates to:
  /// **'Mesas'**
  String get adminPaletteTables;

  /// No description provided for @adminPaletteOpenView.
  ///
  /// In es, this message translates to:
  /// **'Abrir vista · {name}'**
  String adminPaletteOpenView(String name);

  /// No description provided for @adminPaletteGoToOrganization.
  ///
  /// In es, this message translates to:
  /// **'Ir a {name}'**
  String adminPaletteGoToOrganization(String name);

  /// No description provided for @adminPaletteGoToTable.
  ///
  /// In es, this message translates to:
  /// **'Ir a mesa {name}'**
  String adminPaletteGoToTable(String name);

  /// No description provided for @adminPaletteNoResults.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados para «{query}»'**
  String adminPaletteNoResults(String query);

  /// No description provided for @adminPaletteFooter.
  ///
  /// In es, this message translates to:
  /// **'↑ ↓ navegar · Enter ejecutar · Esc cerrar'**
  String get adminPaletteFooter;

  /// No description provided for @adminOrganizationTitle.
  ///
  /// In es, this message translates to:
  /// **'Organización'**
  String get adminOrganizationTitle;

  /// No description provided for @adminEditOrganization.
  ///
  /// In es, this message translates to:
  /// **'Editar organización'**
  String get adminEditOrganization;

  /// No description provided for @adminPause.
  ///
  /// In es, this message translates to:
  /// **'Pausar'**
  String get adminPause;

  /// No description provided for @adminResume.
  ///
  /// In es, this message translates to:
  /// **'Reanudar'**
  String get adminResume;

  /// No description provided for @adminDeactivate.
  ///
  /// In es, this message translates to:
  /// **'Desactivar'**
  String get adminDeactivate;

  /// No description provided for @adminPauseTitle.
  ///
  /// In es, this message translates to:
  /// **'Pausar {name}'**
  String adminPauseTitle(String name);

  /// No description provided for @adminPauseMessage.
  ///
  /// In es, this message translates to:
  /// **'Se detienen las sesiones y las nuevas invitaciones. Los datos y el historial se conservan y puedes reanudar cuando quieras.'**
  String get adminPauseMessage;

  /// No description provided for @adminPauseConfirm.
  ///
  /// In es, this message translates to:
  /// **'Pausar organización'**
  String get adminPauseConfirm;

  /// No description provided for @adminResumeTitle.
  ///
  /// In es, this message translates to:
  /// **'Reanudar {name}'**
  String adminResumeTitle(String name);

  /// No description provided for @adminResumeMessage.
  ///
  /// In es, this message translates to:
  /// **'La organización vuelve a estar activa: las sesiones y las invitaciones se reanudan.'**
  String get adminResumeMessage;

  /// No description provided for @adminDeactivateTitle.
  ///
  /// In es, this message translates to:
  /// **'Desactivar {name}'**
  String adminDeactivateTitle(String name);

  /// No description provided for @adminDeactivateWarningTitle.
  ///
  /// In es, this message translates to:
  /// **'Acción difícil de revertir'**
  String get adminDeactivateWarningTitle;

  /// No description provided for @adminDeactivateWarningDetail.
  ///
  /// In es, this message translates to:
  /// **'Nadie de esta organización podrá iniciar sesión. El historial y los informes se conservan.'**
  String get adminDeactivateWarningDetail;

  /// No description provided for @adminDeactivateConfirm.
  ///
  /// In es, this message translates to:
  /// **'Desactivar organización'**
  String get adminDeactivateConfirm;

  /// No description provided for @adminTypeNameToConfirm.
  ///
  /// In es, this message translates to:
  /// **'Escribe «{name}» para confirmar'**
  String adminTypeNameToConfirm(String name);

  /// No description provided for @adminOrgPausedBannerTitle.
  ///
  /// In es, this message translates to:
  /// **'Organización pausada'**
  String get adminOrgPausedBannerTitle;

  /// No description provided for @adminOrgPausedBannerDetail.
  ///
  /// In es, this message translates to:
  /// **'Las sesiones y las nuevas invitaciones están detenidas. Datos e historial se conservan. Se puede reanudar.'**
  String get adminOrgPausedBannerDetail;

  /// No description provided for @adminOrgInactiveBannerTitle.
  ///
  /// In es, this message translates to:
  /// **'Organización desactivada'**
  String get adminOrgInactiveBannerTitle;

  /// No description provided for @adminOrgInactiveBannerDetail.
  ///
  /// In es, this message translates to:
  /// **'Nadie puede iniciar sesión en este espacio. El historial se conserva para auditoría.'**
  String get adminOrgInactiveBannerDetail;

  /// No description provided for @adminToastOrganizationPaused.
  ///
  /// In es, this message translates to:
  /// **'{name} pausada'**
  String adminToastOrganizationPaused(String name);

  /// No description provided for @adminToastOrganizationResumed.
  ///
  /// In es, this message translates to:
  /// **'{name} reanudada'**
  String adminToastOrganizationResumed(String name);

  /// No description provided for @adminToastOrganizationDeactivated.
  ///
  /// In es, this message translates to:
  /// **'{name} desactivada'**
  String adminToastOrganizationDeactivated(String name);

  /// No description provided for @adminToastOrganizationCreated.
  ///
  /// In es, this message translates to:
  /// **'Organización creada'**
  String get adminToastOrganizationCreated;

  /// No description provided for @adminToastOrganizationCreatedInvited.
  ///
  /// In es, this message translates to:
  /// **'Organización creada · invitación lista para compartir'**
  String get adminToastOrganizationCreatedInvited;

  /// No description provided for @adminToastOrganizationUpdated.
  ///
  /// In es, this message translates to:
  /// **'Organización actualizada'**
  String get adminToastOrganizationUpdated;

  /// No description provided for @adminCoordination.
  ///
  /// In es, this message translates to:
  /// **'Coordinación'**
  String get adminCoordination;

  /// No description provided for @adminNoCoordinatorTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin coordinador'**
  String get adminNoCoordinatorTitle;

  /// No description provided for @adminNoCoordinatorDetail.
  ///
  /// In es, this message translates to:
  /// **'Esta organización no puede crear mesas hasta tener un Coordinador.'**
  String get adminNoCoordinatorDetail;

  /// No description provided for @adminLocations.
  ///
  /// In es, this message translates to:
  /// **'Ubicaciones'**
  String get adminLocations;

  /// No description provided for @adminNewLocation.
  ///
  /// In es, this message translates to:
  /// **'Nueva ubicación'**
  String get adminNewLocation;

  /// No description provided for @adminNoLocations.
  ///
  /// In es, this message translates to:
  /// **'Sin ubicaciones todavía. Agrega la primera para poder crear mesas.'**
  String get adminNoLocations;

  /// No description provided for @adminEditLocation.
  ///
  /// In es, this message translates to:
  /// **'Editar ubicación'**
  String get adminEditLocation;

  /// No description provided for @adminOrgNoTablesTitle.
  ///
  /// In es, this message translates to:
  /// **'Esta organización aún no tiene mesas'**
  String get adminOrgNoTablesTitle;

  /// No description provided for @adminOrgNoTablesMessage.
  ///
  /// In es, this message translates to:
  /// **'Crea la primera mesa: elige ubicación, horario y facilitador.'**
  String get adminOrgNoTablesMessage;

  /// No description provided for @adminOrgNoTablesNeedsCoordinator.
  ///
  /// In es, this message translates to:
  /// **'Primero invita a un Coordinador; luego podrá crear mesas.'**
  String get adminOrgNoTablesNeedsCoordinator;

  /// No description provided for @adminCreateFirstTable.
  ///
  /// In es, this message translates to:
  /// **'Crear primera mesa'**
  String get adminCreateFirstTable;

  /// No description provided for @adminInviteFirstCoordinator.
  ///
  /// In es, this message translates to:
  /// **'Invitar primer coordinador'**
  String get adminInviteFirstCoordinator;

  /// No description provided for @adminMainData.
  ///
  /// In es, this message translates to:
  /// **'Datos principales'**
  String get adminMainData;

  /// No description provided for @adminRecentActivity.
  ///
  /// In es, this message translates to:
  /// **'Actividad reciente'**
  String get adminRecentActivity;

  /// No description provided for @adminNoActivity.
  ///
  /// In es, this message translates to:
  /// **'Sin actividad todavía.'**
  String get adminNoActivity;

  /// No description provided for @adminSeeInAudit.
  ///
  /// In es, this message translates to:
  /// **'Ver en auditoría'**
  String get adminSeeInAudit;

  /// No description provided for @adminSectionOrganization.
  ///
  /// In es, this message translates to:
  /// **'Organización'**
  String get adminSectionOrganization;

  /// No description provided for @adminSectionContact.
  ///
  /// In es, this message translates to:
  /// **'Contacto principal'**
  String get adminSectionContact;

  /// No description provided for @adminFieldOrganizationName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get adminFieldOrganizationName;

  /// No description provided for @adminFieldOrganizationNameHint.
  ///
  /// In es, this message translates to:
  /// **'Ej. Fundación Esperanza'**
  String get adminFieldOrganizationNameHint;

  /// No description provided for @adminFieldKind.
  ///
  /// In es, this message translates to:
  /// **'Tipo'**
  String get adminFieldKind;

  /// No description provided for @adminFieldRegion.
  ///
  /// In es, this message translates to:
  /// **'Región / ciudad'**
  String get adminFieldRegion;

  /// No description provided for @adminFieldContactName.
  ///
  /// In es, this message translates to:
  /// **'Nombre completo'**
  String get adminFieldContactName;

  /// No description provided for @adminFieldEmail.
  ///
  /// In es, this message translates to:
  /// **'Correo'**
  String get adminFieldEmail;

  /// No description provided for @adminFieldPhone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get adminFieldPhone;

  /// No description provided for @adminFieldPhoneHelper.
  ///
  /// In es, this message translates to:
  /// **'Se guarda como contacto sin verificar. No se usa para iniciar sesión.'**
  String get adminFieldPhoneHelper;

  /// No description provided for @adminInviteContactAsCoordinator.
  ///
  /// In es, this message translates to:
  /// **'Invitar ahora al contacto como primer Coordinador'**
  String get adminInviteContactAsCoordinator;

  /// No description provided for @adminFieldLocationName.
  ///
  /// In es, this message translates to:
  /// **'Nombre de la ubicación'**
  String get adminFieldLocationName;

  /// No description provided for @adminFieldLocationNameHint.
  ///
  /// In es, this message translates to:
  /// **'Ej. Sede Central'**
  String get adminFieldLocationNameHint;

  /// No description provided for @adminFieldCity.
  ///
  /// In es, this message translates to:
  /// **'Ciudad'**
  String get adminFieldCity;

  /// No description provided for @adminFieldAddress.
  ///
  /// In es, this message translates to:
  /// **'Dirección'**
  String get adminFieldAddress;

  /// No description provided for @adminFieldLocationActive.
  ///
  /// In es, this message translates to:
  /// **'Ubicación activa'**
  String get adminFieldLocationActive;

  /// No description provided for @adminToastLocationCreated.
  ///
  /// In es, this message translates to:
  /// **'Ubicación creada'**
  String get adminToastLocationCreated;

  /// No description provided for @adminToastLocationUpdated.
  ///
  /// In es, this message translates to:
  /// **'Ubicación actualizada'**
  String get adminToastLocationUpdated;

  /// No description provided for @adminTableTitle.
  ///
  /// In es, this message translates to:
  /// **'Mesa'**
  String get adminTableTitle;

  /// No description provided for @adminEditTable.
  ///
  /// In es, this message translates to:
  /// **'Editar mesa'**
  String get adminEditTable;

  /// No description provided for @adminEditSchedule.
  ///
  /// In es, this message translates to:
  /// **'Editar horario'**
  String get adminEditSchedule;

  /// No description provided for @adminAddMember.
  ///
  /// In es, this message translates to:
  /// **'Agregar miembro'**
  String get adminAddMember;

  /// No description provided for @adminInviteNewPerson.
  ///
  /// In es, this message translates to:
  /// **'Invitar a una persona nueva'**
  String get adminInviteNewPerson;

  /// No description provided for @adminAddExistingMember.
  ///
  /// In es, this message translates to:
  /// **'Agregar una persona existente'**
  String get adminAddExistingMember;

  /// No description provided for @adminAdd.
  ///
  /// In es, this message translates to:
  /// **'Agregar'**
  String get adminAdd;

  /// No description provided for @adminPerson.
  ///
  /// In es, this message translates to:
  /// **'Persona'**
  String get adminPerson;

  /// No description provided for @adminNoExistingCandidates.
  ///
  /// In es, this message translates to:
  /// **'No hay personas disponibles'**
  String get adminNoExistingCandidates;

  /// No description provided for @adminNoExistingCandidatesDetail.
  ///
  /// In es, this message translates to:
  /// **'Solo se pueden agregar personas de la organización que aún no estén en una mesa.'**
  String get adminNoExistingCandidatesDetail;

  /// No description provided for @adminTableWithoutFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Sin facilitador'**
  String get adminTableWithoutFacilitator;

  /// No description provided for @adminTableWithoutFacilitatorDetail.
  ///
  /// In es, this message translates to:
  /// **'La mesa no puede abrir sesiones. Asigna un facilitador.'**
  String get adminTableWithoutFacilitatorDetail;

  /// No description provided for @adminTableDelayedTitle.
  ///
  /// In es, this message translates to:
  /// **'Mesa retrasada'**
  String get adminTableDelayedTitle;

  /// No description provided for @adminTableDelayedDetail.
  ///
  /// In es, this message translates to:
  /// **'Última sesión el {date}; se espera una por semana.'**
  String adminTableDelayedDetail(String date);

  /// No description provided for @adminTableNeedsPeople.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Falta 1 persona} other{Faltan {count} personas}}'**
  String adminTableNeedsPeople(int count);

  /// No description provided for @adminTableNeedsPeopleDetail.
  ///
  /// In es, this message translates to:
  /// **'Una mesa necesita de 3 a 9 personas incluyendo al facilitador.'**
  String get adminTableNeedsPeopleDetail;

  /// No description provided for @adminTableFullTitle.
  ///
  /// In es, this message translates to:
  /// **'Mesa llena (9/9)'**
  String get adminTableFullTitle;

  /// No description provided for @adminTableFullDetail.
  ///
  /// In es, this message translates to:
  /// **'Para sumar a alguien, mueve o desactiva a otra persona.'**
  String get adminTableFullDetail;

  /// No description provided for @adminTableFull.
  ///
  /// In es, this message translates to:
  /// **'llena'**
  String get adminTableFull;

  /// No description provided for @adminNewTableTitle.
  ///
  /// In es, this message translates to:
  /// **'Mesa nueva'**
  String get adminNewTableTitle;

  /// No description provided for @adminNewTableDetail.
  ///
  /// In es, this message translates to:
  /// **'Aún sin sesiones cerradas: no hay KPIs. Se activa al cerrar la primera sesión.'**
  String get adminNewTableDetail;

  /// No description provided for @adminLastSession.
  ///
  /// In es, this message translates to:
  /// **'Última sesión'**
  String get adminLastSession;

  /// No description provided for @adminSchedule.
  ///
  /// In es, this message translates to:
  /// **'Programación'**
  String get adminSchedule;

  /// No description provided for @adminFieldWeekday.
  ///
  /// In es, this message translates to:
  /// **'Día'**
  String get adminFieldWeekday;

  /// No description provided for @adminFieldTime.
  ///
  /// In es, this message translates to:
  /// **'Hora'**
  String get adminFieldTime;

  /// No description provided for @adminFieldTimezone.
  ///
  /// In es, this message translates to:
  /// **'Zona horaria'**
  String get adminFieldTimezone;

  /// No description provided for @adminFieldDuration.
  ///
  /// In es, this message translates to:
  /// **'Duración'**
  String get adminFieldDuration;

  /// No description provided for @adminMinutes.
  ///
  /// In es, this message translates to:
  /// **'{minutes} min'**
  String adminMinutes(int minutes);

  /// No description provided for @adminScheduleCentral.
  ///
  /// In es, this message translates to:
  /// **'El horario lo controla la coordinación: el facilitador lo ve pero no lo puede cambiar.'**
  String get adminScheduleCentral;

  /// No description provided for @adminFacilitatorAndHistory.
  ///
  /// In es, this message translates to:
  /// **'Facilitador e historial'**
  String get adminFacilitatorAndHistory;

  /// No description provided for @adminCurrentFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Facilitador actual'**
  String get adminCurrentFacilitator;

  /// No description provided for @adminChange.
  ///
  /// In es, this message translates to:
  /// **'Cambiar'**
  String get adminChange;

  /// No description provided for @adminAssign.
  ///
  /// In es, this message translates to:
  /// **'Asignar'**
  String get adminAssign;

  /// No description provided for @adminNoHistory.
  ///
  /// In es, this message translates to:
  /// **'Aún no hay cambios en el historial.'**
  String get adminNoHistory;

  /// No description provided for @adminHistoryLeft.
  ///
  /// In es, this message translates to:
  /// **'{name} salió de la mesa ({reason})'**
  String adminHistoryLeft(String name, String reason);

  /// No description provided for @adminLeftMoved.
  ///
  /// In es, this message translates to:
  /// **'movido a otra mesa'**
  String get adminLeftMoved;

  /// No description provided for @adminLeftDeactivated.
  ///
  /// In es, this message translates to:
  /// **'desactivado'**
  String get adminLeftDeactivated;

  /// No description provided for @adminLeftFacilitatorChanged.
  ///
  /// In es, this message translates to:
  /// **'cambio de facilitador'**
  String get adminLeftFacilitatorChanged;

  /// No description provided for @adminLeftInviteRevoked.
  ///
  /// In es, this message translates to:
  /// **'invitación revocada'**
  String get adminLeftInviteRevoked;

  /// No description provided for @adminLeftOther.
  ///
  /// In es, this message translates to:
  /// **'sin motivo'**
  String get adminLeftOther;

  /// No description provided for @adminMembers.
  ///
  /// In es, this message translates to:
  /// **'Miembros'**
  String get adminMembers;

  /// No description provided for @adminMembersHint.
  ///
  /// In es, this message translates to:
  /// **'De 3 a 9 personas incluyendo al facilitador. Desactivar no borra el historial.'**
  String get adminMembersHint;

  /// No description provided for @adminNoMembersTitle.
  ///
  /// In es, this message translates to:
  /// **'Aún no hay miembros'**
  String get adminNoMembersTitle;

  /// No description provided for @adminNoMembersMessage.
  ///
  /// In es, this message translates to:
  /// **'Invita a la primera persona con el botón Agregar miembro.'**
  String get adminNoMembersMessage;

  /// No description provided for @adminMemberSince.
  ///
  /// In es, this message translates to:
  /// **'Desde {date}'**
  String adminMemberSince(String date);

  /// No description provided for @adminSeeAnswersOf.
  ///
  /// In es, this message translates to:
  /// **'Ver respuestas de {name}'**
  String adminSeeAnswersOf(String name);

  /// No description provided for @adminChangeFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Cambiar facilitador'**
  String get adminChangeFacilitator;

  /// No description provided for @adminAssignFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Asignar facilitador'**
  String get adminAssignFacilitator;

  /// No description provided for @adminChangeFacilitatorConfirm.
  ///
  /// In es, this message translates to:
  /// **'Confirmar'**
  String get adminChangeFacilitatorConfirm;

  /// No description provided for @adminChangeFacilitatorCurrent.
  ///
  /// In es, this message translates to:
  /// **'Actual: {name}. El historial se conserva.'**
  String adminChangeFacilitatorCurrent(String name);

  /// No description provided for @adminNewFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Nuevo facilitador'**
  String get adminNewFacilitator;

  /// No description provided for @adminAlreadyInTable.
  ///
  /// In es, this message translates to:
  /// **'ya en la mesa'**
  String get adminAlreadyInTable;

  /// No description provided for @adminKeepPreviousAsMember.
  ///
  /// In es, this message translates to:
  /// **'Dejar a {name} como miembro de la mesa'**
  String adminKeepPreviousAsMember(String name);

  /// No description provided for @adminHistoryKept.
  ///
  /// In es, this message translates to:
  /// **'Nada se borra: el cambio queda en el historial.'**
  String get adminHistoryKept;

  /// No description provided for @adminNoFacilitatorCandidates.
  ///
  /// In es, this message translates to:
  /// **'No hay personas disponibles'**
  String get adminNoFacilitatorCandidates;

  /// No description provided for @adminNoFacilitatorCandidatesDetail.
  ///
  /// In es, this message translates to:
  /// **'Invita a una persona nueva como facilitador desde el formulario de la mesa.'**
  String get adminNoFacilitatorCandidatesDetail;

  /// No description provided for @adminMoveTitle.
  ///
  /// In es, this message translates to:
  /// **'Mover a {name}'**
  String adminMoveTitle(String name);

  /// No description provided for @adminMoveMessage.
  ///
  /// In es, this message translates to:
  /// **'Sale de {code}. El historial viaja con la persona.'**
  String adminMoveMessage(String code);

  /// No description provided for @adminMoveDestination.
  ///
  /// In es, this message translates to:
  /// **'Mesa de destino'**
  String get adminMoveDestination;

  /// No description provided for @adminMove.
  ///
  /// In es, this message translates to:
  /// **'Mover'**
  String get adminMove;

  /// No description provided for @adminMoveNoTargets.
  ///
  /// In es, this message translates to:
  /// **'No hay otras mesas activas en esta organización.'**
  String get adminMoveNoTargets;

  /// No description provided for @adminDeactivateMemberTitle.
  ///
  /// In es, this message translates to:
  /// **'Desactivar a {name}'**
  String adminDeactivateMemberTitle(String name);

  /// No description provided for @adminDeactivateMemberMessage.
  ///
  /// In es, this message translates to:
  /// **'Deja de contar en {code} y no podrá responder. No se borra nada: respuestas e historial se conservan.'**
  String adminDeactivateMemberMessage(String code);

  /// No description provided for @adminDeactivateMemberBelowMinimum.
  ///
  /// In es, this message translates to:
  /// **'La mesa quedará con {remaining, plural, =1{1 persona} other{{remaining} personas}}. El mínimo es 3 incluyendo al facilitador.'**
  String adminDeactivateMemberBelowMinimum(int remaining);

  /// No description provided for @adminToastFacilitatorChanged.
  ///
  /// In es, this message translates to:
  /// **'Facilitador actualizado'**
  String get adminToastFacilitatorChanged;

  /// No description provided for @adminToastMemberAdded.
  ///
  /// In es, this message translates to:
  /// **'{name} agregado a la mesa'**
  String adminToastMemberAdded(String name);

  /// No description provided for @adminToastMemberMoved.
  ///
  /// In es, this message translates to:
  /// **'{name} movido de mesa'**
  String adminToastMemberMoved(String name);

  /// No description provided for @adminToastMemberDeactivated.
  ///
  /// In es, this message translates to:
  /// **'{name} desactivado'**
  String adminToastMemberDeactivated(String name);

  /// No description provided for @adminToastTableCreated.
  ///
  /// In es, this message translates to:
  /// **'Mesa creada'**
  String get adminToastTableCreated;

  /// No description provided for @adminToastTableUpdated.
  ///
  /// In es, this message translates to:
  /// **'Mesa actualizada'**
  String get adminToastTableUpdated;

  /// No description provided for @adminSectionIdentity.
  ///
  /// In es, this message translates to:
  /// **'Identidad'**
  String get adminSectionIdentity;

  /// No description provided for @adminFieldTableName.
  ///
  /// In es, this message translates to:
  /// **'Nombre de la mesa'**
  String get adminFieldTableName;

  /// No description provided for @adminFieldTableNameHint.
  ///
  /// In es, this message translates to:
  /// **'Ej. Esperanza'**
  String get adminFieldTableNameHint;

  /// No description provided for @adminFieldTableCode.
  ///
  /// In es, this message translates to:
  /// **'Código'**
  String get adminFieldTableCode;

  /// No description provided for @adminFieldTableCodeHelper.
  ///
  /// In es, this message translates to:
  /// **'Formato AAA-00, único dentro de la organización.'**
  String get adminFieldTableCodeHelper;

  /// No description provided for @adminSectionLocationSchedule.
  ///
  /// In es, this message translates to:
  /// **'Ubicación y horario'**
  String get adminSectionLocationSchedule;

  /// No description provided for @adminFieldLocation.
  ///
  /// In es, this message translates to:
  /// **'Ubicación'**
  String get adminFieldLocation;

  /// No description provided for @adminChooseOrganizationFirst.
  ///
  /// In es, this message translates to:
  /// **'Primero elige la organización'**
  String get adminChooseOrganizationFirst;

  /// No description provided for @adminOrgWithoutLocations.
  ///
  /// In es, this message translates to:
  /// **'Esta organización no tiene ubicaciones'**
  String get adminOrgWithoutLocations;

  /// No description provided for @adminOrgWithoutLocationsDetail.
  ///
  /// In es, this message translates to:
  /// **'Crea la primera ubicación y vuelve a crear la mesa.'**
  String get adminOrgWithoutLocationsDetail;

  /// No description provided for @adminSectionFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Facilitador'**
  String get adminSectionFacilitator;

  /// No description provided for @adminFieldTableFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Facilitador de la mesa'**
  String get adminFieldTableFacilitator;

  /// No description provided for @adminInviteNewFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Invitar a un facilitador nuevo'**
  String get adminInviteNewFacilitator;

  /// No description provided for @adminPickExistingFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Elegir una persona existente'**
  String get adminPickExistingFacilitator;

  /// No description provided for @adminFacilitatorRequiredHint.
  ///
  /// In es, this message translates to:
  /// **'Cada mesa necesita exactamente un facilitador. Se guarda el historial de cambios.'**
  String get adminFacilitatorRequiredHint;

  /// No description provided for @adminFieldFirstName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get adminFieldFirstName;

  /// No description provided for @adminFieldLastName.
  ///
  /// In es, this message translates to:
  /// **'Apellido'**
  String get adminFieldLastName;

  /// No description provided for @adminFieldInviteEmailHelper.
  ///
  /// In es, this message translates to:
  /// **'La persona entrará con Google, Apple o Facebook.'**
  String get adminFieldInviteEmailHelper;

  /// No description provided for @adminPersonTitle.
  ///
  /// In es, this message translates to:
  /// **'Persona'**
  String get adminPersonTitle;

  /// No description provided for @adminPersonData.
  ///
  /// In es, this message translates to:
  /// **'Datos'**
  String get adminPersonData;

  /// No description provided for @adminFieldPosition.
  ///
  /// In es, this message translates to:
  /// **'Cargo'**
  String get adminFieldPosition;

  /// No description provided for @adminFieldPositionOptional.
  ///
  /// In es, this message translates to:
  /// **'Cargo (si aplica)'**
  String get adminFieldPositionOptional;

  /// No description provided for @adminFieldLinkedAccount.
  ///
  /// In es, this message translates to:
  /// **'Cuenta vinculada'**
  String get adminFieldLinkedAccount;

  /// No description provided for @adminLinkedYes.
  ///
  /// In es, this message translates to:
  /// **'Sí'**
  String get adminLinkedYes;

  /// No description provided for @adminLinkedNo.
  ///
  /// In es, this message translates to:
  /// **'Aún no inició sesión'**
  String get adminLinkedNo;

  /// No description provided for @adminPhoneUnverified.
  ///
  /// In es, this message translates to:
  /// **'Contacto sin verificar; no sirve para iniciar sesión.'**
  String get adminPhoneUnverified;

  /// No description provided for @adminPersonInvitedTitle.
  ///
  /// In es, this message translates to:
  /// **'Invitación pendiente'**
  String get adminPersonInvitedTitle;

  /// No description provided for @adminPersonInvitedDetail.
  ///
  /// In es, this message translates to:
  /// **'Aún no aceptó la invitación: no hay respuestas.'**
  String get adminPersonInvitedDetail;

  /// No description provided for @adminRolesAndTables.
  ///
  /// In es, this message translates to:
  /// **'Roles y mesas'**
  String get adminRolesAndTables;

  /// No description provided for @adminPersonNoAssignments.
  ///
  /// In es, this message translates to:
  /// **'Sin roles ni mesa'**
  String get adminPersonNoAssignments;

  /// No description provided for @adminPersonNoAssignmentsMessage.
  ///
  /// In es, this message translates to:
  /// **'Esta persona todavía no tiene un rol ni una mesa asignada.'**
  String get adminPersonNoAssignmentsMessage;

  /// No description provided for @adminDeactivatePerson.
  ///
  /// In es, this message translates to:
  /// **'Desactivar persona'**
  String get adminDeactivatePerson;

  /// No description provided for @adminReactivate.
  ///
  /// In es, this message translates to:
  /// **'Reactivar'**
  String get adminReactivate;

  /// No description provided for @adminDeactivatePersonTitle.
  ///
  /// In es, this message translates to:
  /// **'Desactivar a {name}'**
  String adminDeactivatePersonTitle(String name);

  /// No description provided for @adminDeactivatePersonMessage.
  ///
  /// In es, this message translates to:
  /// **'Termina sus lugares en mesas, sus roles y sus invitaciones pendientes. No se borra nada: el historial se conserva.'**
  String get adminDeactivatePersonMessage;

  /// No description provided for @adminToastPersonDeactivated.
  ///
  /// In es, this message translates to:
  /// **'{name} desactivado'**
  String adminToastPersonDeactivated(String name);

  /// No description provided for @adminToastPersonReactivated.
  ///
  /// In es, this message translates to:
  /// **'{name} reactivado'**
  String adminToastPersonReactivated(String name);

  /// No description provided for @adminSectionRoleScope.
  ///
  /// In es, this message translates to:
  /// **'Rol y alcance'**
  String get adminSectionRoleScope;

  /// No description provided for @adminSectionPerson.
  ///
  /// In es, this message translates to:
  /// **'Datos de la persona'**
  String get adminSectionPerson;

  /// No description provided for @adminCreateAndInvite.
  ///
  /// In es, this message translates to:
  /// **'Crear e invitar'**
  String get adminCreateAndInvite;

  /// No description provided for @adminNoTablesForInvite.
  ///
  /// In es, this message translates to:
  /// **'No hay mesas disponibles para este rol'**
  String get adminNoTablesForInvite;

  /// No description provided for @adminSeatsOf.
  ///
  /// In es, this message translates to:
  /// **'Plazas de {code}'**
  String adminSeatsOf(String code);

  /// No description provided for @adminSeatsLeft.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{Queda 1 plaza} other{Quedan {count} plazas}}'**
  String adminSeatsLeft(int count);

  /// No description provided for @adminInviteCreatedTitle.
  ///
  /// In es, this message translates to:
  /// **'Invitación creada para {name}'**
  String adminInviteCreatedTitle(String name);

  /// No description provided for @adminInviteCreatedDetail.
  ///
  /// In es, this message translates to:
  /// **'Comparte el enlace o el código. Al iniciar sesión con Google, Apple o Facebook se vincula su identidad.'**
  String get adminInviteCreatedDetail;

  /// No description provided for @adminShareInvite.
  ///
  /// In es, this message translates to:
  /// **'Compartir invitación'**
  String get adminShareInvite;

  /// No description provided for @adminShortCode.
  ///
  /// In es, this message translates to:
  /// **'Código corto'**
  String get adminShortCode;

  /// No description provided for @adminInviteQrLabel.
  ///
  /// In es, this message translates to:
  /// **'Código QR de la invitación'**
  String get adminInviteQrLabel;

  /// No description provided for @adminInviteExpires.
  ///
  /// In es, this message translates to:
  /// **'Vence el {date}'**
  String adminInviteExpires(String date);

  /// No description provided for @adminCopyLink.
  ///
  /// In es, this message translates to:
  /// **'Copiar enlace'**
  String get adminCopyLink;

  /// No description provided for @adminCopyCode.
  ///
  /// In es, this message translates to:
  /// **'Copiar código'**
  String get adminCopyCode;

  /// No description provided for @adminLinkCopied.
  ///
  /// In es, this message translates to:
  /// **'Enlace copiado'**
  String get adminLinkCopied;

  /// No description provided for @adminCodeCopied.
  ///
  /// In es, this message translates to:
  /// **'Código copiado'**
  String get adminCodeCopied;

  /// No description provided for @adminInviteAnother.
  ///
  /// In es, this message translates to:
  /// **'Invitar a otra persona'**
  String get adminInviteAnother;

  /// No description provided for @adminInviteShareMessage.
  ///
  /// In es, this message translates to:
  /// **'Hola {name}, te invito a Gold Roundtables. Código: {code}. Entra aquí: {url}'**
  String adminInviteShareMessage(String name, String code, String url);

  /// No description provided for @adminErrorTableFull.
  ///
  /// In es, this message translates to:
  /// **'La mesa ya tiene 9 personas (incluido el facilitador). No se puede agregar otra.'**
  String get adminErrorTableFull;

  /// No description provided for @adminErrorDuplicateTableCode.
  ///
  /// In es, this message translates to:
  /// **'Ya existe una mesa con ese código en la organización. Usa otro.'**
  String get adminErrorDuplicateTableCode;

  /// No description provided for @adminErrorDuplicateOrganization.
  ///
  /// In es, this message translates to:
  /// **'Ya existe una organización con ese nombre.'**
  String get adminErrorDuplicateOrganization;

  /// No description provided for @adminErrorDuplicateLocation.
  ///
  /// In es, this message translates to:
  /// **'Ya existe una ubicación con ese nombre en la organización.'**
  String get adminErrorDuplicateLocation;

  /// No description provided for @adminErrorFacilitatorRequired.
  ///
  /// In es, this message translates to:
  /// **'Falta el facilitador: cada mesa necesita uno.'**
  String get adminErrorFacilitatorRequired;

  /// No description provided for @adminErrorTableHasFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Esta mesa ya tiene facilitador. Usa «Cambiar facilitador».'**
  String get adminErrorTableHasFacilitator;

  /// No description provided for @adminErrorCannotMoveFacilitator.
  ///
  /// In es, this message translates to:
  /// **'No se puede mover al facilitador. Primero cambia el facilitador.'**
  String get adminErrorCannotMoveFacilitator;

  /// No description provided for @adminErrorCannotRemoveFacilitator.
  ///
  /// In es, this message translates to:
  /// **'No se puede quitar al facilitador. Primero cambia el facilitador.'**
  String get adminErrorCannotRemoveFacilitator;

  /// No description provided for @adminErrorAlreadyMember.
  ///
  /// In es, this message translates to:
  /// **'Esa persona ya está en la mesa.'**
  String get adminErrorAlreadyMember;

  /// No description provided for @adminErrorPersonAlreadyLinked.
  ///
  /// In es, this message translates to:
  /// **'Esa persona ya tiene una cuenta vinculada.'**
  String get adminErrorPersonAlreadyLinked;

  /// No description provided for @adminErrorInvitePendingExists.
  ///
  /// In es, this message translates to:
  /// **'Esa persona ya tiene una invitación pendiente.'**
  String get adminErrorInvitePendingExists;

  /// No description provided for @adminErrorOrganizationInactive.
  ///
  /// In es, this message translates to:
  /// **'La organización está pausada o desactivada: no se pueden hacer cambios.'**
  String get adminErrorOrganizationInactive;

  /// No description provided for @adminErrorLastPlatformAdmin.
  ///
  /// In es, this message translates to:
  /// **'No se puede quitar al último administrador de la plataforma.'**
  String get adminErrorLastPlatformAdmin;

  /// No description provided for @adminErrorTableNotActive.
  ///
  /// In es, this message translates to:
  /// **'La mesa no está activa.'**
  String get adminErrorTableNotActive;

  /// No description provided for @adminErrorForbidden.
  ///
  /// In es, this message translates to:
  /// **'No tienes permiso para hacer esto. El intento quedó registrado.'**
  String get adminErrorForbidden;

  /// No description provided for @kpiReportsTitle.
  ///
  /// In es, this message translates to:
  /// **'Informes'**
  String get kpiReportsTitle;

  /// No description provided for @kpiValuesCompleted.
  ///
  /// In es, this message translates to:
  /// **'Valores completados'**
  String get kpiValuesCompleted;

  /// No description provided for @kpiEstimatedImprovement.
  ///
  /// In es, this message translates to:
  /// **'Mejora estimada'**
  String get kpiEstimatedImprovement;

  /// No description provided for @kpiPointsUnit.
  ///
  /// In es, this message translates to:
  /// **'pts'**
  String get kpiPointsUnit;

  /// No description provided for @kpiAttendance.
  ///
  /// In es, this message translates to:
  /// **'Asistencia'**
  String get kpiAttendance;

  /// No description provided for @kpiSyncedLate.
  ///
  /// In es, this message translates to:
  /// **'Sincronizado tarde'**
  String get kpiSyncedLate;

  /// No description provided for @kpiTables.
  ///
  /// In es, this message translates to:
  /// **'Mesas'**
  String get kpiTables;

  /// No description provided for @kpiTablesByStatus.
  ///
  /// In es, this message translates to:
  /// **'Mesas por estado'**
  String get kpiTablesByStatus;

  /// No description provided for @kpiTablesLegend.
  ///
  /// In es, this message translates to:
  /// **'activas · retrasadas · inactivas'**
  String get kpiTablesLegend;

  /// No description provided for @kpiTablesActive.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 activa} other{{count} activas}}'**
  String kpiTablesActive(int count);

  /// No description provided for @kpiTablesDelayed.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 retrasada} other{{count} retrasadas}}'**
  String kpiTablesDelayed(int count);

  /// No description provided for @kpiTablesInactive.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 inactiva} other{{count} inactivas}}'**
  String kpiTablesInactive(int count);

  /// No description provided for @kpiAllOrganizationsScope.
  ///
  /// In es, this message translates to:
  /// **'Todas las organizaciones'**
  String get kpiAllOrganizationsScope;

  /// No description provided for @kpiPeriodOf.
  ///
  /// In es, this message translates to:
  /// **'períodos de {weeks} semanas'**
  String kpiPeriodOf(int weeks);

  /// No description provided for @kpiPeriod.
  ///
  /// In es, this message translates to:
  /// **'Período'**
  String get kpiPeriod;

  /// No description provided for @kpiWeeks.
  ///
  /// In es, this message translates to:
  /// **'{weeks} semanas'**
  String kpiWeeks(int weeks);

  /// No description provided for @kpiModuleValue.
  ///
  /// In es, this message translates to:
  /// **'Módulo / valor'**
  String get kpiModuleValue;

  /// No description provided for @kpiReportFilters.
  ///
  /// In es, this message translates to:
  /// **'Filtros del informe'**
  String get kpiReportFilters;

  /// No description provided for @kpiOfflineTitle.
  ///
  /// In es, this message translates to:
  /// **'Los informes necesitan conexión'**
  String get kpiOfflineTitle;

  /// No description provided for @kpiOfflineMessage.
  ///
  /// In es, this message translates to:
  /// **'Los KPIs se calculan en el servidor y no se guardan en este dispositivo. Reconéctate para verlos; el explorador sigue disponible.'**
  String get kpiOfflineMessage;

  /// No description provided for @kpiEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin datos para estos filtros'**
  String get kpiEmptyTitle;

  /// No description provided for @kpiEmptyMessage.
  ///
  /// In es, this message translates to:
  /// **'Ninguna mesa coincide con la combinación de filtros, o la organización aún no tiene mesas.'**
  String get kpiEmptyMessage;

  /// No description provided for @kpiRemoveFilters.
  ///
  /// In es, this message translates to:
  /// **'Quitar filtros'**
  String get kpiRemoveFilters;

  /// No description provided for @kpiValuesDetail.
  ///
  /// In es, this message translates to:
  /// **'de 48 posibles por mesa'**
  String get kpiValuesDetail;

  /// No description provided for @kpiImprovementDetail.
  ///
  /// In es, this message translates to:
  /// **'seguimiento − inicial'**
  String get kpiImprovementDetail;

  /// No description provided for @kpiLowTablesDetail.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =0{Ninguna mesa bajo 70 %} =1{1 mesa bajo 70 %} other{{count} mesas bajo 70 %}}'**
  String kpiLowTablesDetail(int count);

  /// No description provided for @kpiSyncedLateDetail.
  ///
  /// In es, this message translates to:
  /// **'respuestas cargadas tras la sesión'**
  String get kpiSyncedLateDetail;

  /// No description provided for @kpiSeeDelayed.
  ///
  /// In es, this message translates to:
  /// **'Ver retrasadas'**
  String get kpiSeeDelayed;

  /// No description provided for @kpiSeeTables.
  ///
  /// In es, this message translates to:
  /// **'Ver mesas'**
  String get kpiSeeTables;

  /// No description provided for @kpiChartView.
  ///
  /// In es, this message translates to:
  /// **'Gráfico'**
  String get kpiChartView;

  /// No description provided for @kpiTableView.
  ///
  /// In es, this message translates to:
  /// **'Tabla'**
  String get kpiTableView;

  /// No description provided for @kpiExportCsvOf.
  ///
  /// In es, this message translates to:
  /// **'Exportar CSV de {title}'**
  String kpiExportCsvOf(String title);

  /// No description provided for @kpiExported.
  ///
  /// In es, this message translates to:
  /// **'Archivo CSV listo'**
  String get kpiExported;

  /// No description provided for @kpiChartValuesPerWeek.
  ///
  /// In es, this message translates to:
  /// **'Valores completados por semana'**
  String get kpiChartValuesPerWeek;

  /// No description provided for @kpiInPeriod.
  ///
  /// In es, this message translates to:
  /// **'{count} en el período'**
  String kpiInPeriod(int count);

  /// No description provided for @kpiAttendanceSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Promedio {average} · umbral {threshold} %'**
  String kpiAttendanceSubtitle(String average, int threshold);

  /// No description provided for @kpiThreshold.
  ///
  /// In es, this message translates to:
  /// **'umbral {percent} %'**
  String kpiThreshold(int percent);

  /// No description provided for @kpiChartImprovementByModule.
  ///
  /// In es, this message translates to:
  /// **'Mejora estimada por módulo'**
  String get kpiChartImprovementByModule;

  /// No description provided for @kpiChartImprovementSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Puntaje inicial → seguimiento (1–10, el 5 está bloqueado)'**
  String get kpiChartImprovementSubtitle;

  /// No description provided for @kpiTablesByStatusSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Por organización · activa / retrasada / inactiva'**
  String get kpiTablesByStatusSubtitle;

  /// No description provided for @kpiSyncedLateChartSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Respuestas cargadas fuera de la ventana · {count} en total'**
  String kpiSyncedLateChartSubtitle(int count);

  /// No description provided for @kpiNoDataInScope.
  ///
  /// In es, this message translates to:
  /// **'Sin datos en este alcance.'**
  String get kpiNoDataInScope;

  /// No description provided for @kpiNoSyncedLate.
  ///
  /// In es, this message translates to:
  /// **'Ninguna mesa tuvo sincronización tardía en este alcance.'**
  String get kpiNoSyncedLate;

  /// No description provided for @kpiColWeek.
  ///
  /// In es, this message translates to:
  /// **'Semana'**
  String get kpiColWeek;

  /// No description provided for @kpiColSessions.
  ///
  /// In es, this message translates to:
  /// **'Sesiones'**
  String get kpiColSessions;

  /// No description provided for @kpiColModule.
  ///
  /// In es, this message translates to:
  /// **'Módulo'**
  String get kpiColModule;

  /// No description provided for @kpiColName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get kpiColName;

  /// No description provided for @kpiColInitialAvg.
  ///
  /// In es, this message translates to:
  /// **'Inicial (prom.)'**
  String get kpiColInitialAvg;

  /// No description provided for @kpiColFollowUpAvg.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento (prom.)'**
  String get kpiColFollowUpAvg;

  /// No description provided for @kpiColValue.
  ///
  /// In es, this message translates to:
  /// **'Valor'**
  String get kpiColValue;

  /// No description provided for @kpiColInitial.
  ///
  /// In es, this message translates to:
  /// **'Inicial'**
  String get kpiColInitial;

  /// No description provided for @kpiColFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento'**
  String get kpiColFollowUp;

  /// No description provided for @kpiColSyncedLate.
  ///
  /// In es, this message translates to:
  /// **'Sincronizado tarde'**
  String get kpiColSyncedLate;

  /// No description provided for @kpiTipWeekValues.
  ///
  /// In es, this message translates to:
  /// **'Semana del {week}: {count, plural, =1{1 valor} other{{count} valores}}'**
  String kpiTipWeekValues(String week, int count);

  /// No description provided for @kpiTipWeekAttendance.
  ///
  /// In es, this message translates to:
  /// **'Semana del {week}: {value}{low, plural, =1{ (bajo el umbral)} other{}}'**
  String kpiTipWeekAttendance(String week, String value, int low);

  /// No description provided for @kpiTipInitial.
  ///
  /// In es, this message translates to:
  /// **'{label} · inicial {value}'**
  String kpiTipInitial(String label, String value);

  /// No description provided for @kpiTipFollowUp.
  ///
  /// In es, this message translates to:
  /// **'{label} · seguimiento {value} ({delta} pts)'**
  String kpiTipFollowUp(String label, String value, String delta);

  /// No description provided for @kpiTipStatus.
  ///
  /// In es, this message translates to:
  /// **'{org} · {status}: {count}'**
  String kpiTipStatus(String org, String status, int count);

  /// No description provided for @kpiTipLate.
  ///
  /// In es, this message translates to:
  /// **'{code}: {count, plural, =1{1 respuesta tarde} other{{count} respuestas tarde}}'**
  String kpiTipLate(String code, int count);

  /// No description provided for @kpiDrillTitle.
  ///
  /// In es, this message translates to:
  /// **'Desglose · {level}'**
  String kpiDrillTitle(String level);

  /// No description provided for @kpiDrillSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Agregado → organización → mesa → miembro. Pulsa una fila para bajar un nivel.'**
  String get kpiDrillSubtitle;

  /// No description provided for @kpiDrillCountry.
  ///
  /// In es, this message translates to:
  /// **'País'**
  String get kpiDrillCountry;

  /// No description provided for @kpiDrillOrganization.
  ///
  /// In es, this message translates to:
  /// **'Organización'**
  String get kpiDrillOrganization;

  /// No description provided for @kpiDrillFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Facilitador'**
  String get kpiDrillFacilitator;

  /// No description provided for @kpiDrillTable.
  ///
  /// In es, this message translates to:
  /// **'Mesa'**
  String get kpiDrillTable;

  /// No description provided for @kpiDrillMember.
  ///
  /// In es, this message translates to:
  /// **'Miembro'**
  String get kpiDrillMember;

  /// No description provided for @kpiAllCountries.
  ///
  /// In es, this message translates to:
  /// **'Todos los países'**
  String get kpiAllCountries;

  /// No description provided for @kpiAllOrganizations.
  ///
  /// In es, this message translates to:
  /// **'Todas las organizaciones'**
  String get kpiAllOrganizations;

  /// No description provided for @kpiAllFacilitators.
  ///
  /// In es, this message translates to:
  /// **'Todos los facilitadores'**
  String get kpiAllFacilitators;

  /// No description provided for @kpiDrillEmpty.
  ///
  /// In es, this message translates to:
  /// **'Sin filas en este nivel'**
  String get kpiDrillEmpty;

  /// No description provided for @kpiSensitiveTitle.
  ///
  /// In es, this message translates to:
  /// **'Datos sensibles · respuestas individuales'**
  String get kpiSensitiveTitle;

  /// No description provided for @kpiSensitiveDetail.
  ///
  /// In es, this message translates to:
  /// **'Visibles para facilitador, coordinador y administración. Cada consulta queda en la auditoría.'**
  String get kpiSensitiveDetail;

  /// No description provided for @kpiSensitiveRevealWarning.
  ///
  /// In es, this message translates to:
  /// **'Al mostrar las respuestas se registra quién las consultó.'**
  String get kpiSensitiveRevealWarning;

  /// No description provided for @kpiSensitiveRevealed.
  ///
  /// In es, this message translates to:
  /// **'Consulta registrada en la auditoría.'**
  String get kpiSensitiveRevealed;

  /// No description provided for @kpiMemberTitle.
  ///
  /// In es, this message translates to:
  /// **'Miembro'**
  String get kpiMemberTitle;

  /// No description provided for @kpiBackToTable.
  ///
  /// In es, this message translates to:
  /// **'Volver a la mesa'**
  String get kpiBackToTable;

  /// No description provided for @kpiMemberDeniedTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin permiso para este miembro'**
  String get kpiMemberDeniedTitle;

  /// No description provided for @kpiMemberDeniedMessage.
  ///
  /// In es, this message translates to:
  /// **'Tu rol no puede ver a esta persona. El intento quedó registrado.'**
  String get kpiMemberDeniedMessage;

  /// No description provided for @kpiSessionsOf.
  ///
  /// In es, this message translates to:
  /// **'{present} de {expected} sesiones'**
  String kpiSessionsOf(int present, int expected);

  /// No description provided for @kpiIndividualAnswers.
  ///
  /// In es, this message translates to:
  /// **'Respuestas individuales'**
  String get kpiIndividualAnswers;

  /// No description provided for @kpiRevealAnswers.
  ///
  /// In es, this message translates to:
  /// **'Mostrar respuestas (se registra)'**
  String get kpiRevealAnswers;

  /// No description provided for @kpiNoAnswersYet.
  ///
  /// In es, this message translates to:
  /// **'Sin respuestas todavía.'**
  String get kpiNoAnswersYet;

  /// No description provided for @kpiReflections.
  ///
  /// In es, this message translates to:
  /// **'Reflexiones'**
  String get kpiReflections;

  /// No description provided for @kpiJustifications.
  ///
  /// In es, this message translates to:
  /// **'Justificaciones de los puntajes'**
  String get kpiJustifications;

  /// No description provided for @kpiCommitments.
  ///
  /// In es, this message translates to:
  /// **'Compromisos'**
  String get kpiCommitments;

  /// No description provided for @kpiCommitmentFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento'**
  String get kpiCommitmentFollowUp;

  /// No description provided for @auditScopePlatform.
  ///
  /// In es, this message translates to:
  /// **'Toda la plataforma'**
  String get auditScopePlatform;

  /// No description provided for @auditAllTypes.
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get auditAllTypes;

  /// No description provided for @auditAllOrganizations.
  ///
  /// In es, this message translates to:
  /// **'Todas las organizaciones'**
  String get auditAllOrganizations;

  /// No description provided for @auditSearchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar actor, objeto o detalle…'**
  String get auditSearchHint;

  /// No description provided for @auditEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin eventos'**
  String get auditEmptyTitle;

  /// No description provided for @auditEmptyMessage.
  ///
  /// In es, this message translates to:
  /// **'No hay registros con estos filtros.'**
  String get auditEmptyMessage;

  /// No description provided for @auditFooter.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 evento} other{{count} eventos}} · el registro no se puede editar ni borrar'**
  String auditFooter(int count);

  /// No description provided for @auditLoadMore.
  ///
  /// In es, this message translates to:
  /// **'Cargar más eventos'**
  String get auditLoadMore;

  /// No description provided for @auditSystemActor.
  ///
  /// In es, this message translates to:
  /// **'Sistema'**
  String get auditSystemActor;

  /// No description provided for @auditColDate.
  ///
  /// In es, this message translates to:
  /// **'Fecha'**
  String get auditColDate;

  /// No description provided for @auditColActor.
  ///
  /// In es, this message translates to:
  /// **'Actor'**
  String get auditColActor;

  /// No description provided for @auditColEvent.
  ///
  /// In es, this message translates to:
  /// **'Evento'**
  String get auditColEvent;

  /// No description provided for @auditColSubject.
  ///
  /// In es, this message translates to:
  /// **'Objeto'**
  String get auditColSubject;

  /// No description provided for @auditColDetail.
  ///
  /// In es, this message translates to:
  /// **'Detalle'**
  String get auditColDetail;

  /// No description provided for @auditCategoryCreated.
  ///
  /// In es, this message translates to:
  /// **'Alta'**
  String get auditCategoryCreated;

  /// No description provided for @auditCategoryRemoved.
  ///
  /// In es, this message translates to:
  /// **'Baja'**
  String get auditCategoryRemoved;

  /// No description provided for @auditCategoryReassigned.
  ///
  /// In es, this message translates to:
  /// **'Reasignación'**
  String get auditCategoryReassigned;

  /// No description provided for @auditCategorySession.
  ///
  /// In es, this message translates to:
  /// **'Sesión'**
  String get auditCategorySession;

  /// No description provided for @auditCategoryRole.
  ///
  /// In es, this message translates to:
  /// **'Cambio de rol'**
  String get auditCategoryRole;

  /// No description provided for @auditCategorySensitive.
  ///
  /// In es, this message translates to:
  /// **'Vista sensible'**
  String get auditCategorySensitive;

  /// No description provided for @auditCategoryChanged.
  ///
  /// In es, this message translates to:
  /// **'Cambio'**
  String get auditCategoryChanged;

  /// No description provided for @auditEventOrganizationCreated.
  ///
  /// In es, this message translates to:
  /// **'Organización creada'**
  String get auditEventOrganizationCreated;

  /// No description provided for @auditEventOrganizationUpdated.
  ///
  /// In es, this message translates to:
  /// **'Organización actualizada'**
  String get auditEventOrganizationUpdated;

  /// No description provided for @auditEventOrganizationStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado de organización cambiado'**
  String get auditEventOrganizationStatus;

  /// No description provided for @auditEventLocationCreated.
  ///
  /// In es, this message translates to:
  /// **'Ubicación creada'**
  String get auditEventLocationCreated;

  /// No description provided for @auditEventLocationUpdated.
  ///
  /// In es, this message translates to:
  /// **'Ubicación actualizada'**
  String get auditEventLocationUpdated;

  /// No description provided for @auditEventTableCreated.
  ///
  /// In es, this message translates to:
  /// **'Mesa creada'**
  String get auditEventTableCreated;

  /// No description provided for @auditEventTableUpdated.
  ///
  /// In es, this message translates to:
  /// **'Mesa actualizada'**
  String get auditEventTableUpdated;

  /// No description provided for @auditEventFacilitatorChanged.
  ///
  /// In es, this message translates to:
  /// **'Facilitador cambiado'**
  String get auditEventFacilitatorChanged;

  /// No description provided for @auditEventMemberAdded.
  ///
  /// In es, this message translates to:
  /// **'Miembro agregado'**
  String get auditEventMemberAdded;

  /// No description provided for @auditEventMemberMoved.
  ///
  /// In es, this message translates to:
  /// **'Miembro movido'**
  String get auditEventMemberMoved;

  /// No description provided for @auditEventMemberDeactivated.
  ///
  /// In es, this message translates to:
  /// **'Miembro desactivado'**
  String get auditEventMemberDeactivated;

  /// No description provided for @auditEventInviteCreated.
  ///
  /// In es, this message translates to:
  /// **'Invitación creada'**
  String get auditEventInviteCreated;

  /// No description provided for @auditEventInviteRevoked.
  ///
  /// In es, this message translates to:
  /// **'Invitación revocada'**
  String get auditEventInviteRevoked;

  /// No description provided for @auditEventInviteRenewed.
  ///
  /// In es, this message translates to:
  /// **'Invitación renovada'**
  String get auditEventInviteRenewed;

  /// No description provided for @auditEventInviteAccepted.
  ///
  /// In es, this message translates to:
  /// **'Invitación aceptada'**
  String get auditEventInviteAccepted;

  /// No description provided for @auditEventPersonUpdated.
  ///
  /// In es, this message translates to:
  /// **'Persona actualizada'**
  String get auditEventPersonUpdated;

  /// No description provided for @auditEventPersonDeactivated.
  ///
  /// In es, this message translates to:
  /// **'Persona desactivada'**
  String get auditEventPersonDeactivated;

  /// No description provided for @auditEventRoleGranted.
  ///
  /// In es, this message translates to:
  /// **'Rol otorgado'**
  String get auditEventRoleGranted;

  /// No description provided for @auditEventRoleRevoked.
  ///
  /// In es, this message translates to:
  /// **'Rol revocado'**
  String get auditEventRoleRevoked;

  /// No description provided for @auditEventSessionOpened.
  ///
  /// In es, this message translates to:
  /// **'Sesión abierta'**
  String get auditEventSessionOpened;

  /// No description provided for @auditEventSessionClosed.
  ///
  /// In es, this message translates to:
  /// **'Sesión cerrada'**
  String get auditEventSessionClosed;

  /// No description provided for @auditEventSessionCancelled.
  ///
  /// In es, this message translates to:
  /// **'Sesión cancelada'**
  String get auditEventSessionCancelled;

  /// No description provided for @auditEventAnswersRevealed.
  ///
  /// In es, this message translates to:
  /// **'Respuestas consultadas'**
  String get auditEventAnswersRevealed;

  /// No description provided for @auditEntityOrganization.
  ///
  /// In es, this message translates to:
  /// **'Organización'**
  String get auditEntityOrganization;

  /// No description provided for @auditEntityLocation.
  ///
  /// In es, this message translates to:
  /// **'Ubicación'**
  String get auditEntityLocation;

  /// No description provided for @auditEntityTable.
  ///
  /// In es, this message translates to:
  /// **'Mesa'**
  String get auditEntityTable;

  /// No description provided for @auditEntityMember.
  ///
  /// In es, this message translates to:
  /// **'Miembro'**
  String get auditEntityMember;

  /// No description provided for @auditEntityPerson.
  ///
  /// In es, this message translates to:
  /// **'Persona'**
  String get auditEntityPerson;

  /// No description provided for @auditEntityInvite.
  ///
  /// In es, this message translates to:
  /// **'Invitación'**
  String get auditEntityInvite;

  /// No description provided for @auditEntitySession.
  ///
  /// In es, this message translates to:
  /// **'Sesión'**
  String get auditEntitySession;

  /// No description provided for @auditEntityRole.
  ///
  /// In es, this message translates to:
  /// **'Rol'**
  String get auditEntityRole;
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
