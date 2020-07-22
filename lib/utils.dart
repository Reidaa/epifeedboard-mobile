String extractDomain(String url) {
  List<String> urlParts = url
      .replaceAll('http://', "")
      .replaceAll("https://", "")
      .split(RegExp(r"/[/?#]/"));
  String domain = urlParts[0].split("/")[0];
  return domain;
}
