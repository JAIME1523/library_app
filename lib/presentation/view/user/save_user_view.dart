import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/config/utils/utils.dart';
import 'package:library_app/data/data.dart';
import 'package:library_app/presentation/provider/user/user_bloc.dart';

import '../../widgets/widgets.dart';

class SaveUserView extends StatelessWidget {
  const SaveUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final provider = context.watch<UserBloc>();
    final colors = Theme.of(context).colorScheme;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        provider.add(ChagngeView(newView: ViewUserEnum.info));
      },
      child: Form(
        key: provider.keyForm,
        child: LayoutBuilder(builder: (_, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                            color: colors.primaryContainer,
                            child: const Icon(
                              Icons.person_2_rounded,
                              size: 100,
                            ))),
                  ),
                  SizedBox(height: size.height * 0.09),
                  CustomInputField(
                      validator: (value) =>
                          RegularExpressions.validateNames(value),
                      controller: provider.nameControl,
                      prefixIcon: const Icon(Icons.person),
                      hintText: "Nombre",
                      labelText: "Nombre",
                      keyboardType: TextInputType.text),
                  CustomInputField(
                      validator: (value) =>
                          RegularExpressions.validateNames(value),
                      controller: provider.lastNameControl,
                      prefixIcon: const Icon(Icons.person_2_outlined),
                      hintText: "Apellidos",
                      labelText: "Apellidos",
                      keyboardType: TextInputType.text),
                  CustomInputField(
                      validator: (value) =>
                          RegularExpressions.validatePhone(value),
                      controller: provider.numberControl,
                      prefixIcon: const Icon(Icons.numbers_outlined),
                      hintText: "Nº Celular",
                      labelText: "Nº Celular",
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 10,
                      keyboardType: TextInputType.number),
                  CustomInputField(
                      validator: (value) =>
                          RegularExpressions.validateEmail(value),
                      controller: provider.emailControl,
                      prefixIcon: const Icon(Icons.email_rounded),
                      hintText: "Correo",
                      labelText: "Correo",
                      keyboardType: TextInputType.emailAddress),
                  _Gender(provider: provider),
                  const SizedBox(height: 20),
                  CustomCalendar(
                    onChanged: (val) {
                      provider.slelectDate(val);
                    },
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      _unFocus();
                      provider.add(SaveUser());
                    },
                    child: const Text('Guardar usuario'),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _unFocus() => FocusManager.instance.primaryFocus?.unfocus();
}

class _Gender extends StatelessWidget {
  const _Gender({
    required this.provider,
  });

  final UserBloc provider;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text("Genero"),
      controller: provider.controllerExpand,
      subtitle: Text(provider.state.genderSelec.value),
      onExpansionChanged: (va) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      children: [
        ...GenderEnum.values.map((gender) => RadioListTile(
            title: Text(gender.value),
            value: gender,
            groupValue: provider.state.genderSelec,
            onChanged: (value) {
              provider.add(ChangeGender(value!));
            }))
      ],
    );
  }
}
