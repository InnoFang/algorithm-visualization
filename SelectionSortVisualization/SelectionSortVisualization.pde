int delay = 100;

SelectionSortData data;
Thread thread;
VisualHelper vh;

void setup() {
   size(1200,800);
   data = new SelectionSortData(100, height);
   vh = new VisualHelper(data);
   thread = new Thread(new Runnable() {
     public void run() {
       selectionSort();
     }
   });
}

void mouseClicked() {
    if (!thread.isAlive()) {
        thread.start();
    }
}



void selectionSort() {
  setData(0, -1, -1);
  for (int i = 0; i < data.N(); i++) {
        int minIndex = i;
        setData(i, -1, minIndex);
        for (int j = i + 1; j < data.N(); j++) {
          setData(i, j, minIndex);
          if (data.get(j) < data.get(minIndex)) {
              minIndex = j;
              setData(i, j, minIndex);
          }
        }
        data.swap(i, minIndex);
        setData(i + 1, -1, minIndex);
    } 
    setData(data.N(), -1, -1);
}

private void setData(int orderedIndex, int currentCompareIndex, int currentMinIndex) {
    data.orderedIndex = orderedIndex;
    data.currentCompareIndex = currentCompareIndex;
    data.currentMinIndex = currentMinIndex;
    
    vh.pause(delay);
}

void draw() {
    smooth();
    background(255);
    vh.render();
}