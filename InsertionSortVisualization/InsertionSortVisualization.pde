int delay = 100;

InsertionSortData data;
VisualHelper vh;
Thread thread;

void setup() {
   size(1200, 800);
   data = new InsertionSortData(100, width);
   vh = new VisualHelper(data);
   thread = new Thread(new Runnable(){
       public void run() {
           
          setData(0, -1);
          for(int i = 0; i < data.N(); i++) {
              setData(i, i);
              for (int j = i; j > 0 && data.get(j) < data.get(j-1); j--){
                  data.swap(j, j-1); 
                  setData(i + 1, j - 1);
              }
          }
          setData(data.N(), -1);
       }
   });
}

  private void setData(int orderedIndex, int currentIndex) {
      data.orderedIndex = orderedIndex;
      data.currentIndex = currentIndex;
      vh.pause(delay);
  }

public void mouseClicked() {
   thread.start(); 
}

void draw() {
  background(255);
  smooth();
  vh.render();
}