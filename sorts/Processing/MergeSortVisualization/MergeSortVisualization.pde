import java.util.*;

int delay = 100;

MergeSortData data;
Thread thread;
VisualHelper vh;

void setup() {
   size(1200,800);
   data = new MergeSortData(100, height);
   vh = new VisualHelper(data);
   thread = new Thread(new Runnable() {
     public void run() {
        setData(-1, -1, -1);

        mergeSort(0, data.N()-1);

        setData(0, data.N()-1, data.N()-1);
     }
   });
}

void mouseClicked() {
    if (!thread.isAlive()) {
        thread.start();
    }
}

private void mergeSort(int l, int r){

    if( l >= r )
        return;

    setData(l, r, -1);

    int mid = (l+r)/2;
    mergeSort(l, mid);
    mergeSort(mid+1, r);
    merge(l, mid, r);
}

private void merge(int l, int mid, int r){

    int[] aux = Arrays.copyOfRange(data.numbers, l, r+1);

    int i = l, j = mid+1;
    for( int k = l ; k <= r; k ++ ){

        if( i > mid ){ 
            data.numbers[k] = aux[j-l]; j ++;
        }
        else if( j > r ){ 
            data.numbers[k] = aux[i-l]; i ++;
        }
        else if( aux[i-l] < aux[j-l] ){ 
            data.numbers[k] = aux[i-l]; i ++;
        }
        else{
            data.numbers[k] = aux[j-l]; j ++;
        }

        setData(l, r, k);
    }
}

private void setData(int l, int r, int mergeIndex){
    data.l = l;
    data.r = r;
    data.mergeIndex = mergeIndex;

    vh.pause(delay);
}

void draw() {
    smooth();
    background(255);
    vh.render();
}