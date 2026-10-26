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
  String get homeWelcome => 'Te damos la bienvenida a Gold Roundtables';

  @override
  String get homeFoundationReady =>
      'La base de la aplicación está lista. Aquí aparecerán tus mesas y sesiones.';

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
  String get sessionSharedNavLabel => 'Sesión';

  @override
  String get sessionSharedLoading => 'Preparando tu mesa…';

  @override
  String get sessionSharedPillLive => 'En vivo';

  @override
  String get sessionSharedPillOnline => 'En línea';

  @override
  String get sessionSharedPillOffline => 'Sin internet';

  @override
  String get sessionSharedPillSyncing => 'Sincronizando';

  @override
  String get sessionSharedPillPending => 'Por sincronizar';

  @override
  String get sessionSharedTimerCaption => 'Tiempo · informativo';

  @override
  String sessionSharedTimerOver(int minutes) {
    return 'Pasó de $minutes min · solo informativo';
  }

  @override
  String sessionSharedTimerLimit(String limit) {
    return '/ $limit';
  }

  @override
  String get sessionSharedUnavailableTitle =>
      'Aún no hay una sesión en este teléfono';

  @override
  String get sessionSharedUnavailableMessage =>
      'Conéctate a internet una vez para descargar tu mesa y la sesión de esta semana.';

  @override
  String get sessionSharedNotTodayTitle => 'Hoy no hay sesión';

  @override
  String sessionSharedNotTodayMessage(String when) {
    return 'Tu próxima sesión es $when.';
  }

  @override
  String get sessionSharedCancelledTitle => 'Sesión cancelada';

  @override
  String get sessionSharedCancelledMessage =>
      'Esta sesión se canceló. Tu facilitador te avisará la nueva fecha.';

  @override
  String sessionSharedValueLabel(int number, String name) {
    return 'Valor $number · $name';
  }

  @override
  String get sessionSharedNoticeSavedOnDevice =>
      'Guardado en este teléfono · pendiente de sincronizar';

  @override
  String get sessionSharedNoticeReconnected =>
      'Conexión restablecida · sincronizando…';

  @override
  String sessionSharedStaleWarning(int hours) {
    return 'Llevas $hours h sin sincronizar. Tu teléfono puede estar hasta 7 días sin conexión. Conéctate pronto para no perder tus respuestas.';
  }

  @override
  String get sessionSharedRejectedTitle =>
      'Algunas respuestas no se pudieron enviar';

  @override
  String get sessionSharedSyncNow => 'Sincronizar ahora';

  @override
  String get sessionSharedAttendanceAuto => 'Asistencia automática';
}
