package com.miui.gallery.search.widget.bannerView;

import android.view.View;
import com.miui.gallery.search.widget.bannerView.BaseBannerItemData;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public abstract class BaseBannerAdapter<T extends BaseBannerItemData> {
    private List<T> mData;
    private OnDataChangedListener mOnDataChangedListener;
    private OnUpdateTextListener mOnUpdateTextListener;

    interface OnDataChangedListener {
        void onChanged();
    }

    public interface OnUpdateTextListener {
        void onUpdateText(String str, String str2);
    }

    public BaseBannerAdapter(T[] tArr) {
        this.mData = new ArrayList(Arrays.asList(tArr));
    }

    public abstract void bindView(View view, int i);

    public int getCount() {
        if (this.mData == null) {
            return 0;
        }
        return this.mData.size();
    }

    public T getItem(int i) {
        return (BaseBannerItemData) this.mData.get(i);
    }

    public OnUpdateTextListener getOnUpdateTextListener() {
        return this.mOnUpdateTextListener;
    }

    public abstract View getView(BannerView bannerView);

    /* access modifiers changed from: 0000 */
    public void notifyDataChanged() {
        this.mOnDataChangedListener.onChanged();
    }

    public void setData(List<T> list) {
        this.mData = list;
        notifyDataChanged();
    }

    public void setData(T[] tArr) {
        setData((List<T>) new ArrayList<T>(Arrays.asList(tArr)));
    }

    /* access modifiers changed from: 0000 */
    public void setOnDataChangedListener(OnDataChangedListener onDataChangedListener) {
        this.mOnDataChangedListener = onDataChangedListener;
    }

    public void setOnUpdateTextListener(OnUpdateTextListener onUpdateTextListener) {
        this.mOnUpdateTextListener = onUpdateTextListener;
    }
}
