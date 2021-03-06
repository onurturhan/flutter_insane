import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hacki/config/locator.dart';
import 'package:hacki/models/models.dart';
import 'package:hacki/repositories/repositories.dart';

part 'pin_state.dart';

class PinCubit extends Cubit<PinState> {
  PinCubit({
    PreferenceRepository? storageRepository,
    StoriesRepository? storiesRepository,
  })  : _storageRepository =
            storageRepository ?? locator.get<PreferenceRepository>(),
        _storiesRepository =
            storiesRepository ?? locator.get<StoriesRepository>(),
        super(PinState.init()) {
    init();
  }

  final PreferenceRepository _storageRepository;
  final StoriesRepository _storiesRepository;

  void init() {
    emit(PinState.init());
    _storageRepository.pinnedStoriesIds.then((List<int> ids) {
      emit(state.copyWith(pinnedStoriesIds: ids));

      _storiesRepository.fetchStoriesStream(ids: ids).listen(_onStoryFetched);
    });
  }

  void pinStory(Story story) {
    if (!state.pinnedStoriesIds.contains(story.id)) {
      emit(
        state.copyWith(
          pinnedStoriesIds: <int>{story.id, ...state.pinnedStoriesIds}.toList(),
          pinnedStories: <Story>{story, ...state.pinnedStories}.toList(),
        ),
      );
      _storageRepository.updatePinnedStoriesIds(state.pinnedStoriesIds);
    }
  }

  void unpinStory(Story story) {
    emit(
      state.copyWith(
        pinnedStoriesIds: <int>[...state.pinnedStoriesIds]..remove(story.id),
        pinnedStories: <Story>[...state.pinnedStories]..remove(story),
      ),
    );
    _storageRepository.updatePinnedStoriesIds(state.pinnedStoriesIds);
  }

  void _onStoryFetched(Story story) {
    emit(state.copyWith(pinnedStories: <Story>[...state.pinnedStories, story]));
  }
}
