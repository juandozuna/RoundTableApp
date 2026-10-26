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
  String get navAccount => 'Cuenta';

  @override
  String get authAppTagline => 'Mesas de valores';

  @override
  String get authBrandHeadline => 'Una sola puerta para todas tus mesas.';

  @override
  String get authBrandBody =>
      'Entra con Google, Apple o Facebook. Si te invitaron, usa tu código o escanea el QR y confirma a qué te unes.';

  @override
  String get authBrandFooter =>
      'Iglesia Casa del Altísimo · Organizaciones y mesas';

  @override
  String get authGateTitle => 'Entra a tu mesa';

  @override
  String get authGateSubtitle =>
      'Usa la cuenta que ya tienes. Sin contraseñas nuevas.';

  @override
  String get authGateFine =>
      'Solo Google, Apple o Facebook. No se usa SMS ni teléfono para entrar.';

  @override
  String get authProviderGoogle => 'Google';

  @override
  String get authProviderApple => 'Apple';

  @override
  String get authProviderFacebook => 'Facebook';

  @override
  String authProviderContinue(String provider) {
    return 'Continuar con $provider';
  }

  @override
  String authProviderJoinWith(String provider) {
    return 'Unirme con $provider';
  }

  @override
  String authSigningIn(String provider) {
    return 'Conectando con $provider…';
  }

  @override
  String get authInvitedDivider => '¿Te invitaron?';

  @override
  String get authHaveInviteCode => 'Tengo un código de invitación';

  @override
  String get authScanQr => 'Escanear QR';

  @override
  String get authNoticeCancelledTitle => 'Cancelaste el inicio de sesión';

  @override
  String get authNoticeCancelledDetail =>
      'No se hizo ningún cambio. Puedes intentarlo de nuevo.';

  @override
  String get authNoticeOfflineTitle => 'Necesitas internet para entrar';

  @override
  String get authNoticeOfflineDetail =>
      'El primer inicio de sesión en este teléfono requiere conexión. Después, tu sesión de mesa sigue funcionando sin internet.';

  @override
  String get authNoticeCredentialsTitle => 'Correo o contraseña incorrectos.';

  @override
  String get authNoticeNotConfiguredTitle =>
      'Esta versión no está conectada al servidor';

  @override
  String get authNoticeNotConfiguredDetail =>
      'Falta la configuración de Supabase en esta compilación.';

  @override
  String get authNoticeFailedTitle => 'No pudimos iniciar tu sesión';

  @override
  String get authNoticeFailedDetail => 'Inténtalo de nuevo en unos momentos.';

  @override
  String get authDevTitle => 'Acceso de desarrollo';

  @override
  String get authDevHint =>
      'Solo en compilaciones locales. Entra con una cuenta de prueba.';

  @override
  String get authDevCreate => 'Crear cuenta de prueba nueva';

  @override
  String authStepSemantics(int current, int total, String label) {
    return 'Paso $current de $total: $label';
  }

  @override
  String get authAccessResolving => 'Preparando tu espacio…';

  @override
  String get authAccessFailedTitle => 'No pudimos cargar tu cuenta';

  @override
  String get authAccessOfflineTitle => 'Necesitas internet para entrar';

  @override
  String get authAccessOfflineBody =>
      'La primera vez que entras en este teléfono hace falta conexión. Después, tu sesión de mesa sigue funcionando sin internet.';

  @override
  String get authNoRoleTitle => 'Todavía no tienes un rol asignado';

  @override
  String get authNoRoleBody =>
      'Tu cuenta existe, pero nadie te ha asignado a una organización o mesa. Cuando ocurra, actualiza esta pantalla y verás tu espacio.';

  @override
  String get authDeactivatedTitle => 'Tu cuenta está desactivada';

  @override
  String get authDeactivatedBody =>
      'No puedes entrar por ahora. Habla con el coordinador de tu organización o con Casa del Altísimo.';

  @override
  String get authUnknownTitle => 'No encontramos tu cuenta';

  @override
  String get authUnknownBody =>
      'Entraste, pero esta cuenta no está registrada ni tiene invitación. Las cuentas se crean cuando alguien te invita.';

  @override
  String get authRefresh => 'Actualizar';

  @override
  String get authSignOut => 'Cerrar sesión';

  @override
  String get authPickerKicker => 'Primer acceso en este teléfono';

  @override
  String get authPickerTitle => '¿Con qué rol entras hoy?';

  @override
  String authPickerBody(String name) {
    return 'Tienes varios roles, $name. Recordaremos tu elección y podrás cambiar desde el chip de arriba, en cualquier pantalla.';
  }

  @override
  String get authPickerBodyAnonymous =>
      'Tienes varios roles. Recordaremos tu elección y podrás cambiar desde el chip de arriba, en cualquier pantalla.';

  @override
  String authPickerNotMe(String name) {
    return 'No soy $name';
  }

  @override
  String get authContextPlatform => 'Plataforma';

  @override
  String get authContextAdministratorDesc => 'Todas las organizaciones';

  @override
  String get authContextCoordinatorDesc =>
      'Mesas y facilitadores de tu organización';

  @override
  String get authContextFacilitatorDesc =>
      'Diriges esta mesa y agregas integrantes';

  @override
  String get authContextMemberDesc => 'Participas en esta mesa';

  @override
  String get authContextSwitchTitle => 'Cambiar de contexto';

  @override
  String get authContextSwitchHint => 'Un solo inicio de sesión, varios roles.';

  @override
  String get authContextChange => 'Cambiar contexto';

  @override
  String authContextSwitched(String role, String scope) {
    return 'Ahora: $role · $scope';
  }

  @override
  String get authAccountTitle => 'Cuenta';

  @override
  String authAccountLinked(String provider) {
    return 'Vinculada con $provider';
  }

  @override
  String get authAccountPhone => 'Teléfono de contacto';

  @override
  String get authAccountPhoneUnverified => 'Sin verificar';

  @override
  String get authAccountContexts => 'Tus contextos';

  @override
  String get authAccountCurrent => 'Actual';

  @override
  String get authSignOutTitle => '¿Cerrar sesión?';

  @override
  String get authSignOutBody =>
      'Volverás a la puerta de entrada. Tus datos ya están sincronizados.';

  @override
  String get authSignOutUnsyncedTitle =>
      'Este teléfono tiene datos sin sincronizar';

  @override
  String authSignOutUnsyncedBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cambios están guardados solo en este teléfono.',
      one: '1 cambio está guardado solo en este teléfono.',
    );
    return '$_temp0';
  }

  @override
  String get authSignOutSync => 'Sincronizar y salir';

  @override
  String get authSignOutSyncing => 'Sincronizando…';

  @override
  String get authSignOutOfflineHint =>
      'Sin conexión: conéctate para sincronizar primero.';

  @override
  String get authSignOutKeep => 'Salir y conservar los datos';

  @override
  String get authSignOutKeepHint =>
      'Se quedan guardados aquí y se envían cuando vuelvas a entrar con esta cuenta.';

  @override
  String authSignOutErase(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Salir y borrar $count cambios',
      one: 'Salir y borrar 1 cambio',
    );
    return '$_temp0';
  }

  @override
  String get authSignOutEraseConfirmTitle =>
      '¿Borrar los datos de este teléfono?';

  @override
  String authSignOutEraseConfirmBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Se perderán $count cambios que no se han enviado.',
      one: 'Se perderá 1 cambio que no se ha enviado.',
    );
    return '$_temp0 No se puede deshacer.';
  }

  @override
  String get authSignOutEraseConfirmAction => 'Sí, borrar y salir';

  @override
  String get authSignOutSyncTimeout =>
      'No se pudo sincronizar a tiempo. Revisa tu conexión e inténtalo de nuevo.';

  @override
  String get authSignOutFailed =>
      'No pudimos cerrar la sesión. Inténtalo de nuevo.';

  @override
  String get navInvites => 'Invitaciones';

  @override
  String get invitesStepCode => 'Código';

  @override
  String get invitesStepConfirm => 'Confirmar';

  @override
  String get invitesStepProfile => 'Perfil';

  @override
  String get invitesCodeTitle => 'Código de invitación';

  @override
  String get invitesCodeHeadline => 'Escribe tu código';

  @override
  String get invitesCodeSubtitle =>
      'Son 6 caracteres. Te lo envió quien te invitó, por WhatsApp o en persona.';

  @override
  String get invitesCodeHint => 'Sin distinguir mayúsculas. Puedes pegarlo.';

  @override
  String get invitesCodeSemantics => 'Código de invitación, 6 caracteres';

  @override
  String invitesCodeNotFoundAttempts(int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: 'te quedan $remaining intentos',
      one: 'te queda 1 intento',
      zero: 'sin intentos',
    );
    return 'No encontramos ese código. Revisa letras y números ($_temp0).';
  }

  @override
  String get invitesCodeLockedTitle => 'Demasiados intentos';

  @override
  String get invitesCodeLocked => 'Espera 60 segundos o escanea el QR.';

  @override
  String get invitesPreferQr => 'Prefiero escanear el QR';

  @override
  String get invitesChecking => 'Comprobando código…';

  @override
  String get invitesScanTitle => 'Escanear QR';

  @override
  String get invitesScanHeadline => 'Escanea el QR';

  @override
  String get invitesScanSubtitle =>
      'Quien te invitó puede mostrarte el QR en su teléfono.';

  @override
  String get invitesPasteSubtitle =>
      'Pega el enlace que te enviaron o escribe el código de 6 caracteres.';

  @override
  String get invitesScanWebTitle => 'La cámara funciona en la app del teléfono';

  @override
  String get invitesScanWebBody =>
      'En computadora no escaneamos QR. Copia el enlace de la invitación y pégalo aquí.';

  @override
  String get invitesPasteLink => 'Pegar enlace o código';

  @override
  String get invitesTypeCode => 'Escribir el código';

  @override
  String get invitesCameraDeniedTitle => 'No podemos usar la cámara';

  @override
  String get invitesCameraDeniedBody =>
      'El permiso está desactivado. Actívalo en los ajustes del teléfono o escribe el código.';

  @override
  String get invitesCameraUnavailableBody =>
      'La cámara no está disponible ahora. Escribe el código.';

  @override
  String get invitesCameraRetry => 'Volver a pedir permiso';

  @override
  String get invitesQrNotInviteTitle => 'Ese QR no es una invitación';

  @override
  String get invitesQrNotInviteBody =>
      'Escaneaste un código que no es de Gold Roundtables. Intenta de nuevo o escribe el código de 6 caracteres.';

  @override
  String get invitesPreviewBar => 'Vista previa';

  @override
  String get invitesPreviewHeadline => 'Esto es a lo que te unes';

  @override
  String get invitesPreviewSubtitle =>
      'Revisa los datos antes de vincular tu cuenta.';

  @override
  String get invitesInvitedBy => 'Te invitó';

  @override
  String get invitesFieldOrganization => 'Organización';

  @override
  String get invitesFieldTable => 'Mesa';

  @override
  String get invitesFieldYourRole => 'Tu rol';

  @override
  String get invitesFieldInvitee => 'Invitada/o';

  @override
  String get invitesFieldExpires => 'Vence';

  @override
  String get invitesConfirmWithAccount =>
      'Confirma con tu cuenta · se vincula a esta invitación';

  @override
  String invitesJoinAs(String role) {
    return 'Unirme como $role';
  }

  @override
  String invitesSignedInWith(String provider) {
    return 'Sesión iniciada con $provider';
  }

  @override
  String get invitesUseAnotherAccount => 'Usar otra cuenta';

  @override
  String get invitesNeedInternetToJoin => 'Necesitas internet para unirte';

  @override
  String get invitesOfflineJoin => 'para entrar y unirte necesitas internet';

  @override
  String get invitesAuthCancelledTitle => 'Cancelaste el inicio de sesión';

  @override
  String get invitesAuthCancelledDetail =>
      'No se vinculó nada. Puedes intentarlo de nuevo.';

  @override
  String get invitesProfileBar => 'Tu perfil';

  @override
  String get invitesProfileHeadline => 'Confirma tu perfil';

  @override
  String get invitesProfileSubtitle =>
      'Quien te invitó ya registró algunos datos. Corrígelos si hace falta.';

  @override
  String get invitesLinkedAccount => 'Cuenta vinculada';

  @override
  String get invitesLinkedPill => 'Vinculada';

  @override
  String get invitesAppleHiddenTitle => 'Ocultaste tu correo con Apple';

  @override
  String get invitesAppleHiddenBody =>
      'Para avisos usaremos el correo que registró quien te invitó. Tu cuenta queda vinculada igual.';

  @override
  String get invitesPhoneUnverified =>
      'Sin verificar: solo es un dato de contacto, no sirve para entrar.';

  @override
  String get invitesConfirmAndEnter => 'Confirmar y entrar';

  @override
  String get invitesFieldFirstName => 'Nombre';

  @override
  String get invitesFieldLastName => 'Apellido';

  @override
  String get invitesFieldPositionOptional => 'Cargo (opcional)';

  @override
  String get invitesFieldEmail => 'Correo';

  @override
  String get invitesFieldPhone => 'Teléfono';

  @override
  String get invitesFieldPhoneOptional => 'Teléfono (opcional)';

  @override
  String get invitesFieldRole => 'Rol';

  @override
  String invitesWelcomeTitle(String name) {
    return 'Listo, $name';
  }

  @override
  String invitesWelcomeBody(String scope, String role) {
    return 'Ya tienes lugar en $scope como $role.';
  }

  @override
  String invitesWelcomeAccountLinked(String provider) {
    return 'Cuenta de $provider vinculada';
  }

  @override
  String get invitesWelcomeAccountLinkedGeneric => 'Cuenta vinculada';

  @override
  String get invitesWelcomeProfileConfirmed => 'Perfil confirmado';

  @override
  String invitesWelcomeContext(String context) {
    return 'Contexto: $context';
  }

  @override
  String get invitesWelcomeEnter => 'Entrar';

  @override
  String get invitesWelcomeEnterTable => 'Entrar a mi mesa';

  @override
  String get invitesTryAnotherCode => 'Probar otro código';

  @override
  String get invitesBackToGate => 'Volver a la puerta';

  @override
  String get invitesSignIn => 'Iniciar sesión';

  @override
  String get invitesExpiredTitle => 'Esta invitación venció';

  @override
  String get invitesExpiredBody =>
      'Pídele a quien te invitó que te envíe una nueva.';

  @override
  String get invitesUsedTitle => 'Esta invitación ya se usó';

  @override
  String get invitesUsedBody =>
      'Otra cuenta ya aceptó este código. Si eres tú, inicia sesión con el mismo proveedor que usaste.';

  @override
  String get invitesRevokedTitle => 'Esta invitación fue revocada';

  @override
  String get invitesRevokedBody =>
      'Quien te invitó la canceló. Si crees que es un error, habla con esa persona.';

  @override
  String get invitesNotFoundTitle => 'No encontramos esa invitación';

  @override
  String get invitesNotFoundBody =>
      'Revisa las letras y los números o pídele el enlace de nuevo a quien te invitó.';

  @override
  String get invitesLinkedTitle =>
      'Esa cuenta ya está vinculada a otro miembro';

  @override
  String get invitesLinkedBody =>
      'Tu cuenta de este proveedor pertenece a otra persona en la plataforma. Usa otra cuenta o pide ayuda a quien te invitó.';

  @override
  String get invitesIdentityLinkedTitle => 'Tu cuenta ya tiene lugar aquí';

  @override
  String get invitesIdentityLinkedBody =>
      'Esta cuenta ya está vinculada a otra persona de esta organización. Entra con ella desde la puerta.';

  @override
  String get invitesUnavailableTitle => 'Esta invitación ya no está disponible';

  @override
  String get invitesGenericFailureTitle => 'No pudimos completar la invitación';

  @override
  String get invitesProblemNotFound =>
      'No encontramos ese código. Revisa letras y números.';

  @override
  String get invitesProblemExpired =>
      'Esta invitación venció. Pide una nueva a quien te invitó.';

  @override
  String get invitesProblemRevoked => 'Esta invitación fue revocada.';

  @override
  String get invitesProblemAlreadyUsed => 'Esta invitación ya se usó.';

  @override
  String get invitesProblemLinkedElsewhere =>
      'Esa cuenta ya está vinculada a otra persona.';

  @override
  String get invitesProblemIdentityLinkedElsewhere =>
      'Tu cuenta ya está vinculada a otra persona de esta organización.';

  @override
  String get invitesProblemUnavailable =>
      'Esta invitación ya no está disponible. Habla con tu coordinador o con Casa del Altísimo.';

  @override
  String get invitesProblemTableFull =>
      'La mesa ya tiene 9 personas, incluido el facilitador.';

  @override
  String get invitesProblemTableHasFacilitator =>
      'Esta mesa ya tiene facilitador.';

  @override
  String get invitesProblemPendingExists =>
      'Ya hay una invitación pendiente para esta persona. Reenvíala o revócala desde Invitaciones.';

  @override
  String get invitesProblemPersonAlreadyLinked =>
      'Esta persona ya tiene una cuenta vinculada. Agrégala directamente a la mesa.';

  @override
  String get invitesProblemOffline =>
      'Sin conexión: necesitas internet para esto.';

  @override
  String get invitesManagerTitle => 'Invitaciones';

  @override
  String get invitesInviteAction => 'Invitar';

  @override
  String get invitesSearchLabel => 'Buscar invitaciones';

  @override
  String get invitesSearchHint => 'Nombre o correo';

  @override
  String get invitesFilterAll => 'Todas';

  @override
  String get invitesStatusPending => 'Pendiente';

  @override
  String get invitesStatusAccepted => 'Aceptada';

  @override
  String get invitesStatusExpired => 'Vencida';

  @override
  String get invitesStatusRevoked => 'Revocada';

  @override
  String get invitesColumnPerson => 'Persona';

  @override
  String get invitesColumnRoleScope => 'Rol · Ámbito';

  @override
  String get invitesColumnStatus => 'Estado';

  @override
  String get invitesColumnDetail => 'Detalle';

  @override
  String invitesDetailExpires(String date) {
    return 'Vence el $date';
  }

  @override
  String invitesDetailAccepted(String date) {
    return 'Aceptó el $date';
  }

  @override
  String invitesDetailExpired(String date) {
    return 'Venció el $date';
  }

  @override
  String invitesDetailRevoked(String date) {
    return 'Revocada el $date';
  }

  @override
  String get invitesShareAction => 'Compartir';

  @override
  String get invitesRenewAction => 'Renovar';

  @override
  String get invitesRevokeAction => 'Revocar';

  @override
  String get invitesNoActions => 'Sin acciones';

  @override
  String invitesSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seleccionadas',
      one: '1 seleccionada',
    );
    return '$_temp0';
  }

  @override
  String get invitesSelectAll => 'Seleccionar todas';

  @override
  String get invitesUnselectAll => 'Quitar selección';

  @override
  String get invitesClearSelection => 'Limpiar';

  @override
  String invitesRevokeConfirmTitleOne(String name) {
    return '¿Revocar la invitación de $name?';
  }

  @override
  String invitesRevokeConfirmTitleMany(int count) {
    return '¿Revocar $count invitaciones?';
  }

  @override
  String get invitesRevokeConfirmBody =>
      'El enlace, el código y el QR dejarán de funcionar y se libera el lugar en la mesa. No se puede deshacer; puedes crear otra invitación.';

  @override
  String get invitesRevokeConfirmAction => 'Sí, revocar';

  @override
  String invitesToastRenewed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count invitaciones renovadas',
      one: 'Invitación renovada con un código nuevo',
    );
    return '$_temp0';
  }

  @override
  String invitesToastRevoked(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count invitaciones revocadas',
      one: 'Invitación revocada. Lugar liberado.',
    );
    return '$_temp0';
  }

  @override
  String get invitesEmptyTitle => 'Aún no has invitado a nadie';

  @override
  String get invitesEmptyBody =>
      'Registra a la primera persona y comparte su invitación.';

  @override
  String get invitesEmptyAction => 'Invitar a la primera persona';

  @override
  String get invitesFilterEmptyTitle => 'Nada con este filtro';

  @override
  String get invitesFilterEmptyBody =>
      'No hay invitaciones que coincidan con la búsqueda o el estado elegido.';

  @override
  String get invitesFilterShowAll => 'Ver todas';

  @override
  String get invitesOfflineList =>
      'No pudimos cargar las invitaciones. Invitaciones y administración solo funcionan con internet; tu sesión de mesa no se ve afectada.';

  @override
  String get invitesDeniedTitle => 'No tienes permiso para esto';

  @override
  String get invitesDeniedBody =>
      'Con tu rol no puedes invitar personas. Pídele a tu facilitador o coordinador que lo haga.';

  @override
  String get invitesFormBar => 'Nueva invitación';

  @override
  String get invitesFormKicker => 'Nueva invitación';

  @override
  String get invitesFormHeadline => 'Registra a la persona';

  @override
  String get invitesFormSubtitle =>
      'Primero se registra; después se comparte el enlace, el código o el QR.';

  @override
  String get invitesRoleMemberDesc => 'Responde en una mesa';

  @override
  String get invitesRoleFacilitatorDesc =>
      'Dirige una mesa y responde como participante';

  @override
  String get invitesRoleCoordinatorDesc =>
      'Crea mesas y facilitadores en su organización';

  @override
  String get invitesRoleOnlyStaff => 'Solo Coordinador o Administrador';

  @override
  String get invitesRoleLockedToast =>
      'Con tu rol solo puedes invitar integrantes a tu mesa.';

  @override
  String get invitesRoleFacilitatorTaken => 'Esta mesa ya tiene facilitador';

  @override
  String get invitesFacilitatorOwnTable =>
      'Como facilitador solo agregas integrantes a tu mesa.';

  @override
  String invitesTableFull(int taken, int max) {
    return 'Mesa llena · $taken de $max';
  }

  @override
  String invitesSeatsFree(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Quedan $count lugares',
      one: 'Queda 1 lugar',
    );
    return '$_temp0';
  }

  @override
  String get invitesSeatsRule =>
      'Las mesas tienen de 3 a 9 personas; el facilitador cuenta y cada invitación pendiente reserva un lugar.';

  @override
  String get invitesNoSeatsTitle => 'No hay lugares libres';

  @override
  String get invitesNoSeatsBody =>
      'Elige otra mesa o revoca una invitación pendiente para liberar un lugar.';

  @override
  String get invitesScopeKicker => 'Alcance';

  @override
  String invitesScopeWholeOrganization(String name) {
    return 'Toda la organización $name';
  }

  @override
  String get invitesScopeCoordinatorNote =>
      'Un coordinador no ocupa lugar en una mesa.';

  @override
  String get invitesWhatTheyGet => 'Qué recibirá';

  @override
  String invitesWhatTheyGetBody(int days) {
    return 'Un enlace, un código de 6 caracteres y un QR. Al usarlos, entra con Google, Apple o Facebook y esa cuenta queda vinculada. Vence en $days días.';
  }

  @override
  String get invitesFormOfflineTitle => 'Sin conexión';

  @override
  String get invitesFormOfflineBody =>
      'No puedes crear invitaciones hasta volver a conectarte.';

  @override
  String get invitesCreateAction => 'Crear invitación';

  @override
  String get invitesShareBar => 'Compartir invitación';

  @override
  String get invitesShareKicker => 'Invitación creada';

  @override
  String invitesShareHeadline(String name) {
    return 'Comparte con $name';
  }

  @override
  String invitesShareMessage(
    String name,
    String scope,
    String link,
    String code,
    String date,
  ) {
    return 'Hola $name, te invito a Gold Roundtables ($scope). Entra aquí: $link o usa el código $code. Vence el $date.';
  }

  @override
  String get invitesShareMissingTitle => 'No encontramos esta invitación';

  @override
  String get invitesCodeKicker => 'Código';

  @override
  String get invitesLinkKicker => 'Enlace';

  @override
  String get invitesWhatsapp => 'WhatsApp';

  @override
  String get invitesWhatsappUnavailable =>
      'No pudimos abrir WhatsApp. Copia el enlace y envíalo por otro medio.';

  @override
  String get invitesCopyLink => 'Copiar enlace';

  @override
  String get invitesCopyCode => 'Copiar código';

  @override
  String get invitesCopiedLink => 'Enlace copiado';

  @override
  String get invitesCopiedCode => 'Código copiado';

  @override
  String get invitesShowBigQr => 'Mostrar QR grande';

  @override
  String invitesBigQrTitle(String name) {
    return 'QR para $name';
  }

  @override
  String get invitesBigQrHint =>
      'Muéstralo en persona. Se escanea desde la puerta de entrada.';

  @override
  String get invitesQrSemantics => 'Código QR de la invitación';

  @override
  String get invitesInviteAnother => 'Invitar a otra persona';

  @override
  String get invitesViewAll => 'Ver todas las invitaciones';
}
