package com.miui.gallery.share;

import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TextView;
import com.miui.gallery.R;
import java.lang.ref.WeakReference;

public class DescriptPreference extends Preference {
    private CharSequence mDescriptDetail;
    private int mDescriptDetailVisibility;
    private CharSequence mDescriptTitle;
    private int mDescriptTitleVisibility;
    private WeakReference<View> mRootRef;

    public DescriptPreference(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public DescriptPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mDescriptTitleVisibility = 0;
        this.mDescriptDetailVisibility = 8;
        setLayoutResource(R.layout.share_album_public_descript_text);
        setPersistent(false);
    }

    private void refresh() {
        if (this.mRootRef != null) {
            View view = (View) this.mRootRef.get();
            if (view != null) {
                TextView textView = (TextView) view.findViewById(R.id.descript_title);
                textView.setVisibility(this.mDescriptTitleVisibility);
                textView.setText(this.mDescriptTitle);
                TextView textView2 = (TextView) view.findViewById(R.id.descript_detail);
                textView2.setVisibility(this.mDescriptDetailVisibility);
                textView2.setText(this.mDescriptDetail);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onBindView(View view) {
        this.mRootRef = new WeakReference<>(view);
        refresh();
    }

    public void setDescriptDetail(CharSequence charSequence) {
        this.mDescriptDetail = charSequence;
    }

    public void setDescriptDetailVisibility(int i) {
        this.mDescriptDetailVisibility = i;
    }

    public void setDescriptTitle(int i) {
        setDescriptTitle((CharSequence) getContext().getString(i));
    }

    public void setDescriptTitle(CharSequence charSequence) {
        this.mDescriptTitle = charSequence;
    }
}
