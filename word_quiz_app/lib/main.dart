import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  for (final key in prefs.getKeys()) {
    _highScores[key] = prefs.getInt(key) ?? 0;
  }
  runApp(const MyApp());
}

// ── Colors ───────────────────────────────────────────────────────
const _bg1 = Color(0xFF2C1A0E);
const _bg2 = Color(0xFF8B4513);
const _bg3 = Color(0xFFD2691E);
const _accent = Color(0xFFE8A020);
const _correct = Color(0xFF4CAF50);
const _wrong = Color(0xFFE53935);
const _cardBg = Color(0xCCFFFFFF);
const _cardBorder = Color(0xAAFFFFFF);

// ── High scores (in-memory, per category+difficulty) ─────────────
final Map<String, int> _highScores = {};

// ── Question bank ────────────────────────────────────────────────
final Map<String, List<Map<String, dynamic>>> _questionBank = {
  'Flutter': [
    // Easy
    {
      'question': 'What language does Flutter use?',
      'options': ['Python', 'Dart', 'Java', 'Kotlin'],
      'answer': 'Dart',
      'difficulty': 'Easy',
    },
    {
      'question': 'Which widget displays text in Flutter?',
      'options': ['Container', 'Text', 'Column', 'Row'],
      'answer': 'Text',
      'difficulty': 'Easy',
    },
    {
      'question': 'What command runs a Flutter app?',
      'options': ['flutter start', 'flutter run', 'flutter build', 'flutter launch'],
      'answer': 'flutter run',
      'difficulty': 'Easy',
    },
    {
      'question': 'Which widget arranges children vertically?',
      'options': ['Row', 'Stack', 'Column', 'Container'],
      'answer': 'Column',
      'difficulty': 'Easy',
    },
    {
      'question': 'Which widget arranges children horizontally?',
      'options': ['Column', 'Row', 'Stack', 'Scaffold'],
      'answer': 'Row',
      'difficulty': 'Easy',
    },
    // Medium
    {
      'question': 'What is a Widget in Flutter?',
      'options': ['A database', 'A network request', 'A building block of UI', 'A programming language'],
      'answer': 'A building block of UI',
      'difficulty': 'Medium',
    },
    {
      'question': 'What does StatefulWidget do?',
      'options': ['Shows static content only', 'Manages UI that can change over time', 'Connects to database', 'Handles network calls'],
      'answer': 'Manages UI that can change over time',
      'difficulty': 'Medium',
    },
    {
      'question': 'What is Scaffold in Flutter?',
      'options': ['A database manager', 'Basic visual structure for a screen', 'A network package', 'A testing tool'],
      'answer': 'Basic visual structure for a screen',
      'difficulty': 'Medium',
    },
    {
      'question': 'Which widget is used to scroll content in Flutter?',
      'options': ['Column', 'Row', 'ListView', 'Stack'],
      'answer': 'ListView',
      'difficulty': 'Medium',
    },
    {
      'question': 'What does setState() do in Flutter?',
      'options': ['Saves data to storage', 'Rebuilds the widget with new data', 'Connects to the internet', 'Closes the app'],
      'answer': 'Rebuilds the widget with new data',
      'difficulty': 'Medium',
    },
    // Hard
    {
      'question': 'What is hot reload in Flutter?',
      'options': ['Restart the device', 'Rebuild app from scratch', 'Apply code changes instantly without losing state', 'Clear app cache'],
      'answer': 'Apply code changes instantly without losing state',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is pubspec.yaml used for?',
      'options': ['Writing Dart code', 'Managing app dependencies and assets', 'Running tests', 'Connecting to APIs'],
      'answer': 'Managing app dependencies and assets',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is the purpose of the BuildContext in Flutter?',
      'options': ['Store app data', 'Handle network requests', 'Locate widget position in the widget tree', 'Manage animations'],
      'answer': 'Locate widget position in the widget tree',
      'difficulty': 'Hard',
    },
    {
      'question': 'What does the Navigator do in Flutter?',
      'options': ['Styles the app', 'Manages a stack of screens/routes', 'Fetches data from the internet', 'Handles device sensors'],
      'answer': 'Manages a stack of screens/routes',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is a Future in Dart?',
      'options': ['A past value', 'A widget type', 'A value that will be available later', 'A layout widget'],
      'answer': 'A value that will be available later',
      'difficulty': 'Hard',
    },
  ],
  'Python': [
    // Easy
    {
      'question': 'Which keyword defines a function in Python?',
      'options': ['func', 'def', 'function', 'define'],
      'answer': 'def',
      'difficulty': 'Easy',
    },
    {
      'question': 'How do you print text in Python?',
      'options': ['echo()', 'console.log()', 'print()', 'say()'],
      'answer': 'print()',
      'difficulty': 'Easy',
    },
    {
      'question': 'Which of these creates a list in Python?',
      'options': ['{}', '()', '[]', '<>'],
      'answer': '[]',
      'difficulty': 'Easy',
    },
    {
      'question': 'What data type is True/False in Python?',
      'options': ['int', 'string', 'bool', 'float'],
      'answer': 'bool',
      'difficulty': 'Easy',
    },
    {
      'question': 'What does len() do in Python?',
      'options': ['Converts to lowercase', 'Returns the length', 'Deletes a variable', 'Loops through a list'],
      'answer': 'Returns the length',
      'difficulty': 'Easy',
    },
    // Medium
    {
      'question': 'Which keyword is used for a loop in Python?',
      'options': ['loop', 'repeat', 'for', 'iterate'],
      'answer': 'for',
      'difficulty': 'Medium',
    },
    {
      'question': 'What does append() do to a list?',
      'options': ['Removes last item', 'Adds item at the end', 'Sorts the list', 'Clears the list'],
      'answer': 'Adds item at the end',
      'difficulty': 'Medium',
    },
    {
      'question': 'What is a dictionary in Python?',
      'options': ['A list of numbers', 'Key-value pairs', 'A type of loop', 'A string method'],
      'answer': 'Key-value pairs',
      'difficulty': 'Medium',
    },
    {
      'question': 'What does the "range(5)" produce?',
      'options': ['Numbers 1 to 5', 'Numbers 0 to 4', 'Numbers 0 to 5', 'Numbers 1 to 4'],
      'answer': 'Numbers 0 to 4',
      'difficulty': 'Medium',
    },
    {
      'question': 'How do you add a comment in Python?',
      'options': ['// comment', '/* comment */', '# comment', '-- comment'],
      'answer': '# comment',
      'difficulty': 'Medium',
    },
    // Hard
    {
      'question': 'What does "if __name__ == \'__main__\':" do?',
      'options': ['Imports a module', 'Runs code only when file is executed directly', 'Defines a class', 'Creates a loop'],
      'answer': 'Runs code only when file is executed directly',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is a list comprehension?',
      'options': ['A way to delete lists', 'A shorthand to create lists using a loop', 'A sorting method', 'A dictionary method'],
      'answer': 'A shorthand to create lists using a loop',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is a lambda function in Python?',
      'options': ['A class method', 'A built-in function', 'A small anonymous function', 'A loop shortcut'],
      'answer': 'A small anonymous function',
      'difficulty': 'Hard',
    },
    {
      'question': 'What does the "self" keyword mean in a Python class?',
      'options': ['Refers to the module', 'Refers to the current instance of the class', 'Creates a new object', 'Imports a library'],
      'answer': 'Refers to the current instance of the class',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is the difference between a list and a tuple?',
      'options': ['No difference', 'Tuples are faster only', 'Lists are mutable, tuples are immutable', 'Tuples can only hold numbers'],
      'answer': 'Lists are mutable, tuples are immutable',
      'difficulty': 'Hard',
    },
  ],
  'General': [
    // Easy
    {
      'question': 'What is the largest planet in our solar system?',
      'options': ['Earth', 'Saturn', 'Jupiter', 'Neptune'],
      'answer': 'Jupiter',
      'difficulty': 'Easy',
    },
    {
      'question': 'How many continents are there on Earth?',
      'options': ['5', '6', '7', '8'],
      'answer': '7',
      'difficulty': 'Easy',
    },
    {
      'question': 'What is the chemical symbol for water?',
      'options': ['WA', 'H2O', 'HO2', 'W2O'],
      'answer': 'H2O',
      'difficulty': 'Easy',
    },
    {
      'question': 'Which planet is closest to the Sun?',
      'options': ['Venus', 'Mars', 'Earth', 'Mercury'],
      'answer': 'Mercury',
      'difficulty': 'Easy',
    },
    {
      'question': 'What gas do plants absorb from the air?',
      'options': ['Oxygen', 'Nitrogen', 'Carbon dioxide', 'Hydrogen'],
      'answer': 'Carbon dioxide',
      'difficulty': 'Easy',
    },
    // Medium
    {
      'question': 'Who developed the theory of relativity?',
      'options': ['Isaac Newton', 'Albert Einstein', 'Nikola Tesla', 'Stephen Hawking'],
      'answer': 'Albert Einstein',
      'difficulty': 'Medium',
    },
    {
      'question': 'What is the powerhouse of the cell?',
      'options': ['Nucleus', 'Ribosome', 'Mitochondria', 'Chloroplast'],
      'answer': 'Mitochondria',
      'difficulty': 'Medium',
    },
    {
      'question': 'Which country has the largest population in the world?',
      'options': ['USA', 'India', 'China', 'Russia'],
      'answer': 'India',
      'difficulty': 'Medium',
    },
    {
      'question': 'What is the speed of light approximately?',
      'options': ['300,000 km/s', '150,000 km/s', '450,000 km/s', '100,000 km/s'],
      'answer': '300,000 km/s',
      'difficulty': 'Medium',
    },
    {
      'question': 'What is the longest river in the world?',
      'options': ['Amazon', 'Yangtze', 'Mississippi', 'Nile'],
      'answer': 'Nile',
      'difficulty': 'Medium',
    },
    // Hard
    {
      'question': 'What is the atomic number of carbon?',
      'options': ['4', '6', '8', '12'],
      'answer': '6',
      'difficulty': 'Hard',
    },
    {
      'question': 'Who was the first human to travel to space?',
      'options': ['Neil Armstrong', 'Buzz Aldrin', 'Yuri Gagarin', 'Alan Shepard'],
      'answer': 'Yuri Gagarin',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is the name of the force that keeps planets in orbit around the Sun?',
      'options': ['Magnetic force', 'Nuclear force', 'Gravitational force', 'Centrifugal force'],
      'answer': 'Gravitational force',
      'difficulty': 'Hard',
    },
    {
      'question': 'What is the hardest natural substance on Earth?',
      'options': ['Gold', 'Iron', 'Diamond', 'Quartz'],
      'answer': 'Diamond',
      'difficulty': 'Hard',
    },
    {
      'question': 'How many bones are in the adult human body?',
      'options': ['196', '206', '216', '226'],
      'answer': '206',
      'difficulty': 'Hard',
    },
  ],
};

List<Map<String, dynamic>> _getQuestions(String category, String difficulty) {
  final all = _questionBank[category]!;
  List<Map<String, dynamic>> filtered;
  filtered = all.where((q) => q['difficulty'] == difficulty).toList();
  filtered.shuffle();
  return filtered;
}

// ── Shared UI helpers ────────────────────────────────────────────
Widget gradientBg({required Widget child}) => Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [_bg1, _bg2, _bg3],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );

Widget glassCard({required Widget child, EdgeInsets? padding, Color? borderColor}) => Container(
      padding: padding ?? const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor ?? _cardBorder, width: 1.5),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 16, offset: const Offset(0, 6))],
      ),
      child: child,
    );

// ════════════════════════════════════════════════════════════════
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Quiz App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: _accent, brightness: Brightness.light),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      );
}

// ════════════════════════════════════════════════════════════════
// HOME SCREEN — category selection
// ════════════════════════════════════════════════════════════════
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Flutter', 'icon': Icons.phone_android_rounded, 'color': const Color(0xFF0553B1)},
      {'name': 'Python', 'icon': Icons.code_rounded, 'color': const Color(0xFF3572A5)},
      {'name': 'General', 'icon': Icons.lightbulb_rounded, 'color': const Color(0xFFE8A020)},
    ];

    return Scaffold(
      body: gradientBg(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Quiz App',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: Colors.black87, letterSpacing: 1),
                ),
                const SizedBox(height: 6),
                Text(
                  'Choose a category',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.55)),
                ),
                const SizedBox(height: 40),
                ...categories.map((cat) {
                  // Show best high score across difficulties
                  final scores = ['Easy', 'Medium', 'Hard']
                      .map((d) => _highScores['${cat['name']}_$d'] ?? 0)
                      .where((s) => s > 0)
                      .toList();
                  final bestScore = scores.isNotEmpty ? scores.reduce((a, b) => a > b ? a : b) : null;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DifficultyScreen(category: cat['name'] as String)),
                      ).then((_) => setState(() {})),
                      child: glassCard(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: (cat['color'] as Color).withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(cat['icon'] as IconData, color: cat['color'] as Color, size: 28),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cat['name'] as String,
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black87),
                                  ),
                                  if (bestScore != null)
                                    Row(
                                      children: [
                                        const Icon(Icons.emoji_events_rounded, color: Color(0xFFFFD700), size: 14),
                                        const SizedBox(width: 4),
                                        Text('Best: $bestScore pts', style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5))),
                                      ],
                                    )
                                  else
                                    Text('Not played yet', style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.4))),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black38, size: 18),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
// DIFFICULTY SCREEN
// ════════════════════════════════════════════════════════════════
class DifficultyScreen extends StatelessWidget {
  final String category;
  const DifficultyScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final difficulties = [
      {'name': 'Easy', 'desc': '5 questions · Basic level', 'color': _correct, 'icon': Icons.sentiment_satisfied_rounded},
      {'name': 'Medium', 'desc': '8 questions · Intermediate', 'color': _accent, 'icon': Icons.sentiment_neutral_rounded},
      {'name': 'Hard', 'desc': '10 questions · Advanced', 'color': _wrong, 'icon': Icons.sentiment_very_dissatisfied_rounded},
    ];

    return Scaffold(
      body: gradientBg(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: glassCard(
                    padding: const EdgeInsets.all(10),
                    child: const Icon(Icons.arrow_back_rounded, color: Colors.black87, size: 22),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  category,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w900, color: Colors.black87),
                ),
                const SizedBox(height: 6),
                Text(
                  'Select difficulty',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.55)),
                ),
                const SizedBox(height: 40),
                ...difficulties.map((d) {
                  final hs = _highScores['${category}_${d['name']}'];
                  final total = d['name'] == 'Easy' ? 5 : d['name'] == 'Medium' ? 8 : 10;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizPage(category: category, difficulty: d['name'] as String),
                        ),
                      ),
                      child: glassCard(
                        borderColor: (d['color'] as Color).withOpacity(0.4),
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Icon(d['icon'] as IconData, color: d['color'] as Color, size: 32),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    d['name'] as String,
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: d['color'] as Color),
                                  ),
                                  Text(d['desc'] as String, style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5))),
                                ],
                              ),
                            ),
                            if (hs != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(Icons.emoji_events_rounded, color: Color(0xFFFFD700), size: 16),
                                  Text('$hs/$total', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black54)),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
// QUIZ PAGE
// ════════════════════════════════════════════════════════════════
class QuizPage extends StatefulWidget {
  final String category;
  final String difficulty;
  const QuizPage({super.key, required this.category, required this.difficulty});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with SingleTickerProviderStateMixin {
  late List<Map<String, dynamic>> questions;
  int currentIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool answered = false;
  final List<Map<String, dynamic>> wrongAnswers = [];

  late AnimationController _fadeCtrl;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    questions = _getQuestions(widget.category, widget.difficulty)
        .map((q) {
          final opts = List<String>.from(q['options'])..shuffle();
          return {...q, 'options': opts};
        })
        .toList();
    _fadeCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    _fadeAnim = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeIn);
    _fadeCtrl.forward();
    _startTimer();
  }

  @override
  void dispose() {
    _fadeCtrl.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _animateNext(VoidCallback action) {
    _fadeCtrl.reverse().then((_) {
      setState(action);
      _fadeCtrl.forward();
    });
  }

  static const int _totalTime = 15;
  int _timeLeft = _totalTime;
  Timer? _timer;

  void _startTimer() {
    _timer?.cancel();
    _timeLeft = _totalTime;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft == 0) {
        timer.cancel();
        if (!answered) {
          setState(() {
            answered = true;
            selectedAnswer = null;
          });
          Future.delayed(const Duration(seconds: 1), nextQuestion);
        }
      } else {
        setState(() {
          _timeLeft--;
        });
      }
    });
  }

  void checkAnswer(String option) {
    if (answered) return;
    _timer?.cancel();
    final correct = questions[currentIndex]['answer'];
    setState(() {
      selectedAnswer = option;
      answered = true;
      if (option == correct) {
        score++;
      } else {
        wrongAnswers.add({
          'question': questions[currentIndex]['question'],
          'yourAnswer': option,
          'correctAnswer': correct,
        });
      }
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      _animateNext(() {
        currentIndex++;
        selectedAnswer = null;
        answered = false;
      });
      _startTimer();
    } else {
      final key = '${widget.category}_${widget.difficulty}';
      if (score > (_highScores[key] ?? 0)) {
        _highScores[key] = score;
        SharedPreferences.getInstance().then((p) => p.setInt(key, score));
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(
            score: score,
            total: questions.length,
            category: widget.category,
            difficulty: widget.difficulty,
            wrongAnswers: wrongAnswers,
          ),
        ),
      );
    }
  }

  Color _optionColor(String option) {
    if (!answered) return _cardBg;
    if (option == questions[currentIndex]['answer']) return _correct.withOpacity(0.2);
    if (option == selectedAnswer) return _wrong.withOpacity(0.2);
    return _cardBg;
  }

  Color _optionBorder(String option) {
    if (!answered) return _cardBorder;
    if (option == questions[currentIndex]['answer']) return _correct;
    if (option == selectedAnswer) return _wrong;
    return _cardBorder;
  }

  Color _optionTextColor(String option) {
    if (!answered) return Colors.black87;
    if (option == questions[currentIndex]['answer']) return _correct;
    if (option == selectedAnswer) return _wrong;
    return Colors.black45;
  }

  IconData? _optionIcon(String option) {
    if (!answered) return null;
    if (option == questions[currentIndex]['answer']) return Icons.check_circle_rounded;
    if (option == selectedAnswer) return Icons.cancel_rounded;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentIndex];
    return Scaffold(
      body: gradientBg(
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnim,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: glassCard(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.close_rounded, color: Colors.black54, size: 20),
                        ),
                      ),
                      Text(
                        '${widget.category} · ${widget.difficulty}',
                        style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.6), fontWeight: FontWeight.w600),
                      ),
                      glassCard(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star_rounded, color: Color(0xFFFFD700), size: 16),
                            const SizedBox(width: 4),
                            Text('$score', style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Question ${currentIndex + 1} of ${questions.length}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.5)),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: (currentIndex + 1) / questions.length,
                      minHeight: 8,
                      backgroundColor: Colors.black12,
                      valueColor: const AlwaysStoppedAnimation<Color>(_accent),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Question card
                  glassCard(
                    borderColor: _accent.withOpacity(0.5),
                    child: Text(
                      q['question'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w700, height: 1.4),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Options
                  ...List<String>.from(q['options']).map((option) {
                    final icon = _optionIcon(option);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () => checkAnswer(option),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          decoration: BoxDecoration(
                            color: _optionColor(option),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: _optionBorder(option), width: 1.5),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8, offset: const Offset(0, 3))],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  option,
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: _optionTextColor(option)),
                                ),
                              ),
                              if (icon != null) Icon(icon, color: _optionTextColor(option), size: 22),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  const Spacer(),
                  if (answered)
                    ElevatedButton(
                      onPressed: nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _accent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 6,
                        shadowColor: _accent.withOpacity(0.5),
                      ),
                      child: Text(
                        currentIndex < questions.length - 1 ? 'Next  →' : 'See Results',
                        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                      ),
                    ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ════════════════════════════════════════════════════════════════
// RESULT SCREEN
// ════════════════════════════════════════════════════════════════
class ResultScreen extends StatefulWidget {
  final int score;
  final int total;
  final String category;
  final String difficulty;
  final List<Map<String, dynamic>> wrongAnswers;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.category,
    required this.difficulty,
    required this.wrongAnswers,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _showReview = false;

  String get _emoji {
    final pct = widget.score / widget.total * 100;
    if (pct == 100) return '🏆';
    if (pct >= 80) return '🎉';
    if (pct >= 50) return '👍';
    return '💪';
  }

  String get _message {
    final pct = widget.score / widget.total * 100;
    if (pct == 100) return 'Perfect Score!';
    if (pct >= 80) return 'Excellent!';
    if (pct >= 50) return 'Good Job!';
    return 'Keep Going!';
  }

  int get _highScore => _highScores['${widget.category}_${widget.difficulty}'] ?? widget.score;

  void _shareScore() async {
    final text =
        'I scored ${widget.score}/${widget.total} on the ${widget.category} ${widget.difficulty} quiz! 🎯 Try it yourself!';
    await Clipboard.setData(ClipboardData(text: text));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Score copied! Paste it anywhere to share.'),
        backgroundColor: _accent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final pct = (widget.score / widget.total * 100).round();

    return Scaffold(
      body: gradientBg(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(_emoji, textAlign: TextAlign.center, style: const TextStyle(fontSize: 64)),
                const SizedBox(height: 12),
                Text(
                  _message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black87),
                ),
                const SizedBox(height: 4),
                Text(
                  '${widget.category} · ${widget.difficulty}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
                ),
                const SizedBox(height: 24),

                // Score card
                glassCard(
                  child: Column(
                    children: [
                      Text(
                        '${widget.score} / ${widget.total}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Colors.black87),
                      ),
                      Text('$pct% correct', style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.6))),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: LinearProgressIndicator(
                          value: widget.score / widget.total,
                          minHeight: 10,
                          backgroundColor: Colors.black12,
                          valueColor: const AlwaysStoppedAnimation<Color>(_accent),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.emoji_events_rounded, color: Color(0xFFFFD700), size: 16),
                          const SizedBox(width: 6),
                          Text(
                            'Best: $_highScore / ${widget.total}',
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Share button
                ElevatedButton.icon(
                  onPressed: _shareScore,
                  icon: const Icon(Icons.share_rounded),
                  label: const Text('Share Score', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 6,
                    shadowColor: _accent.withOpacity(0.4),
                  ),
                ),
                const SizedBox(height: 12),

                // Review wrong answers
                if (widget.wrongAnswers.isNotEmpty) ...[
                  OutlinedButton.icon(
                    onPressed: () => setState(() => _showReview = !_showReview),
                    icon: Icon(_showReview ? Icons.expand_less_rounded : Icons.expand_more_rounded),
                    label: Text(
                      _showReview ? 'Hide Review' : 'Review Wrong Answers (${widget.wrongAnswers.length})',
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _wrong,
                      side: const BorderSide(color: _wrong),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                  if (_showReview) ...[
                    const SizedBox(height: 12),
                    ...widget.wrongAnswers.map((w) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: glassCard(
                            borderColor: _wrong.withOpacity(0.3),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(w['question'],
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87)),
                                const SizedBox(height: 8),
                                Row(children: [
                                  const Icon(Icons.cancel_rounded, color: _wrong, size: 16),
                                  const SizedBox(width: 6),
                                  Expanded(
                                      child: Text('Your answer: ${w['yourAnswer']}',
                                          style: const TextStyle(fontSize: 13, color: _wrong))),
                                ]),
                                const SizedBox(height: 4),
                                Row(children: [
                                  const Icon(Icons.check_circle_rounded, color: _correct, size: 16),
                                  const SizedBox(width: 6),
                                  Expanded(
                                      child: Text('Correct: ${w['correctAnswer']}',
                                          style: const TextStyle(fontSize: 13, color: _correct))),
                                ]),
                              ],
                            ),
                          ),
                        )),
                  ],
                ],

                if (widget.wrongAnswers.isEmpty)
                  glassCard(
                    borderColor: _correct.withOpacity(0.4),
                    padding: const EdgeInsets.all(16),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle_rounded, color: _correct),
                        SizedBox(width: 8),
                        Text('All answers correct!',
                            style: TextStyle(color: _correct, fontWeight: FontWeight.w700, fontSize: 15)),
                      ],
                    ),
                  ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).popUntil((r) => r.isFirst),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black87,
                          side: const BorderSide(color: _cardBorder),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        child: const Text('Home', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => QuizPage(category: widget.category, difficulty: widget.difficulty),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _accent,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          elevation: 6,
                        ),
                        child: const Text('Play Again', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
