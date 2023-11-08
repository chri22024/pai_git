class Staff {
  String id; // スタッフの番号
  int x, y; // スタッフ番号を表示する座標
  
  int startTime;
  int countDown;
  


  boolean isAttendance; // スタッフが出勤しているかいないか
  boolean isTimerOn;

  Staff() { // インスタンスを生成したときに初期化する
    this.isAttendance = false;
    this.id = "";
    this.isTimerOn = false;
    this.startTime = 0;
    this.countDown = 0;
  }

  // スタッフの番号などを表示
  void display() {
    fill(0);
    text(id, x + 25, y + 100);
  }

  //　スタッフの情報などを更新
  void updata() {
  }

  // タイマーを動かすメソッド
  void moveTimer() {

    if (isTimerOn) {
      int currentTime = millis();
      int elapsedTime = currentTime - startTime;
      int remainingTime = countDown * 60 * 1000 - elapsedTime;
      int minutes = max(0, remainingTime / 60000);
      int seconds = (remainingTime / 1000) % 60;

      if (minutes == 0 && seconds == 0) {
        isTimerOn = false;
      } else {
        textSize(20);
        fill(0);
        String timeText = nf(minutes, 2) + ":" + nf(seconds, 2);
        text(timeText, x + 25, y + 160 );
      }
    }
    textSize(20);
  }
  // タイマーをセットするメソッド
  void setTimer(int countDown) {
    startTime = millis();
    this.countDown = countDown;
    isTimerOn = true;
  }

  // スタッフの初期化

  void init() {
  }
}
