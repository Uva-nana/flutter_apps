import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What language does Flutter use?',
      'options': ['Python', 'Dart', 'Java', 'Kotlin'],
      'answer': 'Dart',
    },
    {
      'question': 'What is a Widget in Flutter?',
      'options': [
        'A database',
        'A network request',
        'A building block of UI',
        'A programming language'
      ],
      'answer': 'A building block of UI',
    },
    {
      'question': 'Which widget is used to display text in Flutter?',
      'options': ['Container', 'Text', 'Column', 'Row'],
      'answer': 'Text',
    },
    {
      'question': 'What does StatefulWidget do?',
      'options': [
        'Shows static content only',
        'Manages UI that can change over time',
        'Connects to database',
        'Handles network calls'
      ],
      'answer': 'Manages UI that can change over time',
    },
    {
      'question': 'What command runs a Flutter app?',
      'options': ['flutter start', 'flutter run', 'flutter build', 'flutter launch'],
      'answer': 'flutter run',
    },
    {
      'question': 'Which widget arranges children vertically?',
      'options': ['Row', 'Stack', 'Column', 'Container'],
      'answer': 'Column',
    },
    {
      'question': 'Which widget arranges children horizontally?',
      'options': ['Column', 'Row', 'Stack', 'Scaffold'],
      'answer': 'Row',
    },
    {
      'question': 'What is hot reload in Flutter?',
      'options': [
        'Restart the device',
        'Rebuild entire app from scratch',
        'Apply code changes instantly without losing state',
        'Clear app cache'
      ],
      'answer': 'Apply code changes instantly without losing state',
    },
    {
      'question': 'What is Scaffold in Flutter?',
      'options': [
        'A database manager',
        'Basic visual structure for a screen',
        'A network package',
        'A testing tool'
      ],
      'answer': 'Basic visual structure for a screen',
    },
    {
      'question': 'What is pubspec.yaml used for?',
      'options': [
        'Writing Dart code',
        'Managing app dependencies and assets',
        'Running tests',
        'Connecting to APIs'
      ],
      'answer': 'Managing app dependencies and assets',
    },
  ];

  int currentIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool answered = false;
  bool quizFinished = false;

  void checkAnswer(String option) {
    if (answered) return;
    setState(() {
      selectedAnswer = option;
      answered = true;
      if (option == questions[currentIndex]['answer']) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedAnswer = null;
        answered = false;
      });
    } else {
      setState(() {
        quizFinished = true;
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentIndex = 0;
      score = 0;
      selectedAnswer = null;
      answered = false;
      quizFinished = false;
    });
  }

  Color getOptionColor(String option) {
    if (!answered) return Colors.white;
    if (option == questions[currentIndex]['answer']) return Colors.green;
    if (option == selectedAnswer) return Colors.red;
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    if (quizFinished) {
      return Scaffold(
        backgroundColor: Colors.deepPurple.shade50,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, size: 80, color: Colors.amber),
              const SizedBox(height: 20),
              const Text(
                'Quiz Completed!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Your Score: $score / ${questions.length}',
                style: const TextStyle(fontSize: 22, color: Colors.deepPurple),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: restartQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Flutter Learning Quiz',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // Progress
            Text(
              'Question ${currentIndex + 1} of ${questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: (currentIndex + 1) / questions.length,
              backgroundColor: Colors.grey.shade300,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 30),
            // Question
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                questions[currentIndex]['question'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Options
            ...List<String>.from(questions[currentIndex]['options']).map((option) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: () => checkAnswer(option),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: getOptionColor(option),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.deepPurple),
                    ),
                  ),
                  child: Text(
                    option,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            // Score
            Text(
              'Score: $score',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
            ),
            const SizedBox(height: 10),
            // Next button
            if (answered)
              ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  currentIndex < questions.length - 1 ? 'Next Question' : 'See Results',
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
