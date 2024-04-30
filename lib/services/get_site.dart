import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

Future<Map<String, dynamic>> scrapeWebsiteData(String url) async {
  final response = await http.get(Uri.parse(url));
  final document = parser.parse(utf8.decode(response.bodyBytes));
  String ogImage =
      document.querySelector('meta[name="og:image"]')?.attributes['content'] ??
          '';
  if (ogImage == "") {
    ogImage = document
            .querySelector('meta[property="og:image"]')
            ?.attributes['content'] ??
        '';
  }
  String title = document.querySelector('title')?.text ?? '';
  String description = document
          .querySelector('meta[name="description"]')
          ?.attributes['content'] ??
      '';
  return {
    'ogImage': ogImage,
    'title': title,
    'description': description,
  };
}
