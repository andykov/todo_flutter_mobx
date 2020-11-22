import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  // Реагирование на изменение стейта
  _LoginStore() {
    autorun((_) {
      // print('_reaction_ isFormValid: $isFormValid');
      print('_reaction_ passwordVisible: $passwordVisible');
    });
  }

  // Наблюдение за полями
  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = true;

  @action
  void togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  // Если логин и пароль действительны и не загружается, то возвращаем к функции входа
  @computed
  Function get loginPressed => (isEmailValid && isPasswordValid && !loading) ? login : null;

  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
  }

  // Простая валидация полей
  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  // @computed
  // bool get isFormValid => isEmailValid && isPasswordValid;
}
