package com.miui.gallery.movie.ui.adapter;

import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.graphics.Canvas;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.support.v7.widget.helper.ItemTouchHelper.Callback;
import android.text.TextUtils;
import android.util.Property;
import android.view.View;
import android.view.animation.Interpolator;
import android.widget.ImageView;
import com.meicam.sdk.NvsThumbnailView;
import com.miui.gallery.R;
import com.miui.gallery.movie.entity.ImageEntity;
import com.miui.gallery.movie.ui.adapter.BaseAdapter.BaseHolder;
import java.util.Collections;
import miui.view.animation.CubicEaseOutInterpolator;

public class EditAdapter extends BaseAdapter<ImageEntity> {
    private static final ImageEntity ITEM_ADD = new ImageEntity("ITEM_ADD", null);
    private Callback mCallback;
    /* access modifiers changed from: private */
    public OnActionListener mOnActionListener;

    public class EditHolder extends BaseHolder {
        protected NvsThumbnailView mImageView;
        protected ImageView mImageViewAdd;

        public EditHolder(View view) {
            super(view);
            this.mImageView = (NvsThumbnailView) view.findViewById(R.id.item_iv);
            this.mImageViewAdd = (ImageView) view.findViewById(R.id.item_iv_add);
        }

        public void bindView(int i) {
            if (EditAdapter.this.isAddItem(i)) {
                this.mImageView.setVisibility(8);
                this.mImageViewAdd.setVisibility(0);
                return;
            }
            this.mImageView.setVisibility(0);
            this.mImageViewAdd.setVisibility(8);
            this.mImageView.setMediaFilePath(EditAdapter.this.getItemData(i).image);
        }
    }

    public interface OnActionListener {
        void onMove(int i, int i2);
    }

    public EditAdapter(Context context) {
        super(context);
        this.mCallback = new Callback() {
            private int mFromPosition;
            private boolean mLastActive;
            private boolean mMove;
            private int mToPosition;
            private final Interpolator sDragScrollInterpolator = new Interpolator() {
                public float getInterpolation(float f) {
                    return f * f * f;
                }
            };
            private final Interpolator sDragViewScrollCapInterpolator = new Interpolator() {
                public float getInterpolation(float f) {
                    float f2 = f - 1.0f;
                    return (f2 * f2 * f2 * f2 * f2) + 1.0f;
                }
            };

            public void clearView(RecyclerView recyclerView, ViewHolder viewHolder) {
                super.clearView(recyclerView, viewHolder);
                EditAdapter.this.doScaleAnimal(viewHolder.itemView, false);
            }

            public int getMovementFlags(RecyclerView recyclerView, ViewHolder viewHolder) {
                return EditAdapter.this.isAddItem(viewHolder.getAdapterPosition()) ? makeMovementFlags(0, 0) : makeMovementFlags(15, 0);
            }

            public int interpolateOutOfBoundsScroll(RecyclerView recyclerView, int i, int i2, int i3, long j) {
                float f = 1.0f;
                int signum = (int) (((float) (((int) Math.signum((float) i2)) * 40)) * this.sDragViewScrollCapInterpolator.getInterpolation(Math.min(1.0f, (((float) Math.abs(i2)) * 1.0f) / ((float) i))));
                if (j <= 500) {
                    f = ((float) j) / 500.0f;
                }
                int interpolation = (int) (((float) signum) * this.sDragScrollInterpolator.getInterpolation(f));
                if (interpolation != 0) {
                    return interpolation;
                }
                return i2 > 0 ? 1 : -1;
            }

            public boolean isItemViewSwipeEnabled() {
                return false;
            }

            public boolean isLongPressDragEnabled() {
                return true;
            }

            public void onChildDraw(Canvas canvas, RecyclerView recyclerView, ViewHolder viewHolder, float f, float f2, int i, boolean z) {
                super.onChildDraw(canvas, recyclerView, viewHolder, f, f2, i, z);
                if (this.mLastActive && !z) {
                    EditAdapter.this.doScaleAnimal(viewHolder.itemView, false);
                }
                this.mLastActive = z;
            }

            public boolean onMove(RecyclerView recyclerView, ViewHolder viewHolder, ViewHolder viewHolder2) {
                int adapterPosition = viewHolder.getAdapterPosition();
                int adapterPosition2 = viewHolder2.getAdapterPosition();
                if (EditAdapter.this.isAddItem(adapterPosition2)) {
                    adapterPosition2--;
                }
                this.mToPosition = adapterPosition2;
                if (adapterPosition == adapterPosition2) {
                    return true;
                }
                if (adapterPosition < adapterPosition2) {
                    int i = adapterPosition;
                    while (i < adapterPosition2) {
                        int i2 = i + 1;
                        Collections.swap(EditAdapter.this.getList(), i, i2);
                        EditAdapter.this.swapSelectItem(i, i2);
                        i = i2;
                    }
                } else {
                    for (int i3 = adapterPosition; i3 > adapterPosition2; i3--) {
                        int i4 = i3 - 1;
                        Collections.swap(EditAdapter.this.getList(), i3, i4);
                        EditAdapter.this.swapSelectItem(i3, i4);
                    }
                }
                EditAdapter.this.notifyItemMoved(adapterPosition, adapterPosition2);
                return true;
            }

            public void onSelectedChanged(ViewHolder viewHolder, int i) {
                super.onSelectedChanged(viewHolder, i);
                if (i != 0) {
                    int adapterPosition = viewHolder.getAdapterPosition();
                    if (!EditAdapter.this.isAddItem(adapterPosition)) {
                        EditAdapter.this.doScaleAnimal(viewHolder.itemView, true);
                        this.mMove = true;
                        this.mFromPosition = adapterPosition;
                        this.mToPosition = adapterPosition;
                    }
                } else if (this.mMove && this.mFromPosition != this.mToPosition && EditAdapter.this.mOnActionListener != null) {
                    EditAdapter.this.mOnActionListener.onMove(this.mFromPosition, this.mToPosition);
                }
            }

            public void onSwiped(ViewHolder viewHolder, int i) {
            }
        };
        this.mSelectedItemPosition = -1;
    }

    /* access modifiers changed from: private */
    public void doScaleAnimal(View view, boolean z) {
        ObjectAnimator objectAnimator = new ObjectAnimator();
        Property property = View.SCALE_X;
        float[] fArr = new float[2];
        fArr[0] = view.getScaleX();
        float f = 1.0f;
        fArr[1] = z ? 1.34f : 1.0f;
        PropertyValuesHolder ofFloat = PropertyValuesHolder.ofFloat(property, fArr);
        Property property2 = View.SCALE_Y;
        float[] fArr2 = new float[2];
        fArr2[0] = view.getScaleY();
        if (z) {
            f = 1.34f;
        }
        fArr2[1] = f;
        PropertyValuesHolder ofFloat2 = PropertyValuesHolder.ofFloat(property2, fArr2);
        objectAnimator.setTarget(view);
        objectAnimator.setValues(new PropertyValuesHolder[]{ofFloat, ofFloat2});
        objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
        objectAnimator.setDuration(200);
        objectAnimator.start();
    }

    /* access modifiers changed from: private */
    public void swapSelectItem(int i, int i2) {
        if (this.mSelectedItemPosition == i) {
            this.mSelectedItemPosition = i2;
        } else if (this.mSelectedItemPosition == i2) {
            this.mSelectedItemPosition = i;
        }
    }

    public Callback getCallback() {
        return this.mCallback;
    }

    /* access modifiers changed from: protected */
    public EditHolder getHolder(View view) {
        return new EditHolder(view);
    }

    public int getItemCount() {
        if (this.mList == null) {
            return 0;
        }
        return super.getItemCount() + 1;
    }

    public ImageEntity getItemData(int i) {
        if (i < 0) {
            return null;
        }
        return i >= this.mList.size() ? ITEM_ADD : (ImageEntity) super.getItemData(i);
    }

    /* access modifiers changed from: protected */
    public int getLayoutId() {
        return R.layout.movie_layout_edit_item;
    }

    public int getListSize() {
        if (this.mList == null) {
            return 0;
        }
        return this.mList.size();
    }

    public boolean isAddItem(int i) {
        ImageEntity itemData = getItemData(i);
        return itemData != null && TextUtils.equals(itemData.image, "ITEM_ADD");
    }

    public void setOnActionListener(OnActionListener onActionListener) {
        this.mOnActionListener = onActionListener;
    }
}
