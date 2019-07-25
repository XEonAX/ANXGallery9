package com.miui.gallery.video.editor.adapter;

import android.support.v4.view.PagerAdapter;
import android.view.View;
import android.view.ViewGroup;
import java.util.List;

public class FilterAdjustPageAdapter extends PagerAdapter {
    private List<View> mViewList;

    public FilterAdjustPageAdapter(List<View> list) {
        this.mViewList = list;
    }

    public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
        viewGroup.removeView((View) this.mViewList.get(i));
    }

    public int getCount() {
        if (this.mViewList != null) {
            return this.mViewList.size();
        }
        return 0;
    }

    public Object instantiateItem(ViewGroup viewGroup, int i) {
        viewGroup.addView((View) this.mViewList.get(i));
        return this.mViewList.get(i);
    }

    public boolean isViewFromObject(View view, Object obj) {
        return view == obj;
    }
}
