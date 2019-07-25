package com.miui.gallery.editor.photo.origin;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.editor.photo.app.DraftManager;
import com.miui.gallery.editor.photo.core.RenderData;
import com.miui.gallery.editor.photo.origin.EditorOriginFunc.Stub;
import com.miui.gallery.editor.photo.utils.BigBitmapLoadUtils;
import com.miui.gallery.util.Log;
import java.util.List;

public class EditorOriginHandler {
    /* access modifiers changed from: private */
    public EditorOriginFunc mBinder;
    private Context mContext;
    private int mHandlerMode;
    private ServiceConnection mServiceConnection = new ServiceConnection() {
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            EditorOriginHandler.this.mBinder = Stub.asInterface(iBinder);
        }

        public void onServiceDisconnected(ComponentName componentName) {
            EditorOriginHandler.this.mBinder = null;
        }
    };
    private Uri mSource;

    public EditorOriginHandler(Context context, Uri uri) {
        this.mContext = context;
        this.mSource = uri;
        if (GalleryApp.isEditorProcess()) {
            this.mHandlerMode = 2;
        } else if (useDoubleProcess()) {
            this.mHandlerMode = 1;
        } else {
            this.mHandlerMode = 0;
        }
        Log.d("EditorOriginHandler", "editor handler mode:%d", (Object) Integer.valueOf(this.mHandlerMode));
    }

    private void bindEditorService() {
        try {
            this.mContext.bindService(new Intent(this.mContext, EditorOriginHandlerService.class), this.mServiceConnection, BaiduSceneResult.ACCOUNT_BOOK);
        } catch (Exception e) {
            Log.e("EditorOriginHandler", (Throwable) e);
        }
    }

    private void unbindEditorService() {
        try {
            this.mContext.unbindService(this.mServiceConnection);
        } catch (Exception e) {
            Log.e("EditorOriginHandler", (Throwable) e);
        }
    }

    private boolean useDoubleProcess() {
        return VERSION.SDK_INT < 26 && !BigBitmapLoadUtils.isBigMemoryApp(this.mContext);
    }

    public boolean doExport(DraftManager draftManager, Uri uri) {
        return (!needTransProcess() || draftManager.isPreviewSameWithOrigin()) ? draftManager.export(uri) : doOriginHandler(uri, draftManager.getRenderDataList(), draftManager.getBundle(), draftManager.isWithWatermark());
    }

    public boolean doOriginHandler(Uri uri, List<RenderData> list, Bundle bundle, boolean z) {
        if (this.mBinder != null) {
            try {
                Log.d("EditorOriginHandler", "doOriginHandler");
                EditorOriginFunc editorOriginFunc = this.mBinder;
                OriginRenderData originRenderData = new OriginRenderData(list, this.mSource, uri, bundle, z);
                return editorOriginFunc.handlerOrigin(originRenderData);
            } catch (RemoteException e) {
                Log.e("EditorOriginHandler", (Throwable) e);
            }
        } else {
            Log.e("EditorOriginHandler", "doOriginHandler bind is null");
            return false;
        }
    }

    public boolean isInMainProcess() {
        return this.mHandlerMode == 0;
    }

    public boolean needTransProcess() {
        return this.mHandlerMode == 1;
    }

    public void onDestroy() {
        if (needTransProcess()) {
            unbindEditorService();
        }
    }

    public void onStart() {
        if (needTransProcess()) {
            bindEditorService();
        }
    }
}
