/// What happens right after creating an email account.
enum SignUpOutcome {
  /// The session exists; the person is signed in.
  signedIn,

  /// The server wants the email confirmed first (project setting "Confirm
  /// email" on); the person must open the emailed link.
  confirmationPending,
}
