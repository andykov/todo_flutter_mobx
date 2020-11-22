import 'package:mobx/mobx.dart';
import 'package:state_mobx/stores/todo_store.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  // управление кнопкой добавления
  @observable
  String newTodoTitle = "";

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty && newTodoTitle.length >= 3;

  // Cписок задач
  // [1 Вариант] добавления и создания нового списка (менее предпочтительный способ)
  // @observable
  // List<String> todoList = List(); // для списков нужно всегда создавать новый объект списка

  // @action
  // void addTodo() {
  //   todoList = List.from(todoList..add(newTodoTitle));
  // }

  // [2 Вариант] добавления и создания нового списка (Правильный способ)
  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void addTodo() {
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = ""; // очищаем стейт заголовка чтобы пропадала кнопка добавления при очистке поля ввода
  }
}
