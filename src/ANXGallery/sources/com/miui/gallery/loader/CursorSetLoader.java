package com.miui.gallery.loader;

import android.content.Context;
import android.content.Loader.ForceLoadContentObserver;
import android.database.Cursor;
import android.net.Uri;
import com.miui.gallery.model.CursorDataSet;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.logger.TimingTracing;
import java.util.HashMap;

public abstract class CursorSetLoader extends BaseLoader {
    private ForceLoadContentObserver mObserver = new ForceLoadContentObserver<>(this);

    public CursorSetLoader(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public abstract String getOrder();

    /* access modifiers changed from: protected */
    public abstract String[] getProjection();

    /* access modifiers changed from: protected */
    public abstract String getSelection();

    /* access modifiers changed from: protected */
    public abstract String[] getSelectionArgs();

    /* access modifiers changed from: protected */
    public abstract String getTAG();

    /* access modifiers changed from: protected */
    public abstract Uri getUri();

    public CursorDataSet loadInBackground() {
        Cursor query;
        StringBuilder sb = new StringBuilder();
        sb.append(getTAG());
        sb.append("_load");
        String sb2 = sb.toString();
        TimingTracing.beginTracing(sb2, "loadInBackground");
        try {
            query = getContext().getContentResolver().query(getUri(), getProjection(), getSelection(), getSelectionArgs(), getOrder(), null);
            if (query != null) {
                query.getCount();
            }
            CursorDataSet wrapDataSet = wrapDataSet(query);
            long stopTracing = TimingTracing.stopTracing(sb2, null);
            if (stopTracing > 500) {
                HashMap hashMap = new HashMap();
                StringBuilder sb3 = new StringBuilder();
                sb3.append(getSelection());
                sb3.append("_");
                sb3.append(stopTracing);
                hashMap.put("cost", sb3.toString());
                GallerySamplingStatHelper.recordErrorEvent("load_performance", getTAG(), hashMap);
            }
            return wrapDataSet;
        } catch (RuntimeException e) {
            query.close();
            throw e;
        } catch (Throwable th) {
            long stopTracing2 = TimingTracing.stopTracing(sb2, null);
            if (stopTracing2 > 500) {
                HashMap hashMap2 = new HashMap();
                StringBuilder sb4 = new StringBuilder();
                sb4.append(getSelection());
                sb4.append("_");
                sb4.append(stopTracing2);
                hashMap2.put("cost", sb4.toString());
                GallerySamplingStatHelper.recordErrorEvent("load_performance", getTAG(), hashMap2);
            }
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public abstract CursorDataSet wrapDataSet(Cursor cursor);
}
