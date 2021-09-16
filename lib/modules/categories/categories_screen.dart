import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/components.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/cubit/states.dart';
import 'package:shop_app/model/categories_model.dart';

class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state)
      {

        return ListView.separated(
            itemBuilder: (context,index) => buildCatItem(ShopCubit.get(context).categoriesModel.data.data[index]),
            separatorBuilder:(context,index) => myDivider(),
            itemCount:ShopCubit.get(context).categoriesModel.data.data.length
        );
      },
    );
  }



  Widget buildCatItem(DataModel model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(model.image
          ),
          width: 80,
          height: 80,
          fit: BoxFit.fill,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          model.name,
          style:
          TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        )
      ],
    ),
  );
}
