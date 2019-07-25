package com.miui.gallery.projection;

import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import com.milink.api.v1.MilinkClientManager;
import com.milink.api.v1.MilinkClientManagerDataSource;
import com.milink.api.v1.MilinkClientManagerDelegate;
import com.milink.api.v1.type.DeviceType;
import com.milink.api.v1.type.ErrorCode;
import com.milink.api.v1.type.MediaType;
import com.milink.api.v1.type.ReturnCode;
import com.milink.api.v1.type.SlideMode;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.gallery.model.BaseDataSet;
import com.miui.gallery.preference.GalleryPreferences.SlideShow;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.Log;
import com.nexstreaming.nexeditorsdk.nexProject;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.keyczar.Keyczar;

public class ConnectController {
    private static ConnectController mInstance;
    private Set<ConnectListener> mConnectListeners = new HashSet();
    /* access modifiers changed from: private */
    public String mCurConnectedDevice = null;
    /* access modifiers changed from: private */
    public int mCurrentIndex = 0;
    /* access modifiers changed from: private */
    public String mCurrentPhoto = "";
    private MilinkClientManagerDataSource mDataSource = new MilinkClientManagerDataSource() {
        public String getNextPhoto(String str, boolean z) {
            return ConnectController.this.mSlidingWindow.getNext(str, z);
        }

        public String getPrevPhoto(String str, boolean z) {
            return ConnectController.this.mSlidingWindow.getPrevious(str, z);
        }
    };
    private Runnable mDelayConnect = new Runnable() {
        public void run() {
            Log.v("ConnectController", "delayed disconnected");
            ConnectController.this.disconnectBigShow(false);
        }
    };
    private MilinkClientManagerDelegate mDelegate = new MilinkClientManagerDelegate() {
        private void remoteDisconnected() {
            Log.v("ConnectController", "do remoteDisconnected");
            if (ConnectController.this.mPhotoServerConnected) {
                ConnectController.this.setPhotoServerDisconnect();
                ConnectController.this.doPhotoConnectRelease();
            }
        }

        public void onClose() {
            Log.v("ConnectController", "service closed");
        }

        public void onConnected() {
            Log.d("ConnectController", "connect is responded ok");
            ConnectController.this.mPhotoServerConnected = true;
            ConnectController.this.mCurConnectedDevice = ConnectController.this.mWaitConnectDevice;
            ConnectController.this.mWaitConnectDevice = null;
            ConnectController.this.mIsFirstConnected = true;
            ConnectController.this.mPhotoManager.startShow();
            if (!TextUtils.isEmpty(ConnectController.this.mCurrentPhoto)) {
                StringBuilder sb = new StringBuilder();
                sb.append("==the to show photo is: ");
                sb.append(ConnectController.this.mCurrentPhoto);
                Log.v("ConnectController", sb.toString());
                ConnectController.this.showPhoto(ConnectController.this.mCurrentPhoto, ConnectController.this.mCurrentIndex);
            }
            ConnectController.this.doPhotoConnectResponse(0);
        }

        public void onConnectedFailed(ErrorCode errorCode) {
            Log.d("ConnectController", "connect is responded failed -1");
            ConnectController.this.setPhotoServerDisconnect();
            ConnectController.this.doPhotoConnectResponse(-1);
        }

        public void onDeviceFound(String str, String str2, DeviceType deviceType) {
            if (deviceType == DeviceType.TV) {
                Log.v("ConnectController", "service onDeviceFound");
                ConnectController.this.mDevices.put(str2, str);
                Message.obtain(ConnectController.this.mHandler, 100, str2).sendToTarget();
            }
        }

        public void onDeviceLost(String str) {
            String str2;
            Iterator it = ConnectController.this.mDevices.keySet().iterator();
            while (true) {
                if (!it.hasNext()) {
                    str2 = null;
                    break;
                }
                str2 = (String) it.next();
                if (((String) ConnectController.this.mDevices.get(str2)).equals(str)) {
                    break;
                }
            }
            if (str2 != null) {
                ConnectController.this.mDevices.remove(str2);
                Message.obtain(ConnectController.this.mHandler, BaiduSceneResult.SHOOTING, str2).sendToTarget();
            }
        }

        public void onDisconnected() {
            Log.d("ConnectController", "remote show is dispeared, but connected.");
            remoteDisconnected();
        }

        public void onLoading() {
            Log.v("ConnectController", "loading...");
            for (MediaPlayListener onLoading : ConnectController.this.mMediaPlayListeners) {
                onLoading.onLoading();
            }
        }

        public void onNextAudio(boolean z) {
            StringBuilder sb = new StringBuilder();
            sb.append("onRequestNextItem: ");
            sb.append(z);
            Log.v("ConnectController", sb.toString());
        }

        public void onOpen() {
            Log.v("ConnectController", "service openned");
            ConnectController.this.queryDevices(false);
        }

        public void onPaused() {
            Log.v("ConnectController", "paused");
            for (MediaPlayListener onPaused : ConnectController.this.mMediaPlayListeners) {
                onPaused.onPaused();
            }
        }

        public void onPlaying() {
            Log.v("ConnectController", "playing...");
            for (MediaPlayListener onPlaying : ConnectController.this.mMediaPlayListeners) {
                onPlaying.onPlaying();
            }
        }

        public void onPrevAudio(boolean z) {
            StringBuilder sb = new StringBuilder();
            sb.append("onRequestPrevItem: ");
            sb.append(z);
            Log.v("ConnectController", sb.toString());
        }

        public void onStopped() {
            Log.v("ConnectController", "stopped");
            for (MediaPlayListener onStopped : ConnectController.this.mMediaPlayListeners) {
                onStopped.onStopped();
            }
        }

        public void onVolume(int i) {
        }
    };
    private boolean mDeviceOpen = false;
    /* access modifiers changed from: private */
    public HashMap<String, String> mDevices = new HashMap<>();
    /* access modifiers changed from: private */
    public Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            switch (message.what) {
                case 100:
                    ConnectController.this.doDeviceAdded((String) message.obj);
                    break;
                case BaiduSceneResult.SHOOTING /*101*/:
                    ConnectController.this.doDeviceRemoved((String) message.obj);
                    break;
            }
            super.handleMessage(message);
        }
    };
    /* access modifiers changed from: private */
    public boolean mIsFirstConnected = false;
    /* access modifiers changed from: private */
    public List<MediaPlayListener> mMediaPlayListeners = new ArrayList();
    /* access modifiers changed from: private */
    public MilinkClientManager mPhotoManager;
    /* access modifiers changed from: private */
    public boolean mPhotoServerConnected = false;
    private Runnable mRefreshDevices = new Runnable() {
        public void run() {
            ConnectController.this.refreshDevices();
        }
    };
    private ArrayList<String> mSlideShowTypes = new ArrayList<>();
    /* access modifiers changed from: private */
    public SlidingWindow mSlidingWindow = new SlidingWindow();
    /* access modifiers changed from: private */
    public String mWaitConnectDevice = null;

    public interface ConnectListener {
        void onDeviceRefresh(ArrayList<String> arrayList, String str);

        void onDeviceRemoved(String str);

        void onDevicesAdded(String str);

        void onDevicesAvailable(ArrayList<String> arrayList);

        void onPhotoConnectReleased();

        void onPhotoConnectResponse(int i);
    }

    public interface MediaPlayListener {
        void onLoading();

        void onPaused();

        void onPlaying();

        void onStopped();
    }

    private ConnectController() {
    }

    private boolean deviceOpened() {
        return this.mDeviceOpen;
    }

    /* access modifiers changed from: private */
    public void disconnectBigShow(boolean z) {
        Log.v("ConnectController", "~~~disconnectBigShow");
        removePostDisonnectListener();
        if (this.mConnectListeners.size() == 0 || z) {
            setPhotoServerDisconnect();
            releasePhotoManager();
            synchronized (this) {
                if (this.mPhotoManager != null) {
                    Log.v("ConnectController", "set device close");
                    this.mDevices.clear();
                    this.mDeviceOpen = false;
                    this.mPhotoManager.close();
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void doDeviceAdded(String str) {
        for (ConnectListener connectListener : this.mConnectListeners) {
            if (connectListener != null) {
                connectListener.onDevicesAdded(str);
            }
        }
    }

    private void doDeviceAvailable(ArrayList<String> arrayList) {
        for (ConnectListener connectListener : this.mConnectListeners) {
            if (connectListener != null) {
                connectListener.onDevicesAvailable(arrayList);
            }
        }
    }

    private void doDeviceRefresh(ArrayList<String> arrayList, String str) {
        for (ConnectListener connectListener : this.mConnectListeners) {
            if (connectListener != null) {
                connectListener.onDeviceRefresh(arrayList, str);
            }
        }
    }

    /* access modifiers changed from: private */
    public void doDeviceRemoved(String str) {
        for (ConnectListener connectListener : this.mConnectListeners) {
            if (connectListener != null) {
                connectListener.onDeviceRemoved(str);
            }
        }
    }

    /* access modifiers changed from: private */
    public void doPhotoConnectRelease() {
        for (ConnectListener connectListener : this.mConnectListeners) {
            if (connectListener != null) {
                connectListener.onPhotoConnectReleased();
            }
        }
    }

    /* access modifiers changed from: private */
    public void doPhotoConnectResponse(int i) {
        for (ConnectListener connectListener : this.mConnectListeners) {
            if (connectListener != null) {
                connectListener.onPhotoConnectResponse(i);
            }
        }
    }

    public static synchronized ConnectController getInstance() {
        ConnectController connectController;
        synchronized (ConnectController.class) {
            if (mInstance == null) {
                mInstance = new ConnectController();
            }
            connectController = mInstance;
        }
        return connectController;
    }

    private boolean photoServerOpen() {
        return this.mPhotoServerConnected;
    }

    private void releasePhotoManager() {
        if (this.mPhotoManager != null) {
            this.mPhotoManager.stopShow();
            this.mPhotoManager.disconnect();
        }
    }

    private void removePostDisonnectListener() {
        this.mHandler.removeCallbacks(this.mDelayConnect);
    }

    /* access modifiers changed from: private */
    public void setPhotoServerDisconnect() {
        this.mPhotoServerConnected = false;
        this.mWaitConnectDevice = null;
        this.mCurConnectedDevice = null;
    }

    /* access modifiers changed from: private */
    public int showPhoto(String str, int i) {
        int i2 = -1;
        if (!photoServerOpen()) {
            Log.v("ConnectController", "photo not connected");
            return -1;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("the photo is: ");
        sb.append(str);
        sb.append(" ");
        sb.append(i);
        Log.v("ConnectController", sb.toString());
        if (str != null) {
            try {
                if (this.mPhotoManager.show(str) == ReturnCode.OK) {
                    i2 = 0;
                }
                return i2;
            } catch (IllegalArgumentException e) {
                Log.v("ConnectController", "MilinkClientManager show exception", e);
            }
        }
        return -1;
    }

    public int connectPhotoServer(String str) {
        if (!deviceOpened()) {
            return -1;
        }
        String str2 = (String) this.mDevices.get(str);
        if (str2 == null) {
            return -1;
        }
        if (this.mPhotoServerConnected) {
            Log.v("ConnectController", "connect to another device");
            if (this.mPhotoManager.disconnect() != ReturnCode.OK) {
                Log.v("ConnectController", "disconnect error");
            }
            setPhotoServerDisconnect();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("connect to server: ");
        sb.append(str);
        sb.append(" photo: ");
        sb.append(this.mCurrentPhoto);
        Log.v("ConnectController", sb.toString());
        if (this.mPhotoManager.connect(str2, nexProject.kAutoThemeClipDuration) != ReturnCode.OK) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("connect error ");
            sb2.append(str);
            Log.v("ConnectController", sb2.toString());
            return -1;
        }
        this.mWaitConnectDevice = str;
        return 0;
    }

    public void disconnect(ConnectListener connectListener, boolean z) {
        Log.v("ConnectController", "disconnect");
        unregistConnectListener(connectListener);
        if (this.mDeviceOpen) {
            doPhotoConnectRelease();
            disconnectBigShow(z);
        }
    }

    public String getCurConnectedDevice() {
        return this.mCurConnectedDevice;
    }

    public int getCurrentPosition() {
        if (this.mPhotoManager != null) {
            return this.mPhotoManager.getPlaybackProgress();
        }
        return 0;
    }

    public ArrayList<String> getDeviceList() {
        ArrayList<String> arrayList = new ArrayList<>();
        for (Object add : this.mDevices.keySet()) {
            arrayList.add(add);
        }
        return arrayList;
    }

    public int getDuration() {
        if (this.mPhotoManager != null) {
            return this.mPhotoManager.getPlaybackDuration();
        }
        return 0;
    }

    public boolean isOpen() {
        return this.mDeviceOpen;
    }

    public boolean isPlaying() {
        boolean z = false;
        if (this.mPhotoManager == null) {
            return false;
        }
        if (this.mPhotoManager.getPlaybackRate() == 1) {
            z = true;
        }
        return z;
    }

    public void open() {
        if (!this.mDeviceOpen) {
            if (this.mPhotoManager == null) {
                this.mPhotoManager = new MilinkClientManager(GalleryApp.sGetAndroidContext());
                this.mPhotoManager.setDeviceName(BuildUtil.getDeviceName(GalleryApp.sGetAndroidContext()));
                this.mPhotoManager.setDataSource(this.mDataSource);
                this.mPhotoManager.setDelegate(this.mDelegate);
            }
            this.mPhotoManager.open();
            this.mDeviceOpen = true;
        }
    }

    public void pause() {
        if (this.mPhotoManager != null) {
            this.mPhotoManager.setPlaybackRate(0);
        }
    }

    public void playVideo(String str, String str2, String str3) {
        if (this.mPhotoManager != null && !TextUtils.isEmpty(str)) {
            try {
                this.mPhotoManager.startPlay(URLEncoder.encode(str, Keyczar.DEFAULT_ENCODING), str2, 0, 0.0d, MediaType.Video);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
    }

    public void queryDevices(boolean z) {
        ArrayList deviceList = getDeviceList();
        if (!deviceList.isEmpty()) {
            if (z) {
                doDeviceRefresh(deviceList, this.mCurConnectedDevice);
            } else {
                doDeviceAvailable(deviceList);
            }
        }
    }

    public boolean refreshDevices() {
        if (!deviceOpened()) {
            return false;
        }
        queryDevices(true);
        return true;
    }

    public void registConnectListener(ConnectListener connectListener) {
        removePostDisonnectListener();
        this.mConnectListeners.add(connectListener);
        this.mHandler.post(this.mRefreshDevices);
    }

    public void registMediaPlayListener(MediaPlayListener mediaPlayListener) {
        if (mediaPlayListener != null) {
            this.mMediaPlayListeners.add(mediaPlayListener);
        }
    }

    public int release() {
        Log.v("ConnectController", "do release");
        if (!this.mPhotoServerConnected) {
            return 0;
        }
        setPhotoServerDisconnect();
        releasePhotoManager();
        doPhotoConnectRelease();
        return 0;
    }

    public void resume() {
        if (this.mPhotoManager != null) {
            this.mPhotoManager.setPlaybackRate(1);
        }
    }

    public void seekTo(int i) {
        if (this.mPhotoManager != null) {
            this.mPhotoManager.setPlaybackProgress(i);
        }
    }

    public int showType(boolean z, int i) {
        if (!photoServerOpen()) {
            return -1;
        }
        int i2 = 0;
        if (!z) {
            return 0;
        }
        this.mCurrentIndex = i;
        this.mSlidingWindow.onCurrentIndexChanged(this.mCurrentIndex);
        if (this.mPhotoManager.startSlideshow(Math.max(3000, SlideShow.getSlideShowInterval() * 1000), SlideMode.Recyle) != ReturnCode.OK) {
            i2 = -1;
        }
        return i2;
    }

    public void stop() {
        if (this.mPhotoManager != null) {
            this.mPhotoManager.stopPlay();
        }
    }

    public void syncRemoteView(float f, float f2, float f3, float f4, float f5, float f6, float f7) {
        this.mPhotoManager.zoomPhoto(this.mCurrentPhoto, (int) f, (int) f2, (int) f3, (int) f4, (int) f5, (int) f6, f7);
    }

    public void unregistConnectListener(ConnectListener connectListener) {
        this.mConnectListeners.remove(connectListener);
    }

    public void updateCurrentFolder(BaseDataSet baseDataSet) {
        this.mSlidingWindow.setMediaSet(baseDataSet);
    }

    public void updateCurrentPhoto(String str, int i) {
        this.mCurrentPhoto = str;
        this.mCurrentIndex = i;
        if (!TextUtils.isEmpty(getCurConnectedDevice())) {
            this.mSlidingWindow.onCurrentIndexChanged(this.mCurrentIndex);
            showPhoto(str, i);
        }
    }
}
