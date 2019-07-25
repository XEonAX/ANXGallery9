package com.miui.gallery.editor.photo.widgets.seekbar;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.util.AttributeSet;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import com.miui.gallery.R;

public class BasicSeekBar extends SeekBar {
    private SeekBarChangeDelegate mDelegate;
    private LayerDrawable mThumb;

    private class SeekBarChangeDelegate implements OnSeekBarChangeListener {
        /* access modifiers changed from: private */
        public OnSeekBarChangeListener mDelegated;

        private SeekBarChangeDelegate() {
        }

        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            if (this.mDelegated != null) {
                this.mDelegated.onProgressChanged(seekBar, i, z);
            }
            BasicSeekBar.this.updateThumb(i);
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
            if (this.mDelegated != null) {
                this.mDelegated.onStartTrackingTouch(seekBar);
            }
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
            if (this.mDelegated != null) {
                this.mDelegated.onStopTrackingTouch(seekBar);
            }
        }
    }

    public BasicSeekBar(Context context) {
        this(context, null);
    }

    public BasicSeekBar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 16842875);
    }

    public BasicSeekBar(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mDelegate = new SeekBarChangeDelegate();
        super.setOnSeekBarChangeListener(this.mDelegate);
        updateThumb(getProgress());
    }

    public void setOnSeekBarChangeListener(OnSeekBarChangeListener onSeekBarChangeListener) {
        this.mDelegate.mDelegated = onSeekBarChangeListener;
    }

    public void setThumb(Drawable drawable) {
        if (drawable instanceof LayerDrawable) {
            LayerDrawable layerDrawable = (LayerDrawable) drawable;
            if (!(layerDrawable.findDrawableByLayerId(R.id.seekbar_thumb_active_state) == null || layerDrawable.findDrawableByLayerId(R.id.seekbar_thumb_reset_state) == null)) {
                this.mThumb = layerDrawable;
                updateThumb(getProgress());
                return;
            }
        }
        super.setThumb(drawable);
    }

    /* access modifiers changed from: 0000 */
    public void updateThumb(int i) {
        if (this.mThumb != null) {
            if (i == 0) {
                super.setThumb(this.mThumb.findDrawableByLayerId(R.id.seekbar_thumb_reset_state));
            } else {
                super.setThumb(this.mThumb.findDrawableByLayerId(R.id.seekbar_thumb_active_state));
            }
        }
    }
}
