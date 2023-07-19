import 'package:coding_test/training_series/presentation/components/community_tab.dart';
import 'package:coding_test/training_series/presentation/controller/series_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/services/service_locator.dart';
import '../components/classes_tab.dart';
import '../components/overview_tap.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeriesCubit(sl())..fetchSeriesDetails(),
      child: Scaffold(
        body: BlocConsumer<SeriesCubit, SeriesState>(
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.seriesRequestState) {
              case RequestState.initial:
                return const CupertinoActivityIndicator();
              case RequestState.loaded:
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height / 3,
                      child: Stack(
                        children: [
                          Image.network(
                            state.series!.imageUrl,
                            height: MediaQuery.sizeOf(context).height / 3,
                            width: double.infinity,
                          ),
                          const Positioned(
                              top: 20,
                              left: 20,
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    Text(
                      state.series!.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.sizeOf(context).width * .06,
                      ),
                    ),
                    Text(
                      state.series!.instructorInfo.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.sizeOf(context).width * .04,
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {},
                        child: Text(
                          'START PRACTICING',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery.sizeOf(context).width * .04,
                          ),
                        )),
                    Expanded(
                      child: DefaultTabController(
                        length: 3,
                        child: Builder(builder: (context) {
                          final tabController = DefaultTabController.of(context);
                          return SingleChildScrollView(
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height/2,
                              child: Column(
                                  children: [
                                TabBar(
                                  controller: tabController,
                                  indicatorColor: Colors.black,
                                  indicatorWeight: 3,
                                  labelColor: Colors.black,
                                  tabs: const [
                                    Tab(
                                      text: 'Overview',
                                    ),
                                    Tab(
                                      text: 'Classes',
                                    ),
                                    Tab(
                                      text: 'Community',
                                    ),
                                  ],
                                ),
                                Expanded(
                                    child: TabBarView(controller: tabController, children: [
                                  OverviewTab(
                                    series: state.series!,
                                  ),
                                  const ClassesTab(),
                                  const CommunityTab(),
                                ]))
                              ]),
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                );
              case RequestState.error:
                return const Icon(Icons.error);
              case RequestState.loading:
                return const CupertinoActivityIndicator();
            }
          },
        ),
      ),
    );
  }
}
