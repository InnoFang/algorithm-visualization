public class VisualHelper {
  
  SelectionSortData data;
  
  public VisualHelper(SelectionSortData data) {
     this.data = data;
  }
  
  void render() {
     int w = width / data.N();
     for (int i = 0; i < data.N(); i++) {      
       if (i < data.orderedIndex) fill(#FF6464);
       else fill(#ADADAD);
       
       if (i == data.currentCompareIndex) fill(#E736EA);
       if (i == data.currentMinIndex) fill(#850AC4);
       
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