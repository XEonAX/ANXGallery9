package com.miui.gallery.editor.photo.app.miuibeautify;

import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Context;
import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.miui.arcsoftbeauty.ArcsoftBeautyJni;
import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.app.MenuFragment;
import com.miui.gallery.editor.photo.app.RenderRecord;
import com.miui.gallery.editor.photo.app.menu.MiuiBeautyView;
import com.miui.gallery.editor.photo.app.miuibeautify.ChildMenuFragment.Callbacks;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractEffectFragment;
import com.miui.gallery.editor.photo.core.imports.miuibeauty.MiuiBeautifyData;
import com.miui.gallery.editor.photo.core.imports.miuibeauty.MiuiBeautyEffect;
import com.miui.gallery.editor.photo.core.imports.miuibeauty.MiuiBeautyManager;
import com.miui.gallery.editor.photo.core.imports.miuibeauty.MiuiBeautyRenderFragment;
import com.miui.gallery.editor.photo.widgets.CommonBottomMenuWithUndo;
import com.miui.gallery.editor.photo.widgets.overscroll.HorizontalOverScrollBounceEffectDecorator;
import com.miui.gallery.ui.SimpleRecyclerView;
import com.miui.gallery.ui.SimpleRecyclerView.BlankDivider;
import com.miui.gallery.ui.SimpleRecyclerView.OnItemClickListener;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.ToastUtils;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import miui.app.ProgressDialog;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.QuarticEaseOutInterpolator;

public class MiuiBeautyFragment extends MenuFragment<AbstractEffectFragment, SdkProvider<MiuiBeautifyData, AbstractEffectFragment>> implements RenderRecord {
    public static int BEAUTY_RECORDS_MAX = 10;
    private int mAnimAppearDelay;
    private int mAnimAppearDuration;
    private int mAnimDisappearDuration;
    private int mAnimOffset;
    private View mAnimalLayout;
    /* access modifiers changed from: private */
    public List<MiuiBeautifyData> mBeautyParameters;
    /* access modifiers changed from: private */
    public CommonBottomMenuWithUndo mBottomMenuPanel;
    /* access modifiers changed from: private */
    public Callbacks mChildMenuCallback = new Callbacks() {
        public void changeTitle(String str) {
            MiuiBeautyFragment.this.mTitle.setText(str);
        }

        public void onBeautyParameterChanged(ChildMenuFragment childMenuFragment) {
            AbstractEffectFragment abstractEffectFragment = (AbstractEffectFragment) MiuiBeautyFragment.this.getRenderFragment();
            if (abstractEffectFragment instanceof MiuiBeautyRenderFragment) {
                MiuiBeautyRenderFragment miuiBeautyRenderFragment = (MiuiBeautyRenderFragment) abstractEffectFragment;
                abstractEffectFragment.add(null, childMenuFragment.getBeautyParameterTable());
                miuiBeautyRenderFragment.setShowProgressDelay(!(childMenuFragment instanceof SmartBeautyFragment));
                abstractEffectFragment.render();
                if (!miuiBeautyRenderFragment.isComparisonEnable()) {
                    miuiBeautyRenderFragment.enableComparison(true);
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public int mCurrentDataIndex;
    /* access modifiers changed from: private */
    public boolean mDetectFace;
    /* access modifiers changed from: private */
    public boolean mDetectTaskDone;
    /* access modifiers changed from: private */
    public ChildFragmentData[] mFragmentData = new ChildFragmentData[(this.mSdkProvider.list().size() + 1)];
    private int[] mIcons;
    /* access modifiers changed from: private */
    public boolean mInMainLayout = true;
    private OnItemClickListener mOnItemClickListener = new OnItemClickListener() {
        public boolean OnItemClick(RecyclerView recyclerView, View view, int i) {
            ChildFragmentData childFragmentData = MiuiBeautyFragment.this.mFragmentData[i];
            ChildMenuFragment newMenu = childFragmentData.newMenu();
            newMenu.setCallback(MiuiBeautyFragment.this.mChildMenuCallback);
            MiuiBeautyFragment.this.updateView(newMenu);
            AbstractEffectFragment abstractEffectFragment = (AbstractEffectFragment) MiuiBeautyFragment.this.getRenderFragment();
            if (!MiuiBeautyFragment.this.mInMainLayout) {
                return false;
            }
            if (abstractEffectFragment instanceof MiuiBeautyRenderFragment) {
                if (!MiuiBeautyFragment.this.mDetectTaskDone) {
                    Log.d("MiuiBeautyFragment", "detect task not done");
                    return false;
                } else if (childFragmentData.beautyEffect == null || !childFragmentData.beautyEffect.needFace() || MiuiBeautyFragment.this.mDetectFace) {
                    MiuiBeautyRenderFragment miuiBeautyRenderFragment = (MiuiBeautyRenderFragment) abstractEffectFragment;
                    miuiBeautyRenderFragment.setOnBeautyProcessListener(newMenu);
                    MiuiBeautyFragment.this.showAnimal(false);
                    MiuiBeautyFragment.this.getChildFragmentManager().beginTransaction().add(R.id.child_menu_panel, newMenu).commit();
                    miuiBeautyRenderFragment.setCompareOrigin(false);
                    miuiBeautyRenderFragment.enableComparison(false);
                    MiuiBeautyFragment.this.mInMainLayout = false;
                    MiuiBeautyFragment.this.mBottomMenuPanel.updateBottomBar(true);
                    MiuiBeautyFragment.this.mCurrentDataIndex = i;
                    HashMap hashMap = new HashMap();
                    hashMap.put("name", ((MiuiBeautifyData) MiuiBeautyFragment.this.mBeautyParameters.get(MiuiBeautyFragment.this.mCurrentDataIndex)).name);
                    GallerySamplingStatHelper.recordCountEvent("_miuibeautify", "miui_beauty_item_click", hashMap);
                } else {
                    ToastUtils.makeText((Context) MiuiBeautyFragment.this.getActivity(), (int) R.string.photo_editor_miui_beauty_no_face);
                    return true;
                }
            }
            return true;
        }
    };
    private ProgressDialog mProgressDialog;
    private int mRecordCurr = 0;
    private int mRecordHead = 0;
    private int mRecordTail;
    /* access modifiers changed from: private */
    public TextView mTitle;

    private static class ChildFragmentData {
        final MiuiBeautyEffect beautyEffect;
        final Class<? extends ChildMenuFragment> menu;

        public ChildFragmentData(Class<? extends ChildMenuFragment> cls, MiuiBeautyEffect miuiBeautyEffect) {
            this.menu = cls;
            this.beautyEffect = miuiBeautyEffect;
        }

        public ChildMenuFragment newMenu() {
            try {
                ChildMenuFragment childMenuFragment = (ChildMenuFragment) this.menu.newInstance();
                Bundle bundle = new Bundle();
                bundle.putParcelable("BEAUTY_EFFECT", this.beautyEffect);
                childMenuFragment.setArguments(bundle);
                return childMenuFragment;
            } catch (InstantiationException e) {
                Log.w("MiuiBeautyFragment", (Throwable) e);
                throw new IllegalStateException(e);
            } catch (IllegalAccessException e2) {
                Log.w("MiuiBeautyFragment", (Throwable) e2);
                throw new IllegalStateException(e2);
            }
        }
    }

    private static class DetectFaceTask extends AsyncTask<Void, Void, Integer> {
        private WeakReference<MiuiBeautyFragment> mFragmentWeakReference;

        DetectFaceTask(MiuiBeautyFragment miuiBeautyFragment) {
            this.mFragmentWeakReference = new WeakReference<>(miuiBeautyFragment);
        }

        /* access modifiers changed from: protected */
        public Integer doInBackground(Void... voidArr) {
            MiuiBeautyFragment miuiBeautyFragment = (MiuiBeautyFragment) this.mFragmentWeakReference.get();
            return miuiBeautyFragment != null ? Integer.valueOf(miuiBeautyFragment.detectFaceNum()) : Integer.valueOf(0);
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Integer num) {
            super.onPostExecute(num);
            MiuiBeautyFragment miuiBeautyFragment = (MiuiBeautyFragment) this.mFragmentWeakReference.get();
            if (miuiBeautyFragment != null) {
                miuiBeautyFragment.setDetectFace(num.intValue() > 0);
                miuiBeautyFragment.setDetectTaskDone(true);
            }
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
            super.onPreExecute();
        }
    }

    public MiuiBeautyFragment() {
        super(Effect.MIUIBEAUTIFY);
        this.mFragmentData[0] = new ChildFragmentData(SmartBeautyFragment.class, null);
        MiuiBeautyEffect[] beautyEffects = MiuiBeautyManager.getBeautyEffects();
        for (int i = 0; i < beautyEffects.length; i++) {
            if (beautyEffects[i].mBeautyType == BeautyParameterType.WHITEN_STRENGTH) {
                this.mFragmentData[i + 1] = new ChildFragmentData(DoubleParameterBeautyFragment.class, beautyEffects[i]);
            } else if (beautyEffects[i].mBeautyType == BeautyParameterType.DEBLEMISH) {
                this.mFragmentData[i + 1] = new ChildFragmentData(SwitchParameterBeautyFragment.class, beautyEffects[i]);
            } else {
                this.mFragmentData[i + 1] = new ChildFragmentData(SingleParameterBeautyFragment.class, beautyEffects[i]);
            }
        }
    }

    private void backToMainMenu() {
        this.mBottomMenuPanel.updateBottomBar(this.mBottomMenuPanel.isShowTitle());
        this.mInMainLayout = true;
        FragmentManager childFragmentManager = getChildFragmentManager();
        Fragment findFragmentById = childFragmentManager.findFragmentById(R.id.child_menu_panel);
        if (findFragmentById != null) {
            showAnimal(true);
            childFragmentManager.beginTransaction().remove(findFragmentById).commit();
        }
        this.mTitle.setText(R.string.photo_editor_miui_beauty);
    }

    private boolean hasChildFragment() {
        return getChildFragmentManager().findFragmentById(R.id.child_menu_panel) != null;
    }

    private void initAnimal() {
        this.mAnimOffset = getActivity().getResources().getDimensionPixelSize(R.dimen.photo_editor_enter_sub_editor_main_menu_offset);
        this.mAnimAppearDuration = getActivity().getResources().getInteger(R.integer.photo_editor_sub_editor_main_menu_appear_duration);
        this.mAnimDisappearDuration = getActivity().getResources().getInteger(R.integer.photo_editor_sub_editor_main_menu_disappear_duration);
        this.mAnimAppearDelay = getActivity().getResources().getInteger(R.integer.photo_editor_sub_editor_main_menu_appear_delay);
    }

    /* access modifiers changed from: private */
    public void showAnimal(boolean z) {
        ObjectAnimator objectAnimator = new ObjectAnimator();
        if (z) {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{(float) (-this.mAnimOffset), 0.0f}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{0.0f, 1.0f})});
            objectAnimator.setDuration((long) this.mAnimAppearDuration);
            objectAnimator.setStartDelay((long) this.mAnimAppearDelay);
            objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
        } else {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{0.0f, (float) (-this.mAnimOffset)}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{1.0f, 0.0f})});
            objectAnimator.setDuration((long) this.mAnimDisappearDuration);
            objectAnimator.setInterpolator(new QuarticEaseOutInterpolator());
        }
        objectAnimator.setTarget(this.mAnimalLayout);
        objectAnimator.start();
    }

    /* access modifiers changed from: private */
    public void updateView(Object obj) {
        ((MiuiBeautyView) getView()).updateGuideLine(obj);
    }

    public int detectFaceNum() {
        Bitmap preview = getPreview();
        if (preview == null) {
            return 0;
        }
        return ArcsoftBeautyJni.detectFaceNum(preview, preview.getWidth(), preview.getHeight());
    }

    /* access modifiers changed from: protected */
    public void hideProcessDialog() {
        if (this.mProgressDialog != null && this.mProgressDialog.isShowing()) {
            this.mProgressDialog.dismiss();
        }
    }

    public void nextRecord() {
        boolean z = true;
        this.mRecordCurr = (this.mRecordCurr + 1) % BEAUTY_RECORDS_MAX;
        AbstractEffectFragment abstractEffectFragment = (AbstractEffectFragment) getRenderFragment();
        if (abstractEffectFragment instanceof MiuiBeautyRenderFragment) {
            ((MiuiBeautyRenderFragment) abstractEffectFragment).nextRecord();
        }
        CommonBottomMenuWithUndo commonBottomMenuWithUndo = this.mBottomMenuPanel;
        boolean z2 = this.mRecordCurr != this.mRecordHead;
        if (this.mRecordCurr == this.mRecordTail) {
            z = false;
        }
        commonBottomMenuWithUndo.onMenuUpdated(z2, z);
    }

    /* access modifiers changed from: protected */
    public void notifyDiscard() {
        if (hasChildFragment()) {
            AbstractEffectFragment abstractEffectFragment = (AbstractEffectFragment) getRenderFragment();
            abstractEffectFragment.add(null, null);
            abstractEffectFragment.render();
            if (abstractEffectFragment instanceof MiuiBeautyRenderFragment) {
                MiuiBeautyRenderFragment miuiBeautyRenderFragment = (MiuiBeautyRenderFragment) abstractEffectFragment;
                miuiBeautyRenderFragment.setCompareOrigin(true);
                if (miuiBeautyRenderFragment.isEmpty()) {
                    miuiBeautyRenderFragment.enableComparison(false);
                }
            }
            backToMainMenu();
            return;
        }
        super.notifyDiscard();
    }

    /* access modifiers changed from: protected */
    public void notifySave() {
        if (hasChildFragment()) {
            AbstractEffectFragment abstractEffectFragment = (AbstractEffectFragment) getRenderFragment();
            if (abstractEffectFragment instanceof MiuiBeautyRenderFragment) {
                MiuiBeautyRenderFragment miuiBeautyRenderFragment = (MiuiBeautyRenderFragment) abstractEffectFragment;
                if (miuiBeautyRenderFragment.isBeautyParamWorked()) {
                    miuiBeautyRenderFragment.recordCurrent();
                    recordCurrent();
                    this.mBottomMenuPanel.onMenuUpdated(this.mRecordCurr != this.mRecordHead, false);
                    miuiBeautyRenderFragment.setCompareOrigin(true);
                    HashMap hashMap = new HashMap();
                    hashMap.put("name", ((MiuiBeautifyData) this.mBeautyParameters.get(this.mCurrentDataIndex)).name);
                    GallerySamplingStatHelper.recordCountEvent("_miuibeautify", "miui_beauty_item_save", hashMap);
                }
            }
            backToMainMenu();
            return;
        }
        super.notifySave();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        ArrayList arrayList = new ArrayList(this.mSdkProvider.list());
        this.mBeautyParameters = new ArrayList(arrayList.size() + 1);
        this.mBeautyParameters.add(new SmartBeautyData(0, getActivity().getString(R.string.photo_editor_miui_beauty_menu_smart_beauty)));
        this.mBeautyParameters.addAll(arrayList);
        this.mIcons = new int[]{R.drawable.icon_smart_beauty, R.drawable.icon_beauty_face_thin, R.drawable.icon_beauty_skin_white, R.drawable.icon_beauty_smooth, R.drawable.icon_beauty_eye_large, R.drawable.icon_beauty_eye_bright, R.drawable.icon_beauty_depouch, R.drawable.icon_beauty_deblemish, R.drawable.icon_beauty_relighting, R.drawable.icon_beauty_nose_thin, R.drawable.icon_beauty_lips};
    }

    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return new MiuiBeautyView(viewGroup.getContext());
    }

    public void onDetach() {
        super.onDetach();
        if (this.mProgressDialog != null && this.mProgressDialog.isShowing()) {
            this.mProgressDialog.dismiss();
        }
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        BeautyParameterAdapter beautyParameterAdapter = new BeautyParameterAdapter(this.mBeautyParameters, this.mIcons);
        SimpleRecyclerView simpleRecyclerView = (SimpleRecyclerView) view.findViewById(R.id.parameter_list);
        simpleRecyclerView.setAdapter(beautyParameterAdapter);
        beautyParameterAdapter.setOnItemClickListener(this.mOnItemClickListener);
        simpleRecyclerView.addItemDecoration(new BlankDivider(getResources(), R.dimen.photo_editor_navigator_left_margin, 0));
        HorizontalOverScrollBounceEffectDecorator.setOverScrollEffect(simpleRecyclerView);
        this.mBottomMenuPanel = (CommonBottomMenuWithUndo) view.findViewById(R.id.bottom_bar);
        this.mBottomMenuPanel.setTitle(R.string.photo_editor_miui_beauty);
        this.mBottomMenuPanel.setRenderRecordListener(this);
        this.mBottomMenuPanel.updateBottomBar(true);
        this.mAnimalLayout = view.findViewById(R.id.layout);
        this.mTitle = (TextView) view.findViewById(R.id.title);
        initAnimal();
        new DetectFaceTask(this).execute(new Void[0]);
    }

    public void previousRecord() {
        boolean z = true;
        this.mRecordCurr = (this.mRecordCurr - 1) % BEAUTY_RECORDS_MAX;
        if (this.mRecordCurr < 0) {
            this.mRecordCurr += 10;
        }
        AbstractEffectFragment abstractEffectFragment = (AbstractEffectFragment) getRenderFragment();
        if (abstractEffectFragment instanceof MiuiBeautyRenderFragment) {
            ((MiuiBeautyRenderFragment) abstractEffectFragment).previousRecord();
        }
        CommonBottomMenuWithUndo commonBottomMenuWithUndo = this.mBottomMenuPanel;
        boolean z2 = this.mRecordCurr != this.mRecordHead;
        if (this.mRecordCurr == this.mRecordTail) {
            z = false;
        }
        commonBottomMenuWithUndo.onMenuUpdated(z2, z);
    }

    public void recordCurrent() {
        this.mRecordCurr = (this.mRecordCurr + 1) % BEAUTY_RECORDS_MAX;
        this.mRecordTail = this.mRecordCurr;
        if (this.mRecordCurr == this.mRecordHead) {
            this.mRecordHead = (this.mRecordCurr + 1) % BEAUTY_RECORDS_MAX;
        }
    }

    public void setDetectFace(boolean z) {
        this.mDetectFace = z;
    }

    public void setDetectTaskDone(boolean z) {
        this.mDetectTaskDone = z;
    }

    /* access modifiers changed from: protected */
    public void showProcessDialog() {
        this.mProgressDialog = new ProgressDialog(getActivity());
        this.mProgressDialog.setMessage(getActivity().getString(R.string.photo_editor_saving));
        this.mProgressDialog.setCanceledOnTouchOutside(false);
        this.mProgressDialog.setIndeterminate(true);
        this.mProgressDialog.show();
    }
}
