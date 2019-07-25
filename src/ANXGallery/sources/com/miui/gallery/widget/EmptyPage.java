package com.miui.gallery.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.miui.gallery.R;

public class EmptyPage extends RelativeLayout {
    private Button mActionButton;
    private TextView mBigTitle;
    private TextView mDescription;
    private ImageView mIcon;
    private TextView mTitle;

    public EmptyPage(Context context) {
        this(context, null);
    }

    public EmptyPage(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public EmptyPage(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init(attributeSet);
    }

    /* JADX INFO: finally extract failed */
    private void init(AttributeSet attributeSet) {
        if (!isInEditMode()) {
            TypedArray obtainStyledAttributes = getContext().obtainStyledAttributes(attributeSet, R.styleable.EmptyPage);
            try {
                Drawable drawable = obtainStyledAttributes.getDrawable(3);
                CharSequence text = obtainStyledAttributes.getText(4);
                CharSequence text2 = obtainStyledAttributes.getText(2);
                Drawable drawable2 = obtainStyledAttributes.getDrawable(0);
                CharSequence text3 = obtainStyledAttributes.getText(1);
                boolean z = obtainStyledAttributes.getBoolean(5, true);
                obtainStyledAttributes.recycle();
                View inflate = LayoutInflater.from(getContext()).inflate(R.layout.empty_page, this);
                this.mIcon = (ImageView) inflate.findViewById(R.id.icon);
                this.mTitle = (TextView) inflate.findViewById(R.id.title);
                this.mBigTitle = (TextView) inflate.findViewById(R.id.big_title);
                this.mDescription = (TextView) inflate.findViewById(R.id.description);
                if (VERSION.SDK_INT >= 21) {
                    this.mBigTitle.setLetterSpacing(0.025f);
                    this.mDescription.setLetterSpacing(0.025f);
                }
                this.mActionButton = (Button) inflate.findViewById(R.id.action_button);
                if (drawable != null) {
                    setIcon(drawable);
                }
                if (text2 != null) {
                    setSingleLineTextMode(false);
                    setDescription(text2);
                    if (text != null) {
                        setBigTitle(text);
                    }
                } else {
                    setSingleLineTextMode(true);
                    if (text != null) {
                        setTitle(text);
                    }
                }
                if (drawable2 != null) {
                    setActionButtonBackground(drawable2);
                }
                if (text3 != null) {
                    setActionButtonText(text3);
                }
                setActionButtonVisible(z);
            } catch (Throwable th) {
                obtainStyledAttributes.recycle();
                throw th;
            }
        }
    }

    private void setSingleLineTextMode(boolean z) {
        if (z) {
            this.mTitle.setVisibility(0);
            this.mBigTitle.setVisibility(8);
            this.mDescription.setVisibility(8);
            return;
        }
        this.mTitle.setVisibility(8);
        this.mBigTitle.setVisibility(0);
        this.mDescription.setVisibility(0);
    }

    public void onConfigurationChanged(Configuration configuration) {
        if (this.mIcon != null) {
            MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mIcon.getLayoutParams();
            int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.vertical_spacing_twostagedraw);
            if (marginLayoutParams.topMargin != dimensionPixelSize) {
                marginLayoutParams.setMargins(marginLayoutParams.leftMargin, dimensionPixelSize, marginLayoutParams.rightMargin, marginLayoutParams.bottomMargin);
                this.mIcon.setLayoutParams(marginLayoutParams);
            }
            if (configuration.orientation == 2) {
                this.mTitle.setVisibility(8);
            } else {
                this.mTitle.setVisibility(0);
            }
        }
    }

    public void setActionButtonBackground(int i) {
        this.mActionButton.setBackgroundResource(i);
    }

    public void setActionButtonBackground(Drawable drawable) {
        this.mActionButton.setBackground(drawable);
    }

    public void setActionButtonClickable(boolean z) {
        this.mActionButton.setClickable(z);
    }

    public void setActionButtonText(int i) {
        this.mActionButton.setText(i);
    }

    public void setActionButtonText(CharSequence charSequence) {
        this.mActionButton.setText(charSequence);
    }

    public void setActionButtonVisible(boolean z) {
        this.mActionButton.setVisibility(z ? 0 : 4);
    }

    public void setBigTitle(int i) {
        this.mBigTitle.setText(i);
    }

    public void setBigTitle(CharSequence charSequence) {
        this.mBigTitle.setText(charSequence);
    }

    public void setDescription(int i) {
        this.mDescription.setText(i);
    }

    public void setDescription(CharSequence charSequence) {
        this.mDescription.setText(charSequence);
    }

    public void setIcon(int i) {
        this.mIcon.setImageResource(i);
    }

    public void setIcon(Drawable drawable) {
        this.mIcon.setImageDrawable(drawable);
    }

    public void setOnActionButtonClickListener(OnClickListener onClickListener) {
        this.mActionButton.setOnClickListener(onClickListener);
    }

    public void setTitle(int i) {
        this.mTitle.setText(i);
    }

    public void setTitle(CharSequence charSequence) {
        this.mTitle.setText(charSequence);
    }
}
