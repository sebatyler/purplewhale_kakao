extension EnumExtension on Enum {
  String get string => toString().split('.').last;
}
