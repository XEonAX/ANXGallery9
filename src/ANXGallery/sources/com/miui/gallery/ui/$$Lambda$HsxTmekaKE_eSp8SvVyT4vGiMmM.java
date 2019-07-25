package com.miui.gallery.ui;

import com.miui.gallery.provider.PeopleFaceSnapshotHelper;
import io.reactivex.functions.Function;
import java.util.List;

/* renamed from: com.miui.gallery.ui.-$$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM implements Function {
    public static final /* synthetic */ $$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM INSTANCE = new $$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM();

    private /* synthetic */ $$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM() {
    }

    public final Object apply(Object obj) {
        return Integer.valueOf(PeopleFaceSnapshotHelper.persist((List) obj));
    }
}
