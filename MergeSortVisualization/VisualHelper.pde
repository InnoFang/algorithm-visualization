public class VisualHelper {
  
  MergeSortData data;
  
  public VisualHelper(MergeSortData data) {
     this.data = data;
  }
  
  void render() {
     int w = width / data.N();
     for (int i = 0; i < data.N(); i++) {      
       if (i >= data.l && i <= data.r) fill(#0EE024);
       else fill(#B2B4B3);
       
       if (i >= data.l && i <= data.mergeIndex) fill(#FF121A);
       
       rect(i * w, height - data.get(i), w - 1, data.get(i));
     }
  }

  void pause(int t) {
    try {
        Thread.sleep(t);
    }
    catch (InterruptedException e) {
        System.out.println("Error sleeping");
    }
  }

}