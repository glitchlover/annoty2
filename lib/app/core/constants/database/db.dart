/// note
/// - 0 means inside the previos folder.

mixin DBconst {
  static const String main = "Annoty";

  static const String resource = "$main\\Resource";
  static const String notebook = "$resource\\NoteBook";
  static const String annotations = "$resource\\annotation.json";
  static const String resourceConfig = "$resource\\annote.config.json";

  static const String user = "$main\\User";

  static const String appConfig = "$main\\config.json";
}
