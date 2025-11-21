import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//My App is statless widget because its properties do not change over time
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Header Text With styling
            Text(
              "Welcome to flutter",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 10),
            //Subtitle Text
            Text(
              "Lets Learn Layouts and Styling in Fultter",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(
                    "Box 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: Text(
                    "Box 2",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    "Box 3",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber[100],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber, width: 2),
              ),
              child: Text(
                "This is.",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Widgets"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "BUtton Types in the Flutter",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            //Elevated Button - Raised Button with shadow
            ElevatedButton(
              onPressed: () {
                print("Elevated Pressed!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16),
              ),
              child: const Text("Elevated Button"),
            ),
            const SizedBox(height: 10),

            //Text BUtton -Flat Button no background
            TextButton(
              onPressed: () => {print("just a text button")},
              child: const Text("TextButton"),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  //State Variables
  int _counter = 0;
  Color _containerColor = Colors.blue;
  //Methods that modeify state
  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        _containerColor = Colors.green;
      } else {
        _containerColor = Colors.orange;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter % 2 == 0) {
        _containerColor = Colors.green;
      } else {
        _containerColor = Colors.orange;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _containerColor = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StateFull Widget Counter")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Title
              Text(
                "Counter App",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 30),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: _containerColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              //Status Text
              Text(
                _counter == 0
                    ? "Start Counting"
                    : _counter % 2 == 0
                    ? "Even Number"
                    : "Odd Number",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: _containerColor,
                ),
              ),
              const SizedBox(height: 40),
              //BUtton ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Decrement Button
                  FloatingActionButton(
                    onPressed: _decrementCounter,
                    backgroundColor: Colors.red,
                    heroTag: "decrement",
                    child: Icon(Icons.remove),
                  ),
                  //Reset Button
                  FloatingActionButton(
                    onPressed: _resetCounter,
                    backgroundColor: Colors.green,
                    heroTag: "increment",
                    child: Icon(Icons.refresh),
                  ),
                  // Increment Button
                  FloatingActionButton(
                    onPressed: _incrementCounter,
                    backgroundColor: Colors.green,
                    heroTag: "increment",
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              //Info Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.deepPurple, width: 2),
                ),
                child: Column(
                  children: [
                    const Text(
                      "How StatefulWidget Works:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "• Press buttons to change counter\n"
                      "• setState() rebuilds the UI\n"
                      "• Color changes on even/odd\n"
                      "• Current value: $_counter",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TextEditingController _todoController = TextEditingController();
  final List<TodoItem> _todoList = [];
  void _addTodo() {
    if (_todoController.text.isNotEmpty) {
      setState(() {
        _todoList.add(
          TodoItem(title: _todoController.text, isCompleted: false),
        );
        _todoController.clear();
      });
    }
  }

  void _deleteTodo(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  void _toggleTodo(int index) {
    setState(() {
      _todoList[index].isCompleted = !_todoList[index].isCompleted;
    });
  }

  void _clearCompleted() {
    setState(() {
      _todoList.removeWhere((todo) => todo.isCompleted);
    });
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  Widget _buildStatCard(String label, int count, Color color) {
    return Column(
      children: [
        Text(
          "$count",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //calculate statistics
    int totalTasks = _todoList.length;
    int completedTasks = _todoList.where((todo) => todo.isCompleted).length;
    int pendingTasks = totalTasks - completedTasks;
    return Scaffold(
      appBar: AppBar(
        title: const Text("My todo list"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          //clear completed
          IconButton(
            onPressed: _clearCompleted,
            icon: const Icon(Icons.clear_all),
            tooltip: "Clear Completed",
          ),
        ],
      ),
      body: Column(
        children: [
          //Statistics Section
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.deepPurple[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard("Total", totalTasks, Colors.blue),
                _buildStatCard("Pending", pendingTasks, Colors.orange),
                _buildStatCard("Completed", completedTasks, Colors.green),
              ],
            ),
          ),
          //Input Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: "Enter a new task...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.task_alt),
                    ),
                    onSubmitted: (value) => _addTodo(),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: _addTodo,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _todoList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.inbox, size: 100, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text(
                          "NO Tasks yet!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Add a task to get started",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  )
                :ListView.builder(
                    itemCount: _todoList.length,
                    itemBuilder: (context, index) {
                      final todo = _todoList[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: ListTile(
                          leading: Checkbox(
                            value: todo.isCompleted,
                            onChanged: (value) => _toggleTodo(index),
                          ),
                          title: Text(
                            todo.title,
                            style: TextStyle(
                              decoration: todo.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: todo.isCompleted
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteTodo(index),
                          ),
                                ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class TodoItem {
  String title;
  bool isCompleted;
  TodoItem({required this.title, required this.isCompleted});
}
// Navigation Learning 
// ============================================
// 1. WELCOME SCREEN (Landing Page)
// ============================================
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end:Alignment.bottomCenter,
            colors:[Colors.deepPurple,Colors.purpleAccent]
          )
        ),
      ),

    );
  }
}
