import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/data_change_signal.dart';
import 'package:gold_roundtables/core/data/data_scope.dart';

void main() {
  test('delivers a notified scope to every listener', () async {
    final signal = DataChangeSignal();
    final first = <DataScope>[];
    final second = <DataScope>[];
    signal.changes.listen(first.add);
    signal.changes.listen(second.add);

    signal
      ..notify(DataScope.session)
      ..notify(DataScope.home);
    await Future<void>.delayed(Duration.zero);

    expect(first, [DataScope.session, DataScope.home]);
    expect(second, [DataScope.session, DataScope.home]);
    await signal.dispose();
  });

  test('does not replay changes to a late listener', () async {
    final signal = DataChangeSignal()..notify(DataScope.admin);
    final seen = <DataScope>[];
    signal.changes.listen(seen.add);
    await Future<void>.delayed(Duration.zero);

    expect(seen, isEmpty);
    await signal.dispose();
  });

  test('notify after dispose is ignored', () async {
    final signal = DataChangeSignal();
    await signal.dispose();

    expect(() => signal.notify(DataScope.calendar), returnsNormally);
  });
}
