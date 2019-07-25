package com.miui.gallery.editor.photo.app.filter;

import com.xiaomi.skytransfer.SkyTranFilter;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;

/* renamed from: com.miui.gallery.editor.photo.app.filter.-$$Lambda$FilterFragment$FilterPagerAdapter$1$6f9ZM2CW3zNM58eDglT7_IlvAI8 reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$FilterFragment$FilterPagerAdapter$1$6f9ZM2CW3zNM58eDglT7_IlvAI8 implements ObservableOnSubscribe {
    public static final /* synthetic */ $$Lambda$FilterFragment$FilterPagerAdapter$1$6f9ZM2CW3zNM58eDglT7_IlvAI8 INSTANCE = new $$Lambda$FilterFragment$FilterPagerAdapter$1$6f9ZM2CW3zNM58eDglT7_IlvAI8();

    private /* synthetic */ $$Lambda$FilterFragment$FilterPagerAdapter$1$6f9ZM2CW3zNM58eDglT7_IlvAI8() {
    }

    public final void subscribe(ObservableEmitter observableEmitter) {
        observableEmitter.onNext(Boolean.valueOf(SkyTranFilter.getInstance().waitSegment()));
    }
}
