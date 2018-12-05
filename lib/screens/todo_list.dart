import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_redux/constants/keys.dart';
import 'package:flutter_app_redux/models/todo.dart';
import 'package:flutter_app_redux/redux/reducers/main.dart';
import 'package:flutter_app_redux/services/todo.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class TodoListViewModel {
  final bool isLoading;
  final List<Todo> todoList;

  TodoListViewModel({this.isLoading, this.todoList});

  static TodoListViewModel fromStore(Store<AppState> store) {
    return TodoListViewModel(
      isLoading: store.state.todoList.isLoading,
      todoList: store.state.todoList.todoList,
    );
  }
}

// class TodoListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print('------todolistScreen build');
//     return StoreConnector<AppState, TodoListViewModel>(
//       onInit: (store) => TodoApi.fetchTodoList(),
//       converter: TodoListViewModel.fromStore,
//       builder: (context, vm) => TodoListPresentation(vm: vm, todos: vm.todoList),
//     );
//   }
// }

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    print('------initState ');
    TodoApi.fetchTodoList();
  }

  @override
  Widget build(BuildContext context) {
    print('------todolistScreen build');
    return StoreConnector<AppState, TodoListViewModel>(
      onInit: (store) => TodoApi.fetchTodoList(),
      converter: TodoListViewModel.fromStore,
      builder: (context, vm) =>
          TodoListPresentation(vm: vm, todos: vm.todoList),
    );
  }
}

class TodoListPresentation extends StatelessWidget {
  final TodoListViewModel vm;
  final List<Todo> todos;
  final Function(Todo, bool) onCheckboxChanged;
  final Function(Todo) onRemove;
  final Function(Todo) onUndoRemove;

  const TodoListPresentation(
      {Key key,
      this.vm,
      this.onCheckboxChanged,
      this.onRemove,
      this.onUndoRemove,
      this.todos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('------todolistPresentation build ${todos.length}');
    return _buildListView();
  }

  ListView _buildListView() {
    return ListView.builder(
      key: UniqueKey(),
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todos[index];

        return TodoItem(
          todo: todo,
          onDismissed: (direction) {
            _removeTodo(context, todo);
          },
          onTap: () => _onTodoTap(context, todo),
          onCheckboxChanged: (complete) {
            onCheckboxChanged(todo, complete);
          },
        );
      },
    );
  }

  void _removeTodo(BuildContext context, Todo todo) {
    onRemove(todo);

//    Scaffold.of(context).showSnackBar(SnackBar(
//        duration: Duration(seconds: 2),
//        backgroundColor: Theme.of(context).backgroundColor,
//        content: Text(
//          ArchSampleLocalizations.of(context).todoDeleted(todo.task),
//          maxLines: 1,
//          overflow: TextOverflow.ellipsis,
//        ),
//        action: SnackBarAction(
//          label: ArchSampleLocalizations.of(context).undo,
//          onPressed: () => onUndoRemove(todo),
//        )));
  }

  void _onTodoTap(BuildContext context, Todo todo) {
//    Navigator
//        .of(context)
//        .push(MaterialPageRoute(
//      builder: (_) => TodoDetails(id: todo.id),
//    ))
//        .then((removedTodo) {
//      if (removedTodo != null) {
//        Scaffold.of(context).showSnackBar(SnackBar(
//            key: ArchSampleKeys.snackbar,
//            duration: Duration(seconds: 2),
//            backgroundColor: Theme.of(context).backgroundColor,
//            content: Text(
//              ArchSampleLocalizations.of(context).todoDeleted(todo.task),
//              maxLines: 1,
//              overflow: TextOverflow.ellipsis,
//            ),
//            action: SnackBarAction(
//              label: ArchSampleLocalizations.of(context).undo,
//              onPressed: () {
//                onUndoRemove(todo);
//              },
//            )));
//      }
//    });
  }
}

class TodoItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final Todo todo;

  TodoItem({
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ArchSampleKeys.todoItem(todo.id),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          key: ArchSampleKeys.todoItemCheckbox(todo.id),
          value: todo.complete,
          onChanged: onCheckboxChanged,
        ),
        title: Hero(
          tag: '${todo.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              todo.task,
              key: ArchSampleKeys.todoItemTask(todo.id),
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
        subtitle: Text(
          todo.note,
          key: ArchSampleKeys.todoItemNote(todo.id),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subhead,
        ),
      ),
    );
  }
}