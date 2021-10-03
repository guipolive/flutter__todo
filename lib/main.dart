// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class TodoList extends StatefulWidget {
  const TodoList({ Key? key }) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _todoList = <String>[];
  final _doneTodos = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override

  Widget _buildRow(String todo) {
    final alreadyDone = _todoList.contains(todo);

    return ListTile(
      title: Text(
        todo,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadyDone ? Icons.favorite : Icons.favorite_border,
        color: alreadyDone ? Colors.red : Colors.grey
      ),
      onTap: () {
        setState(() {
          if (alreadyDone) {
            _doneTodos.remove(todo);
          } else {
            _doneTodos.add(todo);
          }
        });
      },
      onLongPress: () {
        setState(() {
          _todoList.remove(todo);
        });
      },
    );
  }

  Widget _buildTodos() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        return _buildRow(_todoList[i]);
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nickname Generator'),
				actions: [
					// IconButton(icon: Icon(Icons.refresh), onPressed: _pushSaved,),
					// IconButton(icon: Icon(Icons.list), onPressed: _pushSaved,)
				],
      ),
      body: _buildTodos(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}