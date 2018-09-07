public class SelectionSortData {
   
    private int[] numbers;
    
    public int orderedIndex = -1;        // [0..orderedIndex] is ordered
    public int currentMinIndex = -1;     // the minimum index in the current array
    public int currentCompareIndex = -1; // the index that is comparing now
    public SelectionSortData(int N, int randomBond) {
        numbers = new int[N];
        for (int i = 0; i < N; i++) {
            numbers[i] = (int)(Math.random() * randomBond) + 1;  
        }    
    }
    
    public int N() { return numbers.length; }
    
    public int get(int index) {
       if ( index < 0 || index >= numbers.length ) 
           throw new IllegalArgumentException("Invalid index to access Sort Data.");
           
       return numbers[index];
    }
    
    public void swap(int i, int j) {
       int t = numbers[i];
       numbers[i] = numbers[j];
       numbers[j] = t;
    }
} 