import 'package:easyhome/views/pages/overview_page.dart';
import 'package:easyhome/views/pages/transaction_page.dart';
import 'package:easyhome/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            customAppBar(context),
            SliverToBoxAdapter(
              child: Container(
                height: 60,
                margin: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                    )),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_left),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("DECEMBER"),
                        Text("11 Transactions"),
                      ],
                    ),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
            ),
            const SliverFillRemaining(
              child: TabBarView(
                children: [
                  OverviewPage(),
                  TransactionPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
