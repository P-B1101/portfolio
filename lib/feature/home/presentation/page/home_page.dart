import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/education_bloc.dart';

class HomePage extends StatefulWidget {
  static const pageRoute = 'home';
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<EducationBloc>().add(GetEducationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
