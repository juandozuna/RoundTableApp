import 'dart:js_interop';

/// Web: downloads the CSV through a temporary object URL and a link click.
Future<void> saveCsvFile(String filename, String content) async {
  // The BOM makes Excel read the accents as UTF-8.
  final blob = _Blob(
    ['﻿$content'.toJS].toJS,
    _BlobOptions(type: 'text/csv;charset=utf-8'),
  );
  final url = _createObjectUrl(blob);
  final link = _document.createElement('a');
  link.href = url;
  link.download = filename;
  link.style.display = 'none';
  _document.body.appendChild(link);
  link.click();
  link.remove();
  _revokeObjectUrl(url);
}

@JS('document')
external _Document get _document;

@JS('URL.createObjectURL')
external String _createObjectUrl(_Blob blob);

@JS('URL.revokeObjectURL')
external void _revokeObjectUrl(String url);

extension type _Document._(JSObject _) implements JSObject {
  external _Element createElement(String tag);
  external _Element get body;
}

extension type _Style._(JSObject _) implements JSObject {
  external set display(String value);
}

extension type _Element._(JSObject _) implements JSObject {
  external set href(String value);
  external set download(String value);
  external _Style get style;
  external void appendChild(_Element child);
  external void click();
  external void remove();
}

@JS('Blob')
extension type _Blob._(JSObject _) implements JSObject {
  external factory _Blob(JSArray<JSString> parts, _BlobOptions options);
}

extension type _BlobOptions._(JSObject _) implements JSObject {
  external factory _BlobOptions({String type});
}
