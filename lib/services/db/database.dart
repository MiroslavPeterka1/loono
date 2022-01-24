import 'package:built_collection/built_collection.dart';
import 'package:encrypted_moor/encrypted_moor.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:loono/helpers/examination_types.dart';
import 'package:loono/helpers/type_converters.dart';
import 'package:loono/models/calendar_event.dart';
import 'package:loono/models/healthcare_provider.dart';
import 'package:loono/models/user.dart';
import 'package:moor/moor.dart';

part 'database.g.dart';

@UseMoor(
  tables: [
    Users,
    HealthcareProviders,
    CalendarEvents,
  ],
  daos: [
    UsersDao,
    HealthcareProvidersDao,
    CalendarEventsDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(String path, String password)
      : super(EncryptedExecutor.inDatabaseFolder(path: path, password: password));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        flutter.debugPrint('**Moor** migration');
      },
    );
  }

  Future<void> deleteAllData() {
    return transaction(() async {
      for (final table in allTables) {
        flutter.debugPrint('**Moor** delele all tables');
        await delete<Table, dynamic>(table).go();
      }
    });
  }
}
