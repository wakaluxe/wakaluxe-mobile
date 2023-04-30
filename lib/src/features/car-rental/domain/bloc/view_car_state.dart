// ignore_for_file: public_member_api_docs, sort_constructors_first
class ViewCarState {
  final int selectedIndex;
  ViewCarState({
    required this.selectedIndex,
  });

  ViewCarState copyWith({
    int? selectedIndex,
  }) {
    return ViewCarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
