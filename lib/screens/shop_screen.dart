import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/data/data_bloc.dart';
import '../core/utils.dart';
import '../widgets/btn.dart';
import '../widgets/scaffold2.dart';
import '../widgets/title_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold2(
      body: Column(
        children: [
          TitleWidget(title: 'SHOP'),
          BlocBuilder<DataBloc, DataState>(
            builder: (context, state) {
              return Expanded(
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    Center(
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Color(0xff5D2B67),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/coin.png',
                              height: 50,
                            ),
                            SizedBox(width: 6),
                            Text(
                              coins.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: 'w400',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    _ShopItem(
                      id: 1,
                      price: 0,
                      bought: true,
                    ),
                    SizedBox(height: 40),
                    _ShopItem(
                      id: 2,
                      price: 400,
                      bought: bought2,
                    ),
                    SizedBox(height: 40),
                    _ShopItem(
                      id: 3,
                      price: 800,
                      bought: bought3,
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ShopItem extends StatelessWidget {
  const _ShopItem({
    required this.id,
    required this.price,
    required this.bought,
  });

  final int id;
  final int price;
  final bool bought;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 4,
          color: Color(0xff5D2B67),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/bg$id.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff39244B).withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/coin.png',
                    height: 50,
                  ),
                  SizedBox(width: 6),
                  Text(
                    price.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'w400',
                    ),
                  ),
                ],
              ),
              Btn(
                onPressed: bought
                    ? () {
                        context.read<DataBloc>().add(SelectBG(id: id));
                      }
                    : coins >= price
                        ? () {
                            context
                                .read<DataBloc>()
                                .add(BuyBG(id: id, price: price));
                          }
                        : null,
                child: Text(
                  id == currentBG
                      ? 'SELECTED'
                      : bought
                          ? 'SELECT'
                          : 'BUY',
                  style: TextStyle(
                    color:
                        bought || coins >= price ? Colors.white : Colors.grey,
                    fontSize: 30,
                    fontFamily: 'w400',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
