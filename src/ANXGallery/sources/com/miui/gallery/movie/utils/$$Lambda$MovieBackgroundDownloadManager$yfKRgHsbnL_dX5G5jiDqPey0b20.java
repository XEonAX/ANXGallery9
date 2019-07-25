package com.miui.gallery.movie.utils;

import com.miui.gallery.movie.ui.factory.MovieFactory;
import io.reactivex.functions.Function;

/* renamed from: com.miui.gallery.movie.utils.-$$Lambda$MovieBackgroundDownloadManager$yfKRgHsbnL_dX5G5jiDqPey0b20 reason: invalid class name */
/* compiled from: lambda */
public final /* synthetic */ class $$Lambda$MovieBackgroundDownloadManager$yfKRgHsbnL_dX5G5jiDqPey0b20 implements Function {
    public static final /* synthetic */ $$Lambda$MovieBackgroundDownloadManager$yfKRgHsbnL_dX5G5jiDqPey0b20 INSTANCE = new $$Lambda$MovieBackgroundDownloadManager$yfKRgHsbnL_dX5G5jiDqPey0b20();

    private /* synthetic */ $$Lambda$MovieBackgroundDownloadManager$yfKRgHsbnL_dX5G5jiDqPey0b20() {
    }

    public final Object apply(Object obj) {
        return MovieFactory.getParentTemplateName(MovieFactory.getTemplateNameById(((Integer) obj).intValue()));
    }
}
