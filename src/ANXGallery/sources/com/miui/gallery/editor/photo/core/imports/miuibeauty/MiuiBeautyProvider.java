package com.miui.gallery.editor.photo.core.imports.miuibeauty;

import android.content.Context;
import com.miui.gallery.editor.photo.core.Effect;
import com.miui.gallery.editor.photo.core.Metadata;
import com.miui.gallery.editor.photo.core.RenderEngine;
import com.miui.gallery.editor.photo.core.RenderFragment;
import com.miui.gallery.editor.photo.core.RenderScript.Translator;
import com.miui.gallery.editor.photo.core.SdkManager;
import com.miui.gallery.editor.photo.core.SdkProvider;
import com.miui.gallery.editor.photo.core.common.fragment.AbstractEffectFragment;
import java.util.ArrayList;
import java.util.List;

public class MiuiBeautyProvider<T extends Metadata> extends SdkProvider<T, AbstractEffectFragment> {
    static MiuiBeautyProvider<MiuiBeautifyData> sMiuiBeautify = new MiuiBeautyProvider<MiuiBeautifyData>(Effect.MIUIBEAUTIFY) {
        public List<? extends MiuiBeautifyData> list() {
            ArrayList arrayList = new ArrayList();
            MiuiBeautyEffect[] beautyEffects = MiuiBeautyManager.getBeautyEffects();
            for (MiuiBeautyEffect miuiBeautyEffect : beautyEffects) {
                arrayList.add(new MiuiBeautifyData((short) miuiBeautyEffect.mOrdinal, miuiBeautyEffect.mName, miuiBeautyEffect.mBeautyType));
            }
            return arrayList;
        }

        /* access modifiers changed from: protected */
        public /* bridge */ /* synthetic */ RenderFragment onCreateFragment() {
            return MiuiBeautyProvider.super.onCreateFragment();
        }

        /* access modifiers changed from: protected */
        public Translator onCreateTranslator() {
            return MiuiBeautyProvider.super.onCreateTranslator();
        }

        public String toString() {
            return "sMiuiBeautify";
        }
    };

    static {
        SdkManager.INSTANCE.register(sMiuiBeautify);
    }

    protected MiuiBeautyProvider(Effect<? extends SdkProvider<T, AbstractEffectFragment>> effect) {
        super(effect);
    }

    public RenderEngine createEngine(Context context) {
        return new MiuiBeautyEngine();
    }

    public List<? extends T> list() {
        return null;
    }

    /* access modifiers changed from: protected */
    public void onActivityCreate() {
        super.onActivityCreate();
        notifyInitializeFinish();
    }

    /* access modifiers changed from: protected */
    public AbstractEffectFragment onCreateFragment() {
        return new MiuiBeautyRenderFragment();
    }
}
