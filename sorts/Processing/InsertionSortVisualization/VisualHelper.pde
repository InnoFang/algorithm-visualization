public class VisualHelper {

  InsertionSortData data;
  
  public VisualHelper(InsertionSortData data) {
    this.data = data;
  }
  
  void render() {
     int w = width / data.N();
     for (int i = 0; i < data.N(); i++) { 
       if (i < data.orderedIndex) fill(#FF4040);
       else fill(#B9B2B2);
       
       if (i == data.currentIndex) fill(#4556E5);
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