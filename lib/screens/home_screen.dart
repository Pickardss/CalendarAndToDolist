import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'account_screen.dart';
import 'addnew_screen.dart';
import 'detail_screen.dart';
import 'package:todo_app/models/drawer.dart';
import 'package:todo_app/models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late TextEditingController _searchController;
  late Stream<QuerySnapshot> _tasksStream;
  Map<DateTime, List<Task>> _events = {};

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _tasksStream = FirebaseFirestore.instance.collection('tasks').snapshots();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    FirebaseFirestore.instance.collection('tasks').snapshots().listen((snapshot) {
      final List<DocumentSnapshot> taskDocs = snapshot.docs;
      final Map<DateTime, List<Task>> newEvents = {};
      for (var doc in taskDocs) {
        final task = Task.fromMap(doc.id, doc.data() as Map<String, dynamic>);
        final taskDate = DateTime(task.date.year, task.date.month, task.date.day);
        if (newEvents[taskDate] == null) {
          newEvents[taskDate] = [];
        }
        newEvents[taskDate]!.add(task);
      }
      setState(() {
        _events = newEvents;
      });
    });
  }

  List<Task> _getTasksForDay(DateTime day) {
    final taskDate = DateTime(day.year, day.month, day.day);
    return _events[taskDate] ?? [];
  }

  List<Task> _filterTasksByTitle(String title) {
    final List<Task> allTasks = _events.values.expand((element) => element).toList();
    return allTasks.where((task) => task.title.toLowerCase().contains(title.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Calendar',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountScreen()),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (value) {
                setState(() {
                  _tasksStream = FirebaseFirestore.instance
                      .collection('tasks')
                      .snapshots();
                });
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: _getTasksForDay,
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: StreamBuilder(
              stream: _tasksStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error?.toString() ?? "Unknown error"}'));
                } else {
                  final List<Task> filteredTasks = _searchController.text.isEmpty
                      ? _getTasksForDay(_selectedDay)
                      : _filterTasksByTitle(_searchController.text);
                  return ListView.builder(
                    itemCount: filteredTasks.length,
                    itemBuilder: (context, index) {
                      final task = filteredTasks[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        child: ListTile(
                          title: Text(
                            task.title,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text('${task.startTime} - ${task.endTime}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(task: task),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2a9d8f),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewScreen()),
          );
          _loadTasks();
        },
        child: const Icon(Icons.add),
      ),
      drawer: const CustomDrawer(),
    );
  }

  @override
  void
  dispose() {
    _searchController.dispose();
    super.dispose();
  }
}