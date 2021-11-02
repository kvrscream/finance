import 'package:finance/models/user_model.dart';
import 'package:finance/styles/app_colors.dart';
import 'package:finance/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final UserModel user;
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(142),
        child: Container(
          height: 152,
          child: AppBar(
            backgroundColor: AppColors.primary,
            title: ListTile(
              title: Text(
                "Finance, " + widget.user.Name,
                style: AppTextStyles.titleAppBar,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(widget.user.PhotoUrl),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => {Navigator.pushNamed(context, "/AddIncome")},
        ),
      ),
    );
  }
}
