package com.miui.gallery.share.baby;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.GridLayout;
import android.widget.LinearLayout.LayoutParams;
import com.miui.gallery.R;
import com.miui.gallery.share.GridPreferenceBase;

public class BabyAlbumSharerPreference extends GridPreferenceBase {
    public BabyAlbumSharerPreference(Context context) {
        this(context, null);
    }

    public BabyAlbumSharerPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public BabyAlbumSharerPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        setSelectable(false);
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.baby_album_sharer_pref_view;
    }

    /* access modifiers changed from: protected */
    public void updateGrid(View view) {
        if (this.mAdapter != null) {
            int count = this.mAdapter.getCount();
            ViewGroup viewGroup = (ViewGroup) view.findViewById(R.id.father_grid);
            ViewGroup viewGroup2 = (ViewGroup) view.findViewById(R.id.mother_grid);
            int i = 8;
            viewGroup.setVisibility(8);
            viewGroup2.setVisibility(8);
            int i2 = 0;
            int i3 = 0;
            while (true) {
                View view2 = null;
                if (i2 < count) {
                    int itemViewType = this.mAdapter.getItemViewType(i2);
                    if (itemViewType == 0 || itemViewType == 1) {
                        ViewGroup viewGroup3 = itemViewType == 0 ? viewGroup : viewGroup2;
                        viewGroup3.setVisibility(0);
                        if (viewGroup3.getChildCount() == 1) {
                            view2 = viewGroup3.getChildAt(0);
                        }
                        View view3 = this.mAdapter.getView(i2, view2, viewGroup3);
                        view3.setTag(getTagInfo(), Integer.valueOf(i2));
                        if (view2 == null) {
                            viewGroup3.addView(view3);
                            view3.setOnClickListener(this.mClickListener);
                        } else if (view2 != view3) {
                            throw new UnsupportedOperationException("convert view must be reused!");
                        }
                        i3++;
                    }
                    i2++;
                } else {
                    ((LayoutParams) viewGroup.getLayoutParams()).setMarginEnd((int) getContext().getResources().getDimension(R.dimen.baby_album_sharer_parents_margin));
                    GridLayout gridLayout = (GridLayout) view.findViewById(16908298);
                    gridLayout.setColumnCount(this.mColumnCount);
                    gridLayout.getLayoutParams().width = this.mColumnWidth * this.mColumnCount;
                    if (gridLayout.getColumnCount() == 0) {
                        gridLayout.removeAllViews();
                        return;
                    }
                    int childCount = gridLayout.getChildCount();
                    int i4 = 0;
                    for (int i5 = 0; i5 < count; i5++) {
                        if (this.mAdapter.getItemViewType(i5) == 2) {
                            View childAt = gridLayout.getChildCount() < i4 ? gridLayout.getChildAt(i4) : null;
                            View view4 = this.mAdapter.getView(i5, childAt, gridLayout);
                            view4.setTag(getTagInfo(), Integer.valueOf(i5));
                            view4.getLayoutParams().width = this.mColumnWidth;
                            if (childAt == null) {
                                gridLayout.addView(view4);
                                view4.setOnClickListener(this.mClickListener);
                            } else if (childAt != view4) {
                                throw new UnsupportedOperationException("convert view must be reused!");
                            }
                            i4++;
                        }
                    }
                    int i6 = count - i3;
                    if (i6 < childCount) {
                        gridLayout.removeViews(i6, childCount - i6);
                    }
                    View findViewById = view.findViewById(R.id.divider);
                    if (i3 > 0 && i6 > 0) {
                        i = 0;
                    }
                    findViewById.setVisibility(i);
                    view.requestLayout();
                    return;
                }
            }
        }
    }
}
