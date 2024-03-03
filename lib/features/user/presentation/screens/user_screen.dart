import 'package:belajar_bloc2/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<UserBloc>().add(const GetUserById(8)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PROFILE'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(state.user.avatar),
                  ),
                  const SizedBox(height: 20),
                  Text(state.user.firstName),
                  Text(state.user.email),
                ],
              ),
            );
          } else if (state is UserError) {
            return Center(
              child: Text(state.messsage),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
