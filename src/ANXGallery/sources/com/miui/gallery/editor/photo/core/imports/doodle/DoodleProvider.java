package com.miui.gallery.editor.photo.core.imports.doodle;

import android.content.Context;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.RenderEngine;
import com.miui.gallery.editor.photo.core.SdkManager;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractDoodleFragment;
import com.miui.gallery.editor.photo.core.common.model.DoodleData;
import java.util.List;

class DoodleProvider extends SdkProvider<DoodleData, AbstractDoodleFragment> {
    private List<DoodleData> mDoodleDataList;

    static {
        SdkManager.INSTANCE.register(new DoodleProvider());
    }

    private DoodleProvider() {
        super(Effect.DOODLE);
    }

    private void initialize() {
        this.mDoodleDataList = DoodleManager.getDoodleData();
        notifyInitializeFinish();
    }

    public RenderEngine createEngine(Context context) {
        return new DoodleEngine();
    }

    public List<DoodleData> list() {
        return this.mDoodleDataList;
    }

    /* access modifiers changed from: protected */
    public void onActivityCreate() {
        super.onActivityCreate();
        initialize();
    }

    /* access modifiers changed from: protected */
    public AbstractDoodleFragment onCreateFragment() {
        return new DoodleFragment();
    }
}
