import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the sum section
  double addSum = 0;
  double subSum = 0;
  double mulSum = 0;
  double divSum = 0;

  // either use a TextEditingController for each input field to get the value
  TextEditingController firstNumberAddController = TextEditingController();
  TextEditingController secondNumberAddController = TextEditingController();

  TextEditingController firstNumberSubController = TextEditingController();
  TextEditingController secondNumberSubController = TextEditingController();

  TextEditingController firstNumberMulController = TextEditingController();
  TextEditingController secondNumberMulController = TextEditingController();

  TextEditingController firstNumberDivController = TextEditingController();
  TextEditingController secondNumberDivController = TextEditingController();
 
  // or store each value in the state
   // int firstAddNum = 0;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstNumberAddController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: secondNumberAddController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $addSum'),
              IconButton(
                icon: const Icon(Icons.add),
                tooltip: 'Add value',
                onPressed: () {
                  setState(() {
                    double firstNum = double.tryParse(firstNumberAddController.text) ?? 0;
                    double secondNum = double.tryParse(secondNumberAddController.text) ?? 0;
                    addSum = firstNum + secondNum;
                  });
                },
              ),
            ],
          ),
          // Subtract Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstNumberSubController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: secondNumberSubController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $subSum'),
              IconButton(
                icon: const Icon(Icons.remove),
                tooltip: 'Subtract value',
                onPressed: () {
                  setState(() {
                    double firstNum = double.tryParse(firstNumberSubController.text) ?? 0;
                    double secondNum = double.tryParse(secondNumberSubController.text) ?? 0;
                    subSum = firstNum - secondNum;
                  });
                },
              ),
            ],
          ),
          // Multiply Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstNumberMulController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" * "),
              Expanded(
                child: TextField(
                  controller: secondNumberMulController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $mulSum'),
              IconButton(
                icon: const Icon(Icons.close),
                tooltip: 'Multiply value',
                onPressed: () {
                  setState(() {
                    double firstNum = double.tryParse(firstNumberMulController.text) ?? 0;
                    double secondNum = double.tryParse(secondNumberMulController.text) ?? 0;
                    mulSum = firstNum * secondNum;
                  });
                },
              ),
            ],
          ),
          // Divide Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstNumberDivController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" / "),
              Expanded(
                child: TextField(
                  controller: secondNumberDivController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $divSum'),
              IconButton(
                icon: const Text('/'),
                tooltip: 'Divide value',
                onPressed: () {
                  setState(() {
                    double firstNum = double.tryParse(firstNumberDivController.text) ?? 0;
                    double secondNum = double.tryParse(secondNumberDivController.text) ?? 0;
                    if (secondNum != 0) {
                      divSum = firstNum / secondNum;
                    } else {
                      divSum = 0;
                    }
                  });
                },
              ),
            ],
          ),
          // Clear Button
          ElevatedButton(
            onPressed: () {
              setState(() {
                firstNumberAddController.clear();
                secondNumberAddController.clear();
                firstNumberSubController.clear();
                secondNumberSubController.clear();
                firstNumberMulController.clear();
                secondNumberMulController.clear();
                firstNumberDivController.clear();
                secondNumberDivController.clear();
                addSum = 0;
                subSum = 0;
                mulSum = 0;
                divSum = 0;
              });
            },
            child: const Text('Clear All'),
          ),
        ],
      ),
    );
  }
}
