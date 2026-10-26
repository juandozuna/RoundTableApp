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
  String get adminNavExplorer => 'Mesas';

  @override
  String get adminAppBarTitle => 'Administración';

  @override
  String get auditStateScheduled => 'programada';

  @override
  String get auditStateOpen => 'abierta';

  @override
  String get auditStateClosed => 'cerrada';

  @override
  String get auditStateCancelled => 'cancelada';

  @override
  String get kpiNavReports => 'Informes';

  @override
  String get auditTitle => 'Auditoría';

  @override
  String get adminExplorerTitle => 'Explorador';

  @override
  String get adminMyOrganization => 'Mi organización';

  @override
  String get adminPaletteTooltip => 'Buscar o ejecutar (Ctrl+K)';

  @override
  String get adminDeniedTitle => 'Sin permiso';

  @override
  String get adminDeniedAction => 'Ir al explorador';

  @override
  String get adminDeniedRoleMessage =>
      'Tu rol no incluye la administración. Si crees que es un error, pide acceso a una persona de la iglesia.';

  @override
  String get adminDeniedAdminOnlyMessage =>
      'Esta acción es solo para el Administrador (personal de la iglesia).';

  @override
  String get adminDeniedOrganizationTitle =>
      'Sin permiso para esta organización';

  @override
  String get adminDeniedOrganizationMessage =>
      'Tu rol de Coordinador solo ve y administra su propia organización. Esa organización pertenece a otro espacio.';

  @override
  String get adminDeniedTableTitle => 'Sin permiso para esta mesa';

  @override
  String get adminDeniedTableMessage =>
      'No encontramos esta mesa en tu organización. Puede que pertenezca a otro espacio.';

  @override
  String get adminDeniedPersonTitle => 'Sin permiso para esta persona';

  @override
  String get adminDeniedPersonMessage =>
      'No encontramos a esta persona en tu organización.';

  @override
  String get adminGoToMyOrganization => 'Ir a mi organización';

  @override
  String get adminGoToExplorer => 'Ir al explorador';

  @override
  String get adminBackToExplorer => 'Volver al explorador';

  @override
  String get adminAdministratorOnly => 'Solo Administrador';

  @override
  String get adminOfflineFormTitle => 'Sin conexión';

  @override
  String get adminOfflineFormDetail =>
      'Puedes llenar el formulario, pero guardar requiere internet.';

  @override
  String get adminCreate => 'Crear';

  @override
  String get adminCreateTable => 'Crear mesa';

  @override
  String get adminCreateOrganization => 'Crear organización';

  @override
  String get adminCreateLocation => 'Crear ubicación';

  @override
  String get adminInvitePerson => 'Invitar persona';

  @override
  String get adminInviteCoordinator => 'Invitar coordinador';

  @override
  String get adminInviteFacilitator => 'Invitar facilitador';

  @override
  String get adminInviteMember => 'Invitar miembro';

  @override
  String get adminSaveChanges => 'Guardar cambios';

  @override
  String get adminDensityCompact => 'Compacta';

  @override
  String get adminDensityComfortable => 'Cómoda';

  @override
  String get adminEntityTables => 'Mesas';

  @override
  String get adminEntityOrganizations => 'Organizaciones';

  @override
  String get adminEntityPeople => 'Personas';

  @override
  String get adminViews => 'Vistas';

  @override
  String get adminSaveView => 'Guardar vista';

  @override
  String get adminSaveViewTitle => 'Guardar vista';

  @override
  String get adminSaveViewName => 'Nombre de la vista';

  @override
  String adminViewSaved(String name) {
    return 'Vista «$name» guardada';
  }

  @override
  String get adminDeleteViewTitle => 'Eliminar vista';

  @override
  String adminDeleteViewMessage(String name) {
    return '¿Eliminar la vista «$name»? Solo se borra en este dispositivo.';
  }

  @override
  String adminDeleteViewTooltip(String name) {
    return 'Eliminar la vista $name';
  }

  @override
  String get adminViewAll => 'Todas';

  @override
  String get adminViewDelayed => 'Mesas retrasadas';

  @override
  String get adminViewLowAttendance => 'Baja asistencia';

  @override
  String get adminViewSyncedLate => 'Sincronizado tarde';

  @override
  String get adminViewPaused => 'Pausadas / desactivadas';

  @override
  String get adminViewWithoutTables => 'Sin mesas';

  @override
  String get adminViewWithoutCoordinator => 'Sin coordinador';

  @override
  String get adminViewCoordinators => 'Coordinadores';

  @override
  String get adminViewFacilitators => 'Facilitadores';

  @override
  String get adminViewMembers => 'Miembros';

  @override
  String get adminViewPendingInvites => 'Invitaciones pendientes';

  @override
  String get adminViewInactive => 'Inactivos';

  @override
  String adminSearchHint(String entity) {
    return 'Buscar $entity…';
  }

  @override
  String get adminFilters => 'Filtros';

  @override
  String adminFiltersCount(int count) {
    return 'Filtros ($count)';
  }

  @override
  String get adminFilterAll => 'Todos';

  @override
  String get adminFilterCountry => 'País';

  @override
  String get adminFilterOrganization => 'Organización';

  @override
  String get adminFilterLocation => 'Ubicación';

  @override
  String get adminFilterFacilitator => 'Facilitador';

  @override
  String get adminFilterRole => 'Rol';

  @override
  String get adminFilterStatus => 'Estado';

  @override
  String get adminClearAll => 'Limpiar todo';

  @override
  String get adminClearFilters => 'Limpiar filtros';

  @override
  String get adminClearFiltersAndView => 'Limpiar filtros y vista';

  @override
  String adminShowResults(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count resultados',
      one: '1 resultado',
    );
    return 'Ver $_temp0';
  }

  @override
  String adminOrganizationLock(String name) {
    return 'Organización: $name';
  }

  @override
  String adminRemoveFilterTooltip(String filter) {
    return 'Quitar el filtro $filter';
  }

  @override
  String adminSelectRow(String name) {
    return 'Seleccionar $name';
  }

  @override
  String get adminSelection => 'Selección';

  @override
  String get adminCurrentView => 'Vista actual';

  @override
  String get adminSelected => 'Seleccionadas';

  @override
  String adminSelectedCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seleccionadas',
      one: '1 seleccionada',
    );
    return '$_temp0';
  }

  @override
  String get adminSelectionHint =>
      'Marca filas para sumar sus KPIs aquí. Sin selección se resume la vista filtrada.';

  @override
  String get adminSelectionKpis => 'KPIs de la selección';

  @override
  String get adminSeeKpis => 'Ver KPIs';

  @override
  String adminRemoveFromSelection(String name) {
    return 'Quitar $name de la selección';
  }

  @override
  String get adminClearSelection => 'Limpiar selección';

  @override
  String get adminOpenInReports => 'Abrir en Informes';

  @override
  String get adminExportCsv => 'Exportar CSV';

  @override
  String get adminExportFailed => 'No se pudo exportar el archivo.';

  @override
  String get adminNoTablesToAggregate => 'Sin mesas para sumar';

  @override
  String adminLowAttendanceTables(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesas con asistencia menor al 70 %',
      one: '1 mesa con asistencia menor al 70 %',
    );
    return '$_temp0';
  }

  @override
  String get adminLowAttendanceThreshold =>
      'Umbral de alerta definido por la iglesia.';

  @override
  String adminTablesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesas',
      one: '1 mesa',
      zero: 'Sin mesas',
    );
    return '$_temp0';
  }

  @override
  String adminPeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count personas',
      one: '1 persona',
      zero: 'Sin personas',
    );
    return '$_temp0';
  }

  @override
  String adminOrganizationsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count organizaciones',
      one: '1 organización',
    );
    return '$_temp0';
  }

  @override
  String adminTablesStatusBreakdown(int active, int delayed, int inactive) {
    return '$active activas · $delayed retrasadas · $inactive inactivas';
  }

  @override
  String adminEmptyTitle(String entity) {
    return 'Aún no hay $entity';
  }

  @override
  String get adminEmptyMessage =>
      'Crea la primera con el botón Crear para empezar a ver KPIs.';

  @override
  String get adminNoResultsTitle => 'Sin resultados';

  @override
  String get adminNoResultsMessage =>
      'Ningún elemento coincide con esta vista y estos filtros.';

  @override
  String adminRowsOfTotal(int visible, int total, int selected) {
    String _temp0 = intl.Intl.pluralLogic(
      selected,
      locale: localeName,
      other: '$selected seleccionadas',
      one: '1 seleccionada',
      zero: '0 seleccionadas',
    );
    return '$visible de $total · $_temp0';
  }

  @override
  String adminDataUpdated(String time) {
    return 'Datos actualizados $time · en línea';
  }

  @override
  String get adminDataSavedReadOnly => 'Datos guardados · solo lectura';

  @override
  String get adminColTable => 'Mesa';

  @override
  String get adminColCode => 'Código';

  @override
  String get adminColName => 'Nombre';

  @override
  String get adminColOrganization => 'Organización';

  @override
  String get adminColLocation => 'Ubicación';

  @override
  String get adminColOrganizationLocation => 'Organización / ubicación';

  @override
  String get adminColFacilitator => 'Facilitador';

  @override
  String get adminColSeats => 'Plazas';

  @override
  String get adminColStatus => 'Estado';

  @override
  String get adminColAttendance => 'Asistencia';

  @override
  String get adminColValues => 'Valores';

  @override
  String get adminColImprovement => 'Mejora';

  @override
  String get adminColLate => 'Tarde';

  @override
  String get adminColKind => 'Tipo';

  @override
  String get adminColCountry => 'País';

  @override
  String get adminColTables => 'Mesas';

  @override
  String get adminColPeople => 'Personas';

  @override
  String get adminColPerson => 'Persona';

  @override
  String get adminColRole => 'Rol';

  @override
  String get adminNoFacilitator => 'Sin facilitador';

  @override
  String get adminWithoutCoordinator => 'Sin coordinador';

  @override
  String get adminWithoutTables => 'Sin mesas';

  @override
  String get adminWithoutTable => 'Sin mesa';

  @override
  String get adminPlatformStaff => 'Equipo de la iglesia';

  @override
  String get adminPersonKindUnassigned => 'Sin asignar';

  @override
  String adminLateCount(int count) {
    return 'Tarde $count';
  }

  @override
  String get adminAttendanceLow => 'por debajo del umbral';

  @override
  String get adminHealthActive => 'Al día';

  @override
  String get adminHealthDelayed => 'Retrasada';

  @override
  String get adminHealthInactive => 'Inactiva';

  @override
  String get adminHealthCompleted => 'Completada';

  @override
  String get adminTableStatusActive => 'Activa';

  @override
  String get adminTableStatusPaused => 'Pausada';

  @override
  String get adminTableStatusCompleted => 'Completada';

  @override
  String get adminTableStatusClosed => 'Cerrada';

  @override
  String get adminOrgStatusActive => 'Activa';

  @override
  String get adminOrgStatusPaused => 'Pausada';

  @override
  String get adminOrgStatusInactive => 'Desactivada';

  @override
  String get adminPersonStatusActive => 'Activo';

  @override
  String get adminPersonStatusInvited => 'Invitación pendiente';

  @override
  String get adminPersonStatusInactive => 'Inactivo';

  @override
  String get adminOrgKindFoundation => 'Fundación';

  @override
  String get adminOrgKindSchool => 'Colegio';

  @override
  String get adminOrgKindCompany => 'Empresa';

  @override
  String get adminOrgKindChurch => 'Iglesia';

  @override
  String get adminOrgKindCommunity => 'Comunidad';

  @override
  String get adminOrgKindOther => 'Otro';

  @override
  String get adminWeekday1 => 'Lunes';

  @override
  String get adminWeekday2 => 'Martes';

  @override
  String get adminWeekday3 => 'Miércoles';

  @override
  String get adminWeekday4 => 'Jueves';

  @override
  String get adminWeekday5 => 'Viernes';

  @override
  String get adminWeekday6 => 'Sábado';

  @override
  String get adminWeekday7 => 'Domingo';

  @override
  String get adminPaletteHint => 'Escribe una acción o destino…';

  @override
  String get adminPaletteActions => 'Acciones';

  @override
  String get adminPaletteSavedViews => 'Vistas guardadas';

  @override
  String get adminPaletteGoTo => 'Ir a';

  @override
  String get adminPaletteTables => 'Mesas';

  @override
  String adminPaletteOpenView(String name) {
    return 'Abrir vista · $name';
  }

  @override
  String adminPaletteGoToOrganization(String name) {
    return 'Ir a $name';
  }

  @override
  String adminPaletteGoToTable(String name) {
    return 'Ir a mesa $name';
  }

  @override
  String adminPaletteNoResults(String query) {
    return 'Sin resultados para «$query»';
  }

  @override
  String get adminPaletteFooter => '↑ ↓ navegar · Enter ejecutar · Esc cerrar';

  @override
  String get adminOrganizationTitle => 'Organización';

  @override
  String get adminEditOrganization => 'Editar organización';

  @override
  String get adminPause => 'Pausar';

  @override
  String get adminResume => 'Reanudar';

  @override
  String get adminDeactivate => 'Desactivar';

  @override
  String adminPauseTitle(String name) {
    return 'Pausar $name';
  }

  @override
  String get adminPauseMessage =>
      'Se detienen las sesiones y las nuevas invitaciones. Los datos y el historial se conservan y puedes reanudar cuando quieras.';

  @override
  String get adminPauseConfirm => 'Pausar organización';

  @override
  String adminResumeTitle(String name) {
    return 'Reanudar $name';
  }

  @override
  String get adminResumeMessage =>
      'La organización vuelve a estar activa: las sesiones y las invitaciones se reanudan.';

  @override
  String adminDeactivateTitle(String name) {
    return 'Desactivar $name';
  }

  @override
  String get adminDeactivateWarningTitle => 'Acción difícil de revertir';

  @override
  String get adminDeactivateWarningDetail =>
      'Nadie de esta organización podrá iniciar sesión. El historial y los informes se conservan.';

  @override
  String get adminDeactivateConfirm => 'Desactivar organización';

  @override
  String adminTypeNameToConfirm(String name) {
    return 'Escribe «$name» para confirmar';
  }

  @override
  String get adminOrgPausedBannerTitle => 'Organización pausada';

  @override
  String get adminOrgPausedBannerDetail =>
      'Las sesiones y las nuevas invitaciones están detenidas. Datos e historial se conservan. Se puede reanudar.';

  @override
  String get adminOrgInactiveBannerTitle => 'Organización desactivada';

  @override
  String get adminOrgInactiveBannerDetail =>
      'Nadie puede iniciar sesión en este espacio. El historial se conserva para auditoría.';

  @override
  String adminToastOrganizationPaused(String name) {
    return '$name pausada';
  }

  @override
  String adminToastOrganizationResumed(String name) {
    return '$name reanudada';
  }

  @override
  String adminToastOrganizationDeactivated(String name) {
    return '$name desactivada';
  }

  @override
  String get adminToastOrganizationCreated => 'Organización creada';

  @override
  String get adminToastOrganizationCreatedInvited =>
      'Organización creada · invitación lista para compartir';

  @override
  String get adminToastOrganizationUpdated => 'Organización actualizada';

  @override
  String get adminCoordination => 'Coordinación';

  @override
  String get adminNoCoordinatorTitle => 'Sin coordinador';

  @override
  String get adminNoCoordinatorDetail =>
      'Esta organización no puede crear mesas hasta tener un Coordinador.';

  @override
  String get adminLocations => 'Ubicaciones';

  @override
  String get adminNewLocation => 'Nueva ubicación';

  @override
  String get adminNoLocations =>
      'Sin ubicaciones todavía. Agrega la primera para poder crear mesas.';

  @override
  String get adminEditLocation => 'Editar ubicación';

  @override
  String get adminOrgNoTablesTitle => 'Esta organización aún no tiene mesas';

  @override
  String get adminOrgNoTablesMessage =>
      'Crea la primera mesa: elige ubicación, horario y facilitador.';

  @override
  String get adminOrgNoTablesNeedsCoordinator =>
      'Primero invita a un Coordinador; luego podrá crear mesas.';

  @override
  String get adminCreateFirstTable => 'Crear primera mesa';

  @override
  String get adminInviteFirstCoordinator => 'Invitar primer coordinador';

  @override
  String get adminMainData => 'Datos principales';

  @override
  String get adminRecentActivity => 'Actividad reciente';

  @override
  String get adminNoActivity => 'Sin actividad todavía.';

  @override
  String get adminSeeInAudit => 'Ver en auditoría';

  @override
  String get adminSectionOrganization => 'Organización';

  @override
  String get adminSectionContact => 'Contacto principal';

  @override
  String get adminFieldOrganizationName => 'Nombre';

  @override
  String get adminFieldOrganizationNameHint => 'Ej. Fundación Esperanza';

  @override
  String get adminFieldKind => 'Tipo';

  @override
  String get adminFieldRegion => 'Región / ciudad';

  @override
  String get adminFieldContactName => 'Nombre completo';

  @override
  String get adminFieldEmail => 'Correo';

  @override
  String get adminFieldPhone => 'Teléfono';

  @override
  String get adminFieldPhoneHelper =>
      'Se guarda como contacto sin verificar. No se usa para iniciar sesión.';

  @override
  String get adminInviteContactAsCoordinator =>
      'Invitar ahora al contacto como primer Coordinador';

  @override
  String get adminFieldLocationName => 'Nombre de la ubicación';

  @override
  String get adminFieldLocationNameHint => 'Ej. Sede Central';

  @override
  String get adminFieldCity => 'Ciudad';

  @override
  String get adminFieldAddress => 'Dirección';

  @override
  String get adminFieldLocationActive => 'Ubicación activa';

  @override
  String get adminToastLocationCreated => 'Ubicación creada';

  @override
  String get adminToastLocationUpdated => 'Ubicación actualizada';

  @override
  String get adminTableTitle => 'Mesa';

  @override
  String get adminEditTable => 'Editar mesa';

  @override
  String get adminEditSchedule => 'Editar horario';

  @override
  String get adminAddMember => 'Agregar miembro';

  @override
  String get adminInviteNewPerson => 'Invitar a una persona nueva';

  @override
  String get adminAddExistingMember => 'Agregar una persona existente';

  @override
  String get adminAdd => 'Agregar';

  @override
  String get adminPerson => 'Persona';

  @override
  String get adminNoExistingCandidates => 'No hay personas disponibles';

  @override
  String get adminNoExistingCandidatesDetail =>
      'Solo se pueden agregar personas de la organización que aún no estén en una mesa.';

  @override
  String get adminTableWithoutFacilitator => 'Sin facilitador';

  @override
  String get adminTableWithoutFacilitatorDetail =>
      'La mesa no puede abrir sesiones. Asigna un facilitador.';

  @override
  String get adminTableDelayedTitle => 'Mesa retrasada';

  @override
  String adminTableDelayedDetail(String date) {
    return 'Última sesión el $date; se espera una por semana.';
  }

  @override
  String adminTableNeedsPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Faltan $count personas',
      one: 'Falta 1 persona',
    );
    return '$_temp0';
  }

  @override
  String get adminTableNeedsPeopleDetail =>
      'Una mesa necesita de 3 a 9 personas incluyendo al facilitador.';

  @override
  String get adminTableFullTitle => 'Mesa llena (9/9)';

  @override
  String get adminTableFullDetail =>
      'Para sumar a alguien, mueve o desactiva a otra persona.';

  @override
  String get adminTableFull => 'llena';

  @override
  String get adminNewTableTitle => 'Mesa nueva';

  @override
  String get adminNewTableDetail =>
      'Aún sin sesiones cerradas: no hay KPIs. Se activa al cerrar la primera sesión.';

  @override
  String get adminLastSession => 'Última sesión';

  @override
  String get adminSchedule => 'Programación';

  @override
  String get adminFieldWeekday => 'Día';

  @override
  String get adminFieldTime => 'Hora';

  @override
  String get adminFieldTimezone => 'Zona horaria';

  @override
  String get adminFieldDuration => 'Duración';

  @override
  String adminMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String get adminScheduleCentral =>
      'El horario lo controla la coordinación: el facilitador lo ve pero no lo puede cambiar.';

  @override
  String get adminFacilitatorAndHistory => 'Facilitador e historial';

  @override
  String get adminCurrentFacilitator => 'Facilitador actual';

  @override
  String get adminChange => 'Cambiar';

  @override
  String get adminAssign => 'Asignar';

  @override
  String get adminNoHistory => 'Aún no hay cambios en el historial.';

  @override
  String adminHistoryLeft(String name, String reason) {
    return '$name salió de la mesa ($reason)';
  }

  @override
  String get adminLeftMoved => 'movido a otra mesa';

  @override
  String get adminLeftDeactivated => 'desactivado';

  @override
  String get adminLeftFacilitatorChanged => 'cambio de facilitador';

  @override
  String get adminLeftInviteRevoked => 'invitación revocada';

  @override
  String get adminLeftOther => 'sin motivo';

  @override
  String get adminMembers => 'Miembros';

  @override
  String get adminMembersHint =>
      'De 3 a 9 personas incluyendo al facilitador. Desactivar no borra el historial.';

  @override
  String get adminNoMembersTitle => 'Aún no hay miembros';

  @override
  String get adminNoMembersMessage =>
      'Invita a la primera persona con el botón Agregar miembro.';

  @override
  String adminMemberSince(String date) {
    return 'Desde $date';
  }

  @override
  String adminSeeAnswersOf(String name) {
    return 'Ver respuestas de $name';
  }

  @override
  String get adminChangeFacilitator => 'Cambiar facilitador';

  @override
  String get adminAssignFacilitator => 'Asignar facilitador';

  @override
  String get adminChangeFacilitatorConfirm => 'Confirmar';

  @override
  String adminChangeFacilitatorCurrent(String name) {
    return 'Actual: $name. El historial se conserva.';
  }

  @override
  String get adminNewFacilitator => 'Nuevo facilitador';

  @override
  String get adminAlreadyInTable => 'ya en la mesa';

  @override
  String adminKeepPreviousAsMember(String name) {
    return 'Dejar a $name como miembro de la mesa';
  }

  @override
  String get adminHistoryKept =>
      'Nada se borra: el cambio queda en el historial.';

  @override
  String get adminNoFacilitatorCandidates => 'No hay personas disponibles';

  @override
  String get adminNoFacilitatorCandidatesDetail =>
      'Invita a una persona nueva como facilitador desde el formulario de la mesa.';

  @override
  String adminMoveTitle(String name) {
    return 'Mover a $name';
  }

  @override
  String adminMoveMessage(String code) {
    return 'Sale de $code. El historial viaja con la persona.';
  }

  @override
  String get adminMoveDestination => 'Mesa de destino';

  @override
  String get adminMove => 'Mover';

  @override
  String get adminMoveNoTargets =>
      'No hay otras mesas activas en esta organización.';

  @override
  String adminDeactivateMemberTitle(String name) {
    return 'Desactivar a $name';
  }

  @override
  String adminDeactivateMemberMessage(String code) {
    return 'Deja de contar en $code y no podrá responder. No se borra nada: respuestas e historial se conservan.';
  }

  @override
  String adminDeactivateMemberBelowMinimum(int remaining) {
    String _temp0 = intl.Intl.pluralLogic(
      remaining,
      locale: localeName,
      other: '$remaining personas',
      one: '1 persona',
    );
    return 'La mesa quedará con $_temp0. El mínimo es 3 incluyendo al facilitador.';
  }

  @override
  String get adminToastFacilitatorChanged => 'Facilitador actualizado';

  @override
  String adminToastMemberAdded(String name) {
    return '$name agregado a la mesa';
  }

  @override
  String adminToastMemberMoved(String name) {
    return '$name movido de mesa';
  }

  @override
  String adminToastMemberDeactivated(String name) {
    return '$name desactivado';
  }

  @override
  String get adminToastTableCreated => 'Mesa creada';

  @override
  String get adminToastTableUpdated => 'Mesa actualizada';

  @override
  String get adminSectionIdentity => 'Identidad';

  @override
  String get adminFieldTableName => 'Nombre de la mesa';

  @override
  String get adminFieldTableNameHint => 'Ej. Esperanza';

  @override
  String get adminFieldTableCode => 'Código';

  @override
  String get adminFieldTableCodeHelper =>
      'Formato AAA-00, único dentro de la organización.';

  @override
  String get adminSectionLocationSchedule => 'Ubicación y horario';

  @override
  String get adminFieldLocation => 'Ubicación';

  @override
  String get adminChooseOrganizationFirst => 'Primero elige la organización';

  @override
  String get adminOrgWithoutLocations =>
      'Esta organización no tiene ubicaciones';

  @override
  String get adminOrgWithoutLocationsDetail =>
      'Crea la primera ubicación y vuelve a crear la mesa.';

  @override
  String get adminSectionFacilitator => 'Facilitador';

  @override
  String get adminFieldTableFacilitator => 'Facilitador de la mesa';

  @override
  String get adminInviteNewFacilitator => 'Invitar a un facilitador nuevo';

  @override
  String get adminPickExistingFacilitator => 'Elegir una persona existente';

  @override
  String get adminFacilitatorRequiredHint =>
      'Cada mesa necesita exactamente un facilitador. Se guarda el historial de cambios.';

  @override
  String get adminFieldFirstName => 'Nombre';

  @override
  String get adminFieldLastName => 'Apellido';

  @override
  String get adminFieldInviteEmailHelper =>
      'La persona entrará con Google, Apple o Facebook.';

  @override
  String get adminPersonTitle => 'Persona';

  @override
  String get adminPersonData => 'Datos';

  @override
  String get adminFieldPosition => 'Cargo';

  @override
  String get adminFieldPositionOptional => 'Cargo (si aplica)';

  @override
  String get adminFieldLinkedAccount => 'Cuenta vinculada';

  @override
  String get adminLinkedYes => 'Sí';

  @override
  String get adminLinkedNo => 'Aún no inició sesión';

  @override
  String get adminPhoneUnverified =>
      'Contacto sin verificar; no sirve para iniciar sesión.';

  @override
  String get adminPersonInvitedTitle => 'Invitación pendiente';

  @override
  String get adminPersonInvitedDetail =>
      'Aún no aceptó la invitación: no hay respuestas.';

  @override
  String get adminRolesAndTables => 'Roles y mesas';

  @override
  String get adminPersonNoAssignments => 'Sin roles ni mesa';

  @override
  String get adminPersonNoAssignmentsMessage =>
      'Esta persona todavía no tiene un rol ni una mesa asignada.';

  @override
  String get adminDeactivatePerson => 'Desactivar persona';

  @override
  String get adminReactivate => 'Reactivar';

  @override
  String adminDeactivatePersonTitle(String name) {
    return 'Desactivar a $name';
  }

  @override
  String get adminDeactivatePersonMessage =>
      'Termina sus lugares en mesas, sus roles y sus invitaciones pendientes. No se borra nada: el historial se conserva.';

  @override
  String adminToastPersonDeactivated(String name) {
    return '$name desactivado';
  }

  @override
  String adminToastPersonReactivated(String name) {
    return '$name reactivado';
  }

  @override
  String get adminSectionRoleScope => 'Rol y alcance';

  @override
  String get adminSectionPerson => 'Datos de la persona';

  @override
  String get adminCreateAndInvite => 'Crear e invitar';

  @override
  String get adminNoTablesForInvite => 'No hay mesas disponibles para este rol';

  @override
  String adminSeatsOf(String code) {
    return 'Plazas de $code';
  }

  @override
  String adminSeatsLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Quedan $count plazas',
      one: 'Queda 1 plaza',
    );
    return '$_temp0';
  }

  @override
  String adminInviteCreatedTitle(String name) {
    return 'Invitación creada para $name';
  }

  @override
  String get adminInviteCreatedDetail =>
      'Comparte el enlace o el código. Al iniciar sesión con Google, Apple o Facebook se vincula su identidad.';

  @override
  String get adminShareInvite => 'Compartir invitación';

  @override
  String get adminShortCode => 'Código corto';

  @override
  String get adminInviteQrLabel => 'Código QR de la invitación';

  @override
  String adminInviteExpires(String date) {
    return 'Vence el $date';
  }

  @override
  String get adminCopyLink => 'Copiar enlace';

  @override
  String get adminCopyCode => 'Copiar código';

  @override
  String get adminLinkCopied => 'Enlace copiado';

  @override
  String get adminCodeCopied => 'Código copiado';

  @override
  String get adminInviteAnother => 'Invitar a otra persona';

  @override
  String adminInviteShareMessage(String name, String code, String url) {
    return 'Hola $name, te invito a Gold Roundtables. Código: $code. Entra aquí: $url';
  }

  @override
  String get adminErrorTableFull =>
      'La mesa ya tiene 9 personas (incluido el facilitador). No se puede agregar otra.';

  @override
  String get adminErrorDuplicateTableCode =>
      'Ya existe una mesa con ese código en la organización. Usa otro.';

  @override
  String get adminErrorDuplicateOrganization =>
      'Ya existe una organización con ese nombre.';

  @override
  String get adminErrorDuplicateLocation =>
      'Ya existe una ubicación con ese nombre en la organización.';

  @override
  String get adminErrorFacilitatorRequired =>
      'Falta el facilitador: cada mesa necesita uno.';

  @override
  String get adminErrorTableHasFacilitator =>
      'Esta mesa ya tiene facilitador. Usa «Cambiar facilitador».';

  @override
  String get adminErrorCannotMoveFacilitator =>
      'No se puede mover al facilitador. Primero cambia el facilitador.';

  @override
  String get adminErrorCannotRemoveFacilitator =>
      'No se puede quitar al facilitador. Primero cambia el facilitador.';

  @override
  String get adminErrorAlreadyMember => 'Esa persona ya está en la mesa.';

  @override
  String get adminErrorPersonAlreadyLinked =>
      'Esa persona ya tiene una cuenta vinculada.';

  @override
  String get adminErrorInvitePendingExists =>
      'Esa persona ya tiene una invitación pendiente.';

  @override
  String get adminErrorOrganizationInactive =>
      'La organización está pausada o desactivada: no se pueden hacer cambios.';

  @override
  String get adminErrorLastPlatformAdmin =>
      'No se puede quitar al último administrador de la plataforma.';

  @override
  String get adminErrorTableNotActive => 'La mesa no está activa.';

  @override
  String get adminErrorForbidden =>
      'No tienes permiso para hacer esto. El intento quedó registrado.';

  @override
  String get kpiReportsTitle => 'Informes';

  @override
  String get kpiValuesCompleted => 'Valores completados';

  @override
  String get kpiEstimatedImprovement => 'Mejora estimada';

  @override
  String get kpiPointsUnit => 'pts';

  @override
  String get kpiAttendance => 'Asistencia';

  @override
  String get kpiSyncedLate => 'Sincronizado tarde';

  @override
  String get kpiTables => 'Mesas';

  @override
  String get kpiTablesByStatus => 'Mesas por estado';

  @override
  String get kpiTablesLegend => 'activas · retrasadas · inactivas';

  @override
  String kpiTablesActive(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count activas',
      one: '1 activa',
    );
    return '$_temp0';
  }

  @override
  String kpiTablesDelayed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count retrasadas',
      one: '1 retrasada',
    );
    return '$_temp0';
  }

  @override
  String kpiTablesInactive(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count inactivas',
      one: '1 inactiva',
    );
    return '$_temp0';
  }

  @override
  String get kpiAllOrganizationsScope => 'Todas las organizaciones';

  @override
  String kpiPeriodOf(int weeks) {
    return 'períodos de $weeks semanas';
  }

  @override
  String get kpiPeriod => 'Período';

  @override
  String kpiWeeks(int weeks) {
    return '$weeks semanas';
  }

  @override
  String get kpiModuleValue => 'Módulo / valor';

  @override
  String get kpiReportFilters => 'Filtros del informe';

  @override
  String get kpiOfflineTitle => 'Los informes necesitan conexión';

  @override
  String get kpiOfflineMessage =>
      'Los KPIs se calculan en el servidor y no se guardan en este dispositivo. Reconéctate para verlos; el explorador sigue disponible.';

  @override
  String get kpiEmptyTitle => 'Sin datos para estos filtros';

  @override
  String get kpiEmptyMessage =>
      'Ninguna mesa coincide con la combinación de filtros, o la organización aún no tiene mesas.';

  @override
  String get kpiRemoveFilters => 'Quitar filtros';

  @override
  String get kpiValuesDetail => 'de 48 posibles por mesa';

  @override
  String get kpiImprovementDetail => 'seguimiento − inicial';

  @override
  String kpiLowTablesDetail(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mesas bajo 70 %',
      one: '1 mesa bajo 70 %',
      zero: 'Ninguna mesa bajo 70 %',
    );
    return '$_temp0';
  }

  @override
  String get kpiSyncedLateDetail => 'respuestas cargadas tras la sesión';

  @override
  String get kpiSeeDelayed => 'Ver retrasadas';

  @override
  String get kpiSeeTables => 'Ver mesas';

  @override
  String get kpiChartView => 'Gráfico';

  @override
  String get kpiTableView => 'Tabla';

  @override
  String kpiExportCsvOf(String title) {
    return 'Exportar CSV de $title';
  }

  @override
  String get kpiExported => 'Archivo CSV listo';

  @override
  String get kpiChartValuesPerWeek => 'Valores completados por semana';

  @override
  String kpiInPeriod(int count) {
    return '$count en el período';
  }

  @override
  String kpiAttendanceSubtitle(String average, int threshold) {
    return 'Promedio $average · umbral $threshold %';
  }

  @override
  String kpiThreshold(int percent) {
    return 'umbral $percent %';
  }

  @override
  String get kpiChartImprovementByModule => 'Mejora estimada por módulo';

  @override
  String get kpiChartImprovementSubtitle =>
      'Puntaje inicial → seguimiento (1–10, el 5 está bloqueado)';

  @override
  String get kpiTablesByStatusSubtitle =>
      'Por organización · activa / retrasada / inactiva';

  @override
  String kpiSyncedLateChartSubtitle(int count) {
    return 'Respuestas cargadas fuera de la ventana · $count en total';
  }

  @override
  String get kpiNoDataInScope => 'Sin datos en este alcance.';

  @override
  String get kpiNoSyncedLate =>
      'Ninguna mesa tuvo sincronización tardía en este alcance.';

  @override
  String get kpiColWeek => 'Semana';

  @override
  String get kpiColSessions => 'Sesiones';

  @override
  String get kpiColModule => 'Módulo';

  @override
  String get kpiColName => 'Nombre';

  @override
  String get kpiColInitialAvg => 'Inicial (prom.)';

  @override
  String get kpiColFollowUpAvg => 'Seguimiento (prom.)';

  @override
  String get kpiColValue => 'Valor';

  @override
  String get kpiColInitial => 'Inicial';

  @override
  String get kpiColFollowUp => 'Seguimiento';

  @override
  String get kpiColSyncedLate => 'Sincronizado tarde';

  @override
  String kpiTipWeekValues(String week, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valores',
      one: '1 valor',
    );
    return 'Semana del $week: $_temp0';
  }

  @override
  String kpiTipWeekAttendance(String week, String value, int low) {
    String _temp0 = intl.Intl.pluralLogic(
      low,
      locale: localeName,
      other: '',
      one: ' (bajo el umbral)',
    );
    return 'Semana del $week: $value$_temp0';
  }

  @override
  String kpiTipInitial(String label, String value) {
    return '$label · inicial $value';
  }

  @override
  String kpiTipFollowUp(String label, String value, String delta) {
    return '$label · seguimiento $value ($delta pts)';
  }

  @override
  String kpiTipStatus(String org, String status, int count) {
    return '$org · $status: $count';
  }

  @override
  String kpiTipLate(String code, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count respuestas tarde',
      one: '1 respuesta tarde',
    );
    return '$code: $_temp0';
  }

  @override
  String kpiDrillTitle(String level) {
    return 'Desglose · $level';
  }

  @override
  String get kpiDrillSubtitle =>
      'Agregado → organización → mesa → miembro. Pulsa una fila para bajar un nivel.';

  @override
  String get kpiDrillCountry => 'País';

  @override
  String get kpiDrillOrganization => 'Organización';

  @override
  String get kpiDrillFacilitator => 'Facilitador';

  @override
  String get kpiDrillTable => 'Mesa';

  @override
  String get kpiDrillMember => 'Miembro';

  @override
  String get kpiAllCountries => 'Todos los países';

  @override
  String get kpiAllOrganizations => 'Todas las organizaciones';

  @override
  String get kpiAllFacilitators => 'Todos los facilitadores';

  @override
  String get kpiDrillEmpty => 'Sin filas en este nivel';

  @override
  String get kpiSensitiveTitle => 'Datos sensibles · respuestas individuales';

  @override
  String get kpiSensitiveDetail =>
      'Visibles para facilitador, coordinador y administración. Cada consulta queda en la auditoría.';

  @override
  String get kpiSensitiveRevealWarning =>
      'Al mostrar las respuestas se registra quién las consultó.';

  @override
  String get kpiSensitiveRevealed => 'Consulta registrada en la auditoría.';

  @override
  String get kpiMemberTitle => 'Miembro';

  @override
  String get kpiBackToTable => 'Volver a la mesa';

  @override
  String get kpiMemberDeniedTitle => 'Sin permiso para este miembro';

  @override
  String get kpiMemberDeniedMessage =>
      'Tu rol no puede ver a esta persona. El intento quedó registrado.';

  @override
  String kpiSessionsOf(int present, int expected) {
    return '$present de $expected sesiones';
  }

  @override
  String get kpiIndividualAnswers => 'Respuestas individuales';

  @override
  String get kpiRevealAnswers => 'Mostrar respuestas (se registra)';

  @override
  String get kpiNoAnswersYet => 'Sin respuestas todavía.';

  @override
  String get kpiReflections => 'Reflexiones';

  @override
  String get kpiJustifications => 'Justificaciones de los puntajes';

  @override
  String get kpiCommitments => 'Compromisos';

  @override
  String get kpiCommitmentFollowUp => 'Seguimiento';

  @override
  String get auditScopePlatform => 'Toda la plataforma';

  @override
  String get auditAllTypes => 'Todos';

  @override
  String get auditAllOrganizations => 'Todas las organizaciones';

  @override
  String get auditSearchHint => 'Buscar actor, objeto o detalle…';

  @override
  String get auditEmptyTitle => 'Sin eventos';

  @override
  String get auditEmptyMessage => 'No hay registros con estos filtros.';

  @override
  String auditFooter(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count eventos',
      one: '1 evento',
    );
    return '$_temp0 · el registro no se puede editar ni borrar';
  }

  @override
  String get auditLoadMore => 'Cargar más eventos';

  @override
  String get auditSystemActor => 'Sistema';

  @override
  String get auditColDate => 'Fecha';

  @override
  String get auditColActor => 'Actor';

  @override
  String get auditColEvent => 'Evento';

  @override
  String get auditColSubject => 'Objeto';

  @override
  String get auditColDetail => 'Detalle';

  @override
  String get auditCategoryCreated => 'Alta';

  @override
  String get auditCategoryRemoved => 'Baja';

  @override
  String get auditCategoryReassigned => 'Reasignación';

  @override
  String get auditCategorySession => 'Sesión';

  @override
  String get auditCategoryRole => 'Cambio de rol';

  @override
  String get auditCategorySensitive => 'Vista sensible';

  @override
  String get auditCategoryChanged => 'Cambio';

  @override
  String get auditEventOrganizationCreated => 'Organización creada';

  @override
  String get auditEventOrganizationUpdated => 'Organización actualizada';

  @override
  String get auditEventOrganizationStatus => 'Estado de organización cambiado';

  @override
  String get auditEventLocationCreated => 'Ubicación creada';

  @override
  String get auditEventLocationUpdated => 'Ubicación actualizada';

  @override
  String get auditEventTableCreated => 'Mesa creada';

  @override
  String get auditEventTableUpdated => 'Mesa actualizada';

  @override
  String get auditEventFacilitatorChanged => 'Facilitador cambiado';

  @override
  String get auditEventMemberAdded => 'Miembro agregado';

  @override
  String get auditEventMemberMoved => 'Miembro movido';

  @override
  String get auditEventMemberDeactivated => 'Miembro desactivado';

  @override
  String get auditEventInviteCreated => 'Invitación creada';

  @override
  String get auditEventInviteRevoked => 'Invitación revocada';

  @override
  String get auditEventInviteRenewed => 'Invitación renovada';

  @override
  String get auditEventInviteAccepted => 'Invitación aceptada';

  @override
  String get auditEventPersonUpdated => 'Persona actualizada';

  @override
  String get auditEventPersonDeactivated => 'Persona desactivada';

  @override
  String get auditEventRoleGranted => 'Rol otorgado';

  @override
  String get auditEventRoleRevoked => 'Rol revocado';

  @override
  String get auditEventSessionOpened => 'Sesión abierta';

  @override
  String get auditEventSessionClosed => 'Sesión cerrada';

  @override
  String get auditEventSessionCancelled => 'Sesión cancelada';

  @override
  String get auditEventAnswersRevealed => 'Respuestas consultadas';

  @override
  String get auditEntityOrganization => 'Organización';

  @override
  String get auditEntityLocation => 'Ubicación';

  @override
  String get auditEntityTable => 'Mesa';

  @override
  String get auditEntityMember => 'Miembro';

  @override
  String get auditEntityPerson => 'Persona';

  @override
  String get auditEntityInvite => 'Invitación';

  @override
  String get auditEntitySession => 'Sesión';

  @override
  String get auditEntityRole => 'Rol';

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
