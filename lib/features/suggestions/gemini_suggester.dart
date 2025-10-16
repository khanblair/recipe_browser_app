import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiSuggester {
  // Pass --dart-define=GEMINI_API_KEY=your_key when running
  static const _apiKey = String.fromEnvironment('GEMINI_API_KEY');

  Future<String?> suggestMeal(String prompt) async {
    if (_apiKey.isEmpty) return null;
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: _apiKey);
    final res = await model.generateContent([Content.text(prompt)]);
    return res.text;
  }
}
