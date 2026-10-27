// ===========================================================================
// TaskList_page.dart  —  MAIN CHANGE OF SESSION 10
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 9:
//   1. This page used to be a ConsumerWidget (stateless). It is now a
//      ConsumerStatefulWidget, because fetching a quote is a one-time side
//      effect that must run when the screen opens and must store its result
//      (loading / error / quote) somewhere. Stateless widgets can't hold that.
//   2. Added a REST API call: fetchQuote() does GET -> check status ->
//      decode JSON -> build a QuoteModel.
//   3. Added a quote "banner" at the top of the body that shows ONE of three
//      things depending on state: a spinner, the quote, or an error message.
//   4. The class was renamed TasklistPage -> TaskListPage (update main.dart).
// Everything below the quote banner (title field, note field, Add button,
// task list) is unchanged from session 9.
// ===========================================================================

import 'dart:convert'; // NEW: gives us jsonDecode() to turn JSON text into a Map

import 'package:flutter/material.dart';
import '../models/quote.dart'; // NEW: the model from quote.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http; // NEW: the http package does the GET

import '../Controllers/app_controllers.dart';
import '../models/task.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_text_size.dart';
import '../widgets/tasktile.dart';

// CHANGED: was `ConsumerWidget`. A StatefulWidget has a separate State class
// (below) that survives rebuilds and can hold loading/error/quote.
class TaskListPage extends ConsumerStatefulWidget {
  const TaskListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskListPageState();
}

class _TaskListPageState extends ConsumerState<TaskListPage> {
  // --- NEW: the three pieces of state that describe the network request ------
  bool loading = false; // true while we are waiting for the server
  String? error; // non-null if the request failed
  QuoteModel? quote; // the quote once it has arrived (null until then)

  // --- NEW: the actual REST API call -----------------------------------------
  // `async` + `Future<void>` because a network call takes time; `await` lets
  // the app keep running and resume here once the response arrives.
  Future<void> fetchQuote() async {
    // 1. Tell the UI we are loading, so it can show a spinner.
    setState(() {
      loading = true;
    });
    try {
      // 2. Build the URL and send the GET request.
      final url = Uri.parse("https://dummyjson.com/quotes/random");
      final res = await http.get(url);

      // 3. Check the STATUS CODE. 200 = success. Anything else = the request
      //    completed but did not succeed (e.g. 404), so we record an error.
      if (res.statusCode == 200) {
        // 4. Decode the JSON text (a String) into a Dart Map...
        Map<String, dynamic> map = jsonDecode(res.body) as Map<String, dynamic>;

        // 5. ...then turn that Map into a typed QuoteModel.
        quote = QuoteModel.fromMapToQuote(map);
      } else {
        error = "Network Error ${res.statusCode}";
      }
    } catch (e) {
      // Catches no-internet / timeout / bad-JSON so the app never crashes.
      error = "Request issue, Please try again";
    }

    // Tell the UI we are done; it will now show the quote or the error.
    setState(() {
      loading = false;
    });
  }

  // --- NEW: run the fetch once, automatically, when the screen first opens ---
  // initState runs a single time when this State is created. Perfect place to
  // kick off the one-time quote fetch.
  @override
  void initState() {
    super.initState();
    fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = ref.watch(tasksProvider).tasks;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final Title = TextEditingController();
    final note = TextEditingController();
    void deleteItem(int index) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          // what does it do
          title: Text("Delete Task?"),
          content: Text("This action cannot be undone"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("Cancel"),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(ctx);
                ref.read(tasksProvider).deleteTask(index);
              },
              child: Text("Delete"),
            ),
          ],
        ),
      );

      // ref.read(tasksProvider).deleteTask(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),
        backgroundColor: Colors.yellow[200],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // --- NEW: the quote banner -------------------------------------
              // Reads like: if loading -> spinner; else if no error -> show the
              // quote; else -> show the error text. The UI is a direct picture
              // of the three state fields above.
              loading
                  ? CircularProgressIndicator()
                  : error == null
                  ? Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 143, 240, 193),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // NOTE: quote! assumes the quote is non-null here.
                          // It is, on the happy path, but a 200 with an empty
                          // body would crash. Fine for the lesson; worth a
                          // mention to students about the ! "null assertion".
                          Text(
                            "\" ${quote!.quote} \"",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "-- ${quote!.author}",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w200),
                          ),
                        ],
                      ),
                    )
                  : Text(
                      error!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
              SizedBox(height: 20),
              // --- Below here is unchanged from session 9 --------------------
              TextField(
                controller: Title,
                decoration: InputDecoration(
                  hint: Text("Enter Task Title"),
                  label: Text("Title"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: note,
                decoration: InputDecoration(
                  hint: Text("Enter Task note"),
                  label: Text("Note"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ref.read(tasksProvider).addTask(Title.text, note.text);
                },
                child: Text("Add Task"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Task_Tile(
                      task: tasks[index],
                      changeStatus: () =>
                          ref.read(tasksProvider).changeStatus(index),
                      DeleteTask: () {
                        deleteItem(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
