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
  String get syncUnavailable => 'Sincronización no configurada';

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
  String get adminDeniedHomeAction => 'Ir al inicio';

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
  String get adminViewFewPeople => 'Menos de 3 personas';

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
  String get adminFieldTableCodeHint => 'Ej. LUZ-07';

  @override
  String get adminFieldTableCodeHelper =>
      'Formato AAA-00, único dentro de la organización.';

  @override
  String get adminSectionLocationSchedule => 'Ubicación y horario';

  @override
  String get adminSectionProgram => 'Programa';

  @override
  String get adminFieldModule => 'Módulo';

  @override
  String get adminFieldProgramValue => 'Valor';

  @override
  String adminProgramModuleOption(int number, String name) {
    return 'Módulo $number · $name';
  }

  @override
  String adminProgramValueOption(int number, String name) {
    return 'Valor $number · $name';
  }

  @override
  String get adminProgramValueHelperCreate =>
      'Valor en el que empieza la mesa (del 1 al 48). Si no eliges, empieza en el valor 1.';

  @override
  String get adminProgramValueHelperEdit =>
      'Valor que trabajará la mesa en su próxima sesión. Las sesiones ya cerradas no cambian.';

  @override
  String get adminRewindTitle => '¿Retroceder en el programa?';

  @override
  String get adminRewindMessage =>
      'Esta mesa ya completó sesiones de este valor o de los siguientes. Esas sesiones y sus respuestas se conservan; la mesa volverá a trabajar el valor elegido.';

  @override
  String get adminRewindConfirm => 'Sí, retroceder';

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
  String get kpiSessionsIncomplete => 'Sesiones incompletas';

  @override
  String kpiSessionsIncompleteDetail(int closed) {
    return 'de $closed sesiones cerradas, sin llegar a las respuestas';
  }

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
  String get homeAlertsKicker => 'Mesas que necesitan atención';

  @override
  String get homeAlertsEmpty => 'Todas tus mesas activas están al día.';

  @override
  String homeAlertsMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'y $count mesas más',
      one: 'y 1 mesa más',
    );
    return '$_temp0';
  }

  @override
  String get adminReasonLowAttendance => 'Baja asistencia';

  @override
  String get adminReasonFewPeople => 'Menos de 3 personas';

  @override
  String get adminTableLowAttendanceTitle =>
      'Baja asistencia en las últimas sesiones';

  @override
  String adminTableLowAttendanceDetail(String percent) {
    return 'El promedio de asistencia de las últimas 3 sesiones es $percent, por debajo del 70 %.';
  }

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
  String get settingsContentLanguageKicker => 'Idioma del contenido';

  @override
  String get settingsContentLanguageHint =>
      'Los valores y las preguntas se muestran en este idioma. Lo que aún no está traducido se ve en español.';

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

  @override
  String get homeWelcome => 'Te damos la bienvenida a Gold Roundtables';

  @override
  String get homeFoundationReady =>
      'La base de la aplicación está lista. Aquí aparecerán tus mesas y sesiones.';

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
  String get sessionBoardSeatAutoChip => 'AUTO';

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

  @override
  String get sessionMemberTableIs => 'La mesa está en:';

  @override
  String get sessionMemberPaceOwn => 'A tu ritmo';

  @override
  String get sessionMemberPeersLabel => 'La mesa';

  @override
  String get sessionMemberYouMark => 'TÚ';

  @override
  String get sessionMemberFacilitatorSuffix => 'facilitador';

  @override
  String sessionMemberPeerPresent(String name) {
    return '$name, presente';
  }

  @override
  String sessionMemberPeerLate(String name) {
    return '$name, llegó tarde';
  }

  @override
  String sessionMemberPeerExcused(String name) {
    return '$name, justificado';
  }

  @override
  String sessionMemberPeerAbsent(String name) {
    return '$name, ausente';
  }

  @override
  String sessionMemberPeerUnmarked(String name) {
    return '$name, sin marcar';
  }

  @override
  String get sessionMemberUnmarked => 'Sin marcar';

  @override
  String get sessionMemberLobbyTitle => 'Esperando a tu facilitador';

  @override
  String get sessionMemberLobbyMessage =>
      'La mesa todavía no está abierta. Cuando se abra, verás aquí a tu mesa en vivo.';

  @override
  String get sessionMemberLobbyFacilitatorTitle => 'Aún no abres la sesión';

  @override
  String get sessionMemberLobbyFacilitatorMessage =>
      'Abre la sesión en “Dirigir la mesa”. Luego podrás responder como un miembro más.';

  @override
  String get sessionMemberAttendanceKicker => 'Asistencia';

  @override
  String get sessionMemberAttendanceTitle =>
      'Tu facilitador está pasando lista';

  @override
  String get sessionMemberAttendanceFacilitatorTitle => 'Estás pasando lista';

  @override
  String get sessionMemberAttendanceUnmarked => 'Aún sin marcar';

  @override
  String get sessionMemberAttendanceWait => 'Espera a que te nombren.';

  @override
  String get sessionMemberAttendanceAbsentHint =>
      'Si respondes igualmente, pasarás a Presente al sincronizar.';

  @override
  String get sessionMemberAttendanceOkHint =>
      'Perfecto. El seguimiento se abre en un momento.';

  @override
  String get sessionMemberAttendanceFacilitatorHint =>
      'Como facilitador quedas Presente. Marca a los demás en “Dirigir la mesa”.';

  @override
  String get sessionMemberStepFollowUp => 'Seguim.';

  @override
  String get sessionMemberStepValue => 'Valor';

  @override
  String get sessionMemberStepCommitment => 'Compromiso';

  @override
  String get sessionMemberChipDone => 'Listo';

  @override
  String get sessionMemberChipNow => 'Ahora';

  @override
  String get sessionMemberChipMissing => 'Falta';

  @override
  String get sessionMemberChipClosed => 'Cerrado';

  @override
  String get sessionMemberChipNotYet => 'Aún no';

  @override
  String get sessionMemberChipSkipped => 'Omitido';

  @override
  String sessionMemberChipSemantics(String step, String state) {
    return '$step: $state';
  }

  @override
  String get sessionMemberStepsLabel => 'Tus etapas';

  @override
  String get sessionMemberValueIncludesCommitment =>
      'Valor actual incluye tu compromiso (no es una etapa aparte).';

  @override
  String sessionMemberFollowUpKicker(int number) {
    return 'Seguimiento · Valor $number';
  }

  @override
  String get sessionMemberPreviousCommitmentKicker =>
      'Tu compromiso de la semana pasada';

  @override
  String get sessionMemberHowItWent => '¿Cómo te fue?';

  @override
  String get sessionMemberStatusKept => 'Lo cumplí';

  @override
  String get sessionMemberStatusPartial => 'Cumplí una parte';

  @override
  String get sessionMemberStatusNotKept => 'No pude cumplirlo';

  @override
  String get sessionMemberJustificationLabel => '¿Por qué ese puntaje?';

  @override
  String get sessionMemberJustificationHint => 'Opcional. Una frase corta.';

  @override
  String get sessionMemberFollowUpNoteLabel =>
      'Cuéntanos en una frase (opcional)';

  @override
  String sessionMemberFollowUpScoreLabel(String value) {
    return '¿Cómo te calificas hoy en $value?';
  }

  @override
  String get sessionMemberFollowUpSend => 'Enviar seguimiento';

  @override
  String get sessionMemberNoPreviousTitle => 'No tienes compromiso previo';

  @override
  String get sessionMemberNoPreviousMessage =>
      'La semana pasada no estuviste en la mesa, así que no hay nada que revisar. ¡Qué bueno verte hoy!';

  @override
  String get sessionMemberFirstSessionTitle =>
      'Es la primera sesión de tu mesa';

  @override
  String get sessionMemberFirstSessionMessage =>
      'Todavía no hay un compromiso que revisar. ¡Empecemos!';

  @override
  String sessionMemberReflectionKicker(int number) {
    return 'Valor actual · Valor $number · parte 1 de 2';
  }

  @override
  String get sessionMemberReflectionHelper =>
      'El contenido está en tu folleto; aquí solo anotas tus respuestas.';

  @override
  String get sessionMemberPersonPickHelper =>
      'Toca a alguien de tu mesa, o escribe otro nombre abajo.';

  @override
  String get sessionMemberPersonOtherLabel => 'Otra persona';

  @override
  String get sessionMemberPersonOtherHint =>
      'Escribe el nombre si no está en la lista';

  @override
  String sessionMemberReflectionScoreLabel(String value) {
    return 'Tu puntaje inicial en $value';
  }

  @override
  String get sessionMemberReflectionSend => 'Enviar y seguir al compromiso';

  @override
  String get sessionMemberCommitmentKicker => 'Valor actual · parte 2 de 2';

  @override
  String get sessionMemberCommitmentTitle => 'Tu compromiso de esta semana';

  @override
  String get sessionMemberCommitmentHelper =>
      'Una sola acción concreta y medible: qué haré, cuándo y cómo lo mediré.';

  @override
  String get sessionMemberWhatLabel => 'Qué haré';

  @override
  String get sessionMemberWhatHint => 'Ej.: Llamar a mi abuela 2 veces';

  @override
  String get sessionMemberWhatExamplesKicker => '¿Sin ideas? Toca un ejemplo';

  @override
  String get sessionMemberWhatExample1 => 'Llamar a mi abuela 2 veces';

  @override
  String get sessionMemberWhatExample2 => 'Ordenar mi cuarto cada noche';

  @override
  String get sessionMemberWhatExample3 =>
      'Terminar mi tarea con 30 minutos diarios';

  @override
  String get sessionMemberWhenLabel => 'Cuándo';

  @override
  String get sessionMemberWhenEveryDay => 'Todos los días';

  @override
  String get sessionMemberWhenMondayThursday => 'Lunes y jueves';

  @override
  String get sessionMemberWhenThisWeek => 'Esta semana';

  @override
  String get sessionMemberWhenBeforeFriday => 'Antes del viernes';

  @override
  String get sessionMemberHowLabel => 'Cómo lo mediré';

  @override
  String get sessionMemberHowCount => 'Cuántas veces lo hice';

  @override
  String get sessionMemberHowYesNo => 'Sí o no cada día';

  @override
  String get sessionMemberHowSunday => 'Lo reviso el domingo';

  @override
  String get sessionMemberHowTell => 'Se lo cuento a la mesa';

  @override
  String get sessionMemberCommitmentSend => 'Enviar mi compromiso';

  @override
  String get sessionMemberErrorAnswer => 'Escribe una respuesta corta.';

  @override
  String get sessionMemberErrorTooShort => 'Muy corta. Cuenta un poco más.';

  @override
  String get sessionMemberErrorScore =>
      'Elige tu puntaje de 1 a 10 (el 5 no se puede).';

  @override
  String get sessionMemberErrorStatus => 'Elige cómo te fue con tu compromiso.';

  @override
  String get sessionMemberErrorWhat =>
      'Escribe una acción concreta para esta semana.';

  @override
  String get sessionMemberErrorWhatShort =>
      'Muy corta. Cuenta qué harás y cuánto.';

  @override
  String get sessionMemberErrorWhen => 'Elige cuándo lo harás.';

  @override
  String get sessionMemberErrorHow => 'Elige cómo lo vas a medir.';

  @override
  String get sessionMemberLockedTitle => 'Etapa cerrada';

  @override
  String get sessionMemberLockedMemberMessage =>
      'Tu facilitador ya cerró las respuestas.';

  @override
  String get sessionMemberLockedFacilitatorMessage =>
      'Cerraste las respuestas.';

  @override
  String get sessionMemberDockSend => 'Enviar';

  @override
  String get sessionMemberDockContinue => 'Seguir';

  @override
  String get sessionMemberDockSaved => 'Guardado';

  @override
  String get sessionMemberDockSentWaiting => 'Enviado · esperando a la mesa';

  @override
  String get sessionMemberDockReadyWaiting => 'Listo · esperando a la mesa';

  @override
  String get sessionMemberDockClosed => 'Cerrado';

  @override
  String get sessionMemberSentLive => 'Enviado.';

  @override
  String get sessionMemberSentWaitingFacilitator =>
      'Enviado. Falta que el facilitador cierre las respuestas.';

  @override
  String get sessionMemberSavedOffline =>
      'Guardado en este teléfono. Sigue con el siguiente paso cuando quieras.';

  @override
  String get sessionMemberRecapKickerFinished => 'Terminaste';

  @override
  String get sessionMemberRecapKickerPending => 'Resumen';

  @override
  String get sessionMemberRecapTitleFacilitator =>
      'Tus respuestas están completas';

  @override
  String get sessionMemberRecapTitleLive => 'Esperando el cierre de la mesa';

  @override
  String get sessionMemberRecapTitleOffline => 'Todo guardado en tu teléfono';

  @override
  String get sessionMemberRecapTitlePending => 'Tienes etapas pendientes';

  @override
  String get sessionMemberRecapOfflineInfo =>
      'Cuando tengas internet, tus respuestas se sincronizan solas. Si la sesión ya cerró, se marcarán “Sincronizado tarde”.';

  @override
  String get sessionMemberRecapAnswersClosed =>
      'Tu facilitador cerró las respuestas. Falta que cierre la sesión.';

  @override
  String sessionMemberResultFollowUp(String value) {
    return 'Seguimiento · $value';
  }

  @override
  String get sessionMemberResultFollowUpSkipped =>
      'Sin compromiso previo (omitido)';

  @override
  String get sessionMemberResultInitialScore =>
      'Valor actual · puntaje inicial';

  @override
  String get sessionMemberResultCommitment => 'Mi compromiso';

  @override
  String get sessionMemberResultsEmpty => 'Aún no hay respuestas guardadas.';

  @override
  String get sessionMemberSummaryKicker => 'Sesión cerrada';

  @override
  String sessionMemberSummaryThanks(String name) {
    return 'Gracias, $name';
  }

  @override
  String get sessionMemberSummaryAttendance => 'Tu asistencia';

  @override
  String get sessionMemberSummaryAutomatic => 'automática';

  @override
  String get sessionMemberSummaryUnanswered =>
      'Quedaron etapas sin responder. Ya no se pueden enviar desde la mesa en vivo.';

  @override
  String get sessionMemberSyncPendingDetailOffline =>
      'Se enviará cuando tengas internet.';

  @override
  String get sessionMemberSyncSyncedDetail =>
      'Tus respuestas ya están en la mesa.';

  @override
  String get sessionMemberSyncLateDetail =>
      'Llegó después del cierre de la sesión: se aceptó y quedó marcado.';

  @override
  String get sessionMemberSyncOfflineTitle =>
      'Sin internet · todo se guarda en este teléfono';

  @override
  String get sessionMemberSyncOfflineFacilitator =>
      'Tus respuestas se sincronizan igual que las de un miembro.';

  @override
  String get sessionMemberSyncOfflineMember =>
      'Tu facilitador te guía de palabra. Sigue a tu ritmo.';

  @override
  String get sessionMemberAutoPendingTitle => 'Te marcaron Ausente.';

  @override
  String get sessionMemberAutoPendingDetail =>
      'Como respondiste, tu asistencia pasará a Presente al sincronizar.';

  @override
  String get sessionMemberAutoDoneTitle => 'Asistencia automática';

  @override
  String get sessionMemberAutoDoneDetail =>
      'Pasaste de Ausente a Presente porque respondiste.';

  @override
  String get sessionMemberAbsentInfo =>
      'Estás marcado como Ausente. Si respondes, pasarás a Presente al sincronizar.';

  @override
  String get sessionMemberToastSent => 'Enviado';

  @override
  String get sessionMemberToastFailed =>
      'No se pudo guardar. Inténtalo de nuevo.';

  @override
  String get sessionMemberOfflineBannerDetail =>
      'todo se guarda en este teléfono';

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
  String get authOfflineWindowTitle => 'Conéctate para volver a entrar';

  @override
  String get authOfflineWindowBody =>
      'Llevas más de 7 días sin conexión. Conéctate a internet y toca Reintentar para confirmar tu sesión. Lo que guardaste en este teléfono sigue aquí y se enviará al conectarte.';

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
  String get invitesProblemRateLimited =>
      'Hubo demasiados intentos seguidos. Espera un minuto e inténtalo de nuevo.';

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
  String get invitesRoleOnlyAdmin => 'Solo la administración de la plataforma';

  @override
  String get invitesRoleLockedCoordinatorToast =>
      'Solo la administración de la plataforma puede invitar coordinadores.';

  @override
  String get invitesProblemRoleNotAllowed =>
      'Con tu rol no puedes invitar a una persona con ese rol.';

  @override
  String get invitesProblemTableNotAllowed =>
      'Solo puedes invitar integrantes a tu propia mesa.';

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

  @override
  String get historyNavLabel => 'Progreso';

  @override
  String get historyMemberTitle => 'Mi progreso';

  @override
  String get historyTableTitle => 'Progreso de la mesa';

  @override
  String historyTimelineTitle(String name) {
    return 'Recorrido de $name';
  }

  @override
  String get historyHomeLinkMember => 'Ver mi progreso';

  @override
  String get historyHomeLinkFacilitator => 'Ver el progreso de la mesa';

  @override
  String get historyWindowNote =>
      'Ves las últimas 8 semanas guardadas en este dispositivo. Lo anterior sigue a salvo en el servidor.';

  @override
  String get historyOfflineDetail =>
      'estás viendo lo guardado en este dispositivo';

  @override
  String get historyUnavailableTitle => 'Aquí verás tu progreso';

  @override
  String get historyUnavailableMessage =>
      'Cuando te unas a una mesa, tus puntajes y compromisos aparecerán aquí.';

  @override
  String get historyEmptyTitle => 'Todavía no hay historial';

  @override
  String get historyEmptyMessage =>
      'Después de la primera sesión verás aquí puntajes, compromisos y asistencia.';

  @override
  String get historyStatAttendance => 'Asistencia';

  @override
  String historyAttendedOf(int attended, int total) {
    return '$attended de $total';
  }

  @override
  String get historyStatInitial => 'Puntaje inicial (promedio)';

  @override
  String get historyStatFollowUp => 'Seguimiento (promedio)';

  @override
  String get historyStatImprovement => 'Mejora promedio';

  @override
  String get historyStatSessions => 'Sesiones realizadas';

  @override
  String get historyStatAttendanceRate => 'Asistencia de la mesa';

  @override
  String historyPercent(double value) {
    final intl.NumberFormat valueNumberFormat =
        intl.NumberFormat.percentPattern(localeName);
    final String valueString = valueNumberFormat.format(value);

    return '$valueString';
  }

  @override
  String get historyChartTitle => 'Inicial y seguimiento por valor';

  @override
  String get historyChartAxisHint =>
      'Cada número es el valor del programa. Puntajes del 1 al 10.';

  @override
  String get historyLegendInitial => 'Inicial';

  @override
  String get historyLegendFollowUp => 'Seguimiento';

  @override
  String get historyChartSemantics =>
      'Gráfica de puntajes inicial y de seguimiento por valor';

  @override
  String historyChartItemSemantics(
    int sequence,
    String name,
    String initial,
    String followUp,
  ) {
    return 'Valor $sequence, $name: inicial $initial, seguimiento $followUp';
  }

  @override
  String get historyScoreMissing => 'sin dato';

  @override
  String historyImprovementUp(int points) {
    return 'Mejoró $points';
  }

  @override
  String historyImprovementDown(int points) {
    return 'Bajó $points';
  }

  @override
  String get historyImprovementSame => 'Sin cambio';

  @override
  String get historyImprovementPending => 'Se mide en el seguimiento';

  @override
  String historyModuleHeading(int number, String name) {
    return 'Módulo $number · $name';
  }

  @override
  String historyValueHeading(int sequence, String name) {
    return 'Valor $sequence · $name';
  }

  @override
  String get historyValuesTitle => 'Por valor';

  @override
  String historyScoreInitialLine(String score) {
    return 'Inicial: $score';
  }

  @override
  String historyScoreFollowUpLine(String score) {
    return 'Seguimiento: $score';
  }

  @override
  String get historyWhyKicker => '¿Por qué ese puntaje?';

  @override
  String get historyCommitmentKicker => 'Compromiso';

  @override
  String historyCommitmentMeasure(String measure) {
    return 'Cómo lo mediré: $measure';
  }

  @override
  String get historyCommitmentPending => 'Se revisa en la próxima sesión';

  @override
  String historyCommitmentNote(String note) {
    return '“$note”';
  }

  @override
  String get historyLateSynced => 'Enviado tarde';

  @override
  String get historySessionsTitle => 'Sesiones';

  @override
  String get historySessionOpenNow => 'En curso';

  @override
  String get historySessionIncomplete => 'Incompleta';

  @override
  String get historyAttendanceNone => 'Sin registro';

  @override
  String historySessionTitle(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat(
      'd \'de\' MMMM',
      localeName,
    );
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String historySessionValueLine(int sequence, String name) {
    return 'Valor $sequence · $name';
  }

  @override
  String historySessionAttendance(int attended, int total) {
    return 'Asistieron $attended de $total';
  }

  @override
  String historySessionScores(String initial, String followUp) {
    return 'Inicial $initial · Seguimiento $followUp';
  }

  @override
  String get historyMembersTitle => 'Integrantes';

  @override
  String get historyFacilitatorTag => 'Facilitador';

  @override
  String historyMemberAverages(String initial, String followUp) {
    return 'Inicial $initial · Seguimiento $followUp';
  }

  @override
  String historyOpenTimeline(String name) {
    return 'Ver el recorrido de $name';
  }

  @override
  String get historyTableValuesTitle => 'Promedio de la mesa por valor';

  @override
  String historyTableValueLine(String initial, String followUp, int count) {
    return 'Inicial $initial · Seguimiento $followUp · $count personas';
  }

  @override
  String get historyNoCommitment => 'Sin compromiso';

  @override
  String get historyLoadError =>
      'No pudimos leer tu historial en este dispositivo.';

  @override
  String get adminSessionsTitle => 'Próxima sesión';

  @override
  String get adminSessionNone => 'Esta mesa no tiene una sesión pendiente.';

  @override
  String get adminSessionExtraBadge => 'Extraordinaria';

  @override
  String get adminSessionMovedBadge => 'Reprogramada';

  @override
  String adminSessionMovedFrom(String date) {
    return 'Antes: $date';
  }

  @override
  String get adminSessionInProgress =>
      'La sesión ya empezó: no se puede cambiar.';

  @override
  String get adminSessionReschedule => 'Reprogramar';

  @override
  String get adminSessionCancel => 'Cancelar sesión';

  @override
  String get adminSessionAddExtra => 'Sesión extraordinaria';

  @override
  String get adminRescheduleTitle => 'Reprogramar la sesión';

  @override
  String adminRescheduleMessage(String timezone) {
    return 'La mesa se reunirá en la fecha y hora que elijas (zona $timezone). El resto del calendario semanal no cambia.';
  }

  @override
  String get adminExtraTitle => 'Agregar sesión extraordinaria';

  @override
  String adminExtraMessage(String date, String timezone) {
    return 'Una reunión adicional antes de la próxima sesión regular ($date). Trabaja el valor actual de la mesa y, al realizarla, el programa avanza. Zona $timezone.';
  }

  @override
  String get adminFieldDateTime => 'Fecha y hora';

  @override
  String get adminFieldDate => 'Fecha';

  @override
  String get adminSessionReason => 'Motivo (opcional)';

  @override
  String get adminSessionConfirmReschedule => 'Reprogramar';

  @override
  String get adminSessionConfirmExtra => 'Agregar sesión';

  @override
  String get adminCancelSessionTitle => 'Cancelar esta sesión';

  @override
  String adminCancelSessionMessage(String date) {
    return 'La sesión del $date no se realizará. El valor no avanza: la próxima sesión de la mesa trabajará el mismo valor.';
  }

  @override
  String get adminCancelReason => 'Motivo';

  @override
  String get adminCancelReasonHoliday => 'Feriado';

  @override
  String get adminCancelReasonForceMajeure => 'Fuerza mayor';

  @override
  String get adminCancelReasonOther => 'Otro motivo';

  @override
  String get adminCancelNote => 'Nota (opcional)';

  @override
  String get adminCancelConfirm => 'Cancelar sesión';

  @override
  String get adminCancelKeep => 'Mantener sesión';

  @override
  String get adminToastSessionRescheduled => 'Sesión reprogramada.';

  @override
  String get adminToastSessionCancelled =>
      'Sesión cancelada. La próxima trabajará el mismo valor.';

  @override
  String get adminToastExtraAdded => 'Sesión extraordinaria agregada.';

  @override
  String get adminErrorSessionInProgress =>
      'La sesión ya empezó; no se puede cambiar.';

  @override
  String get adminErrorScheduleInPast =>
      'La fecha de la sesión debe ser futura.';

  @override
  String get adminErrorSlotTaken =>
      'La mesa ya tiene una sesión en esa fecha y hora.';

  @override
  String get adminErrorExtraNotBeforeNext =>
      'La sesión extraordinaria debe ser antes de la próxima sesión de la mesa.';

  @override
  String get adminErrorExtraExists =>
      'Ya hay una sesión extraordinaria pendiente; reprográmala o cancélala.';

  @override
  String get adminErrorEffectiveInPast =>
      'El nuevo horario no puede empezar en una fecha pasada.';

  @override
  String get adminScheduleHistory => 'Historial de horarios';

  @override
  String adminScheduleFrom(String date) {
    return 'Desde $date';
  }

  @override
  String get adminScheduleCurrent => 'Vigente';

  @override
  String get adminScheduleUpcoming => 'Programado';

  @override
  String get adminScheduleEffectiveFrom => 'Vigente desde';

  @override
  String get adminScheduleEffectiveHelp =>
      'Si no eliges fecha, el cambio aplica desde hoy. Con una fecha futura, las sesiones anteriores no se mueven.';

  @override
  String get homeSessionExtraordinary => 'Sesión extraordinaria';

  @override
  String homeSessionMoved(String date) {
    return 'Reprogramada · antes $date';
  }

  @override
  String homeSessionCancelledNotice(String date) {
    return 'Se canceló la sesión del $date. La próxima trabaja el mismo valor.';
  }

  @override
  String get calendarNavLabel => 'Calendario';

  @override
  String get calendarTitle => 'Próximas sesiones';

  @override
  String calendarCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sesiones',
      one: '1 sesión',
    );
    return '$_temp0';
  }

  @override
  String get calendarEmptyTitle => 'No hay sesiones próximas';

  @override
  String get calendarEmptyMessage =>
      'Cuando una mesa tenga su siguiente sesión programada, aparecerá aquí.';

  @override
  String get calendarEmptyFilteredMessage =>
      'Ninguna sesión coincide con estos filtros.';

  @override
  String get calendarUnavailableTitle => 'Sin calendario para este rol';

  @override
  String get calendarUnavailableMessage =>
      'El calendario es para coordinadores, administradores y facilitadores.';

  @override
  String get calendarLoadError => 'No pudimos cargar las próximas sesiones.';

  @override
  String get calendarOpenBadge => 'En curso';

  @override
  String get calendarCancelledBadge => 'Cancelada';

  @override
  String calendarMovedBadge(String date) {
    return 'Reprogramada · antes $date';
  }

  @override
  String calendarTableTime(String timezone) {
    return 'Hora de la mesa · $timezone';
  }

  @override
  String get calendarNoFacilitator => 'Sin facilitador';

  @override
  String calendarOpenTable(String table) {
    return 'Abrir la mesa $table';
  }

  @override
  String get curriculumNav => 'Currículo';

  @override
  String get curriculumTitle => 'Currículo';

  @override
  String get curriculumIntro =>
      'Los 5 módulos, los 48 valores y sus preguntas de reflexión. Aquí puedes subir el contenido, corregir textos y agregar idiomas. Lo que cambies llega a los dispositivos al sincronizar.';

  @override
  String get curriculumDeniedMessage =>
      'Solo la administración de la plataforma puede ver y editar el currículo.';

  @override
  String curriculumLanguageBase(String name) {
    return '$name (base)';
  }

  @override
  String get curriculumAddLanguage => 'Agregar idioma';

  @override
  String get curriculumAddLanguageConfirm => 'Agregar';

  @override
  String get curriculumFieldLanguageName => 'Nombre del idioma';

  @override
  String get curriculumFieldLanguageNameHint => 'English';

  @override
  String get curriculumFieldLanguageCode => 'Código del idioma';

  @override
  String get curriculumFieldLanguageCodeHint => 'en';

  @override
  String get curriculumFieldLanguageCodeHelper =>
      '2 o 3 letras minúsculas, por ejemplo en o pt.';

  @override
  String curriculumCompleteness(
    String name,
    int translated,
    int total,
    int percent,
  ) {
    return '$name: $translated de $total textos traducidos ($percent %)';
  }

  @override
  String get curriculumCompletenessHint =>
      'Lo que falta se muestra en español a quienes usan este idioma.';

  @override
  String get curriculumLanguageActive => 'Disponible en la app';

  @override
  String get curriculumLanguageHidden => 'Oculto';

  @override
  String get curriculumHideLanguage => 'Ocultar en la app';

  @override
  String get curriculumShowLanguage => 'Mostrar en la app';

  @override
  String get curriculumUpload => 'Subir currículo';

  @override
  String curriculumUploadTranslation(String name) {
    return 'Subir traducción ($name)';
  }

  @override
  String get curriculumExport => 'Compartir archivo del currículo';

  @override
  String curriculumExportSubject(String name) {
    return 'Currículo ($name)';
  }

  @override
  String curriculumModuleTitle(int number, String name) {
    return 'Módulo $number · $name';
  }

  @override
  String curriculumValueTitle(int number, String name) {
    return '$number. $name';
  }

  @override
  String curriculumValueCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count valores',
      one: '1 valor',
    );
    return '$_temp0';
  }

  @override
  String curriculumQuestionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count preguntas',
      one: '1 pregunta',
    );
    return '$_temp0';
  }

  @override
  String get curriculumUsedInSessions => 'ya se usó en sesiones';

  @override
  String get curriculumUntranslated =>
      'Sin traducir: se muestra el texto en español.';

  @override
  String get curriculumQuestionInactive => 'desactivada';

  @override
  String get curriculumQuestionAnswered => 'con respuestas';

  @override
  String curriculumEditModule(int number) {
    return 'Editar módulo $number';
  }

  @override
  String curriculumEditValue(int number) {
    return 'Editar valor $number';
  }

  @override
  String curriculumEditQuestion(String code) {
    return 'Editar pregunta $code';
  }

  @override
  String get curriculumAddQuestion => 'Agregar pregunta';

  @override
  String curriculumAddQuestionTitle(String value) {
    return 'Nueva pregunta para $value';
  }

  @override
  String get curriculumAddQuestionConfirm => 'Agregar pregunta';

  @override
  String get curriculumSave => 'Guardar';

  @override
  String get curriculumSpanishText => 'Texto en español';

  @override
  String get curriculumFieldName => 'Nombre';

  @override
  String get curriculumFieldDescription => 'Descripción';

  @override
  String get curriculumFieldBooklet => 'Referencia del cuadernillo';

  @override
  String get curriculumFieldQuestionText => 'Texto de la pregunta';

  @override
  String get curriculumFieldQuestionCode => 'Código de la pregunta';

  @override
  String get curriculumFieldQuestionCodeHelper =>
      'Identifica la pregunta; minúsculas, números y guion bajo. No se puede cambiar después.';

  @override
  String get curriculumFieldResponseType => 'Tipo de respuesta';

  @override
  String get curriculumFieldQuestionActive => 'Pregunta activa';

  @override
  String get curriculumFieldOrder => 'Orden';

  @override
  String get curriculumFieldStatus => 'Estado';

  @override
  String get curriculumResponseText => 'Texto';

  @override
  String get curriculumResponsePerson => 'Una persona';

  @override
  String get curriculumTypeLockedHint =>
      'La pregunta ya tiene respuestas: no se puede cambiar su tipo.';

  @override
  String get curriculumToastSaved => 'Cambios guardados.';

  @override
  String get curriculumToastUnchanged => 'No había nada que cambiar.';

  @override
  String get curriculumToastQuestionAdded => 'Pregunta agregada.';

  @override
  String get curriculumToastLanguageAdded =>
      'Idioma agregado. Ahora sube o escribe sus textos.';

  @override
  String get curriculumToastApplied => 'Currículo actualizado.';

  @override
  String get curriculumUploadTitle => 'Subir currículo';

  @override
  String curriculumUploadTranslationTitle(String code) {
    return 'Subir traducción ($code)';
  }

  @override
  String get curriculumUploadIntro =>
      'Elige un archivo .json o .csv con los 5 módulos, los 48 valores y sus preguntas, o pega su contenido. Antes de aplicar verás qué cambia; no se guarda nada hasta que lo confirmes.';

  @override
  String get curriculumUploadTranslationIntro =>
      'Elige un archivo .json o .csv con los textos traducidos (puede ser parcial) o pega su contenido. Antes de aplicar verás qué cambia.';

  @override
  String get curriculumPickFile => 'Elegir archivo';

  @override
  String curriculumPickedFile(String name) {
    return 'Archivo: $name';
  }

  @override
  String get curriculumPasteLabel => 'Contenido del archivo';

  @override
  String get curriculumPasteHint => 'Pega aquí el JSON o el CSV';

  @override
  String get curriculumReviewChanges => 'Revisar cambios';

  @override
  String get curriculumReviewTitle => 'Cambios que se aplicarían';

  @override
  String get curriculumApplyChanges => 'Aplicar cambios';

  @override
  String get curriculumNoChanges =>
      'No hay cambios: el archivo ya coincide con lo que está guardado.';

  @override
  String get curriculumRefusedTitle => 'No se puede aplicar este archivo';

  @override
  String get curriculumDiffNew => 'nuevos';

  @override
  String get curriculumDiffChanged => 'con cambios';

  @override
  String get curriculumDiffReactivated => 'reactivadas';

  @override
  String get curriculumDiffDeactivated => 'se desactivan';

  @override
  String get curriculumDiffRemoved => 'se quitan';

  @override
  String get curriculumDiffKeptBecauseAnswered =>
      'Tiene respuestas: se desactiva, no se borra.';

  @override
  String get curriculumDiffEmpty => '(vacío)';

  @override
  String curriculumDiffField(String field, String before, String after) {
    return '$field: $before → $after';
  }

  @override
  String get curriculumEntityModule => 'Módulo';

  @override
  String get curriculumEntityValue => 'Valor';

  @override
  String get curriculumEntityQuestion => 'Pregunta';
}
