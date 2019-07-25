package com.miui.gallery.search.core.display;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;
import com.miui.gallery.R;

public class SectionedSuggestionItemDecoration extends ItemDecoration {
    SectionedSuggestionAdapter mAdapter;
    private int mBottomLineDividerColor;
    Context mContext;
    private boolean mDrawBottomLine = false;
    private boolean mDrawLineBetweenSectionItems = false;
    private int mLineDividerHeight;
    Paint mPaint;
    private int mSectionDividerColor;
    private int mSectionDividerHeight;
    private int mSectionInnerDividerStartMargin;
    private int mTopLineDividerColor;

    public SectionedSuggestionItemDecoration(Context context, SectionedSuggestionAdapter sectionedSuggestionAdapter, boolean z, int i, boolean z2) {
        this.mContext = context;
        this.mAdapter = sectionedSuggestionAdapter;
        this.mPaint = new Paint();
        Resources resources = context.getResources();
        this.mSectionDividerHeight = resources.getDimensionPixelSize(R.dimen.search_section_divider_height);
        this.mLineDividerHeight = resources.getDimensionPixelSize(R.dimen.search_line_divider_height);
        this.mBottomLineDividerColor = resources.getColor(R.color.search_section_divider_line_color);
        this.mTopLineDividerColor = resources.getColor(R.color.search_section_divider_line_color);
        this.mSectionDividerColor = resources.getColor(R.color.search_section_divider_color);
        this.mDrawLineBetweenSectionItems = z;
        this.mSectionInnerDividerStartMargin = i;
        this.mDrawBottomLine = z2;
    }

    private void drawDivider(Canvas canvas, View view, int i, int i2, int i3) {
        int i4 = i3;
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        int top = view.getTop() - layoutParams.topMargin;
        if ((i & 1) != 0) {
            int i5 = top - this.mSectionDividerHeight;
            this.mPaint.setStyle(Style.FILL);
            this.mPaint.setColor(this.mSectionDividerColor);
            float f = (float) i2;
            float f2 = (float) top;
            float f3 = (float) i4;
            canvas.drawRect(f, (float) i5, f3, f2, this.mPaint);
            this.mPaint.setStyle(Style.STROKE);
            this.mPaint.setStrokeWidth((float) this.mLineDividerHeight);
            this.mPaint.setColor(this.mBottomLineDividerColor);
            float f4 = f;
            canvas.drawLine(f4, (float) (i5 - this.mLineDividerHeight), f3, (float) (i5 - this.mLineDividerHeight), this.mPaint);
            this.mPaint.setColor(this.mTopLineDividerColor);
            canvas.drawLine(f4, f2, f3, f2, this.mPaint);
        }
        if ((i & 2) != 0) {
            this.mPaint.setStyle(Style.STROKE);
            this.mPaint.setColor(this.mBottomLineDividerColor);
            canvas.drawLine((float) this.mSectionInnerDividerStartMargin, (float) (this.mLineDividerHeight + top), (float) i4, (float) (top + this.mLineDividerHeight), this.mPaint);
        }
        if ((i & 4) != 0) {
            int bottom = view.getBottom() + layoutParams.bottomMargin;
            this.mPaint.setStyle(Style.STROKE);
            this.mPaint.setColor(this.mBottomLineDividerColor);
            canvas.drawLine(0.0f, (float) (bottom - this.mLineDividerHeight), (float) i4, (float) (bottom - this.mLineDividerHeight), this.mPaint);
        }
    }

    private boolean isSectionHeader(int[] iArr) {
        return iArr[1] == -1 && iArr[0] != 0;
    }

    public void getItemOffsets(Rect rect, View view, RecyclerView recyclerView, State state) {
        int innerItemPosition = this.mAdapter.getInnerItemPosition(recyclerView.getChildAdapterPosition(view));
        if (innerItemPosition < 0 || innerItemPosition >= this.mAdapter.getInnerItemViewCount()) {
            rect.set(0, 0, 0, 0);
        } else if (isSectionHeader(this.mAdapter.getIndexes(innerItemPosition))) {
            rect.set(0, this.mSectionDividerHeight, 0, 0);
        } else {
            rect.set(0, 0, 0, 0);
        }
    }

    public void onDrawOver(Canvas canvas, RecyclerView recyclerView, State state) {
        int paddingLeft = recyclerView.getPaddingLeft();
        int width = recyclerView.getWidth() - recyclerView.getPaddingRight();
        int childCount = recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = recyclerView.getChildAt(i);
            int innerItemPosition = this.mAdapter.getInnerItemPosition(recyclerView.getChildAdapterPosition(childAt));
            if (innerItemPosition >= 0 && innerItemPosition < this.mAdapter.getInnerItemViewCount()) {
                int i2 = isSectionHeader(this.mAdapter.getIndexes(innerItemPosition)) ? 1 : (innerItemPosition == 0 || !this.mDrawLineBetweenSectionItems) ? 0 : 2;
                drawDivider(canvas, childAt, (!this.mDrawBottomLine || innerItemPosition != this.mAdapter.getInnerItemViewCount() - 1) ? i2 : i2 | 4, paddingLeft, width);
            }
        }
    }
}
