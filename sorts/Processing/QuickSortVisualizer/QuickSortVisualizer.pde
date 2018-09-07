
int delay = 50;  

QuickSortData data;
VisualHelper vh;
Thread thread;

void setup() {
  size(1200,800);
   data = new QuickSortData(100, height);
   vh = new VisualHelper(data);
   thread = new Thread(new Runnable() {
     public void run() {
        setData(-1, -1, -1, -1, -1);

        quickSort(0, data.N()-1);

        setData(-1, -1, -1, -1, -1);
     }
   });
}

 private void quickSort(int l, int r){

//        if( l >= r )
//            return;

        if( l > r ) return;

        if( l == r ){
            setData(l, r, l, -1, -1);
            return;
        }

        setData(l, r, -1, -1, -1);

        int p = partition(l, r);
        quickSort(l, p-1 );
        quickSort(p+1, r);
    }

    private int partition(int l, int r){

        int v = data.get(l);
        setData(l, r, -1, l, -1);

        int j = l; // arr[l+1...j] < v ; arr[j+1...i) > v
        for( int i = l + 1 ; i <= r ; i ++ ){
            setData(l, r, -1, l, i);
            if( data.get(i) < v ){
                j ++;
                data.swap(j, i);
                setData(l, r, -1, l, i);
            }
        }

        data.swap(l, j);
        setData(l, r, j, -1, -1);

        return j;
    }

    private void setData(int l, int r, int fixedPivot, int curPivot, int curElement){
        data.l = l;
        data.r = r;
        if(fixedPivot != -1)
            data.fixedPivots[fixedPivot] = true;
        data.curPivot = curPivot;
        data.curElement = curElement;

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