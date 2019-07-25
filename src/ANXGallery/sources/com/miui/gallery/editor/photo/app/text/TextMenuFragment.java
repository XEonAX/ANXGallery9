package com.miui.gallery.editor.photo.app.text;

import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.TextView;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.app.MenuFragment;
import com.miui.gallery.editor.photo.app.menu.WaterMarkView;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractEffectFragment;
import com.miui.gallery.editor.photo.core.common.provider.AbstractTextProvider;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.editor.photo.widgets.recyclerview.ScrollControlLinearLayoutManager;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.editor.photo.widgets.recyclerview.SimpleRecyclerView.OnItemClickListener;
import java.util.ArrayList;
import java.util.List;

public class TextMenuFragment extends MenuFragment<AbstractEffectFragment, AbstractTextProvider> {
    private OnItemClickListener mBubbleItemClickListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            ((AbstractEffectFragment) TextMenuFragment.this.getRenderFragment()).add(TextMenuFragment.this.mTextBubbleAdapter.getItemData(i), Integer.valueOf(i));
            TextMenuFragment.this.mTextBubbleAdapter.setSelection(i);
            TextMenuFragment.this.mTextWatermarkAdapter.setSelection(-1);
            ScrollControlLinearLayoutManager.onItemClick(recyclerView, i);
            return true;
        }
    };
    private RadioGroup mRadioGroup;
    /* access modifiers changed from: private */
    public TextBubbleAdapter mTextBubbleAdapter;
    /* access modifiers changed from: private */
    public TextBubbleAdapter mTextWatermarkAdapter;
    /* access modifiers changed from: private */
    public ViewPager mViewPager;
    private OnItemClickListener mWatermarkItemClickListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            ((AbstractEffectFragment) TextMenuFragment.this.getRenderFragment()).add(TextMenuFragment.this.mTextWatermarkAdapter.getItemData(i), Integer.valueOf(TextMenuFragment.this.mTextBubbleAdapter.getItemCount() + i));
            TextMenuFragment.this.mTextWatermarkAdapter.setSelection(i);
            TextMenuFragment.this.mTextBubbleAdapter.setSelection(-1);
            ScrollControlLinearLayoutManager.onItemClick(recyclerView, i);
            return true;
        }
    };

    private class TextPagerAdapter extends PagerAdapter {
        private List<TextBubbleAdapter> mAdapterList = new ArrayList(2);

        public TextPagerAdapter() {
            this.mAdapterList.add(TextMenuFragment.this.mTextBubbleAdapter);
            this.mAdapterList.add(TextMenuFragment.this.mTextWatermarkAdapter);
        }

        public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
            viewGroup.removeView((View) obj);
        }

        public int getCount() {
            return this.mAdapterList.size();
        }

        public Object instantiateItem(ViewGroup viewGroup, int i) {
            SimpleRecyclerView simpleRecyclerView = new SimpleRecyclerView(TextMenuFragment.this.getActivity());
            ScrollControlLinearLayoutManager scrollControlLinearLayoutManager = new ScrollControlLinearLayoutManager(TextMenuFragment.this.getActivity());
            scrollControlLinearLayoutManager.setOrientation(0);
            simpleRecyclerView.setLayoutManager(scrollControlLinearLayoutManager);
            viewGroup.addView(simpleRecyclerView);
            simpleRecyclerView.setAdapter((TextBubbleAdapter) this.mAdapterList.get(i));
            simpleRecyclerView.addItemDecoration(new BlankDivider(TextMenuFragment.this.getResources(), R.dimen.editor_menu_text_view_pager_horizontal_interval, 0));
            HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(simpleRecyclerView);
            return simpleRecyclerView;
        }

        public boolean isViewFromObject(View view, Object obj) {
            return view == obj;
        }
    }

    public TextMenuFragment() {
        super(Effect.TEXT);
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return new WaterMarkView(viewGroup.getContext());
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.mTextBubbleAdapter = new TextBubbleAdapter(getActivity(), ((AbstractTextProvider) this.mSdkProvider).list(), 0);
        this.mTextBubbleAdapter.setOnItemClickListener(this.mBubbleItemClickListener);
        this.mTextWatermarkAdapter = new TextBubbleAdapter(getActivity(), ((AbstractTextProvider) this.mSdkProvider).listWatermark(), -1);
        this.mTextWatermarkAdapter.setOnItemClickListener(this.mWatermarkItemClickListener);
        ((TextView) view.findViewById(R.id.title)).setText(R.string.photo_editor_text);
        this.mRadioGroup = (RadioGroup) view.findViewById(R.id.radio_group_controller);
        this.mRadioGroup.setOnCheckedChangeListener(new OnCheckedChangeListener() {
            public void onCheckedChanged(RadioGroup radioGroup, int i) {
                if (i == R.id.radio_button_bubble) {
                    TextMenuFragment.this.mViewPager.setCurrentItem(0, true);
                } else if (i == R.id.radio_button_watermark) {
                    TextMenuFragment.this.mViewPager.setCurrentItem(1, true);
                }
            }
        });
        this.mRadioGroup.check(R.id.radio_button_bubble);
        this.mViewPager = (ViewPager) view.findViewById(R.id.view_pager);
        this.mViewPager.setOffscreenPageLimit(1);
        this.mViewPager.setAdapter(new TextPagerAdapter());
        this.mViewPager.setCurrentItem(0, false);
    }
}
