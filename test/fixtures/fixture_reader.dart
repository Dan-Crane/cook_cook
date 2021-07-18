import 'dart:io';

String fixture(String name) =>
    File('test/fixtures/models/$name').readAsStringSync();
