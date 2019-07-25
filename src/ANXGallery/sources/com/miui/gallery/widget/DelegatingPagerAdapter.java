package com.miui.gallery.widget;

import android.database.DataSetObserver;
import android.os.Parcelable;
import android.view.View;
import android.view.ViewGroup;

public class DelegatingPagerAdapter extends PagerAdapter {
    private final PagerAdapter mDelegate;

    public DelegatingPagerAdapter(PagerAdapter pagerAdapter) {
        this.mDelegate = pagerAdapter;
    }

    public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
        this.mDelegate.destroyItem(viewGroup, i, obj);
    }

    public void finishUpdate(ViewGroup viewGroup) {
        this.mDelegate.finishUpdate(viewGroup);
    }

    public int getCount() {
        return this.mDelegate.getCount();
    }

    public PagerAdapter getDelegate() {
        return this.mDelegate;
    }

    public int getItemPosition(Object obj, int i) {
        return this.mDelegate.getItemPosition(obj, i);
    }

    public float getPageWidth(int i) {
        return this.mDelegate.getPageWidth(i);
    }

    public int getSlipWidth(int i, int i2) {
        return this.mDelegate.getSlipWidth(i, i2);
    }

    public Object instantiateItem(ViewGroup viewGroup, int i) {
        return this.mDelegate.instantiateItem(viewGroup, i);
    }

    public boolean isViewFromObject(View view, Object obj) {
        return this.mDelegate.isViewFromObject(view, obj);
    }

    public void notifyDataSetChanged() {
        this.mDelegate.notifyDataSetChanged();
    }

    public void refreshItem(Object obj, int i) {
        this.mDelegate.refreshItem(obj, i);
    }

    public void registerDataSetObserver(DataSetObserver dataSetObserver) {
        this.mDelegate.registerDataSetObserver(dataSetObserver);
    }

    public void restoreState(Parcelable parcelable, ClassLoader classLoader) {
        this.mDelegate.restoreState(parcelable, classLoader);
    }

    public Parcelable saveState() {
        return this.mDelegate.saveState();
    }

    public void setPrimaryItem(ViewGroup viewGroup, int i, Object obj) {
        this.mDelegate.setPrimaryItem(viewGroup, i, obj);
    }

    public void startUpdate(ViewGroup viewGroup) {
        this.mDelegate.startUpdate(viewGroup);
    }

    public void unregisterDataSetObserver(DataSetObserver dataSetObserver) {
        this.mDelegate.unregisterDataSetObserver(dataSetObserver);
    }
}
