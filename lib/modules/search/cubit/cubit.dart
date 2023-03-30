import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/modules/search/cubit/states.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(ShopInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;
  void search({
    required String text,
  }) {
    emit(ShopLoadingSearchState());
    DioHelper.postData(
      url: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value) {
      model = SearchModel.fromJson(value.data);

      emit(ShopSuccessSearchState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorSearchState());
    });
  }
}
