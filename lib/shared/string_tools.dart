bool isNullOrEmpty(String? value) {
  if (value == null) return true;
  return value.isEmpty;
}

bool isNullOrWhitespace(String? value) {
  return isNullOrEmpty(value?.trim());
}