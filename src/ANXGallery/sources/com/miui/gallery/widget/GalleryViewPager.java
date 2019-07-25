package com.miui.gallery.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.ViewGroup;
import com.miui.gallery.widget.ViewPager.OnPageChangeListener;
import com.miui.gallery.widget.ViewPager.OnPageSettledListener;

public class GalleryViewPager extends ViewPager {
    private int mLayoutDirection;
    private ReversingOnPageChangeListener mReversingOnPageChangeListener = new ReversingOnPageChangeListener();
    private ReversingOnPageSettledListener mReversingOnPageSettledListener = new ReversingOnPageSettledListener();

    private class ReversingAdapter extends DelegatingPagerAdapter {
        public ReversingAdapter(PagerAdapter pagerAdapter) {
            super(pagerAdapter);
        }

        public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
            super.destroyItem(viewGroup, GalleryViewPager.processingIndex(i, getCount(), GalleryViewPager.this.isRtl()), obj);
        }

        public int getItemPosition(Object obj, int i) {
            return super.getItemPosition(obj, GalleryViewPager.processingIndex(i, getCount(), GalleryViewPager.this.isRtl()));
        }

        public float getPageWidth(int i) {
            return super.getPageWidth(GalleryViewPager.processingIndex(i, getCount(), GalleryViewPager.this.isRtl()));
        }

        public Object instantiateItem(ViewGroup viewGroup, int i) {
            return super.instantiateItem(viewGroup, GalleryViewPager.processingIndex(i, getCount(), GalleryViewPager.this.isRtl()));
        }

        public void refreshItem(Object obj, int i) {
            super.refreshItem(obj, GalleryViewPager.processingIndex(i, getCount(), GalleryViewPager.this.isRtl()));
        }

        public void setPrimaryItem(ViewGroup viewGroup, int i, Object obj) {
            super.setPrimaryItem(viewGroup, GalleryViewPager.processingIndex(i, getCount(), GalleryViewPager.this.isRtl()), obj);
        }
    }

    private class ReversingOnPageChangeListener implements OnPageChangeListener {
        OnPageChangeListener mListener;

        private ReversingOnPageChangeListener() {
        }

        public void onPageScrollStateChanged(int i) {
            if (this.mListener != null) {
                this.mListener.onPageScrollStateChanged(i);
            }
        }

        public void onPageScrolled(int i, float f, int i2) {
            if (this.mListener != null) {
                this.mListener.onPageScrolled(i, f, i2);
            }
        }

        public void onPageSelected(int i) {
            if (this.mListener != null) {
                PagerAdapter access$201 = GalleryViewPager.super.getAdapter();
                if (access$201 != null) {
                    i = GalleryViewPager.processingIndex(i, access$201.getCount(), GalleryViewPager.this.isRtl());
                }
                this.mListener.onPageSelected(i);
            }
        }
    }

    private class ReversingOnPageSettledListener implements OnPageSettledListener {
        OnPageSettledListener mListener;

        private ReversingOnPageSettledListener() {
        }

        public void onPageSettled(int i) {
            if (this.mListener != null) {
                PagerAdapter access$501 = GalleryViewPager.super.getAdapter();
                if (access$501 != null) {
                    i = GalleryViewPager.processingIndex(i, access$501.getCount(), GalleryViewPager.this.isRtl());
                }
                this.mListener.onPageSettled(i);
            }
        }
    }

    public GalleryViewPager(Context context) {
        super(context);
        init(context);
    }

    public GalleryViewPager(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(context);
    }

    public GalleryViewPager(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(context);
    }

    private void init(Context context) {
        super.setOnPageChangeListener(this.mReversingOnPageChangeListener);
        super.setOnPageSettledListener(this.mReversingOnPageSettledListener);
        this.mLayoutDirection = context.getResources().getConfiguration().getLayoutDirection();
    }

    /* access modifiers changed from: private */
    public boolean isRtl() {
        return this.mLayoutDirection == 1;
    }

    /* access modifiers changed from: private */
    public static int processingIndex(int i, int i2, boolean z) {
        return z ? (i2 - i) - 1 : i;
    }

    public PagerAdapter getAdapter() {
        ReversingAdapter reversingAdapter = (ReversingAdapter) super.getAdapter();
        if (reversingAdapter == null) {
            return null;
        }
        return reversingAdapter.getDelegate();
    }

    public int getCurrentItem() {
        int currentItem = super.getCurrentItem();
        PagerAdapter adapter = super.getAdapter();
        return adapter != null ? processingIndex(currentItem, adapter.getCount(), isRtl()) : currentItem;
    }

    public Object getItem(int i) {
        PagerAdapter adapter = super.getAdapter();
        if (adapter != null) {
            i = processingIndex(i, adapter.getCount(), isRtl());
        }
        return super.getItem(i);
    }

    public void onRtlPropertiesChanged(int i) {
        super.onRtlPropertiesChanged(i);
        if (this.mLayoutDirection != i) {
            int currentItem = getCurrentItem();
            this.mLayoutDirection = i;
            PagerAdapter adapter = getAdapter();
            if (adapter != null) {
                adapter.notifyDataSetChanged();
                setCurrentItem(currentItem);
            }
        }
    }

    public void setAdapter(PagerAdapter pagerAdapter) {
        if (pagerAdapter != null) {
            pagerAdapter = new ReversingAdapter(pagerAdapter);
        }
        super.setAdapter(pagerAdapter);
        setCurrentItem(0);
    }

    public void setCurrentItem(int i) {
        PagerAdapter adapter = super.getAdapter();
        if (adapter != null) {
            i = processingIndex(i, adapter.getCount(), isRtl());
        }
        super.setCurrentItem(i);
    }

    public void setCurrentItem(int i, boolean z) {
        PagerAdapter adapter = super.getAdapter();
        if (adapter != null) {
            i = processingIndex(i, adapter.getCount(), isRtl());
        }
        super.setCurrentItem(i, z);
    }

    public void setOnPageChangeListener(OnPageChangeListener onPageChangeListener) {
        this.mReversingOnPageChangeListener.mListener = onPageChangeListener;
    }

    public void setOnPageSettledListener(OnPageSettledListener onPageSettledListener) {
        this.mReversingOnPageSettledListener.mListener = onPageSettledListener;
    }
}
