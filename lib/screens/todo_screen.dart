import 'package:flutter/material.dart';

class TodoProviderScreen extends StatefulWidget {
  const TodoProviderScreen({super.key});

  @override
  State<TodoProviderScreen> createState() => _TodoProviderScreenState();
}

class _TodoProviderScreenState extends State<TodoProviderScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Screen")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => print("hello"),
                    decoration: InputDecoration(
                      hintText: "Enter a task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () => print("execution"),
                  child: Text("Add"),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatChip("Total", stats.total, Colors.blue),
                _buildStatChip("Pending", stats.pending, Colors.orange),
                _buildStatChip("Done", stats.completed, Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
