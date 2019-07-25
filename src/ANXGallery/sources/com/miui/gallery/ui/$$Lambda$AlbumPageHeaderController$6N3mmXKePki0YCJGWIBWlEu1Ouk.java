package com.miui.gallery.ui;

import com.miui.gallery.provider.PeopleFaceSnapshotHelper;
import com.miui.gallery.util.StaticContext;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;

/* renamed from: com.miui.gallery.ui.-$$Lambda$AlbumPageHeaderController$6N3mmXKePki0YCJGWIBWlEu1Ouk reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$AlbumPageHeaderController$6N3mmXKePki0YCJGWIBWlEu1Ouk implements CompletableSource {
    public static final /* synthetic */ $$Lambda$AlbumPageHeaderController$6N3mmXKePki0YCJGWIBWlEu1Ouk INSTANCE = new $$Lambda$AlbumPageHeaderController$6N3mmXKePki0YCJGWIBWlEu1Ouk();

    private /* synthetic */ $$Lambda$AlbumPageHeaderController$6N3mmXKePki0YCJGWIBWlEu1Ouk() {
    }

    public final void subscribe(CompletableObserver completableObserver) {
        PeopleFaceSnapshotHelper.queryAndPersist(StaticContext.sGetAndroidContext());
    }
}
