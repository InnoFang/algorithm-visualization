public class VisualHelper {
  
  QuickSortData data;
  
  public VisualHelper(QuickSortData data) {
     this.data = data;
  }
  
  void render() {
     int w = width / data.N();
     for (int i = 0; i < data.N(); i++) {      
       if(i >= data.l && i <= data.r) fill(#00F50A);
       else fill(#DEDEDE);
       
       if (i == data.curPivot) fill(#3F51B5);
       if (i == data.curElement) fill(#03A9F4);
       if (data.fixedPivots[i]) fill(#F44336);
       
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