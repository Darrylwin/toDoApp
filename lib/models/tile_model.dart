class TileModel {
  final String taskName;
  final bool? taskCompleted;

  TileModel({
    this.taskName = "",
    this.taskCompleted,
  });

  static List<TileModel> getList() {
    List<TileModel> toDoList = [];

    toDoList.add(
      TileModel(
        taskName: "Personnalised task",
      ),
    );

    return toDoList;
  }
}
