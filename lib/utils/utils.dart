List<String> parse(String input, String pattern) {
  var a = input.split(pattern);
  a.removeLast();
  return a;
}