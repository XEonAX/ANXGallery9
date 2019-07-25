package com.miui.gallery.editor.photo.core.imports.text.editdialog;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLayoutChangeListener;
import android.view.ViewGroup;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.text.editdialog.TextEditDialog.ConfigChangeListener;
import com.miui.gallery.editor.photo.core.imports.text.model.DialogStatusData;
import com.miui.gallery.editor.photo.core.imports.text.utils.AutoLineLayout.TextAlignment;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator;
import com.miui.gallery.editor.photo.widgets.seekbar.BubbleIndicator.Callback;
import com.miui.gallery.editor.photo.widgets.seekbar.CircleDrawable;
import com.miui.gallery.editor.photo.widgets.seekbar.ColorGradientDrawable;
import com.miui.gallery.editor.photo.widgets.seekbar.ColorPicker;
import com.miui.gallery.util.Log;

class DialogStyleMenu extends DialogSubMenu<ConfigChangeListener, DialogStatusData> implements OnClickListener, OnSeekBarChangeListener {
    private TextView mAlignButton;
    private final Drawable mAlignCenterDrawable;
    private final String mAlignCenterString;
    private int mAlignIndex = 0;
    private final Drawable mAlignLeftDrawable;
    private final String mAlignLeftString;
    private final Drawable mAlignRightDrawable;
    private final String mAlignRightString;
    private TextView mBoldButton;
    /* access modifiers changed from: private */
    public ColorPicker mColorPickSeekBar;
    /* access modifiers changed from: private */
    public TextView mShadowButton;
    private SeekBar mTransparentSeekBar;
    private ViewGroup mWholeView;

    private class BubbleCallback implements Callback<View> {
        private BubbleCallback() {
        }

        public void updateProgress(View view, int i) {
            Log.d("DialogStyleMenu", "updateProgress progress: %d color: %s", Integer.valueOf(i), Integer.toHexString(DialogStyleMenu.this.mColorPickSeekBar.getColor()));
            ((GradientDrawable) view.getBackground()).setColor(DialogStyleMenu.this.mColorPickSeekBar.getColor());
        }
    }

    private class ColorPickerChangeListener implements OnSeekBarChangeListener {
        private ColorPickerChangeListener() {
        }

        public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
            if (DialogStyleMenu.this.mListener != null) {
                DialogStyleMenu.this.mColorPickSeekBar.setThumbColor(DialogStyleMenu.this.mColorPickSeekBar.getColor());
                ((ConfigChangeListener) DialogStyleMenu.this.mListener).onColorChange(DialogStyleMenu.this.mColorPickSeekBar.getColor());
            }
        }

        public void onStartTrackingTouch(SeekBar seekBar) {
        }

        public void onStopTrackingTouch(SeekBar seekBar) {
            if (DialogStyleMenu.this.mListener != null) {
                DialogStyleMenu.this.mColorPickSeekBar.setThumbColor(DialogStyleMenu.this.mColorPickSeekBar.getColor());
                ((ConfigChangeListener) DialogStyleMenu.this.mListener).onColorChange(DialogStyleMenu.this.mColorPickSeekBar.getColor());
            }
        }
    }

    DialogStyleMenu(Context context, ViewGroup viewGroup, ConfigChangeListener configChangeListener) {
        super(context, viewGroup, R.string.text_edit_dialog_style, R.drawable.text_edit_dialog_tab_icon_style);
        this.mListener = configChangeListener;
        this.mAlignLeftDrawable = context.getResources().getDrawable(R.drawable.text_edit_dialog_tab_icon_align_left);
        this.mAlignCenterDrawable = context.getResources().getDrawable(R.drawable.text_edit_dialog_tab_icon_align_center);
        this.mAlignRightDrawable = context.getResources().getDrawable(R.drawable.text_edit_dialog_tab_icon_align_right);
        this.mAlignLeftString = context.getString(R.string.text_edit_dialog_style_align_left);
        this.mAlignCenterString = context.getString(R.string.text_edit_dialog_style_align_center);
        this.mAlignRightString = context.getString(R.string.text_edit_dialog_style_align_right);
    }

    private void initView(Context context) {
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(R.dimen.custom_seekbar_thumb_size);
        this.mColorPickSeekBar.setProgressDrawable(new ColorGradientDrawable(ColorPicker.COLORS));
        this.mColorPickSeekBar.setThumbColor(this.mColorPickSeekBar.getColor());
        CircleDrawable circleDrawable = new CircleDrawable((float) context.getResources().getDimensionPixelSize(R.dimen.editor_seek_bar_progress_thumb_start), context.getResources());
        circleDrawable.setIntrinsicWidth(dimensionPixelSize);
        circleDrawable.setIntrinsicHeight(dimensionPixelSize);
        this.mTransparentSeekBar.setThumb(circleDrawable);
        if (this.mTransparentSeekBar.getLayerType() == 0) {
            this.mTransparentSeekBar.setLayerType(2, null);
        }
        setViewClickListener(this.mShadowButton, this.mAlignButton, this.mBoldButton);
        this.mTransparentSeekBar.setOnSeekBarChangeListener(this);
        this.mColorPickSeekBar.setOnSeekBarChangeListener(new BubbleIndicator(View.inflate(context, R.layout.doodle_color_indicator, null), context.getResources().getDimensionPixelSize(R.dimen.photo_editor_bubble_indicator_offset), new BubbleCallback(), new ColorPickerChangeListener()));
    }

    private void setAlignButton(TextAlignment textAlignment) {
        CharSequence charSequence;
        Drawable drawable;
        switch (textAlignment) {
            case LEFT:
                drawable = this.mAlignLeftDrawable;
                charSequence = this.mAlignLeftString;
                break;
            case CENTER:
                drawable = this.mAlignCenterDrawable;
                charSequence = this.mAlignCenterString;
                break;
            case RIGHT:
                String str = this.mAlignRightString;
                charSequence = str;
                drawable = this.mAlignRightDrawable;
                break;
            default:
                drawable = null;
                charSequence = null;
                break;
        }
        this.mAlignButton.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable, null, null, null);
        this.mAlignButton.setText(charSequence);
        this.mAlignIndex = textAlignment.ordinal();
    }

    private void setViewClickListener(View... viewArr) {
        for (View onClickListener : viewArr) {
            onClickListener.setOnClickListener(this);
        }
    }

    /* access modifiers changed from: protected */
    public ViewGroup initSubMenuView(Context context, ViewGroup viewGroup) {
        this.mWholeView = (ViewGroup) LayoutInflater.from(context).inflate(R.layout.text_edit_dialog_options_style_panel, viewGroup, false);
        this.mColorPickSeekBar = (ColorPicker) this.mWholeView.findViewById(R.id.text_edit_dialog_tab_style_color_picker);
        this.mTransparentSeekBar = (SeekBar) this.mWholeView.findViewById(R.id.text_edit_dialog_tab_style_transparent);
        this.mShadowButton = (TextView) this.mWholeView.findViewById(R.id.text_edit_dialog_tab_style_shadow);
        this.mAlignButton = (TextView) this.mWholeView.findViewById(R.id.text_edit_dialog_tab_style_align);
        this.mBoldButton = (TextView) this.mWholeView.findViewById(R.id.text_edit_dialog_tab_style_bold);
        initView(context);
        return this.mWholeView;
    }

    public void initializeData(DialogStatusData dialogStatusData) {
        this.mColorPickSeekBar.setProgress(this.mColorPickSeekBar.findProgressByColor(dialogStatusData.color));
        int max = this.mTransparentSeekBar.getMax();
        this.mTransparentSeekBar.setProgress(max - ((int) (((float) max) * dialogStatusData.transparentProgress)));
        this.mBoldButton.setSelected(dialogStatusData.textBold);
        this.mShadowButton.setSelected(dialogStatusData.textShadow);
        this.mShadowButton.addOnLayoutChangeListener(new OnLayoutChangeListener() {
            public void onLayoutChange(View view, int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8) {
                Log.d("DialogStyleMenu", "onLayoutChange");
                DialogStyleMenu.this.mShadowButton.removeOnLayoutChangeListener(this);
                DialogStyleMenu.this.mShadowButton.refreshDrawableState();
            }
        });
        setAlignButton(dialogStatusData.textAlignment);
    }

    public void onClick(View view) {
        int id = view.getId();
        if (id != R.id.text_edit_dialog_tab_style_shadow) {
            switch (id) {
                case R.id.text_edit_dialog_tab_style_align /*2131296993*/:
                    TextAlignment[] values = TextAlignment.values();
                    this.mAlignIndex++;
                    this.mAlignIndex %= values.length;
                    TextAlignment textAlignment = values[this.mAlignIndex];
                    setAlignButton(textAlignment);
                    if (this.mListener != null) {
                        ((ConfigChangeListener) this.mListener).onTextAlignChange(textAlignment);
                        return;
                    }
                    return;
                case R.id.text_edit_dialog_tab_style_bold /*2131296994*/:
                    boolean isSelected = this.mBoldButton.isSelected();
                    this.mBoldButton.setSelected(!isSelected);
                    if (this.mListener != null) {
                        ((ConfigChangeListener) this.mListener).onBoldChange(!isSelected);
                        return;
                    }
                    return;
                default:
                    return;
            }
        } else {
            boolean isSelected2 = this.mShadowButton.isSelected();
            this.mShadowButton.setSelected(!isSelected2);
            if (this.mListener != null) {
                ((ConfigChangeListener) this.mListener).onShadowChange(!isSelected2);
            }
        }
    }

    public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
        if (seekBar.getId() == R.id.text_edit_dialog_tab_style_transparent && this.mListener != null) {
            ((ConfigChangeListener) this.mListener).onTransparentChange(seekBar.getMax() - i);
        }
    }

    public void onStartTrackingTouch(SeekBar seekBar) {
    }

    public void onStopTrackingTouch(SeekBar seekBar) {
        if (seekBar.getId() == R.id.text_edit_dialog_tab_style_transparent && this.mListener != null) {
            ((ConfigChangeListener) this.mListener).onTransparentChange(seekBar.getMax() - seekBar.getProgress());
        }
    }
}
