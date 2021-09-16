import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/components.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/modules/login/shop_login_screen.dart';
import 'package:shop_app/modules/search/search_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'E-Shop',
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                      Icons.search,
                  )),
            ],
          ),
         body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottom(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon:
                  Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon:
                  Icon(Icons.apps),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                  icon:
                  Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                  icon:
                  Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },


    );
  }
}
