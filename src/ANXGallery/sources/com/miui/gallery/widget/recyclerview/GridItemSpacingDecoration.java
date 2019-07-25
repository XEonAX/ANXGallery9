package com.miui.gallery.widget.recyclerview;

import android.graphics.Rect;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.GridLayoutManager.LayoutParams;
import android.support.v7.widget.GridLayoutManager.SpanSizeLookup;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;
import com.miui.gallery.util.Log;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import miui.util.Pools;

public class GridItemSpacingDecoration<T extends RecyclerView> extends ItemDecoration {
    private int[] mCachedBorders;
    private HashMap<String, Rect[]> mCachedOffsets;
    private int mHorizontalSpacing;
    private final WeakReference<T> mHost;
    private boolean mIncludeEdge;
    private int mSpanCount;
    private int mTotalSpace;
    private int mVerticalSpacing;

    public GridItemSpacingDecoration(T t, boolean z) {
        this.mHorizontalSpacing = 0;
        this.mVerticalSpacing = 0;
        this.mIncludeEdge = false;
        this.mHost = new WeakReference<>(t);
        this.mIncludeEdge = z;
    }

    public GridItemSpacingDecoration(T t, boolean z, int i, int i2) {
        this(t, z);
        this.mHorizontalSpacing = i;
        this.mVerticalSpacing = i2;
    }

    private void cacheOffsets(int[] iArr, int i, Rect rect) {
        String generateOffsetsCacheKey = generateOffsetsCacheKey(iArr);
        if (this.mCachedOffsets == null) {
            this.mCachedOffsets = new HashMap<>();
        }
        Rect[] rectArr = (Rect[]) this.mCachedOffsets.get(generateOffsetsCacheKey);
        if (rectArr == null) {
            rectArr = new Rect[iArr.length];
            this.mCachedOffsets.put(generateOffsetsCacheKey, rectArr);
        }
        rectArr[i] = new Rect(rect);
    }

    static int[] calculateItemBorders(int i, int i2) {
        int i3;
        int[] iArr = new int[(i + 1)];
        int i4 = 0;
        iArr[0] = 0;
        int i5 = i2 / i;
        int i6 = i2 % i;
        int i7 = 0;
        for (int i8 = 1; i8 <= i; i8++) {
            i4 += i6;
            if (i4 <= 0 || i - i4 >= i6) {
                i3 = i5;
            } else {
                i3 = i5 + 1;
                i4 -= i;
            }
            i7 += i3;
            iArr[i8] = i7;
        }
        return iArr;
    }

    static String generateOffsetsCacheKey(int[] iArr) {
        StringBuilder sb = (StringBuilder) Pools.getStringBuilderPool().acquire();
        for (int i = 0; i < iArr.length; i++) {
            sb.append(iArr[i]);
            if (i < iArr.length - 1) {
                sb.append("_");
            }
        }
        String sb2 = sb.toString();
        Pools.getStringBuilderPool().release(sb);
        return sb2;
    }

    private Rect getCachedOffsets(int[] iArr, int i) {
        if (this.mCachedOffsets != null) {
            Rect[] rectArr = (Rect[]) this.mCachedOffsets.get(generateOffsetsCacheKey(iArr));
            if (rectArr != null && rectArr.length > i) {
                return rectArr[i];
            }
        }
        return null;
    }

    static int[] getSpanSizeOneGroup(RecyclerView recyclerView, View view) {
        GridLayoutManager gridLayoutManager = (GridLayoutManager) recyclerView.getLayoutManager();
        int spanCount = gridLayoutManager.getSpanCount();
        int[] iArr = new int[spanCount];
        SpanSizeLookup spanSizeLookup = gridLayoutManager.getSpanSizeLookup();
        int spanIndex = ((LayoutParams) view.getLayoutParams()).getSpanIndex();
        int i = spanIndex + 1;
        int childAdapterPosition = recyclerView.getChildAdapterPosition(view);
        int i2 = 0;
        for (int i3 = 0; i3 <= spanIndex; i3++) {
            iArr[i3] = spanSizeLookup.getSpanSize(childAdapterPosition - (spanIndex - i3));
            i2 += iArr[i3];
        }
        int i4 = i;
        while (i < spanCount) {
            int spanSize = spanSizeLookup.getSpanSize((i - spanIndex) + childAdapterPosition);
            i2 += spanSize;
            if (i2 > spanCount) {
                break;
            }
            iArr[i] = spanSize;
            i4++;
            i++;
        }
        int[] iArr2 = new int[i4];
        System.arraycopy(iArr, 0, iArr2, 0, i4);
        return iArr2;
    }

    private void invalidate() {
        RecyclerView recyclerView = (RecyclerView) this.mHost.get();
        if (recyclerView != null) {
            recyclerView.invalidateItemDecorations();
        }
    }

    private void invalidateCaches() {
        this.mCachedBorders = null;
        this.mCachedOffsets = null;
    }

    public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
        super.getItemOffsets(rect, view, recyclerView, state);
        int i = 0;
        if (this.mIncludeEdge) {
            rect.left = this.mHorizontalSpacing / 2;
            rect.right = this.mHorizontalSpacing - rect.left;
        } else {
            GridLayoutManager gridLayoutManager = (GridLayoutManager) recyclerView.getLayoutManager();
            int spanCount = gridLayoutManager.getSpanCount();
            if (spanCount != this.mSpanCount) {
                this.mSpanCount = spanCount;
                invalidateCaches();
            }
            int width = (recyclerView.getWidth() - recyclerView.getPaddingStart()) - recyclerView.getPaddingEnd();
            if (this.mTotalSpace != width) {
                this.mTotalSpace = width;
                invalidateCaches();
            }
            if (this.mCachedBorders == null) {
                this.mCachedBorders = calculateItemBorders(spanCount, width);
            }
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            int spanIndex = layoutParams.getSpanIndex();
            int spanSize = layoutParams.getSpanSize();
            int[] spanSizeOneGroup = getSpanSizeOneGroup(recyclerView, view);
            Rect cachedOffsets = getCachedOffsets(spanSizeOneGroup, spanIndex);
            if (cachedOffsets != null) {
                rect.set(cachedOffsets);
            } else {
                Log.d("GridItemSpacingDecoration", "calculate offsets");
                boolean z = gridLayoutManager.getLayoutDirection() == 1;
                int length = spanSizeOneGroup.length - 1;
                int length2 = (int) (((float) spanSize) * (((((float) length) * 1.0f) * ((float) this.mHorizontalSpacing)) / ((float) spanSizeOneGroup.length)));
                if (spanIndex == 0) {
                    rect.left = 0;
                    rect.right = length2;
                } else {
                    float f = (((float) (width - (length * this.mHorizontalSpacing))) * 1.0f) / ((float) spanCount);
                    int i2 = this.mCachedBorders[spanIndex];
                    float f2 = 0.0f;
                    for (int i3 = 0; i3 < spanIndex; i3++) {
                        f2 += ((float) spanSizeOneGroup[i3]) * f;
                    }
                    rect.left = this.mHorizontalSpacing - ((int) ((((float) i2) - f2) - ((float) ((spanIndex - 1) * this.mHorizontalSpacing))));
                    rect.right = length2 - rect.left;
                    if (spanSize + spanIndex == spanCount) {
                        rect.left += rect.right;
                        rect.right = 0;
                    }
                }
                if (z) {
                    rect.left += rect.right;
                    rect.right = rect.left - rect.right;
                    rect.left -= rect.right;
                }
                cacheOffsets(spanSizeOneGroup, spanIndex, rect);
            }
        }
        if (!hasHeader((RecyclerView) this.mHost.get(), view)) {
            i = this.mVerticalSpacing / 2;
        }
        rect.top = i;
        rect.bottom = this.mVerticalSpacing / 2;
    }

    /* access modifiers changed from: protected */
    public boolean hasHeader(T t, View view) {
        return false;
    }

    public void setHorizontalSpacing(int i) {
        if (this.mHorizontalSpacing != i) {
            this.mHorizontalSpacing = i;
            invalidate();
        }
    }

    public void setVerticalSpacing(int i) {
        if (this.mVerticalSpacing != i) {
            this.mVerticalSpacing = i;
            invalidate();
        }
    }
}
