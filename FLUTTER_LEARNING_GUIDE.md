# Flutter Learning Guide - Complete Tutorial Summary 🚀

## Table of Contents
1. [Project Setup](#project-setup)
2. [StatelessWidget vs StatefulWidget](#statelesswidget-vs-statefulwidget)
3. [Layout Basics (Row, Column, Container)](#layout-basics)
4. [Styling & Colors](#styling--colors)
5. [Interactive Widgets (Buttons)](#interactive-widgets)
6. [StatefulWidget Deep Dive](#statefulwidget-deep-dive)
7. [TextField & Forms](#textfield--forms)
8. [ListView & Lists](#listview--lists)
9. [Navigation & Routing](#navigation--routing)
10. [Complete Code Examples](#complete-code-examples)

---

## Project Setup

### Basic Flutter App Structure
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
```

### Key Concepts:
- **`main()`** - Entry point of every Flutter app
- **`runApp()`** - Takes a widget and makes it the root
- **`MaterialApp`** - Provides Material Design structure
- **`home`** - First screen users see

---

## StatelessWidget vs StatefulWidget

### StatelessWidget (Immutable)
```dart
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(child: Text("Hello!")),
    );
  }
}
```

**Use when:** Content doesn't change (static pages, configuration)

### StatefulWidget (Mutable)
```dart
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0; // State variable
  
  void _incrementCounter() {
    setState(() {
      _counter++; // Triggers rebuild
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('$_counter')),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

**Use when:** Data changes over time (counters, forms, animations)

### Key Rule:
**Always use `setState(() {})` to modify state variables!**

---

## Layout Basics

### Scaffold - Basic Screen Structure
```dart
Scaffold(
  appBar: AppBar(title: Text("Title")),
  body: Center(child: Text("Content")),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
  drawer: Drawer(), // Side menu
  bottomNavigationBar: BottomNavigationBar(), // Bottom tabs
)
```

### Column - Vertical Stack
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center, // Vertical alignment
  crossAxisAlignment: CrossAxisAlignment.start, // Horizontal alignment
  children: [
    Text("Item 1"),
    Text("Item 2"),
    Text("Item 3"),
  ],
)
```

### Row - Horizontal Line
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Horizontal spacing
  crossAxisAlignment: CrossAxisAlignment.center, // Vertical alignment
  children: [
    Container(width: 50, height: 50, color: Colors.red),
    Container(width: 50, height: 50, color: Colors.green),
    Container(width: 50, height: 50, color: Colors.blue),
  ],
)
```

### Container - The Swiss Army Knife
```dart
Container(
  width: 200,
  height: 200,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.black, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        blurRadius: 10,
        spreadRadius: 2,
      ),
    ],
  ),
  child: Text("Content"),
)
```

### Padding & Spacing
```dart
Padding(
  padding: EdgeInsets.all(16), // All sides
  child: Text("Padded content"),
)

SizedBox(height: 20) // Vertical space
SizedBox(width: 20)  // Horizontal space
```

---

## Styling & Colors

### Text Styling
```dart
Text(
  "Welcome to Flutter!",
  style: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold, // normal, w100-w900, bold
    color: Colors.deepPurple,
    fontStyle: FontStyle.italic, // normal, italic
    decoration: TextDecoration.underline, // none, underline, lineThrough
  ),
)
```

### Colors
```dart
Colors.red           // Predefined colors
Colors.blue[100]     // Lighter shade (100-900)
Colors.blue[900]     // Darker shade
Color(0xFFFF5722)    // Hex color
Color.fromRGBO(255, 87, 34, 1.0) // RGB with opacity
```

### Gradients
```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.blue, Colors.purple],
    ),
  ),
)
```

---

## Interactive Widgets

### Button Types

#### 1. ElevatedButton (Most Common)
```dart
ElevatedButton(
  onPressed: () {
    print("Button pressed!");
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: Text("Click Me"),
)
```

#### 2. TextButton (Flat)
```dart
TextButton(
  onPressed: () {},
  child: Text("Text Button"),
)
```

#### 3. OutlinedButton (Border Only)
```dart
OutlinedButton(
  onPressed: () {},
  child: Text("Outlined Button"),
)
```

#### 4. IconButton
```dart
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {},
  color: Colors.red,
  iconSize: 40,
)
```

#### 5. FloatingActionButton
```dart
FloatingActionButton(
  onPressed: () {},
  backgroundColor: Colors.green,
  child: Icon(Icons.add),
)
```

---

## StatefulWidget Deep Dive

### State Lifecycle
```
1. Widget created → createState() called
2. State object created → initial values set
3. build() called → UI rendered
4. User interacts → method called
5. setState() executed → state changes
6. Flutter calls build() again → UI updates
7. Repeat steps 4-6...
```

### Counter App Example
```dart
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  Color _containerColor = Colors.blue;
  
  void _incrementCounter() {
    setState(() {
      _counter++;
      _containerColor = _counter % 2 == 0 ? Colors.green : Colors.orange;
    });
  }
  
  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _containerColor = _counter % 2 == 0 ? Colors.green : Colors.orange;
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
      appBar: AppBar(title: Text("Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 200,
              height: 200,
              color: _containerColor,
              child: Center(
                child: Text(
                  '$_counter',
                  style: TextStyle(fontSize: 60, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: _decrementCounter,
                  heroTag: "decrement",
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  onPressed: _resetCounter,
                  heroTag: "reset",
                  child: Icon(Icons.refresh),
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  heroTag: "increment",
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## TextField & Forms

### TextEditingController
```dart
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  
  @override
  void dispose() {
    _emailController.dispose(); // Clean up!
    _passwordController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible 
                      ? Icons.visibility 
                      : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## ListView & Lists

### Model Class
```dart
class TodoItem {
  String title;
  bool isCompleted;
  
  TodoItem({required this.title, required this.isCompleted});
}
```

### ListView.builder (Efficient for Long Lists)
```dart
class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final List<TodoItem> _todoList = [];
  final TextEditingController _todoController = TextEditingController();
  
  void _addTodo() {
    if (_todoController.text.isNotEmpty) {
      setState(() {
        _todoList.add(TodoItem(
          title: _todoController.text,
          isCompleted: false,
        ));
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: "Enter task...",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) => _addTodo(),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: _addTodo,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: _todoList.isEmpty
              ? Center(child: Text("No tasks yet!"))
              : ListView.builder(
                  itemCount: _todoList.length,
                  itemBuilder: (context, index) {
                    final todo = _todoList[index];
                    return ListTile(
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
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteTodo(index),
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
```

### List Operations
```dart
List<TodoItem> _todoList = [];

// Add item
_todoList.add(TodoItem(...));

// Remove by index
_todoList.removeAt(index);

// Remove matching items
_todoList.removeWhere((todo) => todo.isCompleted);

// Count items
int total = _todoList.length;

// Filter items
int completed = _todoList.where((todo) => todo.isCompleted).length;
```

---

## Navigation & Routing

### Method 1: Named Routes (Recommended)
```dart
// In MaterialApp
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => WelcomeScreen(),
    '/login': (context) => LoginScreen(),
    '/home': (context) => HomeScreen(),
  },
)

// Navigate to named route
Navigator.pushNamed(context, '/login');
```

### Method 2: Direct Navigation
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ProfileScreen()),
);
```

### Going Back
```dart
Navigator.pop(context);
```

### Replace Current Screen
```dart
Navigator.pushReplacementNamed(context, '/home');
// Can't go back to previous screen
```

### Clear All & Navigate
```dart
Navigator.pushNamedAndRemoveUntil(
  context,
  '/',
  (route) => false, // Removes all routes
);
```

### Passing Data Between Screens

#### Method 1: Named Routes with Arguments
```dart
// Send data
Navigator.pushNamed(context, '/profile', arguments: "user@email.com");

// Receive data
final email = ModalRoute.of(context)?.settings.arguments as String?;
```

#### Method 2: Constructor Parameters
```dart
// Send data
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProfileScreen(email: "user@email.com"),
  ),
);

// Receive data
class ProfileScreen extends StatelessWidget {
  final String email;
  const ProfileScreen({required this.email});
  
  @override
  Widget build(BuildContext context) {
    return Text("Email: $email");
  }
}
```

---

## Complete Code Examples

### Full Navigation App with 4 Screens

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}

// Welcome Screen
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.rocket_launch, size: 120, color: Colors.white),
              SizedBox(height: 30),
              Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: Text("Get Started"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Login Screen
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  void _handleLogin() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields!"),
          backgroundColor: Colors.red),
      );
      return;
    }
    
    Navigator.pushReplacementNamed(
      context, 
      '/home',
      arguments: _emailController.text,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _handleLogin,
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)?.settings.arguments as String?;
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context, '/', (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome!", style: TextStyle(fontSize: 28)),
            Text(email ?? "Guest"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(email: email),
                  ),
                );
              },
              child: Text("Go to Profile"),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile Screen
class ProfileScreen extends StatelessWidget {
  final String? email;
  
  const ProfileScreen({super.key, this.email});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              child: Icon(Icons.person, size: 60),
            ),
            SizedBox(height: 20),
            Text("Email: ${email ?? 'N/A'}"),
          ],
        ),
      ),
    );
  }
}
```

---

## Key Takeaways

### Essential Rules:
1. ✅ Use `StatelessWidget` for static content
2. ✅ Use `StatefulWidget` when data changes
3. ✅ Always wrap state changes in `setState(() {})`
4. ✅ Dispose controllers in `dispose()` method
5. ✅ Use `const` constructors for performance
6. ✅ Use `ListView.builder` for long lists
7. ✅ Named routes for organized navigation

### Widget Hierarchy:
```
MaterialApp
  └─ Scaffold
      ├─ AppBar
      ├─ Body
      │   └─ Layout Widgets (Column, Row, etc.)
      │       └─ Content Widgets (Text, Buttons, etc.)
      ├─ FloatingActionButton
      └─ Drawer / BottomNavigationBar
```

---

## Next Steps

### Advanced Topics to Explore:
1. **State Management** (Provider, Riverpod, Bloc)
2. **API Integration** (HTTP requests, JSON parsing)
3. **Local Storage** (SharedPreferences, SQLite)
4. **Animations** (Hero, Implicit, Explicit)
5. **Firebase Integration** (Auth, Firestore, Storage)
6. **Responsive Design** (MediaQuery, LayoutBuilder)
7. **Custom Widgets** (Reusable components)
8. **Testing** (Unit, Widget, Integration tests)

---

## Useful Resources

- Official Flutter Docs: https://docs.flutter.dev/
- Flutter Widget Catalog: https://docs.flutter.dev/ui/widgets
- Dart Language Tour: https://dart.dev/guides/language/language-tour
- Flutter Cookbook: https://docs.flutter.dev/cookbook
- Pub.dev (Packages): https://pub.dev/

---

## Summary

You've learned:
- ✅ Basic Flutter app structure
- ✅ StatelessWidget vs StatefulWidget
- ✅ Layout widgets (Row, Column, Container)
- ✅ Styling text and widgets
- ✅ Interactive buttons
- ✅ State management with setState
- ✅ Forms and user input
- ✅ Lists with ListView.builder
- ✅ Navigation between screens

**You're now ready to build real Flutter apps!** 🎉

Keep practicing, keep building, and don't be afraid to experiment!
