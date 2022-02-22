
extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toCamelCase() => replaceAll(RegExp(' +'), '_').split('_').map((str) => str.toCapitalized()).join('');
  String toTitleCase() => replaceAll(RegExp(' +'), '_').split('_').map((str) => str.toCapitalized()).join(' ');

}