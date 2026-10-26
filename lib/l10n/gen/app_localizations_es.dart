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

  @override
  String get sessionBoardFacilitatorLabel => 'Facilitador';

  @override
  String get sessionBoardTabBoard => 'Dirigir la mesa';

  @override
  String get sessionBoardTabMyAnswers => 'Mis respuestas';

  @override
  String sessionBoardTabMissing(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pasos pendientes',
      one: '1 paso pendiente',
    );
    return '$_temp0';
  }

  @override
  String get sessionBoardStageFollowUpShort => 'Seguim.';

  @override
  String get sessionBoardStageOpenTitle => 'Apertura';

  @override
  String get sessionBoardStageAttendanceTitle => 'Asistencia';

  @override
  String get sessionBoardStageValueTitle => 'Valor actual';

  @override
  String get sessionBoardStageNotYet =>
      'Aún no: usa el botón de abajo para abrir esa etapa.';

  @override
  String sessionBoardStageSemantics(int number, String name, String state) {
    return 'Etapa $number: $name ($state)';
  }

  @override
  String get sessionBoardStateCurrent => 'actual';

  @override
  String get sessionBoardStateDone => 'completada';

  @override
  String get sessionBoardStatePending => 'pendiente';

  @override
  String get sessionBoardKickerTableIsAt => 'La mesa está en';

  @override
  String get sessionBoardKickerSession => 'Sesión';

  @override
  String get sessionBoardClosedTitle => 'Cerrada';

  @override
  String sessionBoardViewingPrefix(String stage, String detail) {
    return 'Viendo: $stage · $detail';
  }

  @override
  String sessionBoardBackToCurrent(String stage) {
    return 'Viendo $stage · volver a la etapa actual';
  }

  @override
  String sessionBoardSubtitleOpen(int taken, int max) {
    return '$taken de $max lugares (facilitador incluido)';
  }

  @override
  String sessionBoardSubtitleAttendance(int done, int total) {
    return '$done de $total con asistencia marcada';
  }

  @override
  String sessionBoardSubtitleFollowUp(int done, int total, int noPrevious) {
    String _temp0 = intl.Intl.pluralLogic(
      noPrevious,
      locale: localeName,
      other: ' · $noPrevious sin compromiso previo',
      one: ' · 1 sin compromiso previo',
      zero: '',
    );
    return '$done de $total respondieron$_temp0';
  }

  @override
  String sessionBoardSubtitleValue(int done, int total, int pending) {
    String _temp0 = intl.Intl.pluralLogic(
      pending,
      locale: localeName,
      other: ' · $pending con compromiso pendiente',
      one: ' · 1 con compromiso pendiente',
      zero: '',
    );
    return '$done de $total completaron Valor actual$_temp0';
  }

  @override
  String sessionBoardSubtitleAnswersClosed(int done, int total) {
    return 'Respuestas cerradas · falta cerrar la sesión · $done de $total';
  }

  @override
  String sessionBoardSubtitleClosed(int done, int total) {
    return 'Sesión cerrada · $done de $total respuestas recibidas';
  }

  @override
  String get sessionBoardOfflineSubtitle =>
      'Sin internet: ves lo tuyo; el resto llega al sincronizar';

  @override
  String get sessionBoardNoLiveData => 'Sin datos en vivo';

  @override
  String get sessionBoardCaptionSeats => 'lugares';

  @override
  String get sessionBoardCaptionWithList => 'con lista';

  @override
  String get sessionBoardCaptionAnswered => 'respondieron';

  @override
  String get sessionBoardCaptionCompleted => 'completaron';

  @override
  String get sessionBoardCaptionResponses => 'respuestas';

  @override
  String sessionBoardTableSemantics(int count, int max) {
    return 'Mesa redonda: $count de $max lugares';
  }

  @override
  String get sessionBoardSeatUnmarked => 'Sin marcar';

  @override
  String get sessionBoardSeatAnswered => 'Respondió';

  @override
  String get sessionBoardSeatPending => 'Pendiente';

  @override
  String get sessionBoardSeatOffline => 'Sin red';

  @override
  String get sessionBoardSeatSyncing => 'Sincroniz.';

  @override
  String get sessionBoardSeatSaved => 'Guardado';

  @override
  String get sessionBoardSeatSyncedLate => 'Llegó tarde';

  @override
  String get sessionBoardSeatSkipped => 'Omitido';

  @override
  String get sessionBoardSeatMissed => 'No respondió';

  @override
  String sessionBoardSeatProgress(int done, int total) {
    return '$done/$total';
  }

  @override
  String get sessionBoardLegendTitle => 'Leyenda de la mesa';

  @override
  String get sessionBoardLegendOffline => 'Sin red / guardado en su teléfono';

  @override
  String get sessionBoardLegendSyncedLate => 'Sincronizó tarde';

  @override
  String get sessionBoardLegendNote =>
      'Corona = facilitador (también responde) · ●● = reflexión y compromiso dentro de Valor';

  @override
  String get sessionBoardDockOpen => 'Abrir sesión';

  @override
  String get sessionBoardDockFollowUp => 'Abrir seguimiento';

  @override
  String get sessionBoardDockValue => 'Abrir valor actual';

  @override
  String get sessionBoardDockCloseAnswers => 'Cerrar respuestas';

  @override
  String get sessionBoardDockCloseSession => 'Cerrar sesión';

  @override
  String get sessionBoardDockAnnounceOpen => 'Anunciar: abrir sesión';

  @override
  String get sessionBoardDockAnnounceFollowUp => 'Anunciar: seguimiento';

  @override
  String get sessionBoardDockAnnounceValue => 'Anunciar: valor actual';

  @override
  String get sessionBoardDockAnnounceCloseAnswers =>
      'Anunciar: cerrar respuestas';

  @override
  String get sessionBoardSessionClosed => 'Sesión cerrada';

  @override
  String get sessionBoardMarkEveryonePresent => 'Marcar a todos Presente';

  @override
  String sessionBoardAnswerMyself(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Responder yo · faltan $count pasos',
      one: 'Responder yo · falta 1 paso',
    );
    return '$_temp0';
  }

  @override
  String get sessionBoardHintOpen =>
      'Al abrir, los miembros ven la sesión en vivo.';

  @override
  String get sessionBoardHintAttendance =>
      'Marca a cada persona tocando su asiento.';

  @override
  String get sessionBoardHintFollowUp =>
      'Los miembros esperan hasta que abras la etapa.';

  @override
  String get sessionBoardHintValue =>
      'Valor actual incluye el compromiso. Al cerrar respuestas, los teléfonos en línea dejan de enviar.';

  @override
  String get sessionBoardHintClosing =>
      'Respuestas cerradas. Cierra la sesión para enviar el resumen.';

  @override
  String get sessionBoardHintVerbal =>
      'Sin internet: los botones son guía verbal; cada teléfono avanza a su ritmo.';

  @override
  String get sessionBoardHintClosedPending =>
      'Cerrada en este teléfono · pendiente de sincronizar';

  @override
  String get sessionBoardHintClosedSynced =>
      'Cierre sincronizado · los teléfonos que lleguen después se marcan “tarde”.';

  @override
  String sessionBoardHintNotYet(String when) {
    return 'La sesión se puede abrir desde 12 horas antes: $when.';
  }

  @override
  String get sessionBoardVerbalTitle => 'Guía verbal';

  @override
  String get sessionBoardVerbalOpen =>
      'Abrimos la mesa. Abran la app y esperen mis indicaciones.';

  @override
  String get sessionBoardVerbalAttendance =>
      'Yo marco la asistencia en mi teléfono. Digan “presente” cuando los nombre.';

  @override
  String sessionBoardVerbalFollowUp(String previous) {
    return 'Abran Seguimiento: cuenten qué hicieron con su compromiso y califíquense en $previous.';
  }

  @override
  String sessionBoardVerbalValue(String current) {
    return 'Abran Valor actual: $current. Respondan, pónganse un puntaje (sin 5) y escriban su compromiso: qué, cuándo y cómo lo medirán.';
  }

  @override
  String get sessionBoardVerbalClosing =>
      'Cerramos respuestas. Guarden lo que falte; con internet se sincroniza solo. Ahora cierro la sesión.';

  @override
  String sessionBoardAttendanceMissing(String names) {
    return 'Falta marcar asistencia: $names.';
  }

  @override
  String sessionBoardAttendanceTitle(String name) {
    return 'Asistencia · $name';
  }

  @override
  String get sessionBoardAttendanceHint =>
      'Toca una opción. Puedes cambiarla después.';

  @override
  String get sessionBoardAttendanceUnmarked => 'Asistencia sin marcar';

  @override
  String get sessionBoardAttendanceAutoNote => 'asistencia automática';

  @override
  String get sessionBoardNoPreviousNote => 'sin compromiso previo';

  @override
  String get sessionBoardGoToMyAnswers => 'Ir a Mis respuestas';

  @override
  String get sessionBoardGoToTable => 'Ir a la mesa';

  @override
  String sessionBoardMiniStage(String stage) {
    return 'La mesa está en: $stage';
  }

  @override
  String sessionBoardMiniStageWithCount(String stage, int done, int total) {
    return 'La mesa está en: $stage · $done/$total';
  }

  @override
  String get sessionBoardConfirmCloseAnswersTitle => '¿Cerrar respuestas ya?';

  @override
  String get sessionBoardConfirmOpenValueTitle => '¿Abrir valor actual ya?';

  @override
  String get sessionBoardConfirmCloseTitle => '¿Cerrar la sesión?';

  @override
  String get sessionBoardConfirmMineTitle =>
      'Tus propias respuestas están incompletas';

  @override
  String sessionBoardConfirmMineBody(String steps) {
    return 'Falta: $steps. Si cierras ahora, ya no podrás enviarlas.';
  }

  @override
  String get sessionBoardConfirmEveryoneAnswered =>
      'Todos los demás ya respondieron.';

  @override
  String sessionBoardConfirmPending(String names, String mode) {
    String _temp0 = intl.Intl.selectLogic(mode, {
      'close': '',
      'other':
          ' Podrán volver a la etapa anterior hasta que cierres respuestas.',
    });
    return 'Aún no responden: $names.$_temp0';
  }

  @override
  String get sessionBoardConfirmCloseBody =>
      'Se envía el resumen a la organización. Si algún teléfono sin red responde después, sus respuestas se aceptan y quedan marcadas “Sincronizado tarde”.';

  @override
  String sessionBoardConfirmCloseIncomplete(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hay $count personas con respuestas incompletas.',
      one: 'Hay 1 persona con respuestas incompletas.',
    );
    return '$_temp0';
  }

  @override
  String get sessionBoardAnswerNow => 'Responder yo ahora';

  @override
  String get sessionBoardWait => 'Esperar';

  @override
  String get sessionBoardCloseAnyway => 'Cerrar de todos modos';

  @override
  String get sessionBoardOpenNow => 'Abrir ahora';

  @override
  String get sessionBoardChipCurrent => 'Actual';

  @override
  String get sessionBoardChipPrevious => 'Anterior';

  @override
  String get sessionBoardInfoTitle => 'Sesión de hoy';

  @override
  String get sessionBoardInfoTable => 'Mesa';

  @override
  String get sessionBoardInfoOrganization => 'Organización';

  @override
  String get sessionBoardInfoScheduled => 'Programada';

  @override
  String sessionBoardInfoMaxMinutes(int minutes) {
    return '$minutes min máx.';
  }

  @override
  String get sessionBoardInfoCurrentValue => 'Valor actual';

  @override
  String get sessionBoardInfoPreviousValue => 'Valor anterior';

  @override
  String get sessionBoardInfoSeats => 'Lugares';

  @override
  String sessionBoardInfoSeatsValue(int taken, int max) {
    return '$taken de $max (facilitador incluido)';
  }

  @override
  String get sessionBoardActivityTitle => 'En vivo · actividad';

  @override
  String get sessionBoardActivityEmpty =>
      'Aún no hay actividad. Abre la sesión para empezar.';

  @override
  String sessionBoardActivityAnswered(String name, String step) {
    return '$name respondió $step';
  }

  @override
  String sessionBoardActivityAttendance(String name) {
    return 'Asistencia de $name marcada';
  }

  @override
  String sessionBoardActivityAutoAttendance(String name) {
    return '$name pasó a Presente (asistencia automática)';
  }

  @override
  String get sessionBoardActivityLate => 'sincronizado tarde';

  @override
  String get sessionBoardSummaryPresent => 'Presentes (incluye facilitador)';

  @override
  String sessionBoardSummaryPresentWithAbsent(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Presentes · $count ausentes',
      one: 'Presentes · 1 ausente',
    );
    return '$_temp0';
  }

  @override
  String sessionBoardSummaryDuration(int minutes) {
    return 'Duración (meta $minutes:00)';
  }

  @override
  String sessionBoardSummaryFollowUp(String average) {
    return 'Seguimiento · prom. $average';
  }

  @override
  String sessionBoardSummaryValue(String average) {
    return 'Valor actual · prom. $average';
  }

  @override
  String get sessionBoardSummaryCommitments =>
      'Compromisos recibidos (parte de Valor actual)';

  @override
  String get sessionBoardSummaryAutoTitle => 'Asistencia automática';

  @override
  String sessionBoardSummaryAutoBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count personas estaban Ausente, respondieron y pasaron a Presente.',
      one: '1 persona estaba Ausente, respondió y pasó a Presente.',
    );
    return '$_temp0';
  }

  @override
  String sessionBoardSummaryLateBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count respuestas llegaron después del cierre. Se aceptaron y quedaron marcadas.',
      one: '1 respuesta llegó después del cierre. Se aceptó y quedó marcada.',
    );
    return '$_temp0';
  }

  @override
  String sessionBoardSummaryUnsyncedTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Faltan $count respuestas por sincronizar',
      one: 'Falta 1 respuesta por sincronizar',
    );
    return '$_temp0';
  }

  @override
  String get sessionBoardSummaryUnsyncedBody =>
      'Están en teléfonos sin conexión; el resumen se actualizará cuando lleguen.';

  @override
  String get sessionBoardErrorTransition =>
      'Ese cambio de etapa no es posible ahora. Revisa el estado de la sesión.';

  @override
  String get sessionBoardErrorFinalized => 'La sesión ya está cerrada.';

  @override
  String get sessionBoardErrorNotFacilitator =>
      'Solo el facilitador de esta mesa puede controlar la sesión.';
}
