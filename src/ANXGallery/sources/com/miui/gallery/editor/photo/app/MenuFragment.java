package com.miui.gallery.editor.photo.app;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.app.Fragment;
import android.app.FragmentTransaction;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.os.Handler;
import android.util.Property;
import android.view.View;
import android.view.View.OnClickListener;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.core.RenderFragment;
import com.miui.gallery.editor.photo.core.SdkManager;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.util.Log;
import java.util.List;
import miui.app.ProgressDialog;
import miui.view.animation.CubicEaseOutInterpolator;

public abstract class MenuFragment<F extends RenderFragment, P extends SdkProvider<?, F>> extends EditorFragment {
    private static final Property<View, Float> VIEW_RELATIVE_Y = new Property<View, Float>(Float.class, "relative_y") {
        public Float get(View view) {
            return null;
        }

        public void set(View view, Float f) {
            view.setY((((float) ((View) view.getParent()).getHeight()) - ((float) view.getHeight())) + f.floatValue());
        }
    };
    private static int sAnimAppearDelay;
    private static int sAnimAppearDuration;
    private static int sAnimDisappearDuration;
    private static int sAnimOffset;
    Callbacks mCallbacks;
    private View mDiscardBtn;
    Effect<?> mEffect;
    private Fragment mGestureFragment;
    private OnClickListener mOnClickListener = new OnClickListener() {
        public void onClick(View view) {
            if (view.getId() == R.id.ok) {
                MenuFragment.this.notifySave();
            } else if (view.getId() == R.id.cancel) {
                MenuFragment.this.notifyDiscard();
            }
        }
    };
    private com.miui.gallery.editor.photo.core.RenderFragment.Callbacks mRenderCallbacks = new com.miui.gallery.editor.photo.core.RenderFragment.Callbacks() {
    };
    private F mRenderFragment;
    private View mSaveBtn;
    protected final P mSdkProvider;

    public interface Callbacks {
        void onDiscard(MenuFragment menuFragment);

        Bitmap onLoadOrigin();

        Bitmap onLoadPreview();

        List<RenderData> onLoadRenderData();

        void onSave(MenuFragment menuFragment);
    }

    public MenuFragment(Effect<P> effect) {
        this.mEffect = effect;
        this.mSdkProvider = SdkManager.INSTANCE.getProvider(effect);
    }

    /* access modifiers changed from: protected */
    public Fragment createGestureFragment() {
        return null;
    }

    /* access modifiers changed from: 0000 */
    public F createRenderFragment() {
        return this.mSdkProvider.createFragment();
    }

    /* access modifiers changed from: protected */
    public final Bitmap decodeOrigin() {
        return this.mCallbacks.onLoadOrigin();
    }

    /* access modifiers changed from: protected */
    public final ProgressDialog genProgressDialog(String str) {
        ProgressDialog progressDialog = new ProgressDialog(getActivity());
        progressDialog.setMessage(str);
        progressDialog.setCanceledOnTouchOutside(false);
        progressDialog.setCancelable(false);
        progressDialog.setIndeterminate(true);
        return progressDialog;
    }

    /* access modifiers changed from: protected */
    public final Fragment getGestureFragment() {
        return this.mGestureFragment;
    }

    /* access modifiers changed from: protected */
    public final List<RenderData> getPreRenderData() {
        return this.mCallbacks.onLoadRenderData();
    }

    /* access modifiers changed from: protected */
    public final Bitmap getPreview() {
        return this.mCallbacks.onLoadPreview();
    }

    /* access modifiers changed from: protected */
    public final F getRenderFragment() {
        return this.mRenderFragment;
    }

    /* access modifiers changed from: protected */
    public void hideProcessDialog() {
    }

    /* access modifiers changed from: protected */
    public void notifyDiscard() {
        this.mCallbacks.onDiscard(this);
    }

    /* access modifiers changed from: protected */
    public void notifySave() {
        new Handler().postDelayed(new Runnable() {
            public void run() {
                if (MenuFragment.this.isAdded()) {
                    MenuFragment.this.showProcessDialog();
                }
            }
        }, 1000);
        this.mCallbacks.onSave(this);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Log.d("MenuFragment", "MenuFragment onCreate");
        this.mRenderFragment = (RenderFragment) getFragmentManager().getFragment(getArguments(), "MenuFragment:display_fragment");
        this.mGestureFragment = getFragmentManager().getFragment(getArguments(), "MenuFragment:gesture_fragment");
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
            objectAnimator.setValues(new PropertyValuesHolder[]{PropertyValuesHolder.ofFloat(VIEW_RELATIVE_Y, new float[]{0.0f, (float) sAnimOffset}), PropertyValuesHolder.ofFloat(View.ALPHA, new float[]{1.0f, 0.0f})});
            objectAnimator.setDuration((long) sAnimDisappearDuration);
        }
        objectAnimator.setInterpolator(new CubicEaseOutInterpolator());
        return objectAnimator;
    }

    public void onDestroy() {
        super.onDestroy();
        this.mRenderFragment = null;
    }

    public void onDestroyView() {
        super.onDestroyView();
        if (!getFragmentManager().isDestroyed()) {
            FragmentTransaction beginTransaction = getFragmentManager().beginTransaction();
            beginTransaction.detach(this.mRenderFragment);
            if (this.mGestureFragment != null) {
                beginTransaction.detach(this.mGestureFragment);
            }
            beginTransaction.commit();
        }
    }

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        view.setAlpha(0.0f);
        this.mSaveBtn = view.findViewById(R.id.ok);
        if (this.mSaveBtn != null) {
            this.mSaveBtn.setOnClickListener(this.mOnClickListener);
        }
        this.mDiscardBtn = view.findViewById(R.id.cancel);
        if (this.mDiscardBtn != null) {
            this.mDiscardBtn.setOnClickListener(this.mOnClickListener);
        }
        Bitmap preview = getPreview();
        String str = "MenuFragment";
        String str2 = "MenuFragment onViewCreated and preview bitmap : %s width : %d height : %d";
        int i = -1;
        Integer valueOf = Integer.valueOf(preview == null ? -1 : preview.getWidth());
        if (preview != null) {
            i = preview.getHeight();
        }
        Log.d(str, str2, preview, valueOf, Integer.valueOf(i));
        this.mRenderFragment.setBitmap(preview);
        this.mRenderFragment.setBitmapRatio(preview);
        FragmentTransaction beginTransaction = getFragmentManager().beginTransaction();
        beginTransaction.attach(this.mRenderFragment);
        if (this.mGestureFragment != null) {
            beginTransaction.attach(this.mGestureFragment);
        }
        beginTransaction.commit();
    }

    /* access modifiers changed from: protected */
    public void showProcessDialog() {
    }
}
