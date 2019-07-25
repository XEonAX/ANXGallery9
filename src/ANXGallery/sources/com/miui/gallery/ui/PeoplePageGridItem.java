package com.miui.gallery.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.widget.editwrapper.PickAnimationHelper.BackgroundImageViewable;

public class PeoplePageGridItem extends FaceDisplayItemPreferFromThumbnailSource implements Checkable, BackgroundImageViewable {
    protected CheckBox mCheckBox;
    private TextView mName;

    private class IdHolder {
        long id;
        String serverId;

        public IdHolder(long j, String str) {
            this.id = j;
            this.serverId = str;
        }
    }

    public PeoplePageGridItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public ImageView getBackgroundImageView() {
        return this.mCover;
    }

    public String getName() {
        return this.mName.getText().toString();
    }

    public long getPeopleLocalId() {
        return ((IdHolder) getTag()).id;
    }

    public String getPeopleServerId() {
        return ((IdHolder) getTag()).serverId;
    }

    public boolean isChecked() {
        return this.mCheckBox.isChecked();
    }

    /* access modifiers changed from: protected */
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mCover = (ImageView) findViewById(R.id.face);
        this.mName = (TextView) findViewById(R.id.name);
        this.mCheckBox = (CheckBox) findViewById(16908289);
    }

    public void saveIds2Tag(long j, String str) {
        setTag(new IdHolder(j, str));
    }

    public void setCheckable(boolean z) {
        if (z) {
            this.mCheckBox.setVisibility(0);
        } else {
            this.mCheckBox.setVisibility(8);
        }
    }

    public void setChecked(boolean z) {
        this.mCheckBox.setChecked(z);
    }

    public void setName(String str) {
        this.mName.setText(str);
    }

    public void toggle() {
        this.mCheckBox.toggle();
    }
}
