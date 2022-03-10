part of training_utils;

class Singletons {
  static final _mediaApiService = MediaApiServiceImpl();

  static List<BlocProvider> registerCubits() => [
        BlocProvider<GetItemsCubit>(
          create: (context) => GetItemsCubit(
            mediaApiService: _mediaApiService,
          ),
        ),
      ];
}
