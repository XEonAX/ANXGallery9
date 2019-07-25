package com.miui.gallery.movie.utils;

import android.content.Context;
import android.os.AsyncTask;
import android.text.TextUtils;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.movie.MovieConfig;
import com.miui.gallery.movie.entity.TemplateResource;
import com.miui.gallery.movie.net.TemplateResourceRequest;
import com.miui.gallery.movie.ui.factory.TemplateFactory;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import io.reactivex.Observable;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import io.reactivex.schedulers.Schedulers;
import java.util.List;

public class MovieBackgroundDownloadManager {
    private static MovieBackgroundDownloadManager sInstance = new MovieBackgroundDownloadManager();
    private List<TemplateResource> mTemplateResources;

    private MovieBackgroundDownloadManager() {
    }

    public static MovieBackgroundDownloadManager getInstance() {
        return sInstance;
    }

    /* access modifiers changed from: private */
    public TemplateResource getTemplateResourceFromNameSync(String str) {
        List<TemplateResource> list = this.mTemplateResources;
        if (list == null) {
            try {
                Object[] executeSync = new TemplateResourceRequest().executeSync();
                if (executeSync != null && executeSync.length > 0 && (executeSync[0] instanceof List)) {
                    list = (List) executeSync[0];
                }
                Log.d("MovieBackgroundDownloadManager", "getTemplateList %d ", (Object) Integer.valueOf(list == null ? -1 : list.size()));
            } catch (RequestError unused) {
                Log.e("MovieBackgroundDownloadManager", "RequestError: getTemplateList");
            }
        }
        TemplateResource templateResource = null;
        if (list == null) {
            Log.d("MovieBackgroundDownloadManager", "template resource is null");
        } else {
            for (TemplateResource templateResource2 : list) {
                if (TextUtils.equals(templateResource2.nameKey, str)) {
                    templateResource = templateResource2;
                }
            }
        }
        this.mTemplateResources = list;
        return templateResource;
    }

    static /* synthetic */ boolean lambda$downloadTemplate$113(String str) throws Exception {
        boolean z = TextUtils.equals(str, MovieStatUtils.FROM_NORMAL) || FileUtils.isFileExist(TemplateFactory.getTemplateDir(str));
        if (z) {
            Log.d("MovieBackgroundDownloadManager", "template %s is already exist", (Object) str);
        }
        return !z;
    }

    static /* synthetic */ boolean lambda$downloadTemplate$115(TemplateResource templateResource) throws Exception {
        return templateResource != null;
    }

    static /* synthetic */ void lambda$downloadTemplate$116(TemplateResource templateResource) throws Exception {
        Log.d("MovieBackgroundDownloadManager", "start download %s in background", (Object) templateResource.nameKey);
        MovieDownloadManager.getInstance().downloadResource(templateResource, null, false);
    }

    public void downloadTemplate(Context context, int i) {
        if (!NetworkUtils.isNetworkConnected()) {
            Log.d("MovieBackgroundDownloadManager", "download templateId %d no network", (Object) Integer.valueOf(i));
        } else if (NetworkUtils.isActiveNetworkMetered()) {
            Log.d("MovieBackgroundDownloadManager", "download templateId %d in network metered", (Object) Integer.valueOf(i));
        } else {
            MovieConfig.init(context);
            Observable.just(Integer.valueOf(i)).observeOn(Schedulers.from(AsyncTask.THREAD_POOL_EXECUTOR)).map($$Lambda$MovieBackgroundDownloadManager$yfKRgHsbnL_dX5G5jiDqPey0b20.INSTANCE).filter($$Lambda$MovieBackgroundDownloadManager$gHzGdQnrurndwOhmRhtu6DMKEM.INSTANCE).map(new Function() {
                public final Object apply(Object obj) {
                    return MovieBackgroundDownloadManager.this.getTemplateResourceFromNameSync((String) obj);
                }
            }).filter($$Lambda$MovieBackgroundDownloadManager$KLrQYZSJxvxhuGVp6lqQtEHBYY.INSTANCE).subscribe((Consumer<? super T>) $$Lambda$MovieBackgroundDownloadManager$d1WYRnrowXpHZl7121PcaoY4oM.INSTANCE);
        }
    }
}
