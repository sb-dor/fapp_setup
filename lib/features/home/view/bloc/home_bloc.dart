import 'package:bloc/bloc.dart';
import 'package:fapp_setup/features/home/domain/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo _homeRepo;

  HomeBloc(this._homeRepo) : super(const HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
