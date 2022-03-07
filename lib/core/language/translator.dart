import 'package:flutter_with_supabase/core/language/dn_DK.dart';
import 'package:flutter_with_supabase/core/language/en_US.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';


class Translator extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en_US": LocaleEnUS.en_US,
    "dn_DK": LocaleDnDk.dn_Dk,
  };
}