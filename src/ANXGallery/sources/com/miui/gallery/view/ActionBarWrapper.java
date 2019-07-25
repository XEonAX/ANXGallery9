package com.miui.gallery.view;

import android.app.ActionBar.LayoutParams;
import android.app.ActionBar.OnMenuVisibilityListener;
import android.app.ActionBar.OnNavigationListener;
import android.app.ActionBar.Tab;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;
import android.widget.SpinnerAdapter;
import com.miui.gallery.util.MiscUtil;
import miui.app.ActionBar;
import miui.app.ActionBar.FragmentViewPagerChangeListener;

public class ActionBarWrapper extends ActionBar {
    protected ActionBar mWrapped;

    public ActionBarWrapper(ActionBar actionBar) {
        this.mWrapped = actionBar;
    }

    public int addFragmentTab(String str, Tab tab, int i, Class<? extends Fragment> cls, Bundle bundle, boolean z) {
        return this.mWrapped.addFragmentTab(str, tab, i, cls, bundle, z);
    }

    public int addFragmentTab(String str, Tab tab, Class<? extends Fragment> cls, Bundle bundle, boolean z) {
        return this.mWrapped.addFragmentTab(str, tab, cls, bundle, z);
    }

    public void addOnFragmentViewPagerChangeListener(FragmentViewPagerChangeListener fragmentViewPagerChangeListener) {
        this.mWrapped.addOnFragmentViewPagerChangeListener(fragmentViewPagerChangeListener);
    }

    public void addOnMenuVisibilityListener(OnMenuVisibilityListener onMenuVisibilityListener) {
        this.mWrapped.addOnMenuVisibilityListener(onMenuVisibilityListener);
    }

    public void addTab(Tab tab) {
        this.mWrapped.addTab(tab);
    }

    public void addTab(Tab tab, int i) {
        this.mWrapped.addTab(tab, i);
    }

    public void addTab(Tab tab, int i, boolean z) {
        this.mWrapped.addTab(tab, i, z);
    }

    public void addTab(Tab tab, boolean z) {
        this.mWrapped.addTab(tab, z);
    }

    public View getCustomView() {
        return this.mWrapped.getCustomView();
    }

    public int getDisplayOptions() {
        return this.mWrapped.getDisplayOptions();
    }

    public Fragment getFragmentAt(int i) {
        return this.mWrapped.getFragmentAt(i);
    }

    public int getFragmentTabCount() {
        return this.mWrapped.getFragmentTabCount();
    }

    public int getHeight() {
        return this.mWrapped.getHeight();
    }

    public int getNavigationItemCount() {
        return this.mWrapped.getNavigationItemCount();
    }

    public int getNavigationMode() {
        return this.mWrapped.getNavigationMode();
    }

    public int getSelectedNavigationIndex() {
        return this.mWrapped.getSelectedNavigationIndex();
    }

    public Tab getSelectedTab() {
        return this.mWrapped.getSelectedTab();
    }

    public CharSequence getSubtitle() {
        return this.mWrapped.getSubtitle();
    }

    public Tab getTabAt(int i) {
        return this.mWrapped.getTabAt(i);
    }

    public int getTabCount() {
        return this.mWrapped.getTabCount();
    }

    public CharSequence getTitle() {
        return this.mWrapped.getTitle();
    }

    public int getViewPagerOffscreenPageLimit() {
        return this.mWrapped.getViewPagerOffscreenPageLimit();
    }

    public ActionBar getWrapped() {
        return this.mWrapped;
    }

    public void hide() {
        this.mWrapped.hide();
    }

    public boolean isFragmentViewPagerMode() {
        return this.mWrapped.isFragmentViewPagerMode();
    }

    public boolean isShowing() {
        return this.mWrapped.isShowing();
    }

    public Tab newTab() {
        return this.mWrapped.newTab();
    }

    public void removeAllFragmentTab() {
        this.mWrapped.removeAllFragmentTab();
    }

    public void removeAllTabs() {
        this.mWrapped.removeAllTabs();
    }

    public void removeFragmentTab(Tab tab) {
        this.mWrapped.removeFragmentTab(tab);
    }

    public void removeFragmentTab(Fragment fragment) {
        this.mWrapped.removeFragmentTab(fragment);
    }

    public void removeFragmentTab(String str) {
        this.mWrapped.removeFragmentTab(str);
    }

    public void removeFragmentTabAt(int i) {
        this.mWrapped.removeFragmentTabAt(i);
    }

    public void removeOnFragmentViewPagerChangeListener(FragmentViewPagerChangeListener fragmentViewPagerChangeListener) {
        this.mWrapped.removeOnFragmentViewPagerChangeListener(fragmentViewPagerChangeListener);
    }

    public void removeOnMenuVisibilityListener(OnMenuVisibilityListener onMenuVisibilityListener) {
        this.mWrapped.removeOnMenuVisibilityListener(onMenuVisibilityListener);
    }

    public void removeTab(Tab tab) {
        this.mWrapped.removeTab(tab);
    }

    public void removeTabAt(int i) {
        this.mWrapped.removeTabAt(i);
    }

    public void selectTab(Tab tab) {
        this.mWrapped.selectTab(tab);
    }

    public void setBackgroundDrawable(Drawable drawable) {
        this.mWrapped.setBackgroundDrawable(drawable);
    }

    public void setCustomView(int i) {
        this.mWrapped.setCustomView(i);
    }

    public void setCustomView(View view) {
        this.mWrapped.setCustomView(view);
    }

    public void setCustomView(View view, LayoutParams layoutParams) {
        this.mWrapped.setCustomView(view, layoutParams);
    }

    public void setDisplayHomeAsUpEnabled(boolean z) {
        this.mWrapped.setDisplayHomeAsUpEnabled(z);
    }

    public void setDisplayOptions(int i) {
        this.mWrapped.setDisplayOptions(i);
    }

    public void setDisplayOptions(int i, int i2) {
        this.mWrapped.setDisplayOptions(i, i2);
    }

    public void setDisplayShowCustomEnabled(boolean z) {
        this.mWrapped.setDisplayShowCustomEnabled(z);
    }

    public void setDisplayShowHomeEnabled(boolean z) {
        this.mWrapped.setDisplayShowHomeEnabled(z);
    }

    public void setDisplayShowTitleEnabled(boolean z) {
        this.mWrapped.setDisplayShowTitleEnabled(z);
    }

    public void setDisplayUseLogoEnabled(boolean z) {
        this.mWrapped.setDisplayUseLogoEnabled(z);
    }

    public void setEndView(View view) {
        this.mWrapped.setEndView(view);
    }

    public void setFragmentActionMenuAt(int i, boolean z) {
        this.mWrapped.setFragmentActionMenuAt(i, z);
    }

    public void setFragmentViewPagerMode(Context context, FragmentManager fragmentManager) {
        this.mWrapped.setFragmentViewPagerMode(context, fragmentManager);
    }

    public void setFragmentViewPagerMode(Context context, FragmentManager fragmentManager, boolean z) {
        this.mWrapped.setFragmentViewPagerMode(context, fragmentManager, z);
    }

    public void setIcon(int i) {
        this.mWrapped.setIcon(i);
    }

    public void setIcon(Drawable drawable) {
        this.mWrapped.setIcon(drawable);
    }

    public void setListNavigationCallbacks(SpinnerAdapter spinnerAdapter, OnNavigationListener onNavigationListener) {
        this.mWrapped.setListNavigationCallbacks(spinnerAdapter, onNavigationListener);
    }

    public void setLogo(int i) {
        this.mWrapped.setLogo(i);
    }

    public void setLogo(Drawable drawable) {
        this.mWrapped.setLogo(drawable);
    }

    public void setNavigationMode(int i) {
        this.mWrapped.setNavigationMode(i);
    }

    public void setProgress(int i) {
        this.mWrapped.setProgress(i);
    }

    public void setProgressBarIndeterminate(boolean z) {
        this.mWrapped.setProgressBarIndeterminate(z);
    }

    public void setProgressBarIndeterminateVisibility(boolean z) {
        this.mWrapped.setProgressBarIndeterminateVisibility(z);
    }

    public void setProgressBarVisibility(boolean z) {
        this.mWrapped.setProgressBarVisibility(z);
    }

    public void setSelectedNavigationItem(int i) {
        this.mWrapped.setSelectedNavigationItem(i);
    }

    public void setShowHideAnimationEnabled(boolean z) {
        MiscUtil.invokeSafely(this.mWrapped, "setShowHideAnimationEnabled", new Class[]{Boolean.TYPE}, Boolean.valueOf(z));
    }

    public void setStartView(View view) {
        this.mWrapped.setStartView(view);
    }

    public void setSubtitle(int i) {
        this.mWrapped.setSubtitle(i);
    }

    public void setSubtitle(CharSequence charSequence) {
        this.mWrapped.setSubtitle(charSequence);
    }

    public void setTabBadgeVisibility(int i, boolean z) {
        this.mWrapped.setTabBadgeVisibility(i, z);
    }

    public void setTabsMode(boolean z) {
        this.mWrapped.setTabsMode(z);
    }

    public void setTitle(int i) {
        this.mWrapped.setTitle(i);
    }

    public void setTitle(CharSequence charSequence) {
        this.mWrapped.setTitle(charSequence);
    }

    public void setViewPagerDecor(View view) {
        this.mWrapped.setViewPagerDecor(view);
    }

    public void setViewPagerOffscreenPageLimit(int i) {
        this.mWrapped.setViewPagerOffscreenPageLimit(i);
    }

    public void show() {
        this.mWrapped.show();
    }

    public void showActionBarShadow(boolean z) {
        this.mWrapped.showActionBarShadow(z);
    }

    public void showSplitActionBar(boolean z, boolean z2) {
        this.mWrapped.showSplitActionBar(z, z2);
    }
}
