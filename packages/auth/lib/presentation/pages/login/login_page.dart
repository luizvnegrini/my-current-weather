import 'package:auth/presentation/pages/login/login_page_providers.dart';
import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  SizedBox get defaultSpacer => const SizedBox(height: 16);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonEnabledNotifier = useValueNotifier(false);
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final vm = readLoginViewModel(ref);
    final state = useLoginState(ref);

    return HookBuilder(
      builder: (_) {
        Widget? loader;
        if (state.isLoading) {
          loader = const Center(child: CircularProgressIndicator());
        }

        return ScaffoldWidget(
          appBar: AppBar(
            title: const Text('Login'),
          ),
          body: loader ??
              Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(hintText: 'Username'),
                    onChanged: (value) {
                      isButtonEnabledNotifier.value = _isValidForm(
                        username: usernameController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
                  defaultSpacer,
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(hintText: 'Password'),
                    onChanged: (value) {
                      isButtonEnabledNotifier.value = _isValidForm(
                        username: usernameController.text,
                        password: passwordController.text,
                      );
                    },
                  ),
                  defaultSpacer,
                  Row(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: vm.clearStorage,
                        child: Text(
                          'Reset storage',
                          style: TextStyle(
                            color: Colors.blue[500],
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue[500],
                          ),
                        ),
                      ),
                      const Spacer(),
                      ValueListenableBuilder(
                        valueListenable: isButtonEnabledNotifier,
                        builder: (_, isValid, __) => ElevatedButton(
                          onPressed: isValid
                              ? () => vm.authenticate(
                                    username: usernameController.text,
                                    password: passwordController.text,
                                  )
                              : null,
                          child: const Text('Send'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        );
      },
    );
  }

  bool _isValidForm({
    required String username,
    required String password,
  }) =>
      username.isNotEmpty && password.isNotEmpty;
}
