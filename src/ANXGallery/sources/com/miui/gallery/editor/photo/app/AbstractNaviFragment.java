package com.miui.gallery.editor.photo.app;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.app.Fragment;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Property;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import miui.view.animation.CubicEaseOutInterpolator;
import miui.view.animation.QuarticEaseOutInterpolator;

public abstract class AbstractNaviFragment extends Fragment {
    private static final Property<View, Float> VIEW_RELATIVE_Y = new Property<View, Float>(Float.class, "relative_y") {
        public Float get(View view) {
            return null;
        }

        public void set(View view, Float f) {
            view.setY(((float) (((View) view.getParent()).getHeight() - view.getHeight())) + f.floatValue());
        }
    };
    private static int sAnimAppearDelay;
    private static int sAnimAppearDuration;
    private static int sAnimDisappearDuration;
    private static int sAnimOffset;
    Callbacks mCallbacks;
    private OnClickListener mClickListener = new OnClickListener() {
        public void onClick(View view) {
            if (view.getId() == R.id.export) {
                AbstractNaviFragment.this.mCallbacks.onExport();
            } else if (view.getId() == R.id.discard) {
                AbstractNaviFragment.this.mCallbacks.onDiscard();
            } else {
                throw new IllegalStateException("not support view");
            }
        }
    };
    private List<NavigatorData> mData;
    private boolean mExportable;
    private boolean mNavigatorCreated;
    private NavigatorData[] mSupportedData = new NavigatorData[Effect.values().length];

    interface Callbacks {
        void onDiscard();

        void onExport();

        void onNavigate(Effect effect);
    }

    protected static class NavigatorData {
        public final Effect effect;
        public final int icon;
        public final boolean isPlugin;
        public final int name;
        public final String pluginModuleName;

        NavigatorData(int i, int i2, Effect effect2) {
            this(i, i2, effect2, null);
        }

        NavigatorData(int i, int i2, Effect effect2, String str) {
            this.icon = i;
            this.name = i2;
            this.effect = effect2;
            this.pluginModuleName = str;
            this.isPlugin = !TextUtils.isEmpty(str);
        }
    }

    public AbstractNaviFragment() {
        this.mSupportedData[Effect.FILTER.ordinal()] = new NavigatorData(R.drawable.navigator_icon_filter, R.string.photo_editor_filter, Effect.FILTER);
        this.mSupportedData[Effect.ADJUST.ordinal()] = new NavigatorData(R.drawable.navigator_icon_adjust, R.string.photo_editor_adjust, Effect.ADJUST);
        this.mSupportedData[Effect.CROP.ordinal()] = new NavigatorData(R.drawable.navigator_icon_crop, R.string.photo_editor_crop_and_rotate, Effect.CROP);
        this.mSupportedData[Effect.DOODLE.ordinal()] = new NavigatorData(R.drawable.navigator_icon_doodle, R.string.photo_editor_doodle, Effect.DOODLE);
        this.mSupportedData[Effect.STICKER.ordinal()] = new NavigatorData(R.drawable.navigator_icon_sticker, R.string.photo_editor_sticker, Effect.STICKER);
        this.mSupportedData[Effect.BEAUTIFY.ordinal()] = new NavigatorData(R.drawable.navigator_icon_beautify, R.string.photo_editor_beautify, Effect.BEAUTIFY);
        this.mSupportedData[Effect.LONG_CROP.ordinal()] = new NavigatorData(R.drawable.navigator_icon_crop, R.string.photo_editor_long_crop, Effect.LONG_CROP);
        this.mSupportedData[Effect.TEXT.ordinal()] = new NavigatorData(R.drawable.navigator_icon_text, R.string.photo_editor_text, Effect.TEXT);
        this.mSupportedData[Effect.MOSAIC.ordinal()] = new NavigatorData(R.drawable.navigator_icon_mosaic, R.string.photo_editor_mosaic, Effect.MOSAIC);
        this.mSupportedData[Effect.REMOVER.ordinal()] = new NavigatorData(R.drawable.navigator_icon_remover, R.string.photo_editor_remover, Effect.REMOVER);
        this.mSupportedData[Effect.MIUIBEAUTIFY.ordinal()] = new NavigatorData(R.drawable.icon_miui_beauty, R.string.photo_editor_miui_beauty, Effect.MIUIBEAUTIFY);
        this.mSupportedData[Effect.FRAME.ordinal()] = new NavigatorData(R.drawable.navigator_icon_frame, R.string.photo_editor_frame, Effect.FRAME);
    }

    private void initialize() {
        ArrayList integerArrayList = getArguments().getIntegerArrayList("content");
        this.mData = new ArrayList();
        Iterator it = integerArrayList.iterator();
        while (it.hasNext()) {
            int intValue = ((Integer) it.next()).intValue();
            if (intValue > this.mSupportedData.length) {
                StringBuilder sb = new StringBuilder();
                sb.append("invalid effect index of ");
                sb.append(intValue);
                Log.w("AbstractNaviFragment", sb.toString());
            } else {
                this.mData.add(this.mSupportedData[intValue]);
            }
        }
    }

    /* access modifiers changed from: protected */
    public final List<NavigatorData> getNaviData() {
        return this.mData;
    }

    /* access modifiers changed from: protected */
    public final void notifyNavigate(Effect effect) {
        this.mCallbacks.onNavigate(effect);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (this.mCallbacks != null) {
            if (sAnimOffset == 0) {
                sAnimOffset = getActivity().getResources().getDimensionPixelSize(R.dimen.photo_editor_enter_sub_editor_main_menu_offset);
            }
            if (sAnimAppearDuration == 0) {
                sAnimAppearDuration = getActivity().getResources().getInteger(R.integer.photo_editor_sub_editor_main_menu_appear_duration);
            }
            if (sAnimDisappearDuration == 0) {
                sAnimDisappearDuration = getActivity().getResources().getInteger(R.integer.photo_editor_sub_editor_main_menu_disappear_duration);
            }
            if (sAnimAppearDelay == 0) {
                sAnimAppearDelay = getActivity().getResources().getInteger(R.integer.photo_editor_sub_editor_main_menu_appear_delay);
            }
            initialize();
            return;
        }
        throw new IllegalStateException("illegal state: no callbacks bound");
    }

    public Animator onCreateAnimator(int i, boolean z, int i2) {
        StringBuilder sb = new StringBuilder();
        sb.append("onCreateAnimator:");
        sb.append(i);
        sb.append(":");
        sb.append(z);
        sb.append(":");
        sb.append(i2);
        Log.d("AbstractNaviFragment", sb.toString());
        if (8194 == i && z) {
            return null;
        }
        ObjectAnimator objectAnimator = new ObjectAnimator();
        if (z) {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{(float) (-sAnimOffset), 0.0f}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{0.0f, 1.0f})});
            objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
            getView().setAlpha(0.0f);
            objectAnimator.setStartDelay((long) sAnimAppearDelay);
            objectAnimator.setDuration((long) sAnimAppearDuration);
        } else {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(VIEW_RELATIVE_Y, new float[]{0.0f, (float) (-sAnimOffset)}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{1.0f, 0.0f})});
            objectAnimator.setInterpolator(new QuarticEaseOutInterpolator());
            objectAnimator.setDuration((long) sAnimDisappearDuration);
        }
        return objectAnimator;
    }

    /* access modifiers changed from: protected */
    public View onCreateNavigator(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return null;
    }

    public final View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View onCreateNavigator = onCreateNavigator(layoutInflater, viewGroup, bundle);
        this.mNavigatorCreated = onCreateNavigator != null;
        return onCreateNavigator;
    }

    /* access modifiers changed from: protected */
    public void onNavigatorCreated(View view, Bundle bundle) {
    }

    public final void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        if (this.mNavigatorCreated) {
            onNavigatorCreated(view, bundle);
        }
        View findViewById = view.findViewById(R.id.export);
        findViewById.setEnabled(this.mExportable);
        findViewById.setOnClickListener(this.mClickListener);
        view.findViewById(R.id.discard).setOnClickListener(this.mClickListener);
    }

    /* access modifiers changed from: 0000 */
    public void setExportEnabled(boolean z) {
        if (getView() != null) {
            getView().findViewById(R.id.export).setEnabled(z);
            getView().findViewById(R.id.export).setClickable(z);
        } else {
            Log.w("AbstractNaviFragment", "shouldn't call when not visible");
        }
        this.mExportable = z;
    }
}
