package com.miui.gallery.provider;

import com.miui.gallery.model.Album;
import java.util.Comparator;

/* renamed from: com.miui.gallery.provider.-$$Lambda$AlbumSnapshotHelper$XhaKj7ydYj21gKVmCuxq2f3VSLY reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$AlbumSnapshotHelper$XhaKj7ydYj21gKVmCuxq2f3VSLY implements Comparator {
    public static final /* synthetic */ $$Lambda$AlbumSnapshotHelper$XhaKj7ydYj21gKVmCuxq2f3VSLY INSTANCE = new $$Lambda$AlbumSnapshotHelper$XhaKj7ydYj21gKVmCuxq2f3VSLY();

    private /* synthetic */ $$Lambda$AlbumSnapshotHelper$XhaKj7ydYj21gKVmCuxq2f3VSLY() {
    }

    public final int compare(Object obj, Object obj2) {
        return Long.compare(((Album) obj).getSortBy(), ((Album) obj2).getSortBy());
    }
}
