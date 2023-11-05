class Staff {
  String id; // スタッフの番号
  int x, y; // スタッフ番号を表示する座標

  boolean isAttendance; // スタッフが出勤しているかいないか

  Staff() { // インスタンスを生成したときに初期化する
    this.isAttendance = false;
    this.id = "";
  }

  // スタッフの番号などを表示
  void display() {
    fill(0);
    text(id, x + 25, y + 100);
  }

  //　スタッフの情報などを更新
  void updata() {
  }

  // スタッフの初期化

  void init() {
  }
}
