class Pai {
  int x;
  int y = 10, w = 50, h = 200;
  int info; // パイの種類: 1, 2, 3 = 白, 青, 黒

  boolean isClicked; // パイが選択されているかどうか

  Pai(int info, int x) {
    this.x = x;
    this.info = info;
    this.isClicked = false;
  }

  void display() {
    
    if(isClicked){
      fill(255, 0, 0);
      ellipse(x + w/2, y + h + 20, 20, 20);
    }

    if (info == 1) {
      fill(255);
    } else if (info == 2) {
      fill(0, 0, 255);
    } else {
      fill(0);
    }
    



    rect(x, y, w, h);
  }

  void updata() {
  }
  
  boolean isPressed(){
    return true;
  }
}
