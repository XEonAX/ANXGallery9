package com.miui.gallery.collage.widget;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.PopupWindow;
import android.widget.PopupWindow.OnDismissListener;
import com.miui.gallery.R;

class ControlPopupWindow extends PopupWindow {
    private Context mContext;
    /* access modifiers changed from: private */
    public ControlListener mControlListener;
    private int mHeight;
    private int mMargin;
    private OnClickListener mOnClickListener;
    private int mWidth;

    interface ControlListener {
        void onDismiss();

        void onMirror();

        void onReplace();

        void onRotate();
    }

    ControlPopupWindow(Context context) {
        this(context, true);
    }

    ControlPopupWindow(Context context, boolean z) {
        super(context);
        this.mOnClickListener = new OnClickListener() {
            public void onClick(View view) {
                int id = view.getId();
                if (id != R.id.mirror) {
                    if (id != R.id.replace) {
                        if (id == R.id.rotate && ControlPopupWindow.this.mControlListener != null) {
                            ControlPopupWindow.this.mControlListener.onRotate();
                        }
                    } else if (ControlPopupWindow.this.mControlListener != null) {
                        ControlPopupWindow.this.mControlListener.onReplace();
                    }
                } else if (ControlPopupWindow.this.mControlListener != null) {
                    ControlPopupWindow.this.mControlListener.onMirror();
                }
            }
        };
        init(context, z);
    }

    private void init(Context context, boolean z) {
        this.mContext = context;
        View inflate = View.inflate(context, R.layout.collage_dialog, null);
        setContentView(inflate);
        setBackgroundDrawable(new ColorDrawable(0));
        setOutsideTouchable(false);
        setFocusable(false);
        setAnimationStyle(2131820557);
        setOnDismissListener(new OnDismissListener() {
            public void onDismiss() {
                if (ControlPopupWindow.this.mControlListener != null) {
                    ControlPopupWindow.this.mControlListener.onDismiss();
                }
            }
        });
        this.mWidth = context.getResources().getDimensionPixelSize(z ? R.dimen.collage_control_popup_width : R.dimen.collage_control_popup_width_no_rotation);
        this.mHeight = context.getResources().getDimensionPixelSize(R.dimen.collage_control_popup_height);
        this.mMargin = context.getResources().getDimensionPixelSize(R.dimen.collage_dialog_margin);
        setWidth(this.mWidth);
        setHeight(this.mHeight);
        ImageView imageView = (ImageView) inflate.findViewById(R.id.replace);
        ImageView imageView2 = (ImageView) inflate.findViewById(R.id.rotate);
        ImageView imageView3 = (ImageView) inflate.findViewById(R.id.mirror);
        if (!z) {
            imageView2.setVisibility(8);
        }
        imageView.setOnClickListener(this.mOnClickListener);
        imageView2.setOnClickListener(this.mOnClickListener);
        imageView3.setOnClickListener(this.mOnClickListener);
    }

    /* access modifiers changed from: 0000 */
    public void setControlListener(ControlListener controlListener) {
        this.mControlListener = controlListener;
    }

    public void showAtLocation(View view, View view2) {
        showAtLocation(view, view2, false);
    }

    public void showAtLocation(View view, View view2, boolean z) {
        int[] iArr = new int[2];
        int[] iArr2 = new int[2];
        view2.getLocationInWindow(iArr);
        view.getLocationInWindow(iArr2);
        int height = (((float) (iArr[1] + (view2.getHeight() / 2))) >= ((float) (iArr2[1] + (view.getHeight() / 2))) || z) ? (iArr[1] - this.mHeight) - this.mMargin : iArr[1] + view2.getHeight() + this.mMargin;
        if (height < 0) {
            height = Math.round(((float) iArr[1]) - (((float) this.mHeight) / 2.0f));
        }
        if (height < 0) {
            height = iArr[1] + this.mMargin;
        }
        int width = (iArr[0] + (view2.getWidth() / 2)) - (this.mWidth / 2);
        if (isShowing()) {
            update(width, height, this.mWidth, this.mHeight);
        } else {
            super.showAtLocation(view, 8388659, width, height);
        }
    }
}
