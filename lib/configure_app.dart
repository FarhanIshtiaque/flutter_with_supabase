import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future configureApp() async {
  // init Supabase singleton
  await Supabase.initialize(
    url: dotenv.get('BASE_URL'),
    anonKey: dotenv.get('ANON_KEY'),
    authCallbackUrlHostname: 'login-callback',
    debug: true,
    localStorage: SecureLocalStorage(),
  );
}

// user flutter_secure_storage to persist user session
class SecureLocalStorage extends LocalStorage {
  SecureLocalStorage()
      : super(
    initialize: () async {},
    hasAccessToken: () {
      const storage = FlutterSecureStorage();
      return storage.containsKey(key: supabasePersistSessionKey);
    },
    accessToken: () {
      const storage = FlutterSecureStorage();
      return storage.read(key: supabasePersistSessionKey);
    },
    removePersistedSession: () {
      const storage = FlutterSecureStorage();
      return storage.delete(key: supabasePersistSessionKey);
    },
    persistSession: (String value) {
      const storage = FlutterSecureStorage();
      return storage.write(key: supabasePersistSessionKey, value: value);
    },
  );
}