package com.miui.gallery.widget;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.miui.gallery.util.Log;

public abstract class AntiDoubleItemClickListener implements OnItemClickListener {
    private long mLastClickTimeMillis;
    private int mMinClickInterval;

    public AntiDoubleItemClickListener() {
        this(600);
    }

    public AntiDoubleItemClickListener(int i) {
        this.mMinClickInterval = i;
    }

    public abstract void onAntiDoubleItemClick(AdapterView<?> adapterView, View view, int i, long j);

    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        if (System.currentTimeMillis() - this.mLastClickTimeMillis < ((long) this.mMinClickInterval)) {
            Log.e("DoubleClick", "On filtered click event");
            return;
        }
        this.mLastClickTimeMillis = System.currentTimeMillis();
        onAntiDoubleItemClick(adapterView, view, i, j);
    }
}
