import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:library_app/data/data.dart';
import 'package:library_app/presentation/view/user/save_user_view.dart';
import 'package:nav_service/nav_service.dart';

import '../../provider/user/user_bloc.dart';

class UserInfoView extends StatelessWidget {
  const UserInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final provi = context.watch<UserBloc>();
    return Scaffold(
      appBar: provi.state.viewSelect == ViewUserEnum.addUser
          ? AppBar(
              leading: _AppbarAdd(provi: provi),
            )
          : AppBar(
              title: Text(
                "Lista de regsitro",
                style: styleText.headlineMedium,
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: switch (provi.state.viewSelect) {
          ViewUserEnum.info => const _ListUsers(),
          ViewUserEnum.addUser => const SaveUserView(),
        },
      ),
    );
  }
}

class _AppbarAdd extends StatelessWidget {
  const _AppbarAdd({
    required this.provi,
  });

  final UserBloc provi;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => provi.add(ChagngeView(newView: ViewUserEnum.info)),
        icon: const Icon(Icons.arrow_back_ios_new_outlined));
  }
}

class _ListUsers extends StatelessWidget {
  const _ListUsers();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final provi = context.watch<UserBloc>();
    final styleText = Theme.of(context).textTheme;
    return Scaffold(
      body: provi.state.users.isEmpty
          ? const _EmptyList()
          : Column(
              children: [
                Expanded(
                  child: Center(
                    child: ListView.builder(
                      itemCount: provi.state.users.length,
                      itemBuilder: (context, index) {
                        final user = provi.state.users[index];
                        return FadeInDown(
                          child: Card(
                            color: colors.primaryContainer,
                            elevation: 0,
                            child: ListTile(
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                      color: Colors.white,
                                      child: Icon(
                                        _getIcon(user.gender),
                                        size: 60,
                                      ))),
                              title: Text(
                                user.name,
                                style: styleText.titleLarge!
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _RowInfo(
                                      data: user.lastName, tile: "Apellido"),
                                  _RowInfo(data: user.email, tile: "Correo"),
                                  _RowInfo(
                                      data: user.gender.value, tile: "Genero"),
                                  _RowInfo(
                                      data: "${user.age.toString()} años",
                                      tile: "Edad"),
                                  _RowInfo(
                                      data: DateFormat("dd/MM/yyyy")
                                          .format(user.birthdate),
                                      tile: "F.Nacimiento"),
                                  _RowInfo(
                                      data: user.phoneNumber, tile: "N.Cel."),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButton: FadeInUp(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                provi.add(ChagngeView(newView: ViewUserEnum.addUser));
              },
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),
            _FloatDelete(provi: provi),
          ],
        ),
      ),
    );
  }

  _getIcon(GenderEnum gender) {
    switch (gender) {
      case GenderEnum.masculino:
        return FontAwesomeIcons.person;

      case GenderEnum.femenino:
        return FontAwesomeIcons.personDress;
      case GenderEnum.otro:
        return FontAwesomeIcons.personHalfDress;
    }
  }
}

class _EmptyList extends StatelessWidget {
  const _EmptyList();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("No se encontró ningún registro"),
          Icon(FontAwesomeIcons.faceSadCry)
        ],
      ),
    );
  }
}

class _FloatDelete extends StatelessWidget {
  const _FloatDelete({
    required this.provi,
  });

  final UserBloc provi;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ShowService.alert(
            content: AlertDialog(
          title: const Text("Alerta"),
          content: const Text("¿Deseas eliminar todo los registros?"),
          actions: [
            ElevatedButton(
                onPressed: () => NavService.pop(),
                child: const Text('Cancelar')),
            ElevatedButton(
                onPressed: () {
                  provi.add(DeleteAllUser());
                  NavService.pop();
                },
                child: const Text('Aceptar')),
          ],
        ));
      },
      child: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
    );
  }
}

class _RowInfo extends StatelessWidget {
  const _RowInfo({
    required this.tile,
    required this.data,
  });
  final String tile;
  final String data;
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    return Row(
      children: [
        Text(
          "$tile: ",
          style: styleText.bodyMedium,
        ),
        const SizedBox(width: 5),
        Expanded(
            child: Text(
          data,
          style: styleText.bodyMedium,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        )),
      ],
    );
  }
}
