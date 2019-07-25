package com.miui.gallery.video;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.media.MediaMetadataRetriever;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.LruCache;
import android.view.Surface;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.video.VideoFrameProvider.ThumbListInfo;
import com.miui.os.Rom;
import com.miui.video.localvideoplayer.FrameParams;
import com.miui.video.localvideoplayer.VideoFrameInterface;
import com.miui.video.localvideoplayer.VideoFrameInterface.Stub;
import java.io.ByteArrayOutputStream;
import java.io.FileDescriptor;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class VideoFrameProvider {
    private static final String[] SUPPORTED_DEVICES = {"dipper"};
    private static boolean sIsDeviceSupported;
    /* access modifiers changed from: private */
    public MiuiVideoConnection mConnection;
    private HandlerThread mHandlerThread = new HandlerThread("VideoFrameProvider-Thread");
    private RequestTask mLastSingleFrameTask;
    private RequestTask mLastThumbListTask;
    private List<Listener> mListeners = new CopyOnWriteArrayList();
    private Handler mMainHandler = new Handler(Looper.getMainLooper());
    /* access modifiers changed from: private */
    public final LruCache<String, ThumbListInfo> mThumbListCache = new LruCache<>(2);
    private Handler mWorkHandler;

    private class AssignSurfaceTask extends RequestTask {
        private Surface mSurface;

        public AssignSurfaceTask(String str, Surface surface) {
            super(str, 0, 0);
            this.mSurface = surface;
        }

        public void handle(VideoFrameInterface videoFrameInterface) throws RemoteException {
            Log.d("VideoFrameProvider", "setSurfaceForVideo");
            videoFrameInterface.setSurface(this.mSurface, this.mSurface.hashCode(), this.mPath);
        }
    }

    public interface Listener {
        void onSingleFrameResponse(String str, long j);

        void onThumbListResponse(String str, ThumbListInfo thumbListInfo);
    }

    private class MiuiVideoConnection {
        private boolean mCanceled = false;
        private Context mContext;
        private boolean mEnable = true;
        private ServiceConnectionImpl mServiceConnection;
        private VideoFrameInterface mServiceInterface;

        private class ServiceConnectionImpl implements ServiceConnection {
            private volatile boolean mReleased;

            private ServiceConnectionImpl() {
            }

            public boolean isReleased() {
                return this.mReleased;
            }

            public void onBindingDied(ComponentName componentName) {
                Log.w("MiuiVideoConnection", "onBindingDied");
                MiuiVideoConnection.this.onConnectFailed(this, true);
            }

            public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
                MiuiVideoConnection.this.onConnectSuccess(this, iBinder);
            }

            public void onServiceDisconnected(ComponentName componentName) {
                Log.w("MiuiVideoConnection", "onServiceDisconnected");
                MiuiVideoConnection.this.onConnectFailed(this, true);
            }

            public void release() {
                this.mReleased = true;
            }
        }

        public MiuiVideoConnection(Context context) {
            this.mContext = context;
        }

        /* JADX WARNING: Code restructure failed: missing block: B:35:0x007a, code lost:
            return null;
         */
        private synchronized VideoFrameInterface connect() {
            if (this.mServiceInterface != null) {
                return this.mServiceInterface;
            } else if (this.mEnable && !this.mCanceled && this.mContext != null) {
                try {
                    if (this.mServiceConnection == null) {
                        Intent intent = new Intent();
                        intent.setClassName("com.miui.video", "com.miui.video.localvideoplayer.VideoFrameService");
                        intent.putExtra("version", 1);
                        if (MiscUtil.isServiceSupported(intent)) {
                            this.mServiceConnection = new ServiceConnectionImpl();
                            if (this.mContext.bindService(intent, this.mServiceConnection, 1)) {
                                Log.d("MiuiVideoConnection", "bind service success");
                                wait();
                            } else {
                                Log.w("MiuiVideoConnection", "bind service failed");
                                disconnect(false);
                            }
                        } else {
                            Log.w("MiuiVideoConnection", "bind service not support.");
                            disconnect(false);
                        }
                    } else {
                        wait();
                    }
                } catch (InterruptedException unused) {
                } catch (Exception e) {
                    Log.w("MiuiVideoConnection", "bind service error.\n", e);
                    disconnect(false);
                }
                return this.mServiceInterface;
            }
        }

        private synchronized void disconnect(boolean z) {
            Log.d("MiuiVideoConnection", "disconnect");
            this.mEnable = z;
            this.mServiceInterface = null;
            if (this.mServiceConnection != null) {
                try {
                    if (this.mContext != null) {
                        this.mContext.unbindService(this.mServiceConnection);
                        Log.d("MiuiVideoConnection", "unbind service");
                    }
                } catch (Exception e) {
                    Log.w("MiuiVideoConnection", "unbind service error.\n", e);
                }
                this.mServiceConnection.release();
                this.mServiceConnection = null;
            }
            notifyAll();
        }

        /* access modifiers changed from: private */
        public synchronized void onConnectFailed(ServiceConnectionImpl serviceConnectionImpl, boolean z) {
            Log.d("MiuiVideoConnection", "connect failed");
            if (!serviceConnectionImpl.isReleased()) {
                disconnect(z);
            }
        }

        /* access modifiers changed from: private */
        /* JADX WARNING: Code restructure failed: missing block: B:13:0x002a, code lost:
            return;
         */
        public synchronized void onConnectSuccess(ServiceConnectionImpl serviceConnectionImpl, IBinder iBinder) {
            Log.d("MiuiVideoConnection", "connect success");
            if (!serviceConnectionImpl.isReleased()) {
                this.mServiceInterface = Stub.asInterface(iBinder);
                if (this.mServiceInterface != null) {
                    notifyAll();
                    Log.d("MiuiVideoConnection", "connected");
                } else {
                    disconnect(false);
                }
            }
        }

        public synchronized void cancel() {
            this.mCanceled = true;
            disconnect(this.mEnable);
        }

        public synchronized VideoFrameInterface getServiceInterface() {
            return connect();
        }

        public synchronized void release() {
            disconnect(false);
            this.mContext = null;
        }

        public synchronized void reset() {
            this.mCanceled = false;
        }
    }

    private class PrepareRequestTask extends RequestTask {
        public PrepareRequestTask(String str) {
            super(str, 0, 0);
        }

        public void handle(VideoFrameInterface videoFrameInterface) throws RemoteException {
            Log.d("VideoFrameProvider", "prepareForVideo");
            videoFrameInterface.prepare(this.mPath);
        }
    }

    private class ReleaseRequestTask extends RequestTask {
        public ReleaseRequestTask(String str) {
            super(str, 0, 0);
        }

        public void handle(VideoFrameInterface videoFrameInterface) throws RemoteException {
            Log.d("VideoFrameProvider", "releaseForVideo");
            videoFrameInterface.release(this.mPath);
        }
    }

    private abstract class RequestTask implements Runnable {
        protected String mPath;
        protected int mRequestHeight;
        protected int mRequestWidth;

        public RequestTask(String str, int i, int i2) {
            this.mPath = str;
            this.mRequestWidth = i;
            this.mRequestHeight = i2;
        }

        public abstract void handle(VideoFrameInterface videoFrameInterface) throws RemoteException;

        public void onError() {
        }

        public final void run() {
            VideoFrameInterface serviceInterface = VideoFrameProvider.this.mConnection.getServiceInterface();
            if (serviceInterface == null) {
                Log.d("VideoFrameProvider", "interface null");
                return;
            }
            try {
                handle(serviceInterface);
            } catch (Exception e) {
                onError();
                Log.w("VideoFrameProvider", "interface remote error\n", e);
            }
        }
    }

    private class SingleFrameRequestTask extends RequestTask {
        private Surface mSurface;
        private long mTime;

        SingleFrameRequestTask(String str, long j, int i, int i2, Surface surface) {
            super(str, i, i2);
            this.mTime = j;
            this.mSurface = surface;
        }

        public void handle(VideoFrameInterface videoFrameInterface) throws RemoteException {
            Log.d("VideoFrameProvider", "request frame start %d", (Object) Long.valueOf(this.mTime));
            videoFrameInterface.showPreviewFrameAtTime(this.mSurface, this.mSurface.hashCode(), this.mPath, this.mTime);
            VideoFrameProvider.this.notifySingleFrame(this.mPath, this.mTime);
        }

        public void onError() {
            VideoFrameProvider.this.notifySingleFrame(this.mPath, this.mTime);
        }
    }

    public static class ThumbListInfo {
        private long mDuration;
        private int mHeight;
        private String mPath;
        private List<Bitmap> mThumbList;
        private int mWidth;

        public ThumbListInfo(List<Bitmap> list, String str, int i, int i2, long j) {
            this.mThumbList = list;
            this.mPath = str;
            this.mWidth = i;
            this.mHeight = i2;
            this.mDuration = j;
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ThumbListInfo)) {
                return false;
            }
            return TextUtils.equals(this.mPath, ((ThumbListInfo) obj).mPath);
        }

        public long getDuration() {
            return this.mDuration;
        }

        public int getHeight() {
            return this.mHeight;
        }

        public List<Bitmap> getThumbList() {
            return this.mThumbList;
        }

        public int getWidth() {
            return this.mWidth;
        }

        public int hashCode() {
            if (this.mPath == null) {
                return 0;
            }
            return this.mPath.hashCode();
        }
    }

    private class ThumbListRequestTask extends RequestTask {
        private int mVideoDuration;
        private int mVideoHeight;
        private int mVideoWidth;

        public ThumbListRequestTask(String str, int i, int i2) {
            super(str, i, i2);
        }

        private void extractVideoMetadata(String str) {
            MediaMetadataRetriever mediaMetadataRetriever = new MediaMetadataRetriever();
            try {
                mediaMetadataRetriever.setDataSource(str);
                this.mVideoDuration = Integer.valueOf(mediaMetadataRetriever.extractMetadata(9)).intValue();
                this.mVideoWidth = Integer.valueOf(mediaMetadataRetriever.extractMetadata(18)).intValue();
                this.mVideoHeight = Integer.valueOf(mediaMetadataRetriever.extractMetadata(19)).intValue();
            } catch (Exception e) {
                Log.w("VideoFrameProvider", "extractVideoMetadata error\n", e);
            } catch (Throwable th) {
                mediaMetadataRetriever.release();
                throw th;
            }
            mediaMetadataRetriever.release();
        }

        public void handle(VideoFrameInterface videoFrameInterface) throws RemoteException {
            int i;
            int i2;
            long currentTimeMillis = System.currentTimeMillis();
            extractVideoMetadata(this.mPath);
            if (this.mVideoWidth <= 0 || this.mVideoHeight <= 0) {
                Log.w("VideoFrameProvider", "request thumbList width height invalid");
                return;
            }
            if ((((float) this.mVideoWidth) * 1.0f) / ((float) this.mVideoHeight) > (((float) this.mRequestWidth) * 1.0f) / ((float) this.mRequestHeight)) {
                int i3 = this.mRequestHeight;
                i = i3;
                i2 = (int) (((((float) i3) * 1.0f) * ((float) this.mVideoWidth)) / ((float) this.mVideoHeight));
            } else {
                i2 = this.mRequestWidth;
                i = (int) (((((float) i2) * 1.0f) * ((float) this.mVideoHeight)) / ((float) this.mVideoWidth));
            }
            FrameParams frameList = videoFrameInterface.getFrameList(this.mPath, i2, i);
            if (frameList == null) {
                Log.w("VideoFrameProvider", "request thumbList params null");
                return;
            }
            FileDescriptor fileDescriptor = frameList.getFileDescriptor();
            if (fileDescriptor == null) {
                Log.w("VideoFrameProvider", "request thumbList fd null");
                return;
            }
            ArrayList arrayList = new ArrayList();
            byte[] readRemoteData = VideoFrameProvider.readRemoteData(fileDescriptor);
            if (readRemoteData != null) {
                int width = frameList.getWidth();
                int height = frameList.getHeight();
                int i4 = width * height * 4;
                int count = frameList.getCount();
                for (int i5 = 0; i5 < count; i5++) {
                    Bitmap createBitmap = VideoFrameProvider.createBitmap(readRemoteData, i4 * i5, width, height, frameList.getConfig());
                    if (createBitmap != null) {
                        arrayList.add(createBitmap);
                    }
                }
            }
            if (MiscUtil.isValid(arrayList)) {
                ThumbListInfo thumbListInfo = new ThumbListInfo(arrayList, this.mPath, this.mVideoWidth, this.mVideoHeight, (long) this.mVideoDuration);
                VideoFrameProvider.this.notifyThumbListResponse(this.mPath, thumbListInfo);
                synchronized (VideoFrameProvider.this.mThumbListCache) {
                    VideoFrameProvider.this.mThumbListCache.put(this.mPath, thumbListInfo);
                }
            } else {
                Log.w("VideoFrameProvider", "request thumbList empty");
            }
            Log.d("VideoFrameProvider", "request thumb list cost %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        }
    }

    static {
        sIsDeviceSupported = false;
        for (String equalsIgnoreCase : SUPPORTED_DEVICES) {
            if (equalsIgnoreCase.equalsIgnoreCase(Build.DEVICE)) {
                sIsDeviceSupported = true;
            }
        }
    }

    public VideoFrameProvider(Context context) {
        this.mConnection = new MiuiVideoConnection(context);
    }

    private void cancelTask(Runnable runnable) {
        if (this.mWorkHandler != null && runnable != null) {
            this.mWorkHandler.removeCallbacks(runnable);
        }
    }

    public static Bitmap createBitmap(byte[] bArr, int i, int i2, int i3, Config config) {
        if (bArr == null || bArr.length == 0) {
            return null;
        }
        int i4 = i2 * i3;
        int i5 = (i4 * 4) + i;
        if (i5 > bArr.length) {
            return null;
        }
        int[] iArr = new int[i4];
        int i6 = 0;
        while (true) {
            int i7 = i + 3;
            if (i7 < i5) {
                iArr[i6] = (bArr[i7] & 255) | ((bArr[i] & 255) << 24) | ((bArr[i + 1] & 255) << 16) | ((bArr[i + 2] & 255) << 8);
                i += 4;
                i6++;
            } else {
                try {
                    return Bitmap.createBitmap(iArr, i2, i3, config);
                } catch (Exception e) {
                    Log.w("VideoFrameProvider", "createBitmap error\n", e);
                    return null;
                }
            }
        }
    }

    public static boolean isDeviceSupport() {
        return Rom.IS_ALPHA && sIsDeviceSupported && !BuildUtil.isPad() && !BuildUtil.isInternational();
    }

    public static /* synthetic */ void lambda$notifySingleFrame$5(VideoFrameProvider videoFrameProvider, String str, long j) {
        for (Listener onSingleFrameResponse : videoFrameProvider.mListeners) {
            onSingleFrameResponse.onSingleFrameResponse(str, j);
        }
    }

    public static /* synthetic */ void lambda$notifyThumbListResponse$4(VideoFrameProvider videoFrameProvider, String str, ThumbListInfo thumbListInfo) {
        for (Listener onThumbListResponse : videoFrameProvider.mListeners) {
            onThumbListResponse.onThumbListResponse(str, thumbListInfo);
        }
    }

    /* access modifiers changed from: private */
    public void notifySingleFrame(String str, long j) {
        this.mMainHandler.post(new Runnable(str, j) {
            private final /* synthetic */ String f$1;
            private final /* synthetic */ long f$2;

            {
                this.f$1 = r2;
                this.f$2 = r3;
            }

            public final void run() {
                VideoFrameProvider.lambda$notifySingleFrame$5(VideoFrameProvider.this, this.f$1, this.f$2);
            }
        });
    }

    /* access modifiers changed from: private */
    public void notifyThumbListResponse(String str, ThumbListInfo thumbListInfo) {
        this.mMainHandler.post(new Runnable(str, thumbListInfo) {
            private final /* synthetic */ String f$1;
            private final /* synthetic */ ThumbListInfo f$2;

            {
                this.f$1 = r2;
                this.f$2 = r3;
            }

            public final void run() {
                VideoFrameProvider.lambda$notifyThumbListResponse$4(VideoFrameProvider.this, this.f$1, this.f$2);
            }
        });
    }

    public static byte[] readRemoteData(FileDescriptor fileDescriptor) {
        ByteArrayOutputStream byteArrayOutputStream;
        FileInputStream fileInputStream;
        if (fileDescriptor == null || !fileDescriptor.valid()) {
            return null;
        }
        long currentTimeMillis = System.currentTimeMillis();
        try {
            fileInputStream = new FileInputStream(fileDescriptor);
            try {
                byteArrayOutputStream = new ByteArrayOutputStream();
            } catch (Exception e) {
                e = e;
                byteArrayOutputStream = null;
                try {
                    Log.w("VideoFrameProvider", "read remote data error\n", e);
                    MiscUtil.closeSilently(fileInputStream);
                    MiscUtil.closeSilently(byteArrayOutputStream);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    MiscUtil.closeSilently(fileInputStream);
                    MiscUtil.closeSilently(byteArrayOutputStream);
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                byteArrayOutputStream = null;
                MiscUtil.closeSilently(fileInputStream);
                MiscUtil.closeSilently(byteArrayOutputStream);
                throw th;
            }
            try {
                byte[] bArr = new byte[1024];
                while (true) {
                    int read = fileInputStream.read(bArr);
                    if (read > 0) {
                        byteArrayOutputStream.write(bArr, 0, read);
                    } else {
                        byte[] byteArray = byteArrayOutputStream.toByteArray();
                        Log.d("VideoFrameProvider", "read remote data length: %d, cost: %dms", Integer.valueOf(byteArray.length), Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                        MiscUtil.closeSilently(fileInputStream);
                        MiscUtil.closeSilently(byteArrayOutputStream);
                        return byteArray;
                    }
                }
            } catch (Exception e2) {
                e = e2;
                Log.w("VideoFrameProvider", "read remote data error\n", e);
                MiscUtil.closeSilently(fileInputStream);
                MiscUtil.closeSilently(byteArrayOutputStream);
                return null;
            }
        } catch (Exception e3) {
            e = e3;
            byteArrayOutputStream = null;
            fileInputStream = null;
            Log.w("VideoFrameProvider", "read remote data error\n", e);
            MiscUtil.closeSilently(fileInputStream);
            MiscUtil.closeSilently(byteArrayOutputStream);
            return null;
        } catch (Throwable th3) {
            fileInputStream = null;
            th = th3;
            byteArrayOutputStream = null;
            MiscUtil.closeSilently(fileInputStream);
            MiscUtil.closeSilently(byteArrayOutputStream);
            throw th;
        }
    }

    private void submitTask(Runnable runnable) {
        Handler handler = this.mWorkHandler;
        if (handler == null && this.mHandlerThread != null) {
            this.mHandlerThread.start();
            handler = new Handler(this.mHandlerThread.getLooper());
            this.mWorkHandler = handler;
        }
        if (handler != null) {
            handler.post(runnable);
        }
    }

    public void addListener(Listener listener) {
        this.mListeners.add(listener);
    }

    public ThumbListInfo getThumbListInfo(String str) {
        ThumbListInfo thumbListInfo;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        synchronized (this.mThumbListCache) {
            thumbListInfo = (ThumbListInfo) this.mThumbListCache.get(str);
        }
        return thumbListInfo;
    }

    public void onStart() {
        Log.d("VideoFrameProvider", "onStart");
        this.mConnection.reset();
    }

    public void onStop() {
        Log.d("VideoFrameProvider", "onStop");
        this.mConnection.cancel();
        synchronized (this.mThumbListCache) {
            this.mThumbListCache.evictAll();
        }
    }

    public void prepareForVideo(String str) {
        if (this.mHandlerThread != null && !TextUtils.isEmpty(str)) {
            cancelTask(this.mLastThumbListTask);
            this.mLastThumbListTask = null;
            submitTask(new PrepareRequestTask(str));
        }
    }

    public void release() {
        if (this.mWorkHandler != null) {
            this.mWorkHandler.removeCallbacksAndMessages(null);
            this.mWorkHandler = null;
        }
        this.mHandlerThread.quit();
        this.mHandlerThread = null;
        this.mListeners.clear();
        synchronized (this.mThumbListCache) {
            this.mThumbListCache.evictAll();
        }
        this.mConnection.release();
        this.mMainHandler.removeCallbacks(null);
    }

    public void releaseForVideo(String str) {
        if (this.mHandlerThread != null && !TextUtils.isEmpty(str)) {
            submitTask(new ReleaseRequestTask(str));
        }
    }

    public void requestSingleFrame(String str, int i, int i2, long j, Surface surface) {
        if (this.mHandlerThread != null && !TextUtils.isEmpty(str)) {
            SingleFrameRequestTask singleFrameRequestTask = new SingleFrameRequestTask(str, j, i, i2, surface);
            cancelTask(this.mLastSingleFrameTask);
            submitTask(singleFrameRequestTask);
            this.mLastSingleFrameTask = singleFrameRequestTask;
        }
    }

    public void requestThumbList(String str, int i, int i2) {
        if (this.mHandlerThread != null && !TextUtils.isEmpty(str)) {
            ThumbListInfo thumbListInfo = getThumbListInfo(str);
            if (thumbListInfo != null) {
                notifyThumbListResponse(str, thumbListInfo);
            } else {
                ThumbListRequestTask thumbListRequestTask = new ThumbListRequestTask(str, i, i2);
                cancelTask(this.mLastThumbListTask);
                submitTask(thumbListRequestTask);
                this.mLastThumbListTask = thumbListRequestTask;
            }
        }
    }

    public void setSurfaceForVideo(String str, Surface surface) {
        if (this.mHandlerThread != null && !TextUtils.isEmpty(str) && surface != null) {
            submitTask(new AssignSurfaceTask(str, surface));
        }
    }
}
