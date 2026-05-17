class ApiClient {
  ApiClient();

  Future<Map<String, dynamic>> get(String path) async {
    await Future.delayed(const Duration(milliseconds: 600));
    final normalized = path.toLowerCase().replaceAll('/dictionary/', '');

    return _mockDictionary[normalized] ?? {
      'term': normalized,
      'definition': 'Sorry, "$normalized" could not be found in the local dictionary.',
      'examples': [],
    };
  }

  static final Map<String, Map<String, dynamic>> _mockDictionary = {
    'flutter': {
      'term': 'Flutter',
      'definition': 'An open-source UI software development toolkit created by Google.',
      'examples': ['Flutter builds natively compiled applications for mobile, web, and desktop.'],
    },
    'widget': {
      'term': 'Widget',
      'definition': 'A basic building block of a Flutter user interface.',
      'examples': ['Every visible item in Flutter is a widget.'],
    },
    'state': {
      'term': 'State',
      'definition': 'Information that can be read synchronously when a widget is built and might change during the lifetime of the widget.',
      'examples': ['State is used to update the UI when data changes.'],
    },
  };
}
