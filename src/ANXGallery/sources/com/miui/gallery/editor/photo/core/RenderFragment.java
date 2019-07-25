package com.miui.gallery.editor.photo.core;

import android.app.Activity;
import android.app.Fragment;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.View;
import com.miui.gallery.editor.photo.utils.Attachable;
import com.miui.gallery.util.Log;
import java.util.List;

public abstract class RenderFragment extends Fragment {
    private Bitmap mBitmap;
    protected Effect<?> mEffect;
    private boolean mIsNear3V4;

    public interface Callbacks {
    }

    public abstract void clear();

    public final RenderData export() {
        if (isEmpty()) {
            return null;
        }
        RenderData onExport = onExport();
        onExport.mType = this.mEffect;
        return onExport;
    }

    public Bitmap getBitmap() {
        return this.mBitmap;
    }

    public int getUnSupportStringRes() {
        return 0;
    }

    public abstract boolean isEmpty();

    public boolean isNear3V4() {
        return this.mIsNear3V4;
    }

    public boolean isSupportAnimation() {
        return false;
    }

    public boolean isSupportBitmap(Bitmap bitmap) {
        return true;
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        Fragment parentFragment = getParentFragment();
        if (parentFragment instanceof Attachable) {
            ((Attachable) parentFragment).attach(this);
        }
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Log.d("RenderFragment", "RenderFragment onCreate");
        if (this.mEffect == null) {
            this.mEffect = Effect.values()[getArguments().getInt("RenderFragment:effect")];
        }
    }

    public void onDestroyView() {
        super.onDestroyView();
        this.mBitmap = null;
        clear();
    }

    /* access modifiers changed from: protected */
    public abstract RenderData onExport();

    /* access modifiers changed from: protected */
    public abstract List<String> onSample();

    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        Log.d("RenderFragment", "RenderFragment onViewCreated");
    }

    public final List<String> sample() {
        return onSample();
    }

    public void setArguments(Bundle bundle) {
        Bundle arguments = getArguments();
        if (arguments == null || arguments.isEmpty()) {
            super.setArguments(bundle);
        } else {
            arguments.putAll(bundle);
        }
    }

    public void setBitmap(Bitmap bitmap) {
        this.mBitmap = bitmap;
    }

    public void setBitmapRatio(Bitmap bitmap) {
        if (bitmap != null) {
            float width = ((float) bitmap.getWidth()) / ((float) bitmap.getHeight());
            this.mIsNear3V4 = Math.abs(width - 0.75f) <= Math.abs(width - 0.5625f);
        }
    }
}
