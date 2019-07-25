package com.miui.gallery.editor.photo.core.imports.remover;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.RenderEngine;
import com.miui.gallery.editor.photo.core.SdkManager;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractRemoverFragment;
import com.miui.gallery.editor.photo.core.common.model.RemoverData;
import java.util.Arrays;
import java.util.List;

public class RemoverProvider extends SdkProvider<RemoverData, AbstractRemoverFragment> {
    static {
        SdkManager.INSTANCE.register(new RemoverProvider());
    }

    protected RemoverProvider() {
        super(Effect.REMOVER);
    }

    public RenderEngine createEngine(Context context) {
        return new RemoverEngine();
    }

    public List<RemoverData> list() {
        return Arrays.asList(new RemoverData[]{new RemoverData(0, getApplicationContext().getString(R.string.remover_edit_type_free), R.drawable.icon_remove_dust, 0), new RemoverData(1, getApplicationContext().getString(R.string.remover_edit_type_line), R.drawable.icon_remove_line, 1)});
    }

    /* access modifiers changed from: protected */
    public void onActivityCreate() {
        super.onActivityCreate();
        notifyInitializeFinish();
    }

    /* access modifiers changed from: protected */
    public AbstractRemoverFragment onCreateFragment() {
        return new RemoverRenderFragment();
    }
}
