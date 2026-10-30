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
  /// **'Sincronización no configurada'**
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

  /// No description provided for @adminDeniedHomeAction.
  ///
  /// In es, this message translates to:
  /// **'Ir al inicio'**
  String get adminDeniedHomeAction;

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

  /// No description provided for @adminViewFewPeople.
  ///
  /// In es, this message translates to:
  /// **'Menos de 3 personas'**
  String get adminViewFewPeople;

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

  /// No description provided for @adminFieldTableCodeHint.
  ///
  /// In es, this message translates to:
  /// **'Ej. LUZ-07'**
  String get adminFieldTableCodeHint;

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

  /// No description provided for @adminSectionProgram.
  ///
  /// In es, this message translates to:
  /// **'Programa'**
  String get adminSectionProgram;

  /// No description provided for @adminFieldModule.
  ///
  /// In es, this message translates to:
  /// **'Módulo'**
  String get adminFieldModule;

  /// No description provided for @adminFieldProgramValue.
  ///
  /// In es, this message translates to:
  /// **'Valor'**
  String get adminFieldProgramValue;

  /// No description provided for @adminProgramModuleOption.
  ///
  /// In es, this message translates to:
  /// **'Módulo {number} · {name}'**
  String adminProgramModuleOption(int number, String name);

  /// No description provided for @adminProgramValueOption.
  ///
  /// In es, this message translates to:
  /// **'Valor {number} · {name}'**
  String adminProgramValueOption(int number, String name);

  /// No description provided for @adminProgramValueHelperCreate.
  ///
  /// In es, this message translates to:
  /// **'Valor en el que empieza la mesa (del 1 al 48). Si no eliges, empieza en el valor 1.'**
  String get adminProgramValueHelperCreate;

  /// No description provided for @adminProgramValueHelperEdit.
  ///
  /// In es, this message translates to:
  /// **'Valor que trabajará la mesa en su próxima sesión. Las sesiones ya cerradas no cambian.'**
  String get adminProgramValueHelperEdit;

  /// No description provided for @adminRewindTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Retroceder en el programa?'**
  String get adminRewindTitle;

  /// No description provided for @adminRewindMessage.
  ///
  /// In es, this message translates to:
  /// **'Esta mesa ya completó sesiones de este valor o de los siguientes. Esas sesiones y sus respuestas se conservan; la mesa volverá a trabajar el valor elegido.'**
  String get adminRewindMessage;

  /// No description provided for @adminRewindConfirm.
  ///
  /// In es, this message translates to:
  /// **'Sí, retroceder'**
  String get adminRewindConfirm;

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

  /// No description provided for @kpiSessionsIncomplete.
  ///
  /// In es, this message translates to:
  /// **'Sesiones incompletas'**
  String get kpiSessionsIncomplete;

  /// No description provided for @kpiSessionsIncompleteDetail.
  ///
  /// In es, this message translates to:
  /// **'de {closed} sesiones cerradas, sin llegar a las respuestas'**
  String kpiSessionsIncompleteDetail(int closed);

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

  /// No description provided for @homeAlertsKicker.
  ///
  /// In es, this message translates to:
  /// **'Mesas que necesitan atención'**
  String get homeAlertsKicker;

  /// No description provided for @homeAlertsEmpty.
  ///
  /// In es, this message translates to:
  /// **'Todas tus mesas activas están al día.'**
  String get homeAlertsEmpty;

  /// No description provided for @homeAlertsMore.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{y 1 mesa más} other{y {count} mesas más}}'**
  String homeAlertsMore(int count);

  /// No description provided for @adminReasonLowAttendance.
  ///
  /// In es, this message translates to:
  /// **'Baja asistencia'**
  String get adminReasonLowAttendance;

  /// No description provided for @adminReasonFewPeople.
  ///
  /// In es, this message translates to:
  /// **'Menos de 3 personas'**
  String get adminReasonFewPeople;

  /// No description provided for @adminTableLowAttendanceTitle.
  ///
  /// In es, this message translates to:
  /// **'Baja asistencia en las últimas sesiones'**
  String get adminTableLowAttendanceTitle;

  /// No description provided for @adminTableLowAttendanceDetail.
  ///
  /// In es, this message translates to:
  /// **'El promedio de asistencia de las últimas 3 sesiones es {percent}, por debajo del 70 %.'**
  String adminTableLowAttendanceDetail(String percent);

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

  /// No description provided for @settingsContentLanguageKicker.
  ///
  /// In es, this message translates to:
  /// **'Idioma del contenido'**
  String get settingsContentLanguageKicker;

  /// No description provided for @settingsContentLanguageHint.
  ///
  /// In es, this message translates to:
  /// **'Los valores y las preguntas se muestran en este idioma. Lo que aún no está traducido se ve en español.'**
  String get settingsContentLanguageHint;

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

  /// No description provided for @sessionBoardSeatAutoChip.
  ///
  /// In es, this message translates to:
  /// **'AUTO'**
  String get sessionBoardSeatAutoChip;

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

  /// No description provided for @sessionMemberTableIs.
  ///
  /// In es, this message translates to:
  /// **'La mesa está en:'**
  String get sessionMemberTableIs;

  /// No description provided for @sessionMemberPaceOwn.
  ///
  /// In es, this message translates to:
  /// **'A tu ritmo'**
  String get sessionMemberPaceOwn;

  /// No description provided for @sessionMemberPeersLabel.
  ///
  /// In es, this message translates to:
  /// **'La mesa'**
  String get sessionMemberPeersLabel;

  /// No description provided for @sessionMemberYouMark.
  ///
  /// In es, this message translates to:
  /// **'TÚ'**
  String get sessionMemberYouMark;

  /// No description provided for @sessionMemberFacilitatorSuffix.
  ///
  /// In es, this message translates to:
  /// **'facilitador'**
  String get sessionMemberFacilitatorSuffix;

  /// No description provided for @sessionMemberPeerPresent.
  ///
  /// In es, this message translates to:
  /// **'{name}, presente'**
  String sessionMemberPeerPresent(String name);

  /// No description provided for @sessionMemberPeerLate.
  ///
  /// In es, this message translates to:
  /// **'{name}, llegó tarde'**
  String sessionMemberPeerLate(String name);

  /// No description provided for @sessionMemberPeerExcused.
  ///
  /// In es, this message translates to:
  /// **'{name}, justificado'**
  String sessionMemberPeerExcused(String name);

  /// No description provided for @sessionMemberPeerAbsent.
  ///
  /// In es, this message translates to:
  /// **'{name}, ausente'**
  String sessionMemberPeerAbsent(String name);

  /// No description provided for @sessionMemberPeerUnmarked.
  ///
  /// In es, this message translates to:
  /// **'{name}, sin marcar'**
  String sessionMemberPeerUnmarked(String name);

  /// No description provided for @sessionMemberUnmarked.
  ///
  /// In es, this message translates to:
  /// **'Sin marcar'**
  String get sessionMemberUnmarked;

  /// No description provided for @sessionMemberLobbyTitle.
  ///
  /// In es, this message translates to:
  /// **'Esperando a tu facilitador'**
  String get sessionMemberLobbyTitle;

  /// No description provided for @sessionMemberLobbyMessage.
  ///
  /// In es, this message translates to:
  /// **'La mesa todavía no está abierta. Cuando se abra, verás aquí a tu mesa en vivo.'**
  String get sessionMemberLobbyMessage;

  /// No description provided for @sessionMemberLobbyFacilitatorTitle.
  ///
  /// In es, this message translates to:
  /// **'Aún no abres la sesión'**
  String get sessionMemberLobbyFacilitatorTitle;

  /// No description provided for @sessionMemberLobbyFacilitatorMessage.
  ///
  /// In es, this message translates to:
  /// **'Abre la sesión en “Dirigir la mesa”. Luego podrás responder como un miembro más.'**
  String get sessionMemberLobbyFacilitatorMessage;

  /// No description provided for @sessionMemberAttendanceKicker.
  ///
  /// In es, this message translates to:
  /// **'Asistencia'**
  String get sessionMemberAttendanceKicker;

  /// No description provided for @sessionMemberAttendanceTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu facilitador está pasando lista'**
  String get sessionMemberAttendanceTitle;

  /// No description provided for @sessionMemberAttendanceFacilitatorTitle.
  ///
  /// In es, this message translates to:
  /// **'Estás pasando lista'**
  String get sessionMemberAttendanceFacilitatorTitle;

  /// No description provided for @sessionMemberAttendanceUnmarked.
  ///
  /// In es, this message translates to:
  /// **'Aún sin marcar'**
  String get sessionMemberAttendanceUnmarked;

  /// No description provided for @sessionMemberAttendanceWait.
  ///
  /// In es, this message translates to:
  /// **'Espera a que te nombren.'**
  String get sessionMemberAttendanceWait;

  /// No description provided for @sessionMemberAttendanceAbsentHint.
  ///
  /// In es, this message translates to:
  /// **'Si respondes igualmente, pasarás a Presente al sincronizar.'**
  String get sessionMemberAttendanceAbsentHint;

  /// No description provided for @sessionMemberAttendanceOkHint.
  ///
  /// In es, this message translates to:
  /// **'Perfecto. El seguimiento se abre en un momento.'**
  String get sessionMemberAttendanceOkHint;

  /// No description provided for @sessionMemberAttendanceFacilitatorHint.
  ///
  /// In es, this message translates to:
  /// **'Como facilitador quedas Presente. Marca a los demás en “Dirigir la mesa”.'**
  String get sessionMemberAttendanceFacilitatorHint;

  /// No description provided for @sessionMemberStepFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Seguim.'**
  String get sessionMemberStepFollowUp;

  /// No description provided for @sessionMemberStepValue.
  ///
  /// In es, this message translates to:
  /// **'Valor'**
  String get sessionMemberStepValue;

  /// No description provided for @sessionMemberStepCommitment.
  ///
  /// In es, this message translates to:
  /// **'Compromiso'**
  String get sessionMemberStepCommitment;

  /// No description provided for @sessionMemberChipDone.
  ///
  /// In es, this message translates to:
  /// **'Listo'**
  String get sessionMemberChipDone;

  /// No description provided for @sessionMemberChipNow.
  ///
  /// In es, this message translates to:
  /// **'Ahora'**
  String get sessionMemberChipNow;

  /// No description provided for @sessionMemberChipMissing.
  ///
  /// In es, this message translates to:
  /// **'Falta'**
  String get sessionMemberChipMissing;

  /// No description provided for @sessionMemberChipClosed.
  ///
  /// In es, this message translates to:
  /// **'Cerrado'**
  String get sessionMemberChipClosed;

  /// No description provided for @sessionMemberChipNotYet.
  ///
  /// In es, this message translates to:
  /// **'Aún no'**
  String get sessionMemberChipNotYet;

  /// No description provided for @sessionMemberChipSkipped.
  ///
  /// In es, this message translates to:
  /// **'Omitido'**
  String get sessionMemberChipSkipped;

  /// No description provided for @sessionMemberChipSemantics.
  ///
  /// In es, this message translates to:
  /// **'{step}: {state}'**
  String sessionMemberChipSemantics(String step, String state);

  /// No description provided for @sessionMemberStepsLabel.
  ///
  /// In es, this message translates to:
  /// **'Tus etapas'**
  String get sessionMemberStepsLabel;

  /// No description provided for @sessionMemberValueIncludesCommitment.
  ///
  /// In es, this message translates to:
  /// **'Valor actual incluye tu compromiso (no es una etapa aparte).'**
  String get sessionMemberValueIncludesCommitment;

  /// No description provided for @sessionMemberFollowUpKicker.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento · Valor {number}'**
  String sessionMemberFollowUpKicker(int number);

  /// No description provided for @sessionMemberPreviousCommitmentKicker.
  ///
  /// In es, this message translates to:
  /// **'Tu compromiso de la semana pasada'**
  String get sessionMemberPreviousCommitmentKicker;

  /// No description provided for @sessionMemberHowItWent.
  ///
  /// In es, this message translates to:
  /// **'¿Cómo te fue?'**
  String get sessionMemberHowItWent;

  /// No description provided for @sessionMemberStatusKept.
  ///
  /// In es, this message translates to:
  /// **'Lo cumplí'**
  String get sessionMemberStatusKept;

  /// No description provided for @sessionMemberStatusPartial.
  ///
  /// In es, this message translates to:
  /// **'Cumplí una parte'**
  String get sessionMemberStatusPartial;

  /// No description provided for @sessionMemberStatusNotKept.
  ///
  /// In es, this message translates to:
  /// **'No pude cumplirlo'**
  String get sessionMemberStatusNotKept;

  /// No description provided for @sessionMemberJustificationLabel.
  ///
  /// In es, this message translates to:
  /// **'¿Por qué ese puntaje?'**
  String get sessionMemberJustificationLabel;

  /// No description provided for @sessionMemberJustificationHint.
  ///
  /// In es, this message translates to:
  /// **'Opcional. Una frase corta.'**
  String get sessionMemberJustificationHint;

  /// No description provided for @sessionMemberFollowUpNoteLabel.
  ///
  /// In es, this message translates to:
  /// **'Cuéntanos en una frase (opcional)'**
  String get sessionMemberFollowUpNoteLabel;

  /// No description provided for @sessionMemberFollowUpScoreLabel.
  ///
  /// In es, this message translates to:
  /// **'¿Cómo te calificas hoy en {value}?'**
  String sessionMemberFollowUpScoreLabel(String value);

  /// No description provided for @sessionMemberFollowUpSend.
  ///
  /// In es, this message translates to:
  /// **'Enviar seguimiento'**
  String get sessionMemberFollowUpSend;

  /// No description provided for @sessionMemberNoPreviousTitle.
  ///
  /// In es, this message translates to:
  /// **'No tienes compromiso previo'**
  String get sessionMemberNoPreviousTitle;

  /// No description provided for @sessionMemberNoPreviousMessage.
  ///
  /// In es, this message translates to:
  /// **'La semana pasada no estuviste en la mesa, así que no hay nada que revisar. ¡Qué bueno verte hoy!'**
  String get sessionMemberNoPreviousMessage;

  /// No description provided for @sessionMemberFirstSessionTitle.
  ///
  /// In es, this message translates to:
  /// **'Es la primera sesión de tu mesa'**
  String get sessionMemberFirstSessionTitle;

  /// No description provided for @sessionMemberFirstSessionMessage.
  ///
  /// In es, this message translates to:
  /// **'Todavía no hay un compromiso que revisar. ¡Empecemos!'**
  String get sessionMemberFirstSessionMessage;

  /// No description provided for @sessionMemberReflectionKicker.
  ///
  /// In es, this message translates to:
  /// **'Valor actual · Valor {number} · parte 1 de 2'**
  String sessionMemberReflectionKicker(int number);

  /// No description provided for @sessionMemberReflectionHelper.
  ///
  /// In es, this message translates to:
  /// **'El contenido está en tu folleto; aquí solo anotas tus respuestas.'**
  String get sessionMemberReflectionHelper;

  /// No description provided for @sessionMemberPersonPickHelper.
  ///
  /// In es, this message translates to:
  /// **'Toca a alguien de tu mesa, o escribe otro nombre abajo.'**
  String get sessionMemberPersonPickHelper;

  /// No description provided for @sessionMemberPersonOtherLabel.
  ///
  /// In es, this message translates to:
  /// **'Otra persona'**
  String get sessionMemberPersonOtherLabel;

  /// No description provided for @sessionMemberPersonOtherHint.
  ///
  /// In es, this message translates to:
  /// **'Escribe el nombre si no está en la lista'**
  String get sessionMemberPersonOtherHint;

  /// No description provided for @sessionMemberReflectionScoreLabel.
  ///
  /// In es, this message translates to:
  /// **'Tu puntaje inicial en {value}'**
  String sessionMemberReflectionScoreLabel(String value);

  /// No description provided for @sessionMemberReflectionSend.
  ///
  /// In es, this message translates to:
  /// **'Enviar y seguir al compromiso'**
  String get sessionMemberReflectionSend;

  /// No description provided for @sessionMemberCommitmentKicker.
  ///
  /// In es, this message translates to:
  /// **'Valor actual · parte 2 de 2'**
  String get sessionMemberCommitmentKicker;

  /// No description provided for @sessionMemberCommitmentTitle.
  ///
  /// In es, this message translates to:
  /// **'Tu compromiso de esta semana'**
  String get sessionMemberCommitmentTitle;

  /// No description provided for @sessionMemberCommitmentHelper.
  ///
  /// In es, this message translates to:
  /// **'Una sola acción concreta y medible: qué haré, cuándo y cómo lo mediré.'**
  String get sessionMemberCommitmentHelper;

  /// No description provided for @sessionMemberWhatLabel.
  ///
  /// In es, this message translates to:
  /// **'Qué haré'**
  String get sessionMemberWhatLabel;

  /// No description provided for @sessionMemberWhatHint.
  ///
  /// In es, this message translates to:
  /// **'Ej.: Llamar a mi abuela 2 veces'**
  String get sessionMemberWhatHint;

  /// No description provided for @sessionMemberWhatExamplesKicker.
  ///
  /// In es, this message translates to:
  /// **'¿Sin ideas? Toca un ejemplo'**
  String get sessionMemberWhatExamplesKicker;

  /// No description provided for @sessionMemberWhatExample1.
  ///
  /// In es, this message translates to:
  /// **'Llamar a mi abuela 2 veces'**
  String get sessionMemberWhatExample1;

  /// No description provided for @sessionMemberWhatExample2.
  ///
  /// In es, this message translates to:
  /// **'Ordenar mi cuarto cada noche'**
  String get sessionMemberWhatExample2;

  /// No description provided for @sessionMemberWhatExample3.
  ///
  /// In es, this message translates to:
  /// **'Terminar mi tarea con 30 minutos diarios'**
  String get sessionMemberWhatExample3;

  /// No description provided for @sessionMemberWhenLabel.
  ///
  /// In es, this message translates to:
  /// **'Cuándo'**
  String get sessionMemberWhenLabel;

  /// No description provided for @sessionMemberWhenEveryDay.
  ///
  /// In es, this message translates to:
  /// **'Todos los días'**
  String get sessionMemberWhenEveryDay;

  /// No description provided for @sessionMemberWhenMondayThursday.
  ///
  /// In es, this message translates to:
  /// **'Lunes y jueves'**
  String get sessionMemberWhenMondayThursday;

  /// No description provided for @sessionMemberWhenThisWeek.
  ///
  /// In es, this message translates to:
  /// **'Esta semana'**
  String get sessionMemberWhenThisWeek;

  /// No description provided for @sessionMemberWhenBeforeFriday.
  ///
  /// In es, this message translates to:
  /// **'Antes del viernes'**
  String get sessionMemberWhenBeforeFriday;

  /// No description provided for @sessionMemberHowLabel.
  ///
  /// In es, this message translates to:
  /// **'Cómo lo mediré'**
  String get sessionMemberHowLabel;

  /// No description provided for @sessionMemberHowCount.
  ///
  /// In es, this message translates to:
  /// **'Cuántas veces lo hice'**
  String get sessionMemberHowCount;

  /// No description provided for @sessionMemberHowYesNo.
  ///
  /// In es, this message translates to:
  /// **'Sí o no cada día'**
  String get sessionMemberHowYesNo;

  /// No description provided for @sessionMemberHowSunday.
  ///
  /// In es, this message translates to:
  /// **'Lo reviso el domingo'**
  String get sessionMemberHowSunday;

  /// No description provided for @sessionMemberHowTell.
  ///
  /// In es, this message translates to:
  /// **'Se lo cuento a la mesa'**
  String get sessionMemberHowTell;

  /// No description provided for @sessionMemberCommitmentSend.
  ///
  /// In es, this message translates to:
  /// **'Enviar mi compromiso'**
  String get sessionMemberCommitmentSend;

  /// No description provided for @sessionMemberErrorAnswer.
  ///
  /// In es, this message translates to:
  /// **'Escribe una respuesta corta.'**
  String get sessionMemberErrorAnswer;

  /// No description provided for @sessionMemberErrorTooShort.
  ///
  /// In es, this message translates to:
  /// **'Muy corta. Cuenta un poco más.'**
  String get sessionMemberErrorTooShort;

  /// No description provided for @sessionMemberErrorScore.
  ///
  /// In es, this message translates to:
  /// **'Elige tu puntaje de 1 a 10 (el 5 no se puede).'**
  String get sessionMemberErrorScore;

  /// No description provided for @sessionMemberErrorStatus.
  ///
  /// In es, this message translates to:
  /// **'Elige cómo te fue con tu compromiso.'**
  String get sessionMemberErrorStatus;

  /// No description provided for @sessionMemberErrorWhat.
  ///
  /// In es, this message translates to:
  /// **'Escribe una acción concreta para esta semana.'**
  String get sessionMemberErrorWhat;

  /// No description provided for @sessionMemberErrorWhatShort.
  ///
  /// In es, this message translates to:
  /// **'Muy corta. Cuenta qué harás y cuánto.'**
  String get sessionMemberErrorWhatShort;

  /// No description provided for @sessionMemberErrorWhen.
  ///
  /// In es, this message translates to:
  /// **'Elige cuándo lo harás.'**
  String get sessionMemberErrorWhen;

  /// No description provided for @sessionMemberErrorHow.
  ///
  /// In es, this message translates to:
  /// **'Elige cómo lo vas a medir.'**
  String get sessionMemberErrorHow;

  /// No description provided for @sessionMemberLockedTitle.
  ///
  /// In es, this message translates to:
  /// **'Etapa cerrada'**
  String get sessionMemberLockedTitle;

  /// No description provided for @sessionMemberLockedMemberMessage.
  ///
  /// In es, this message translates to:
  /// **'Tu facilitador ya cerró las respuestas.'**
  String get sessionMemberLockedMemberMessage;

  /// No description provided for @sessionMemberLockedFacilitatorMessage.
  ///
  /// In es, this message translates to:
  /// **'Cerraste las respuestas.'**
  String get sessionMemberLockedFacilitatorMessage;

  /// No description provided for @sessionMemberDockSend.
  ///
  /// In es, this message translates to:
  /// **'Enviar'**
  String get sessionMemberDockSend;

  /// No description provided for @sessionMemberDockContinue.
  ///
  /// In es, this message translates to:
  /// **'Seguir'**
  String get sessionMemberDockContinue;

  /// No description provided for @sessionMemberDockSaved.
  ///
  /// In es, this message translates to:
  /// **'Guardado'**
  String get sessionMemberDockSaved;

  /// No description provided for @sessionMemberDockSentWaiting.
  ///
  /// In es, this message translates to:
  /// **'Enviado · esperando a la mesa'**
  String get sessionMemberDockSentWaiting;

  /// No description provided for @sessionMemberDockReadyWaiting.
  ///
  /// In es, this message translates to:
  /// **'Listo · esperando a la mesa'**
  String get sessionMemberDockReadyWaiting;

  /// No description provided for @sessionMemberDockClosed.
  ///
  /// In es, this message translates to:
  /// **'Cerrado'**
  String get sessionMemberDockClosed;

  /// No description provided for @sessionMemberSentLive.
  ///
  /// In es, this message translates to:
  /// **'Enviado.'**
  String get sessionMemberSentLive;

  /// No description provided for @sessionMemberSentWaitingFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Enviado. Falta que el facilitador cierre las respuestas.'**
  String get sessionMemberSentWaitingFacilitator;

  /// No description provided for @sessionMemberSavedOffline.
  ///
  /// In es, this message translates to:
  /// **'Guardado en este teléfono. Sigue con el siguiente paso cuando quieras.'**
  String get sessionMemberSavedOffline;

  /// No description provided for @sessionMemberRecapKickerFinished.
  ///
  /// In es, this message translates to:
  /// **'Terminaste'**
  String get sessionMemberRecapKickerFinished;

  /// No description provided for @sessionMemberRecapKickerPending.
  ///
  /// In es, this message translates to:
  /// **'Resumen'**
  String get sessionMemberRecapKickerPending;

  /// No description provided for @sessionMemberRecapTitleFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Tus respuestas están completas'**
  String get sessionMemberRecapTitleFacilitator;

  /// No description provided for @sessionMemberRecapTitleLive.
  ///
  /// In es, this message translates to:
  /// **'Esperando el cierre de la mesa'**
  String get sessionMemberRecapTitleLive;

  /// No description provided for @sessionMemberRecapTitleOffline.
  ///
  /// In es, this message translates to:
  /// **'Todo guardado en tu teléfono'**
  String get sessionMemberRecapTitleOffline;

  /// No description provided for @sessionMemberRecapTitlePending.
  ///
  /// In es, this message translates to:
  /// **'Tienes etapas pendientes'**
  String get sessionMemberRecapTitlePending;

  /// No description provided for @sessionMemberRecapOfflineInfo.
  ///
  /// In es, this message translates to:
  /// **'Cuando tengas internet, tus respuestas se sincronizan solas. Si la sesión ya cerró, se marcarán “Sincronizado tarde”.'**
  String get sessionMemberRecapOfflineInfo;

  /// No description provided for @sessionMemberRecapAnswersClosed.
  ///
  /// In es, this message translates to:
  /// **'Tu facilitador cerró las respuestas. Falta que cierre la sesión.'**
  String get sessionMemberRecapAnswersClosed;

  /// No description provided for @sessionMemberResultFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento · {value}'**
  String sessionMemberResultFollowUp(String value);

  /// No description provided for @sessionMemberResultFollowUpSkipped.
  ///
  /// In es, this message translates to:
  /// **'Sin compromiso previo (omitido)'**
  String get sessionMemberResultFollowUpSkipped;

  /// No description provided for @sessionMemberResultInitialScore.
  ///
  /// In es, this message translates to:
  /// **'Valor actual · puntaje inicial'**
  String get sessionMemberResultInitialScore;

  /// No description provided for @sessionMemberResultCommitment.
  ///
  /// In es, this message translates to:
  /// **'Mi compromiso'**
  String get sessionMemberResultCommitment;

  /// No description provided for @sessionMemberResultsEmpty.
  ///
  /// In es, this message translates to:
  /// **'Aún no hay respuestas guardadas.'**
  String get sessionMemberResultsEmpty;

  /// No description provided for @sessionMemberSummaryKicker.
  ///
  /// In es, this message translates to:
  /// **'Sesión cerrada'**
  String get sessionMemberSummaryKicker;

  /// No description provided for @sessionMemberSummaryThanks.
  ///
  /// In es, this message translates to:
  /// **'Gracias, {name}'**
  String sessionMemberSummaryThanks(String name);

  /// No description provided for @sessionMemberSummaryAttendance.
  ///
  /// In es, this message translates to:
  /// **'Tu asistencia'**
  String get sessionMemberSummaryAttendance;

  /// No description provided for @sessionMemberSummaryAutomatic.
  ///
  /// In es, this message translates to:
  /// **'automática'**
  String get sessionMemberSummaryAutomatic;

  /// No description provided for @sessionMemberSummaryUnanswered.
  ///
  /// In es, this message translates to:
  /// **'Quedaron etapas sin responder. Ya no se pueden enviar desde la mesa en vivo.'**
  String get sessionMemberSummaryUnanswered;

  /// No description provided for @sessionMemberSyncPendingDetailOffline.
  ///
  /// In es, this message translates to:
  /// **'Se enviará cuando tengas internet.'**
  String get sessionMemberSyncPendingDetailOffline;

  /// No description provided for @sessionMemberSyncSyncedDetail.
  ///
  /// In es, this message translates to:
  /// **'Tus respuestas ya están en la mesa.'**
  String get sessionMemberSyncSyncedDetail;

  /// No description provided for @sessionMemberSyncLateDetail.
  ///
  /// In es, this message translates to:
  /// **'Llegó después del cierre de la sesión: se aceptó y quedó marcado.'**
  String get sessionMemberSyncLateDetail;

  /// No description provided for @sessionMemberSyncOfflineTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin internet · todo se guarda en este teléfono'**
  String get sessionMemberSyncOfflineTitle;

  /// No description provided for @sessionMemberSyncOfflineFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Tus respuestas se sincronizan igual que las de un miembro.'**
  String get sessionMemberSyncOfflineFacilitator;

  /// No description provided for @sessionMemberSyncOfflineMember.
  ///
  /// In es, this message translates to:
  /// **'Tu facilitador te guía de palabra. Sigue a tu ritmo.'**
  String get sessionMemberSyncOfflineMember;

  /// No description provided for @sessionMemberAutoPendingTitle.
  ///
  /// In es, this message translates to:
  /// **'Te marcaron Ausente.'**
  String get sessionMemberAutoPendingTitle;

  /// No description provided for @sessionMemberAutoPendingDetail.
  ///
  /// In es, this message translates to:
  /// **'Como respondiste, tu asistencia pasará a Presente al sincronizar.'**
  String get sessionMemberAutoPendingDetail;

  /// No description provided for @sessionMemberAutoDoneTitle.
  ///
  /// In es, this message translates to:
  /// **'Asistencia automática'**
  String get sessionMemberAutoDoneTitle;

  /// No description provided for @sessionMemberAutoDoneDetail.
  ///
  /// In es, this message translates to:
  /// **'Pasaste de Ausente a Presente porque respondiste.'**
  String get sessionMemberAutoDoneDetail;

  /// No description provided for @sessionMemberAbsentInfo.
  ///
  /// In es, this message translates to:
  /// **'Estás marcado como Ausente. Si respondes, pasarás a Presente al sincronizar.'**
  String get sessionMemberAbsentInfo;

  /// No description provided for @sessionMemberToastSent.
  ///
  /// In es, this message translates to:
  /// **'Enviado'**
  String get sessionMemberToastSent;

  /// No description provided for @sessionMemberToastFailed.
  ///
  /// In es, this message translates to:
  /// **'No se pudo guardar. Inténtalo de nuevo.'**
  String get sessionMemberToastFailed;

  /// No description provided for @sessionMemberOfflineBannerDetail.
  ///
  /// In es, this message translates to:
  /// **'todo se guarda en este teléfono'**
  String get sessionMemberOfflineBannerDetail;

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

  /// No description provided for @authOfflineWindowTitle.
  ///
  /// In es, this message translates to:
  /// **'Conéctate para volver a entrar'**
  String get authOfflineWindowTitle;

  /// No description provided for @authOfflineWindowBody.
  ///
  /// In es, this message translates to:
  /// **'Llevas más de 7 días sin conexión. Conéctate a internet y toca Reintentar para confirmar tu sesión. Lo que guardaste en este teléfono sigue aquí y se enviará al conectarte.'**
  String get authOfflineWindowBody;

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

  /// No description provided for @invitesProblemRateLimited.
  ///
  /// In es, this message translates to:
  /// **'Hubo demasiados intentos seguidos. Espera un minuto e inténtalo de nuevo.'**
  String get invitesProblemRateLimited;

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

  /// No description provided for @invitesRoleOnlyAdmin.
  ///
  /// In es, this message translates to:
  /// **'Solo la administración de la plataforma'**
  String get invitesRoleOnlyAdmin;

  /// No description provided for @invitesRoleLockedCoordinatorToast.
  ///
  /// In es, this message translates to:
  /// **'Solo la administración de la plataforma puede invitar coordinadores.'**
  String get invitesRoleLockedCoordinatorToast;

  /// No description provided for @invitesProblemRoleNotAllowed.
  ///
  /// In es, this message translates to:
  /// **'Con tu rol no puedes invitar a una persona con ese rol.'**
  String get invitesProblemRoleNotAllowed;

  /// No description provided for @invitesProblemTableNotAllowed.
  ///
  /// In es, this message translates to:
  /// **'Solo puedes invitar integrantes a tu propia mesa.'**
  String get invitesProblemTableNotAllowed;

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

  /// No description provided for @historyNavLabel.
  ///
  /// In es, this message translates to:
  /// **'Progreso'**
  String get historyNavLabel;

  /// No description provided for @historyMemberTitle.
  ///
  /// In es, this message translates to:
  /// **'Mi progreso'**
  String get historyMemberTitle;

  /// No description provided for @historyTableTitle.
  ///
  /// In es, this message translates to:
  /// **'Progreso de la mesa'**
  String get historyTableTitle;

  /// No description provided for @historyTimelineTitle.
  ///
  /// In es, this message translates to:
  /// **'Recorrido de {name}'**
  String historyTimelineTitle(String name);

  /// No description provided for @historyHomeLinkMember.
  ///
  /// In es, this message translates to:
  /// **'Ver mi progreso'**
  String get historyHomeLinkMember;

  /// No description provided for @historyHomeLinkFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Ver el progreso de la mesa'**
  String get historyHomeLinkFacilitator;

  /// No description provided for @historyWindowNote.
  ///
  /// In es, this message translates to:
  /// **'Ves las últimas 8 semanas guardadas en este dispositivo. Lo anterior sigue a salvo en el servidor.'**
  String get historyWindowNote;

  /// No description provided for @historyOfflineDetail.
  ///
  /// In es, this message translates to:
  /// **'estás viendo lo guardado en este dispositivo'**
  String get historyOfflineDetail;

  /// No description provided for @historyUnavailableTitle.
  ///
  /// In es, this message translates to:
  /// **'Aquí verás tu progreso'**
  String get historyUnavailableTitle;

  /// No description provided for @historyUnavailableMessage.
  ///
  /// In es, this message translates to:
  /// **'Cuando te unas a una mesa, tus puntajes y compromisos aparecerán aquí.'**
  String get historyUnavailableMessage;

  /// No description provided for @historyEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'Todavía no hay historial'**
  String get historyEmptyTitle;

  /// No description provided for @historyEmptyMessage.
  ///
  /// In es, this message translates to:
  /// **'Después de la primera sesión verás aquí puntajes, compromisos y asistencia.'**
  String get historyEmptyMessage;

  /// No description provided for @historyStatAttendance.
  ///
  /// In es, this message translates to:
  /// **'Asistencia'**
  String get historyStatAttendance;

  /// No description provided for @historyAttendedOf.
  ///
  /// In es, this message translates to:
  /// **'{attended} de {total}'**
  String historyAttendedOf(int attended, int total);

  /// No description provided for @historyStatInitial.
  ///
  /// In es, this message translates to:
  /// **'Puntaje inicial (promedio)'**
  String get historyStatInitial;

  /// No description provided for @historyStatFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento (promedio)'**
  String get historyStatFollowUp;

  /// No description provided for @historyStatImprovement.
  ///
  /// In es, this message translates to:
  /// **'Mejora promedio'**
  String get historyStatImprovement;

  /// No description provided for @historyStatSessions.
  ///
  /// In es, this message translates to:
  /// **'Sesiones realizadas'**
  String get historyStatSessions;

  /// No description provided for @historyStatAttendanceRate.
  ///
  /// In es, this message translates to:
  /// **'Asistencia de la mesa'**
  String get historyStatAttendanceRate;

  /// No description provided for @historyPercent.
  ///
  /// In es, this message translates to:
  /// **'{value}'**
  String historyPercent(double value);

  /// No description provided for @historyChartTitle.
  ///
  /// In es, this message translates to:
  /// **'Inicial y seguimiento por valor'**
  String get historyChartTitle;

  /// No description provided for @historyChartAxisHint.
  ///
  /// In es, this message translates to:
  /// **'Cada número es el valor del programa. Puntajes del 1 al 10.'**
  String get historyChartAxisHint;

  /// No description provided for @historyLegendInitial.
  ///
  /// In es, this message translates to:
  /// **'Inicial'**
  String get historyLegendInitial;

  /// No description provided for @historyLegendFollowUp.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento'**
  String get historyLegendFollowUp;

  /// No description provided for @historyChartSemantics.
  ///
  /// In es, this message translates to:
  /// **'Gráfica de puntajes inicial y de seguimiento por valor'**
  String get historyChartSemantics;

  /// No description provided for @historyChartItemSemantics.
  ///
  /// In es, this message translates to:
  /// **'Valor {sequence}, {name}: inicial {initial}, seguimiento {followUp}'**
  String historyChartItemSemantics(
    int sequence,
    String name,
    String initial,
    String followUp,
  );

  /// No description provided for @historyScoreMissing.
  ///
  /// In es, this message translates to:
  /// **'sin dato'**
  String get historyScoreMissing;

  /// No description provided for @historyImprovementUp.
  ///
  /// In es, this message translates to:
  /// **'Mejoró {points}'**
  String historyImprovementUp(int points);

  /// No description provided for @historyImprovementDown.
  ///
  /// In es, this message translates to:
  /// **'Bajó {points}'**
  String historyImprovementDown(int points);

  /// No description provided for @historyImprovementSame.
  ///
  /// In es, this message translates to:
  /// **'Sin cambio'**
  String get historyImprovementSame;

  /// No description provided for @historyImprovementPending.
  ///
  /// In es, this message translates to:
  /// **'Se mide en el seguimiento'**
  String get historyImprovementPending;

  /// No description provided for @historyModuleHeading.
  ///
  /// In es, this message translates to:
  /// **'Módulo {number} · {name}'**
  String historyModuleHeading(int number, String name);

  /// No description provided for @historyValueHeading.
  ///
  /// In es, this message translates to:
  /// **'Valor {sequence} · {name}'**
  String historyValueHeading(int sequence, String name);

  /// No description provided for @historyValuesTitle.
  ///
  /// In es, this message translates to:
  /// **'Por valor'**
  String get historyValuesTitle;

  /// No description provided for @historyScoreInitialLine.
  ///
  /// In es, this message translates to:
  /// **'Inicial: {score}'**
  String historyScoreInitialLine(String score);

  /// No description provided for @historyScoreFollowUpLine.
  ///
  /// In es, this message translates to:
  /// **'Seguimiento: {score}'**
  String historyScoreFollowUpLine(String score);

  /// No description provided for @historyWhyKicker.
  ///
  /// In es, this message translates to:
  /// **'¿Por qué ese puntaje?'**
  String get historyWhyKicker;

  /// No description provided for @historyCommitmentKicker.
  ///
  /// In es, this message translates to:
  /// **'Compromiso'**
  String get historyCommitmentKicker;

  /// No description provided for @historyCommitmentMeasure.
  ///
  /// In es, this message translates to:
  /// **'Cómo lo mediré: {measure}'**
  String historyCommitmentMeasure(String measure);

  /// No description provided for @historyCommitmentPending.
  ///
  /// In es, this message translates to:
  /// **'Se revisa en la próxima sesión'**
  String get historyCommitmentPending;

  /// No description provided for @historyCommitmentNote.
  ///
  /// In es, this message translates to:
  /// **'“{note}”'**
  String historyCommitmentNote(String note);

  /// No description provided for @historyLateSynced.
  ///
  /// In es, this message translates to:
  /// **'Enviado tarde'**
  String get historyLateSynced;

  /// No description provided for @historySessionsTitle.
  ///
  /// In es, this message translates to:
  /// **'Sesiones'**
  String get historySessionsTitle;

  /// No description provided for @historySessionOpenNow.
  ///
  /// In es, this message translates to:
  /// **'En curso'**
  String get historySessionOpenNow;

  /// No description provided for @historySessionIncomplete.
  ///
  /// In es, this message translates to:
  /// **'Incompleta'**
  String get historySessionIncomplete;

  /// No description provided for @historyAttendanceNone.
  ///
  /// In es, this message translates to:
  /// **'Sin registro'**
  String get historyAttendanceNone;

  /// No description provided for @historySessionTitle.
  ///
  /// In es, this message translates to:
  /// **'{date}'**
  String historySessionTitle(DateTime date);

  /// No description provided for @historySessionValueLine.
  ///
  /// In es, this message translates to:
  /// **'Valor {sequence} · {name}'**
  String historySessionValueLine(int sequence, String name);

  /// No description provided for @historySessionAttendance.
  ///
  /// In es, this message translates to:
  /// **'Asistieron {attended} de {total}'**
  String historySessionAttendance(int attended, int total);

  /// No description provided for @historySessionScores.
  ///
  /// In es, this message translates to:
  /// **'Inicial {initial} · Seguimiento {followUp}'**
  String historySessionScores(String initial, String followUp);

  /// No description provided for @historyMembersTitle.
  ///
  /// In es, this message translates to:
  /// **'Integrantes'**
  String get historyMembersTitle;

  /// No description provided for @historyFacilitatorTag.
  ///
  /// In es, this message translates to:
  /// **'Facilitador'**
  String get historyFacilitatorTag;

  /// No description provided for @historyMemberAverages.
  ///
  /// In es, this message translates to:
  /// **'Inicial {initial} · Seguimiento {followUp}'**
  String historyMemberAverages(String initial, String followUp);

  /// No description provided for @historyOpenTimeline.
  ///
  /// In es, this message translates to:
  /// **'Ver el recorrido de {name}'**
  String historyOpenTimeline(String name);

  /// No description provided for @historyTableValuesTitle.
  ///
  /// In es, this message translates to:
  /// **'Promedio de la mesa por valor'**
  String get historyTableValuesTitle;

  /// No description provided for @historyTableValueLine.
  ///
  /// In es, this message translates to:
  /// **'Inicial {initial} · Seguimiento {followUp} · {count} personas'**
  String historyTableValueLine(String initial, String followUp, int count);

  /// No description provided for @historyNoCommitment.
  ///
  /// In es, this message translates to:
  /// **'Sin compromiso'**
  String get historyNoCommitment;

  /// No description provided for @historyLoadError.
  ///
  /// In es, this message translates to:
  /// **'No pudimos leer tu historial en este dispositivo.'**
  String get historyLoadError;

  /// No description provided for @adminSessionsTitle.
  ///
  /// In es, this message translates to:
  /// **'Próxima sesión'**
  String get adminSessionsTitle;

  /// No description provided for @adminSessionNone.
  ///
  /// In es, this message translates to:
  /// **'Esta mesa no tiene una sesión pendiente.'**
  String get adminSessionNone;

  /// No description provided for @adminSessionExtraBadge.
  ///
  /// In es, this message translates to:
  /// **'Extraordinaria'**
  String get adminSessionExtraBadge;

  /// No description provided for @adminSessionMovedBadge.
  ///
  /// In es, this message translates to:
  /// **'Reprogramada'**
  String get adminSessionMovedBadge;

  /// No description provided for @adminSessionMovedFrom.
  ///
  /// In es, this message translates to:
  /// **'Antes: {date}'**
  String adminSessionMovedFrom(String date);

  /// No description provided for @adminSessionInProgress.
  ///
  /// In es, this message translates to:
  /// **'La sesión ya empezó: no se puede cambiar.'**
  String get adminSessionInProgress;

  /// No description provided for @adminSessionReschedule.
  ///
  /// In es, this message translates to:
  /// **'Reprogramar'**
  String get adminSessionReschedule;

  /// No description provided for @adminSessionCancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar sesión'**
  String get adminSessionCancel;

  /// No description provided for @adminSessionAddExtra.
  ///
  /// In es, this message translates to:
  /// **'Sesión extraordinaria'**
  String get adminSessionAddExtra;

  /// No description provided for @adminRescheduleTitle.
  ///
  /// In es, this message translates to:
  /// **'Reprogramar la sesión'**
  String get adminRescheduleTitle;

  /// No description provided for @adminRescheduleMessage.
  ///
  /// In es, this message translates to:
  /// **'La mesa se reunirá en la fecha y hora que elijas (zona {timezone}). El resto del calendario semanal no cambia.'**
  String adminRescheduleMessage(String timezone);

  /// No description provided for @adminExtraTitle.
  ///
  /// In es, this message translates to:
  /// **'Agregar sesión extraordinaria'**
  String get adminExtraTitle;

  /// No description provided for @adminExtraMessage.
  ///
  /// In es, this message translates to:
  /// **'Una reunión adicional antes de la próxima sesión regular ({date}). Trabaja el valor actual de la mesa y, al realizarla, el programa avanza. Zona {timezone}.'**
  String adminExtraMessage(String date, String timezone);

  /// No description provided for @adminFieldDateTime.
  ///
  /// In es, this message translates to:
  /// **'Fecha y hora'**
  String get adminFieldDateTime;

  /// No description provided for @adminFieldDate.
  ///
  /// In es, this message translates to:
  /// **'Fecha'**
  String get adminFieldDate;

  /// No description provided for @adminSessionReason.
  ///
  /// In es, this message translates to:
  /// **'Motivo (opcional)'**
  String get adminSessionReason;

  /// No description provided for @adminSessionConfirmReschedule.
  ///
  /// In es, this message translates to:
  /// **'Reprogramar'**
  String get adminSessionConfirmReschedule;

  /// No description provided for @adminSessionConfirmExtra.
  ///
  /// In es, this message translates to:
  /// **'Agregar sesión'**
  String get adminSessionConfirmExtra;

  /// No description provided for @adminCancelSessionTitle.
  ///
  /// In es, this message translates to:
  /// **'Cancelar esta sesión'**
  String get adminCancelSessionTitle;

  /// No description provided for @adminCancelSessionMessage.
  ///
  /// In es, this message translates to:
  /// **'La sesión del {date} no se realizará. El valor no avanza: la próxima sesión de la mesa trabajará el mismo valor.'**
  String adminCancelSessionMessage(String date);

  /// No description provided for @adminCancelReason.
  ///
  /// In es, this message translates to:
  /// **'Motivo'**
  String get adminCancelReason;

  /// No description provided for @adminCancelReasonHoliday.
  ///
  /// In es, this message translates to:
  /// **'Feriado'**
  String get adminCancelReasonHoliday;

  /// No description provided for @adminCancelReasonForceMajeure.
  ///
  /// In es, this message translates to:
  /// **'Fuerza mayor'**
  String get adminCancelReasonForceMajeure;

  /// No description provided for @adminCancelReasonOther.
  ///
  /// In es, this message translates to:
  /// **'Otro motivo'**
  String get adminCancelReasonOther;

  /// No description provided for @adminCancelNote.
  ///
  /// In es, this message translates to:
  /// **'Nota (opcional)'**
  String get adminCancelNote;

  /// No description provided for @adminCancelConfirm.
  ///
  /// In es, this message translates to:
  /// **'Cancelar sesión'**
  String get adminCancelConfirm;

  /// No description provided for @adminCancelKeep.
  ///
  /// In es, this message translates to:
  /// **'Mantener sesión'**
  String get adminCancelKeep;

  /// No description provided for @adminToastSessionRescheduled.
  ///
  /// In es, this message translates to:
  /// **'Sesión reprogramada.'**
  String get adminToastSessionRescheduled;

  /// No description provided for @adminToastSessionCancelled.
  ///
  /// In es, this message translates to:
  /// **'Sesión cancelada. La próxima trabajará el mismo valor.'**
  String get adminToastSessionCancelled;

  /// No description provided for @adminToastExtraAdded.
  ///
  /// In es, this message translates to:
  /// **'Sesión extraordinaria agregada.'**
  String get adminToastExtraAdded;

  /// No description provided for @adminErrorSessionInProgress.
  ///
  /// In es, this message translates to:
  /// **'La sesión ya empezó; no se puede cambiar.'**
  String get adminErrorSessionInProgress;

  /// No description provided for @adminErrorScheduleInPast.
  ///
  /// In es, this message translates to:
  /// **'La fecha de la sesión debe ser futura.'**
  String get adminErrorScheduleInPast;

  /// No description provided for @adminErrorSlotTaken.
  ///
  /// In es, this message translates to:
  /// **'La mesa ya tiene una sesión en esa fecha y hora.'**
  String get adminErrorSlotTaken;

  /// No description provided for @adminErrorExtraNotBeforeNext.
  ///
  /// In es, this message translates to:
  /// **'La sesión extraordinaria debe ser antes de la próxima sesión de la mesa.'**
  String get adminErrorExtraNotBeforeNext;

  /// No description provided for @adminErrorExtraExists.
  ///
  /// In es, this message translates to:
  /// **'Ya hay una sesión extraordinaria pendiente; reprográmala o cancélala.'**
  String get adminErrorExtraExists;

  /// No description provided for @adminErrorEffectiveInPast.
  ///
  /// In es, this message translates to:
  /// **'El nuevo horario no puede empezar en una fecha pasada.'**
  String get adminErrorEffectiveInPast;

  /// No description provided for @adminScheduleHistory.
  ///
  /// In es, this message translates to:
  /// **'Historial de horarios'**
  String get adminScheduleHistory;

  /// No description provided for @adminScheduleFrom.
  ///
  /// In es, this message translates to:
  /// **'Desde {date}'**
  String adminScheduleFrom(String date);

  /// No description provided for @adminScheduleCurrent.
  ///
  /// In es, this message translates to:
  /// **'Vigente'**
  String get adminScheduleCurrent;

  /// No description provided for @adminScheduleUpcoming.
  ///
  /// In es, this message translates to:
  /// **'Programado'**
  String get adminScheduleUpcoming;

  /// No description provided for @adminScheduleEffectiveFrom.
  ///
  /// In es, this message translates to:
  /// **'Vigente desde'**
  String get adminScheduleEffectiveFrom;

  /// No description provided for @adminScheduleEffectiveHelp.
  ///
  /// In es, this message translates to:
  /// **'Si no eliges fecha, el cambio aplica desde hoy. Con una fecha futura, las sesiones anteriores no se mueven.'**
  String get adminScheduleEffectiveHelp;

  /// No description provided for @homeSessionExtraordinary.
  ///
  /// In es, this message translates to:
  /// **'Sesión extraordinaria'**
  String get homeSessionExtraordinary;

  /// No description provided for @homeSessionMoved.
  ///
  /// In es, this message translates to:
  /// **'Reprogramada · antes {date}'**
  String homeSessionMoved(String date);

  /// No description provided for @homeSessionCancelledNotice.
  ///
  /// In es, this message translates to:
  /// **'Se canceló la sesión del {date}. La próxima trabaja el mismo valor.'**
  String homeSessionCancelledNotice(String date);

  /// No description provided for @calendarNavLabel.
  ///
  /// In es, this message translates to:
  /// **'Calendario'**
  String get calendarNavLabel;

  /// No description provided for @calendarTitle.
  ///
  /// In es, this message translates to:
  /// **'Próximas sesiones'**
  String get calendarTitle;

  /// No description provided for @calendarCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 sesión} other{{count} sesiones}}'**
  String calendarCount(int count);

  /// No description provided for @calendarEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'No hay sesiones próximas'**
  String get calendarEmptyTitle;

  /// No description provided for @calendarEmptyMessage.
  ///
  /// In es, this message translates to:
  /// **'Cuando una mesa tenga su siguiente sesión programada, aparecerá aquí.'**
  String get calendarEmptyMessage;

  /// No description provided for @calendarEmptyFilteredMessage.
  ///
  /// In es, this message translates to:
  /// **'Ninguna sesión coincide con estos filtros.'**
  String get calendarEmptyFilteredMessage;

  /// No description provided for @calendarUnavailableTitle.
  ///
  /// In es, this message translates to:
  /// **'Sin calendario para este rol'**
  String get calendarUnavailableTitle;

  /// No description provided for @calendarUnavailableMessage.
  ///
  /// In es, this message translates to:
  /// **'El calendario es para coordinadores, administradores y facilitadores.'**
  String get calendarUnavailableMessage;

  /// No description provided for @calendarLoadError.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar las próximas sesiones.'**
  String get calendarLoadError;

  /// No description provided for @calendarOpenBadge.
  ///
  /// In es, this message translates to:
  /// **'En curso'**
  String get calendarOpenBadge;

  /// No description provided for @calendarCancelledBadge.
  ///
  /// In es, this message translates to:
  /// **'Cancelada'**
  String get calendarCancelledBadge;

  /// No description provided for @calendarMovedBadge.
  ///
  /// In es, this message translates to:
  /// **'Reprogramada · antes {date}'**
  String calendarMovedBadge(String date);

  /// No description provided for @calendarTableTime.
  ///
  /// In es, this message translates to:
  /// **'Hora de la mesa · {timezone}'**
  String calendarTableTime(String timezone);

  /// No description provided for @calendarNoFacilitator.
  ///
  /// In es, this message translates to:
  /// **'Sin facilitador'**
  String get calendarNoFacilitator;

  /// No description provided for @calendarOpenTable.
  ///
  /// In es, this message translates to:
  /// **'Abrir la mesa {table}'**
  String calendarOpenTable(String table);

  /// No description provided for @curriculumNav.
  ///
  /// In es, this message translates to:
  /// **'Currículo'**
  String get curriculumNav;

  /// No description provided for @curriculumTitle.
  ///
  /// In es, this message translates to:
  /// **'Currículo'**
  String get curriculumTitle;

  /// No description provided for @curriculumIntro.
  ///
  /// In es, this message translates to:
  /// **'Los 5 módulos, los 48 valores y sus preguntas de reflexión. Aquí puedes subir el contenido, corregir textos y agregar idiomas. Lo que cambies llega a los dispositivos al sincronizar.'**
  String get curriculumIntro;

  /// No description provided for @curriculumDeniedMessage.
  ///
  /// In es, this message translates to:
  /// **'Solo la administración de la plataforma puede ver y editar el currículo.'**
  String get curriculumDeniedMessage;

  /// No description provided for @curriculumLanguageBase.
  ///
  /// In es, this message translates to:
  /// **'{name} (base)'**
  String curriculumLanguageBase(String name);

  /// No description provided for @curriculumAddLanguage.
  ///
  /// In es, this message translates to:
  /// **'Agregar idioma'**
  String get curriculumAddLanguage;

  /// No description provided for @curriculumAddLanguageConfirm.
  ///
  /// In es, this message translates to:
  /// **'Agregar'**
  String get curriculumAddLanguageConfirm;

  /// No description provided for @curriculumFieldLanguageName.
  ///
  /// In es, this message translates to:
  /// **'Nombre del idioma'**
  String get curriculumFieldLanguageName;

  /// No description provided for @curriculumFieldLanguageNameHint.
  ///
  /// In es, this message translates to:
  /// **'English'**
  String get curriculumFieldLanguageNameHint;

  /// No description provided for @curriculumFieldLanguageCode.
  ///
  /// In es, this message translates to:
  /// **'Código del idioma'**
  String get curriculumFieldLanguageCode;

  /// No description provided for @curriculumFieldLanguageCodeHint.
  ///
  /// In es, this message translates to:
  /// **'en'**
  String get curriculumFieldLanguageCodeHint;

  /// No description provided for @curriculumFieldLanguageCodeHelper.
  ///
  /// In es, this message translates to:
  /// **'2 o 3 letras minúsculas, por ejemplo en o pt.'**
  String get curriculumFieldLanguageCodeHelper;

  /// No description provided for @curriculumCompleteness.
  ///
  /// In es, this message translates to:
  /// **'{name}: {translated} de {total} textos traducidos ({percent} %)'**
  String curriculumCompleteness(
    String name,
    int translated,
    int total,
    int percent,
  );

  /// No description provided for @curriculumCompletenessHint.
  ///
  /// In es, this message translates to:
  /// **'Lo que falta se muestra en español a quienes usan este idioma.'**
  String get curriculumCompletenessHint;

  /// No description provided for @curriculumLanguageActive.
  ///
  /// In es, this message translates to:
  /// **'Disponible en la app'**
  String get curriculumLanguageActive;

  /// No description provided for @curriculumLanguageHidden.
  ///
  /// In es, this message translates to:
  /// **'Oculto'**
  String get curriculumLanguageHidden;

  /// No description provided for @curriculumHideLanguage.
  ///
  /// In es, this message translates to:
  /// **'Ocultar en la app'**
  String get curriculumHideLanguage;

  /// No description provided for @curriculumShowLanguage.
  ///
  /// In es, this message translates to:
  /// **'Mostrar en la app'**
  String get curriculumShowLanguage;

  /// No description provided for @curriculumUpload.
  ///
  /// In es, this message translates to:
  /// **'Subir currículo'**
  String get curriculumUpload;

  /// No description provided for @curriculumUploadTranslation.
  ///
  /// In es, this message translates to:
  /// **'Subir traducción ({name})'**
  String curriculumUploadTranslation(String name);

  /// No description provided for @curriculumExport.
  ///
  /// In es, this message translates to:
  /// **'Compartir archivo del currículo'**
  String get curriculumExport;

  /// No description provided for @curriculumExportSubject.
  ///
  /// In es, this message translates to:
  /// **'Currículo ({name})'**
  String curriculumExportSubject(String name);

  /// No description provided for @curriculumModuleTitle.
  ///
  /// In es, this message translates to:
  /// **'Módulo {number} · {name}'**
  String curriculumModuleTitle(int number, String name);

  /// No description provided for @curriculumValueTitle.
  ///
  /// In es, this message translates to:
  /// **'{number}. {name}'**
  String curriculumValueTitle(int number, String name);

  /// No description provided for @curriculumValueCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 valor} other{{count} valores}}'**
  String curriculumValueCount(int count);

  /// No description provided for @curriculumQuestionCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 pregunta} other{{count} preguntas}}'**
  String curriculumQuestionCount(int count);

  /// No description provided for @curriculumUsedInSessions.
  ///
  /// In es, this message translates to:
  /// **'ya se usó en sesiones'**
  String get curriculumUsedInSessions;

  /// No description provided for @curriculumUntranslated.
  ///
  /// In es, this message translates to:
  /// **'Sin traducir: se muestra el texto en español.'**
  String get curriculumUntranslated;

  /// No description provided for @curriculumQuestionInactive.
  ///
  /// In es, this message translates to:
  /// **'desactivada'**
  String get curriculumQuestionInactive;

  /// No description provided for @curriculumQuestionAnswered.
  ///
  /// In es, this message translates to:
  /// **'con respuestas'**
  String get curriculumQuestionAnswered;

  /// No description provided for @curriculumEditModule.
  ///
  /// In es, this message translates to:
  /// **'Editar módulo {number}'**
  String curriculumEditModule(int number);

  /// No description provided for @curriculumEditValue.
  ///
  /// In es, this message translates to:
  /// **'Editar valor {number}'**
  String curriculumEditValue(int number);

  /// No description provided for @curriculumEditQuestion.
  ///
  /// In es, this message translates to:
  /// **'Editar pregunta {code}'**
  String curriculumEditQuestion(String code);

  /// No description provided for @curriculumAddQuestion.
  ///
  /// In es, this message translates to:
  /// **'Agregar pregunta'**
  String get curriculumAddQuestion;

  /// No description provided for @curriculumAddQuestionTitle.
  ///
  /// In es, this message translates to:
  /// **'Nueva pregunta para {value}'**
  String curriculumAddQuestionTitle(String value);

  /// No description provided for @curriculumAddQuestionConfirm.
  ///
  /// In es, this message translates to:
  /// **'Agregar pregunta'**
  String get curriculumAddQuestionConfirm;

  /// No description provided for @curriculumSave.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get curriculumSave;

  /// No description provided for @curriculumSpanishText.
  ///
  /// In es, this message translates to:
  /// **'Texto en español'**
  String get curriculumSpanishText;

  /// No description provided for @curriculumFieldName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get curriculumFieldName;

  /// No description provided for @curriculumFieldDescription.
  ///
  /// In es, this message translates to:
  /// **'Descripción'**
  String get curriculumFieldDescription;

  /// No description provided for @curriculumFieldBooklet.
  ///
  /// In es, this message translates to:
  /// **'Referencia del cuadernillo'**
  String get curriculumFieldBooklet;

  /// No description provided for @curriculumFieldQuestionText.
  ///
  /// In es, this message translates to:
  /// **'Texto de la pregunta'**
  String get curriculumFieldQuestionText;

  /// No description provided for @curriculumFieldQuestionCode.
  ///
  /// In es, this message translates to:
  /// **'Código de la pregunta'**
  String get curriculumFieldQuestionCode;

  /// No description provided for @curriculumFieldQuestionCodeHelper.
  ///
  /// In es, this message translates to:
  /// **'Identifica la pregunta; minúsculas, números y guion bajo. No se puede cambiar después.'**
  String get curriculumFieldQuestionCodeHelper;

  /// No description provided for @curriculumFieldResponseType.
  ///
  /// In es, this message translates to:
  /// **'Tipo de respuesta'**
  String get curriculumFieldResponseType;

  /// No description provided for @curriculumFieldQuestionActive.
  ///
  /// In es, this message translates to:
  /// **'Pregunta activa'**
  String get curriculumFieldQuestionActive;

  /// No description provided for @curriculumFieldOrder.
  ///
  /// In es, this message translates to:
  /// **'Orden'**
  String get curriculumFieldOrder;

  /// No description provided for @curriculumFieldStatus.
  ///
  /// In es, this message translates to:
  /// **'Estado'**
  String get curriculumFieldStatus;

  /// No description provided for @curriculumResponseText.
  ///
  /// In es, this message translates to:
  /// **'Texto'**
  String get curriculumResponseText;

  /// No description provided for @curriculumResponsePerson.
  ///
  /// In es, this message translates to:
  /// **'Una persona'**
  String get curriculumResponsePerson;

  /// No description provided for @curriculumTypeLockedHint.
  ///
  /// In es, this message translates to:
  /// **'La pregunta ya tiene respuestas: no se puede cambiar su tipo.'**
  String get curriculumTypeLockedHint;

  /// No description provided for @curriculumToastSaved.
  ///
  /// In es, this message translates to:
  /// **'Cambios guardados.'**
  String get curriculumToastSaved;

  /// No description provided for @curriculumToastUnchanged.
  ///
  /// In es, this message translates to:
  /// **'No había nada que cambiar.'**
  String get curriculumToastUnchanged;

  /// No description provided for @curriculumToastQuestionAdded.
  ///
  /// In es, this message translates to:
  /// **'Pregunta agregada.'**
  String get curriculumToastQuestionAdded;

  /// No description provided for @curriculumToastLanguageAdded.
  ///
  /// In es, this message translates to:
  /// **'Idioma agregado. Ahora sube o escribe sus textos.'**
  String get curriculumToastLanguageAdded;

  /// No description provided for @curriculumToastApplied.
  ///
  /// In es, this message translates to:
  /// **'Currículo actualizado.'**
  String get curriculumToastApplied;

  /// No description provided for @curriculumUploadTitle.
  ///
  /// In es, this message translates to:
  /// **'Subir currículo'**
  String get curriculumUploadTitle;

  /// No description provided for @curriculumUploadTranslationTitle.
  ///
  /// In es, this message translates to:
  /// **'Subir traducción ({code})'**
  String curriculumUploadTranslationTitle(String code);

  /// No description provided for @curriculumUploadIntro.
  ///
  /// In es, this message translates to:
  /// **'Elige un archivo .json o .csv con los 5 módulos, los 48 valores y sus preguntas, o pega su contenido. Antes de aplicar verás qué cambia; no se guarda nada hasta que lo confirmes.'**
  String get curriculumUploadIntro;

  /// No description provided for @curriculumUploadTranslationIntro.
  ///
  /// In es, this message translates to:
  /// **'Elige un archivo .json o .csv con los textos traducidos (puede ser parcial) o pega su contenido. Antes de aplicar verás qué cambia.'**
  String get curriculumUploadTranslationIntro;

  /// No description provided for @curriculumPickFile.
  ///
  /// In es, this message translates to:
  /// **'Elegir archivo'**
  String get curriculumPickFile;

  /// No description provided for @curriculumPickedFile.
  ///
  /// In es, this message translates to:
  /// **'Archivo: {name}'**
  String curriculumPickedFile(String name);

  /// No description provided for @curriculumPasteLabel.
  ///
  /// In es, this message translates to:
  /// **'Contenido del archivo'**
  String get curriculumPasteLabel;

  /// No description provided for @curriculumPasteHint.
  ///
  /// In es, this message translates to:
  /// **'Pega aquí el JSON o el CSV'**
  String get curriculumPasteHint;

  /// No description provided for @curriculumReviewChanges.
  ///
  /// In es, this message translates to:
  /// **'Revisar cambios'**
  String get curriculumReviewChanges;

  /// No description provided for @curriculumReviewTitle.
  ///
  /// In es, this message translates to:
  /// **'Cambios que se aplicarían'**
  String get curriculumReviewTitle;

  /// No description provided for @curriculumApplyChanges.
  ///
  /// In es, this message translates to:
  /// **'Aplicar cambios'**
  String get curriculumApplyChanges;

  /// No description provided for @curriculumNoChanges.
  ///
  /// In es, this message translates to:
  /// **'No hay cambios: el archivo ya coincide con lo que está guardado.'**
  String get curriculumNoChanges;

  /// No description provided for @curriculumRefusedTitle.
  ///
  /// In es, this message translates to:
  /// **'No se puede aplicar este archivo'**
  String get curriculumRefusedTitle;

  /// No description provided for @curriculumDiffNew.
  ///
  /// In es, this message translates to:
  /// **'nuevos'**
  String get curriculumDiffNew;

  /// No description provided for @curriculumDiffChanged.
  ///
  /// In es, this message translates to:
  /// **'con cambios'**
  String get curriculumDiffChanged;

  /// No description provided for @curriculumDiffReactivated.
  ///
  /// In es, this message translates to:
  /// **'reactivadas'**
  String get curriculumDiffReactivated;

  /// No description provided for @curriculumDiffDeactivated.
  ///
  /// In es, this message translates to:
  /// **'se desactivan'**
  String get curriculumDiffDeactivated;

  /// No description provided for @curriculumDiffRemoved.
  ///
  /// In es, this message translates to:
  /// **'se quitan'**
  String get curriculumDiffRemoved;

  /// No description provided for @curriculumDiffKeptBecauseAnswered.
  ///
  /// In es, this message translates to:
  /// **'Tiene respuestas: se desactiva, no se borra.'**
  String get curriculumDiffKeptBecauseAnswered;

  /// No description provided for @curriculumDiffEmpty.
  ///
  /// In es, this message translates to:
  /// **'(vacío)'**
  String get curriculumDiffEmpty;

  /// No description provided for @curriculumDiffField.
  ///
  /// In es, this message translates to:
  /// **'{field}: {before} → {after}'**
  String curriculumDiffField(String field, String before, String after);

  /// No description provided for @curriculumEntityModule.
  ///
  /// In es, this message translates to:
  /// **'Módulo'**
  String get curriculumEntityModule;

  /// No description provided for @curriculumEntityValue.
  ///
  /// In es, this message translates to:
  /// **'Valor'**
  String get curriculumEntityValue;

  /// No description provided for @curriculumEntityQuestion.
  ///
  /// In es, this message translates to:
  /// **'Pregunta'**
  String get curriculumEntityQuestion;
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
