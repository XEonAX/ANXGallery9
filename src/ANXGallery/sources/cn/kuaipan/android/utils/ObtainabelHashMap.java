package cn.kuaipan.android.utils;

import java.util.HashMap;

public class ObtainabelHashMap<K, V> extends HashMap<K, V> implements IObtainable {
    private static ObtainabelHashMap<?, ?> mPool = null;
    private static int mPoolSize = 0;
    private static Object mPoolSync = new Object();
    private static final long serialVersionUID = 5201260832948788096L;
    private ObtainabelHashMap<?, ?> next;

    private ObtainabelHashMap() {
    }

    public static <K, V> ObtainabelHashMap<K, V> obtain() {
        synchronized (mPoolSync) {
            if (mPool == null) {
                return new ObtainabelHashMap<>();
            }
            ObtainabelHashMap<?, ?> obtainabelHashMap = mPool;
            mPool = obtainabelHashMap.next;
            obtainabelHashMap.next = null;
            mPoolSize--;
            obtainabelHashMap.clear();
            return obtainabelHashMap;
        }
    }

    public void recycle() {
        synchronized (mPoolSync) {
            if (mPoolSize < 500) {
                mPoolSize++;
                this.next = mPool;
                mPool = this;
            }
            for (Object next2 : values()) {
                if (next2 instanceof IObtainable) {
                    ((IObtainable) next2).recycle();
                }
            }
            clear();
        }
    }
}
