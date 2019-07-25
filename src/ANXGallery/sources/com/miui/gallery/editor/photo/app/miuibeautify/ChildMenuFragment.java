package com.miui.gallery.editor.photo.app.miuibeautify;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.app.Fragment;
import android.os.Bundle;
import android.view.View;
import com.miui.filtersdk.beauty.BeautyParameterType;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.imports.miuibeauty.MiuiBeautyEffect;
import com.miui.gallery.editor.photo.core.imports.miuibeauty.MiuiBeautyRenderFragment.OnBeautyProcessListener;
import java.util.HashMap;
import java.util.Map;
import miui.view.animation.CubicEaseOutInterpolator;

public class ChildMenuFragment extends Fragment implements OnBeautyProcessListener {
    private static int sAnimAppearDelay;
    private static int sAnimAppearDuration;
    private static int sAnimDisappearDuration;
    private static int sAnimOffset;
    protected Callbacks mCallbacks;
    private Map<BeautyParameterType, Float> mExtraTable = new HashMap();

    public interface Callbacks {
        void changeTitle(String str);

        void onBeautyParameterChanged(ChildMenuFragment childMenuFragment);
    }

    public Map<BeautyParameterType, Float> getBeautyParameterTable() {
        return this.mExtraTable;
    }

    /* access modifiers changed from: protected */
    public final void notifyBeautyParameterChanged() {
        this.mCallbacks.onBeautyParameterChanged(this);
    }

    public void onBeautyProcessEnd() {
    }

    public void onBeautyProcessStart() {
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (sAnimOffset == 0) {
            sAnimOffset = getActivity().getResources().getDimensionPixelSize(R.dimen.photo_editor_enter_sub_editor_sub_menu_offset);
        }
        if (sAnimAppearDuration == 0) {
            sAnimAppearDuration = getActivity().getResources().getInteger(R.integer.photo_editor_sub_editor_sub_menu_appear_duration);
        }
        if (sAnimDisappearDuration == 0) {
            sAnimDisappearDuration = getActivity().getResources().getInteger(R.integer.photo_editor_sub_editor_sub_menu_disappear_duration);
        }
        if (sAnimAppearDelay == 0) {
            sAnimAppearDelay = getActivity().getResources().getInteger(R.integer.photo_editor_sub_editor_sub_menu_appear_delay);
        }
    }

    public Animator onCreateAnimator(int i, boolean z, int i2) {
        ObjectAnimator objectAnimator = new ObjectAnimator();
        if (z) {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{(float) sAnimOffset, 0.0f}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{0.0f, 1.0f})});
            objectAnimator.setDuration((long) sAnimAppearDuration);
            objectAnimator.setStartDelay((long) sAnimAppearDelay);
        } else {
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(View.TRANSLATION_Y, new float[]{0.0f, (float) sAnimOffset}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{1.0f, 0.0f})});
            objectAnimator.setDuration((long) sAnimDisappearDuration);
        }
        objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
        return objectAnimator;
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        view.setAlpha(0.0f);
        Bundle arguments = getArguments();
        if (arguments != null) {
            MiuiBeautyEffect miuiBeautyEffect = (MiuiBeautyEffect) arguments.getParcelable("BEAUTY_EFFECT");
            if (miuiBeautyEffect != null) {
                this.mCallbacks.changeTitle(miuiBeautyEffect.mName);
            }
        }
    }

    public void setBeautyParameterTable(BeautyParameterType beautyParameterType, float f) {
        if (beautyParameterType == BeautyParameterType.BRIGHT_EYE_RATIO) {
            this.mExtraTable.put(BeautyParameterType.IRIS_SHINE_RATIO, Float.valueOf(f));
        }
        this.mExtraTable.put(beautyParameterType, Float.valueOf(f));
    }

    public void setBeautyParameterTable(Map<BeautyParameterType, Float> map) {
        this.mExtraTable = map;
    }

    public void setCallback(Callbacks callbacks) {
        this.mCallbacks = callbacks;
    }
}
