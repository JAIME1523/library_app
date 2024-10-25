import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/presentation/provider/home/home_bloc.dart';
import 'package:library_app/presentation/view/library/library_vew.dart';
import 'package:library_app/presentation/view/user/user_info_view.dart';
import 'package:library_app/presentation/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(builder: (context) {
        final provider = context.watch<HomeBloc>();
        return Scaffold(
          body: SafeArea(child: _switchView(provider.state.currentView)),
          bottomNavigationBar: CustomBottonNavigation(
            buttons: [
              ButtonMenu(
                  lable: "Libros",
                  icon: Icons.book,
                  onTap: (value) =>
                      provider.add(ChangeView(newCuerrent: value))),
              ButtonMenu(
                  lable: "User",
                  icon: Icons.person_2_outlined,
                  onTap: (value) =>
                      provider.add(ChangeView(newCuerrent: value))),
            ],
            current: provider.state.currentPage,
          ),
        );
      }),
    );
  }

  Widget _switchView(ViewEnum view) {
    switch (view) {
      case ViewEnum.userView:
        return const UserInfoView();
      case ViewEnum.libraryView:
        return const LibraryVew();
    }
  }
}
