import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_app_redux/screens/todo_detail/effect.dart';
import 'package:flutter_app_redux/screens/todo_detail/reducer.dart';
import 'package:flutter_app_redux/screens/todo_detail/state.dart';
import 'package:flutter_app_redux/screens/todo_detail/view.dart';

class TodoDetailPage extends Page<TodoDetailState, Map<String, dynamic>> {
  TodoDetailPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          middleware: <Middleware<TodoDetailState>>[
            logMiddleware(tag: 'TodoDetailPage'),
          ],
        );
}
