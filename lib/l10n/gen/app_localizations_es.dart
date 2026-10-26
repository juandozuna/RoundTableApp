// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Gold Roundtables';

  @override
  String get actionContinue => 'Continuar';

  @override
  String get actionCancel => 'Cancelar';

  @override
  String get actionConfirm => 'Confirmar';

  @override
  String get actionAccept => 'Aceptar';

  @override
  String get actionSave => 'Guardar';

  @override
  String get actionRetry => 'Reintentar';

  @override
  String get actionClose => 'Cerrar';

  @override
  String get actionBack => 'Volver';

  @override
  String get actionNext => 'Siguiente';

  @override
  String get actionDone => 'Listo';

  @override
  String get actionEdit => 'Editar';

  @override
  String get actionDelete => 'Eliminar';

  @override
  String get actionShare => 'Compartir';

  @override
  String get actionSearch => 'Buscar';

  @override
  String get actionGoHome => 'Ir al inicio';

  @override
  String get tooltipBack => 'Volver';

  @override
  String get tooltipClose => 'Cerrar';

  @override
  String get tooltipMenu => 'Menú';

  @override
  String get tooltipIncrease => 'Aumentar';

  @override
  String get tooltipDecrease => 'Disminuir';

  @override
  String get tooltipShowPassword => 'Mostrar';

  @override
  String get loading => 'Cargando…';

  @override
  String get confirmDialogDefaultTitle => '¿Quieres continuar?';

  @override
  String get toastSaved => 'Guardado';

  @override
  String get errorGeneric => 'Algo salió mal. Inténtalo de nuevo.';

  @override
  String get errorNetwork =>
      'No hay conexión con el servidor. Revisa tu internet.';

  @override
  String get errorTimeout =>
      'El servidor tardó demasiado en responder. Inténtalo de nuevo.';

  @override
  String get errorUnauthorized => 'Tu sesión terminó. Vuelve a ingresar.';

  @override
  String get errorForbidden => 'No tienes permiso para hacer esto.';

  @override
  String get errorNotFound => 'No encontramos lo que buscas.';

  @override
  String get errorConflict =>
      'Estos datos cambiaron mientras tanto. Actualiza e inténtalo otra vez.';

  @override
  String get errorValidation => 'Revisa los datos e inténtalo otra vez.';

  @override
  String get errorServer =>
      'El servidor tuvo un problema. Inténtalo más tarde.';

  @override
  String get errorStateTitle => 'No pudimos cargar esto';

  @override
  String get emptyStateTitle => 'Todavía no hay nada aquí';

  @override
  String get notFoundTitle => 'Esta página no existe';

  @override
  String get notFoundMessage =>
      'Puede que el enlace esté incompleto o que la página se haya movido.';

  @override
  String get connectivityOnline => 'En línea';

  @override
  String get connectivityOffline => 'Sin conexión';

  @override
  String offlineBanner(String detail) {
    return 'Sin conexión · $detail';
  }

  @override
  String get offlineDetailOnlineOnly => 'esta sección necesita internet';

  @override
  String get offlineDetailSavedLocally =>
      'lo que respondas se guarda en este teléfono';

  @override
  String get syncPending => 'Pendiente';

  @override
  String get syncSyncing => 'Sincronizando';

  @override
  String get syncSynced => 'Sincronizado';

  @override
  String get syncSyncedLate => 'Sincronizado tarde';

  @override
  String get syncUnavailable => 'Sincronización no disponible';

  @override
  String get syncNever => 'Aún no se ha sincronizado';

  @override
  String syncPendingCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cambios pendientes',
      one: '1 cambio pendiente',
      zero: 'Nada pendiente',
    );
    return '$_temp0';
  }

  @override
  String syncLastSynced(String time) {
    return 'Última sincronización: $time';
  }

  @override
  String get syncStaleWarning =>
      'Hay respuestas sin sincronizar desde hace más de 24 horas. Conéctate a internet.';

  @override
  String get roleAdministrator => 'Administrador';

  @override
  String get roleCoordinator => 'Coordinador';

  @override
  String get roleFacilitator => 'Facilitador';

  @override
  String get roleMember => 'Miembro';

  @override
  String get stageOpen => 'Abrir';

  @override
  String get stageAttendance => 'Lista';

  @override
  String get stageFollowUp => 'Seguimiento';

  @override
  String get stageCurrentValue => 'Valor';

  @override
  String get stageCommitment => 'Compromiso';

  @override
  String get stageClosing => 'Cierre';

  @override
  String get attendancePresent => 'Presente';

  @override
  String get attendanceLate => 'Tarde';

  @override
  String get attendanceExcused => 'Justificado';

  @override
  String get attendanceAbsent => 'Ausente';

  @override
  String get assessmentFollowUp => 'Seguimiento';

  @override
  String get assessmentCurrentValue => 'Valor actual';

  @override
  String get healthOnTrack => 'Al día';

  @override
  String get healthAtRisk => 'En riesgo';

  @override
  String get healthOffTrack => 'Retrasada';

  @override
  String get healthUnknown => 'Sin datos';

  @override
  String get scoreLabel => 'Puntaje';

  @override
  String get scoreHint => 'Elige un número del 1 al 10. El 5 no se permite.';

  @override
  String get scoreLow => 'Bajo';

  @override
  String get scoreHigh => 'Alto';

  @override
  String get scoreLockedSemantics => '5, no disponible';

  @override
  String get scoreFiveExplanation =>
      'El 5 no se permite: elige un poco más arriba o un poco más abajo.';

  @override
  String scorePicked(int score) {
    return 'Elegiste $score';
  }

  @override
  String scoreSemantics(int score) {
    return 'Puntaje $score';
  }

  @override
  String seatsCount(int count, int max) {
    return '$count/$max lugares';
  }

  @override
  String seatsOverCapacity(int max) {
    return 'La mesa tiene más de $max lugares';
  }

  @override
  String get contextChipLabel => 'Estás como';

  @override
  String counterSemantics(String label, int value) {
    return '$label: $value';
  }

  @override
  String get dropdownHint => 'Elige una opción';

  @override
  String get validationRequired => 'Este campo es obligatorio.';

  @override
  String get validationEmail =>
      'Escribe un correo válido, por ejemplo nombre@correo.com.';

  @override
  String get validationPhone =>
      'Escribe el número con el código de país, por ejemplo +52 55 1234 5678.';

  @override
  String get validationPersonName =>
      'Escribe un nombre válido, solo con letras.';

  @override
  String get validationScore => 'Elige un número del 1 al 10.';

  @override
  String get validationScoreFive => 'El 5 no se permite.';

  @override
  String validationTooShort(int min) {
    return 'Escribe al menos $min caracteres.';
  }

  @override
  String get validationInviteCode => 'El código tiene 6 letras o números.';

  @override
  String get navHome => 'Inicio';

  @override
  String get homeTitle => 'Inicio';

  @override
  String get homeOpenGallery => 'Ver galería de componentes';

  @override
  String get galleryTitle => 'Galería de componentes';

  @override
  String get galleryThemeLight => 'Claro';

  @override
  String get galleryThemeDark => 'Oscuro';

  @override
  String get gallerySectionButtons => 'Botones';

  @override
  String get gallerySectionStatus => 'Estados';

  @override
  String get gallerySectionAvatars => 'Avatares y roles';

  @override
  String get gallerySectionFeedback => 'Avisos';

  @override
  String get gallerySectionScore => 'Puntaje';

  @override
  String get gallerySectionForms => 'Formularios';

  @override
  String get gallerySectionStates => 'Carga, vacío y error';

  @override
  String get gallerySectionTable => 'Tabla de datos';

  @override
  String get gallerySectionDialogs => 'Diálogos';

  @override
  String get galleryPrimary => 'Principal';

  @override
  String get gallerySecondary => 'Secundario';

  @override
  String get galleryDanger => 'Peligro';

  @override
  String get galleryOfflineAction => 'Sin internet';

  @override
  String get galleryShowToast => 'Mostrar aviso';

  @override
  String get galleryShowDialog => 'Abrir diálogo';

  @override
  String get galleryShowSheet => 'Abrir hoja inferior';

  @override
  String get galleryFieldName => 'Nombre completo';

  @override
  String get galleryFieldEmail => 'Correo';

  @override
  String get galleryFieldPhone => 'Teléfono';

  @override
  String get galleryFieldInvite => 'Código de invitación';

  @override
  String get galleryFieldCountry => 'País';

  @override
  String get galleryFieldConsent => 'Acepto recibir recordatorios';

  @override
  String get galleryFieldSeats => 'Lugares';

  @override
  String get galleryColumnName => 'Nombre';

  @override
  String get galleryColumnRole => 'Rol';

  @override
  String get galleryColumnStatus => 'Estado';

  @override
  String get galleryInfoMessage => 'La mesa está en: Seguimiento';

  @override
  String get galleryWarningMessage => 'Rodrigo lleva 31 horas sin sincronizar.';

  @override
  String get galleryErrorMessage =>
      'No se pudo guardar. Tus respuestas siguen en este teléfono.';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get contextChipPlatform => 'Plataforma';

  @override
  String get homeNoContextTitle => 'Elige cómo quieres entrar';

  @override
  String get homeNoContextMessage =>
      'Todavía no tienes una mesa u organización activa. Cuando entres con una invitación, aparecerá aquí.';

  @override
  String get homeNoSessionTitle => 'No hay una sesión programada';

  @override
  String get homeNoSessionMessage =>
      'Cuando tu mesa tenga una próxima sesión, la verás aquí.';

  @override
  String get homeKickerNextSession => 'Próxima sesión';

  @override
  String get homeSessionOpenNow => 'En curso';

  @override
  String homeSessionDay(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat(
      'EEEE d \'de\' MMMM',
      localeName,
    );
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String homeSessionWhen(String day, String time) {
    return '$day · $time';
  }

  @override
  String homeValueLine(int number, String name) {
    return 'Valor $number · $name';
  }

  @override
  String homeFollowUpLine(String name) {
    return 'Seguimiento de: $name';
  }

  @override
  String get homeOpenSession => 'Abrir sesión';

  @override
  String get homeContinueSession => 'Continuar sesión';

  @override
  String get homeEnterSession => 'Entrar a la sesión';

  @override
  String get homeHealthInactive => 'Inactiva';

  @override
  String get homeHealthCompleted => 'Completada';

  @override
  String get homeLastCommitmentKicker => 'Tu último compromiso';

  @override
  String get homeNoCommitment =>
      'Aún no tienes un compromiso. Aparecerá aquí después de tu primera sesión.';

  @override
  String get homeCommitmentKept => 'Lo cumpliste';

  @override
  String get homeCommitmentPartial => 'Cumplido a medias';

  @override
  String get homeCommitmentNotKept => 'No se cumplió';

  @override
  String get homeCommitmentToReview => 'Se revisa en la próxima sesión';

  @override
  String get homeProgressKicker => 'Tu camino';

  @override
  String get homeProgressEmpty => 'Aún no hay valores completados.';

  @override
  String homeProgressValues(int done, int total) {
    return '$done de $total valores';
  }

  @override
  String homeModuleLabel(int number, String name) {
    return 'Módulo $number · $name';
  }

  @override
  String get homeKpiKicker => 'Resumen de tus mesas';

  @override
  String get homeKpiEmpty => 'Todavía no hay datos para mostrar.';

  @override
  String get homeKpiValues => 'Valores completados';

  @override
  String get homeKpiImprovement => 'Mejora estimada';

  @override
  String get homeKpiAttendance => 'Asistencia';

  @override
  String get homeKpiTablesActive => 'Mesas activas';

  @override
  String get homeKpiTablesDelayed => 'Mesas retrasadas';

  @override
  String get homeKpiViewAll => 'Ver el tablero completo';

  @override
  String homeInvitesPending(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count invitaciones pendientes',
      one: '1 invitación pendiente',
      zero: 'No hay invitaciones pendientes',
    );
    return '$_temp0';
  }

  @override
  String get notificationsSessionReminder => 'Tu sesión de la mesa es pronto.';

  @override
  String get notificationsCommitmentNudge =>
      'Recuerda tu compromiso de esta semana.';

  @override
  String get notificationsStageOpened =>
      'El facilitador abrió una nueva etapa.';

  @override
  String get notificationsGeneric => 'Tienes un aviso nuevo.';

  @override
  String get notificationsUnsyncedTitle => 'Tienes respuestas sin sincronizar';

  @override
  String notificationsUnsyncedDetail(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cambios llevan más de 24 horas sin enviarse',
      one: '1 cambio lleva más de 24 horas sin enviarse',
    );
    return '$_temp0. Conéctate a internet para enviarlos.';
  }

  @override
  String get notificationsTitle => 'Notificaciones';

  @override
  String get notificationsIntro =>
      'Elige qué avisos quieres recibir en este dispositivo.';

  @override
  String get notificationsPushTitle => 'Avisos de la mesa';

  @override
  String get notificationsPushSubtitle =>
      'Recordatorio de la sesión, recordatorio de tu compromiso y cuando se abre una etapa.';

  @override
  String get notificationsForegroundTitle => 'Mostrar avisos dentro de la app';

  @override
  String get notificationsForegroundSubtitle =>
      'Un mensaje breve cuando llega un aviso mientras usas la app.';

  @override
  String get notificationsUnsyncedSwitchTitle =>
      'Alerta de datos sin sincronizar';

  @override
  String get notificationsUnsyncedSwitchSubtitle =>
      'Te avisamos si tus respuestas llevan más de 24 horas sin enviarse.';

  @override
  String get notificationsUnsupportedTitle =>
      'Los avisos no están disponibles aquí';

  @override
  String get notificationsUnsupportedDetail =>
      'Este navegador o esta versión de la app no puede recibir avisos. Las alertas dentro de la app siguen funcionando.';

  @override
  String get notificationsDeniedTitle => 'Los avisos están bloqueados';

  @override
  String get notificationsDeniedDetail =>
      'Actívalos en los ajustes de tu dispositivo o navegador para recibir recordatorios.';

  @override
  String get notificationsAskTitle => 'Activa los avisos';

  @override
  String get notificationsAskDetail =>
      'Así te recordamos la sesión y tu compromiso a tiempo.';

  @override
  String get notificationsAllow => 'Permitir avisos';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsOfflineDetail => 'tu perfil se puede editar con internet';

  @override
  String get settingsProfileUnavailable => 'Perfil no disponible';

  @override
  String get settingsEditProfile => 'Editar mis datos';

  @override
  String get settingsNotifications => 'Notificaciones';

  @override
  String get settingsSyncKicker => 'Sincronización';

  @override
  String get settingsAboutKicker => 'Acerca de';

  @override
  String settingsVersion(String version, String build) {
    return 'Versión $version ($build)';
  }

  @override
  String get settingsSignOut => 'Cerrar sesión';

  @override
  String get settingsSignOutFailed =>
      'No pudimos cerrar tu sesión. Inténtalo de nuevo.';

  @override
  String get settingsSignOutPendingTitle => 'Tienes cambios sin enviar';

  @override
  String settingsSignOutPendingDetail(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cambios se enviarán',
      one: '1 cambio se enviará',
    );
    return '$_temp0 cuando vuelvas a entrar con tu cuenta y tengas internet.';
  }

  @override
  String get settingsSignOutConfirmTitle => '¿Cerrar sesión?';

  @override
  String get settingsSignOutConfirmMessage =>
      'Tendrás que volver a entrar para ver tus mesas.';

  @override
  String get settingsSignOutConfirmPending =>
      'Tus cambios sin enviar se guardan en este dispositivo y se enviarán cuando vuelvas a entrar con la misma cuenta.';

  @override
  String get profileEditTitle => 'Mis datos';

  @override
  String get profileEditIntro =>
      'Estos datos los ve tu facilitador o coordinador. No los verificamos.';

  @override
  String get profileEditFirstName => 'Nombre';

  @override
  String get profileEditLastName => 'Apellido';

  @override
  String get profileEditPosition => 'Cargo (opcional)';

  @override
  String get profileEditPhone => 'Teléfono (opcional)';

  @override
  String get profileEditPhoneHelper =>
      'Con el código de país, por ejemplo +52 55 1234 5678';

  @override
  String profileEditEmailNote(String email) {
    return 'Correo: $email. Para cambiarlo, pídeselo a tu coordinador.';
  }
}
