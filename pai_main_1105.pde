

boolean one = true;
int member1=0;
int member2=0;
int selectRect=1;

String inputID = "";

int clickedIndex = -1;

boolean clicked = false;
boolean isClickedNum = false;

boolean isMemberInputed = false; // member1,2が入力完了したかどうか


boolean isInputNumMode = false;

boolean isClickedEnterBtn = false;



Staff[] staff;
Pai[] pai;




void setup() {


  size(1000, 800);
  textAlign(CENTER, CENTER);
  textSize(20);
}
void draw() {
  background(255);


  if (isMemberInputed) {      // member1,2が入力完了したあと
    text(inputID, width/2, height/2+ 100);


    // 一度しかこのif分のなかは処理されない
    if (one) {
      staff = new Staff[member1 + 3];
      pai = new Pai[member1 + 3];
      initStaff(staff);
      initPai(pai);



      one = false;
    }

    setX();

    for (int i = 0; i < pai.length; i++) {
      if (pai[i].isClicked) {
        isInputNumMode = true;
      }
    }


    // staffIDの入力モード
    if (isInputNumMode) {


      // enterボタンを表示させる
      drawEnterBtn();
    }




    // パイがクリックされたかどうかを変数に格納
    for (int i = 0; i < pai.length; i ++) {
      if (clickedIndex == i && clickedIndex != member2 && clickedIndex != member2 + 1 && clickedIndex != member1 + 2) {

        pai[i].isClicked = true;
      } else {
        pai[i].isClicked = false;
      }
      pai[i].display();
      staff[i].display();
    }


    // text(numStr, width / 2, height / 4);
    text("Clicked pai black is '" + clickedIndex + "'", width/2, height * 1/3);
    fill(0);
  } else {                      // member1,2が入力されるまでここで待つ
    //println("Input member1 & member2");
  }
}







boolean drawButton(int x, int y, int w, int h, String msg) {
  rect(x, y, w, h);
  fill(0);
  text(msg, x + w/2, y + h/2);
  fill(255);

  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    return true;
  } else {
    return false;
  }
}



boolean drawButton_1(int x, int y, int w, int h) {

  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    return true;
  } else {
    return false;
  }
}

void drawEnterBtn() {
  fill(255);
  drawButton(width / 2 - 35, height / 2, 70, 40, "Enter");
}



void isClickedEnterBtn() {
  if (!clicked) {
    if (drawButton_1(width / 2 - 35, height / 2, 70, 40)) {

      isClickedEnterBtn = true;
    }
    clicked = true;
  } else {
    isClickedEnterBtn = false;
  }
}



void getSelectedPaiIndex() {
  for (int i = 0; i < pai.length; i++) {
    if (mouseX > pai[i].x && mouseX < pai[i].x + pai[i].w && mouseY > pai[i].y && mouseY < pai[i].y + pai[i].h) {
      clickedIndex = i;
    }
  }
}

void keyPressed() {
  if (isMemberInputed) {
    if (key >= '0' && key <= '9') {
      inputID = inputID + key; // キーボードから入力された文字を inputChar に格納
    }
  }

  if (!isMemberInputed) {
    if (key >= '0' && key <= '9') {
      if (member1 == 0) {
        member1 = int(key - '0');
      } else {
        member2 = int(key - '0');
        isMemberInputed = true;
      }
    }
  }
  redraw();
}

void mousePressed() {

  if (!clicked) {
    isClickedNum = true;
    clicked = true;

    // Enterボタンを押したら
    if (isWithinRange(width / 2 - 35, height / 2, 70, 40)) {
      setStaffID();
    }


    getSelectedPaiIndex();
  }
}

void mouseReleased() {
  clicked = false;
  isClickedNum = false;

  isClickedEnterBtn = false;
}


// 範囲内かどうかを返す関数
boolean isWithinRange(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    return true;
  } else {
    return false;
  }
}


// スタッフidを表示するときのx座標と各パイのx座標を一緒にする
void setX() {
  for (int i = 0; i < pai.length; i++) {
    staff[i].x = pai[i].x;
  }
}

// 入力された値をstaffに格納する
void setStaffID() {

  if (clickedIndex != -1) {
    if ( staff[clickedIndex].id == "") {

      println(222);
      staff[clickedIndex].id = inputID;
      inputID = "";
    }
  }
}









// Staffオブジェクトを初期化する関数
void initStaff(Staff[] staff) {
  for (int i = 0; i < staff.length; i++) {
    staff[i] = new Staff();
  }
}


// Paiオブジェクトを初期化
void initPai(Pai[] pai) {
  int info = 0;
  int w = width / (member1 + 3);
  for (int i = 0; i < pai.length; i++) {

    if (member2 == i || member1 +  2== i) {  // パイが先頭のとき（青）
      info = 2;
    } else if (member2 + 1 == i ) { // パイが壁の時(黒)
      info = 3;
    } else {                      // 何もなし(白）
      info = 1;
    }
    pai[i] = new Pai(info, i * w);
  }
}
