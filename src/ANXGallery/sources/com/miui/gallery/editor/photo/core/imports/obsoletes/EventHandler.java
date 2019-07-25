package com.miui.gallery.editor.photo.core.imports.obsoletes;

import android.os.Handler;
import android.os.Message;
import android.util.SparseArray;
import java.util.BitSet;

public class EventHandler extends Handler {
    private BitSet mBitSet = new BitSet();
    private SparseArray<Runnable> mCallbacks = new SparseArray<>();

    public void handleMessage(Message message) {
        Runnable runnable = (Runnable) this.mCallbacks.get(message.what);
        if (runnable != null) {
            runnable.run();
        }
    }

    public int register(Runnable runnable) {
        int nextClearBit = this.mBitSet.nextClearBit(0);
        this.mCallbacks.put(nextClearBit, runnable);
        this.mBitSet.set(nextClearBit);
        return nextClearBit;
    }

    public void unregister(int i) {
        this.mCallbacks.setValueAt(i, null);
        this.mBitSet.clear(i);
    }
}
