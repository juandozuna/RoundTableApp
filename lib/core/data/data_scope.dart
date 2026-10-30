/// Area of data an app write may have changed. A write notifies its scopes
/// through `DataChangeSignal`, and live watches subscribed to one of them
/// refetch immediately instead of waiting for the next poll.
enum DataScope {
  /// The live session: stage, attendance, answers, assessments, commitments.
  session,

  /// Closed sessions and their review.
  history,

  /// Home overview: tables, next session, pending follow-up.
  home,

  /// Scheduled and rescheduled sessions.
  calendar,

  /// Content languages and curriculum translations.
  contentLanguage,

  /// Administration: organizations, locations, tables, people, roles.
  admin,
}
