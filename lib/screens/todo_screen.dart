import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/todo_provider.dart';
import 'package:provider/provider.dart';

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

  Widget _buildStatChip(String label, int count, Color color) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$count',
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(width: 6),
          Text(label),
        ],
      ),
      side: BorderSide(color: color.withOpacity(0.4)),
      backgroundColor: color.withOpacity(0.06),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = context.watch<TodoProvider>();
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
                  onPressed: () {
                    todoProvider.addTodo(_controller.text);
                    _controller.clear();
                  },
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
                _buildStatChip("Total", todoProvider.total, Colors.blue),
                _buildStatChip("Pending", todoProvider.pending, Colors.orange),
                _buildStatChip("Done", todoProvider.completed, Colors.green),
              ],
            ),
          ),
          Expanded(
            child: todoProvider.items.isEmpty
                ? Center(
                    child: Text(
                      'No tasks yet',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  )
                : ListView.builder(
                    itemCount: todoProvider.items.length,
                    itemBuilder: (context, index) {
                      final todoItem = todoProvider.items[index];
                      return ListTile(
                        title: Text(todoItem.title),
                        leading: Checkbox(
                          value: todoItem.isCompleted,
                          onChanged: (_) {
                            todoProvider.toggle(todoItem.id);
                          },
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            todoProvider.delete(todoItem.id);
                          },
                          icon: const Icon(Icons.delete),
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
