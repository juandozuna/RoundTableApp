import 'dart:async';

// Parallel reads whose failure is the first original error.
//
// Dart's record `.wait` wraps failures in a `ParallelWaitError`, which the
// feature error mapping (ApiException → offline / error state) does not
// recognize, so an offline refresh would surface as an unknown error.
// `.waitUnwrapped` keeps `.wait`'s parallelism and typing and rethrows the
// first failure (in record order) as it was thrown.

Never _rethrowFirst(List<AsyncError?> errors) {
  final first = errors.firstWhere((error) => error != null)!;
  Error.throwWithStackTrace(first.error, first.stackTrace);
}

extension WaitUnwrapped2<A, B> on (Future<A>, Future<B>) {
  Future<(A, B)> get waitUnwrapped async {
    try {
      return await wait;
    } on ParallelWaitError<(A?, B?), (AsyncError?, AsyncError?)> catch (error) {
      final (a, b) = error.errors;
      _rethrowFirst([a, b]);
    }
  }
}

extension WaitUnwrapped3<A, B, C> on (Future<A>, Future<B>, Future<C>) {
  Future<(A, B, C)> get waitUnwrapped async {
    try {
      return await wait;
    } on ParallelWaitError<
      (A?, B?, C?),
      (AsyncError?, AsyncError?, AsyncError?)
    > catch (error) {
      final (a, b, c) = error.errors;
      _rethrowFirst([a, b, c]);
    }
  }
}

extension WaitUnwrapped4<A, B, C, D>
    on (Future<A>, Future<B>, Future<C>, Future<D>) {
  Future<(A, B, C, D)> get waitUnwrapped async {
    try {
      return await wait;
    } on ParallelWaitError<
      (A?, B?, C?, D?),
      (AsyncError?, AsyncError?, AsyncError?, AsyncError?)
    > catch (error) {
      final (a, b, c, d) = error.errors;
      _rethrowFirst([a, b, c, d]);
    }
  }
}

extension WaitUnwrapped5<A, B, C, D, E>
    on (Future<A>, Future<B>, Future<C>, Future<D>, Future<E>) {
  Future<(A, B, C, D, E)> get waitUnwrapped async {
    try {
      return await wait;
    } on ParallelWaitError<
      (A?, B?, C?, D?, E?),
      (AsyncError?, AsyncError?, AsyncError?, AsyncError?, AsyncError?)
    > catch (error) {
      final (a, b, c, d, e) = error.errors;
      _rethrowFirst([a, b, c, d, e]);
    }
  }
}

extension WaitUnwrapped6<A, B, C, D, E, F>
    on (Future<A>, Future<B>, Future<C>, Future<D>, Future<E>, Future<F>) {
  Future<(A, B, C, D, E, F)> get waitUnwrapped async {
    try {
      return await wait;
    } on ParallelWaitError<
      (A?, B?, C?, D?, E?, F?),
      (
        AsyncError?,
        AsyncError?,
        AsyncError?,
        AsyncError?,
        AsyncError?,
        AsyncError?,
      )
    > catch (error) {
      final (a, b, c, d, e, f) = error.errors;
      _rethrowFirst([a, b, c, d, e, f]);
    }
  }
}

extension WaitUnwrapped7<A, B, C, D, E, F, G>
    on
        (
          Future<A>,
          Future<B>,
          Future<C>,
          Future<D>,
          Future<E>,
          Future<F>,
          Future<G>,
        ) {
  Future<(A, B, C, D, E, F, G)> get waitUnwrapped async {
    try {
      return await wait;
    } on ParallelWaitError<
      (A?, B?, C?, D?, E?, F?, G?),
      (
        AsyncError?,
        AsyncError?,
        AsyncError?,
        AsyncError?,
        AsyncError?,
        AsyncError?,
        AsyncError?,
      )
    > catch (error) {
      final (a, b, c, d, e, f, g) = error.errors;
      _rethrowFirst([a, b, c, d, e, f, g]);
    }
  }
}
