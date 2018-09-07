
int delay = 50;  

DualPivotQuickSortData data;
VisualHelper vh;
Thread thread;

void setup() {
  size(1200,800);
   data = new DualPivotQuickSortData(100, height, Type.Default);
   vh = new VisualHelper(data);
   thread = new Thread(new Runnable() {
     public void run() {
        setData(-1, -1, -1, -1, -1, -1);

        dualPivotQuickSort(0, data.N() - 1);

        setData(-1, -1, -1, -1, -1, -1);
     }
   });
}

 private void dualPivotQuickSort(int l, int r){

//        if( l >= r )
//            return;

        if( l > r ) return;

        if( l == r ){
            setData(l, r, l, -1, -1, -1);
            return;
        }

        setData(l, r, -1, -1, -1, -1);

        int p = partition(l, r);
        dualPivotQuickSort(l, p-1 );
        dualPivotQuickSort(p+1, r);
    }

    private int partition(int l, int r){

        int p = (int)(Math.random() * (r - l + 1)) + l;
        setData(l, r, -1, p, -1, -1);
        
        data.swap(l, p);
        int v = data.get(l);
        setData(l, r, -1, l, -1, -1);

        // arr[l+1...j] <= v ; arr[j+1...i) >= v
        int j = r, i = l + 1; 
        setData(l, r, -1, l, i, j);
        while( true ) {
           while ( i <= r && data.get(i) < v ) {
              i++; 
              setData(l, r, -1, l, i, j);
           }
           
           while ( j >= l+1 && data.get(j) > v ) {
              j--;
              setData(l, r, -1, l, i, j);
           }
           
           if ( i > j ) break;
           
           data.swap(i, j);
           i++;
           j--;
           setData(l, r, -1, l, i, j);  
        }

        data.swap(l, j);
        setData(l, r, j, -1, -1, -1);

        return j;
    }


    private void setData(int l, int r, int fixedPivot, int curPivot, int curL, int curR){
        data.l = l;
        data.r = r;
        if(fixedPivot != -1)
            data.fixedPivots[fixedPivot] = true;
        data.curPivot = curPivot;
        data.curL = curL;
        data.curR = curR;
        
        vh.pause(delay);
    }


void mouseClicked() {
    if (!thread.isAlive()) {
        thread.start();
    }
}


void draw() {
    smooth();
    background(255);
    vh.render();
}