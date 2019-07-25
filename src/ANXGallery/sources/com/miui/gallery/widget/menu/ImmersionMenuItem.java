package com.miui.gallery.widget.menu;

import android.content.Context;
import android.graphics.drawable.Drawable;

public class ImmersionMenuItem {
    private Context mContext;
    private int mFlags = 16;
    private Drawable mIcon;
    private int mId;
    private CharSequence mInfomation;
    private boolean mIsRedDotDisplayed;
    private boolean mIsRemainWhenClick;
    private ImmersionSubMenu mSubMenu;
    private CharSequence mSummary;
    private CharSequence mTitle;

    public ImmersionMenuItem(Context context, int i, CharSequence charSequence) {
        this.mContext = context;
        this.mId = i;
        this.mTitle = charSequence;
    }

    public Drawable getIcon() {
        return this.mIcon;
    }

    public CharSequence getInformation() {
        return this.mInfomation;
    }

    public int getItemId() {
        return this.mId;
    }

    public ImmersionSubMenu getSubMenu() {
        return this.mSubMenu;
    }

    public CharSequence getSummary() {
        return this.mSummary;
    }

    public CharSequence getTitle() {
        return this.mTitle;
    }

    public boolean hasSubMenu() {
        return this.mSubMenu != null;
    }

    public boolean isCheckable() {
        return (this.mFlags & 1) == 1;
    }

    public boolean isChecked() {
        return (this.mFlags & 2) == 2;
    }

    public boolean isRedDotDisplayed() {
        return this.mIsRedDotDisplayed;
    }

    public boolean isRemainWhenClick() {
        return this.mIsRemainWhenClick;
    }

    public boolean isVisible() {
        return (this.mFlags & 8) == 0;
    }

    public ImmersionMenuItem setIconResource(int i) {
        this.mIcon = this.mContext.getResources().getDrawable(i);
        return this;
    }

    public ImmersionMenuItem setInformation(int i) {
        return setInformation((CharSequence) this.mContext.getString(i));
    }

    public ImmersionMenuItem setInformation(CharSequence charSequence) {
        this.mInfomation = charSequence;
        return this;
    }

    public void setIsRedDotDisplayed(boolean z) {
        this.mIsRedDotDisplayed = z;
    }

    public void setRemainWhenClick(boolean z) {
        this.mIsRemainWhenClick = z;
    }

    public ImmersionMenuItem setVisible(boolean z) {
        this.mFlags = (z ? 0 : 8) | (this.mFlags & -9);
        return this;
    }
}
