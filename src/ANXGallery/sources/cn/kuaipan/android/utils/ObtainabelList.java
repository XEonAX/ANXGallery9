package cn.kuaipan.android.utils;

import java.util.Iterator;
import java.util.LinkedList;

public class ObtainabelList<E> extends LinkedList<E> implements IObtainable {
    private static ObtainabelList<?> mPool = null;
    private static int mPoolSize = 0;
    private static Object mPoolSync = new Object();
    private static final long serialVersionUID = 6483198895359712723L;
    private ObtainabelList<?> next;

    private ObtainabelList() {
    }

    public static <E> ObtainabelList<E> obtain() {
        synchronized (mPoolSync) {
            if (mPool == null) {
                return new ObtainabelList<>();
            }
            ObtainabelList<?> obtainabelList = mPool;
            mPool = obtainabelList.next;
            obtainabelList.next = null;
            mPoolSize--;
            obtainabelList.clear();
            return obtainabelList;
        }
    }

    public void recycle() {
        synchronized (mPoolSync) {
            if (mPoolSize < 80) {
                mPoolSize++;
                this.next = mPool;
                mPool = this;
            }
            Iterator it = iterator();
            while (it.hasNext()) {
                Object next2 = it.next();
                if (next2 instanceof IObtainable) {
                    ((IObtainable) next2).recycle();
                }
            }
            clear();
        }
    }
}
