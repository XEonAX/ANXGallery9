package com.miui.gallery.sdk.download.downloader;

import android.accounts.Account;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.v4.provider.DocumentFile;
import android.text.TextUtils;
import android.util.Base64;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CheckResult;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryMiCloudServerException;
import com.miui.gallery.cloud.HostManager.OwnerMedia;
import com.miui.gallery.cloud.HostManager.ShareMedia;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.cloud.NetworkUtils.RequestType;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.util.ErrorParseUtil;
import com.miui.gallery.preference.GalleryPreferences.FileDownload;
import com.miui.gallery.preference.ThumbnailPreference;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.assist.DownloadFailReason;
import com.miui.gallery.sdk.download.assist.DownloadItem;
import com.miui.gallery.sdk.download.assist.DownloadedItem;
import com.miui.gallery.sdk.download.assist.RequestItem;
import com.miui.gallery.sdk.download.util.DownloadUtil;
import com.miui.gallery.util.CryptoUtil;
import com.miui.gallery.util.DocumentProviderUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.MiscUtil;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;
import java.util.concurrent.locks.ReentrantLock;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONException;
import org.json.JSONObject;
import org.keyczar.Keyczar;

abstract class AbsThumbnailDownloader implements IDownloader {
    private static final int MAX_TRY_COUNT = CloudControlStrategyHelper.getSyncStrategy().getMaxDownloadTimes();

    AbsThumbnailDownloader() {
    }

    private boolean checkConditionPermitted(DownloadItem downloadItem) {
        DownloadFailReason checkCondition = DownloadUtil.checkCondition(downloadItem);
        if (checkCondition == null) {
            return true;
        }
        if (downloadItem.isStatusOk()) {
            DownloadItem.callbackError(downloadItem, checkCondition);
        }
        return false;
    }

    private boolean checkItemValid(RequestItem requestItem) {
        DBImage dBImage = requestItem.mDBItem;
        if (DownloadUtil.canDownloadStatus(dBImage)) {
            return true;
        }
        if (dBImage == null) {
            fireFailEvent(requestItem, null, new DownloadFailReason(ErrorCode.PARAMS_ERROR, "dbImage null", null));
        } else if (DownloadUtil.isNotSyncedStatus(dBImage)) {
            fireFailEvent(requestItem, null, new DownloadFailReason(ErrorCode.NOT_SYNCED, String.format("item invalid server[%s], local[%s]", new Object[]{dBImage.getServerStatus(), Integer.valueOf(dBImage.getLocalFlag())}), null));
        } else {
            fireFailEvent(requestItem, null, new DownloadFailReason(ErrorCode.PARAMS_ERROR, String.format("item invalid server[%s], local[%s]", new Object[]{dBImage.getServerStatus(), Integer.valueOf(dBImage.getLocalFlag())}), null));
        }
        return false;
    }

    private static HashMap<String, List<RequestItem>> classifyRequest(List<RequestItem> list) {
        HashMap<String, List<RequestItem>> hashMap = new HashMap<>();
        for (RequestItem requestItem : list) {
            String valueOf = requestItem.mDBItem.isShareItem() ? String.valueOf(requestItem.mDBItem.getGroupId()) : "owner";
            List list2 = (List) hashMap.get(valueOf);
            if (list2 == null) {
                list2 = new LinkedList();
                hashMap.put(valueOf, list2);
            }
            list2.add(requestItem);
        }
        return hashMap;
    }

    private void decreaseConnTimeout(DownloadType downloadType) {
        int connTimeout = FileDownload.getConnTimeout(downloadType) - 1000;
        if (FileDownload.setConnTimeout(downloadType, connTimeout)) {
            Log.i(getTag(), "decrease conn timeout %d, type %s", Integer.valueOf(connTimeout), downloadType.name());
        }
    }

    private void deleteTempFile(RequestItem requestItem) {
        if (requestItem.mDBItem != null) {
            String downloadTempFilePath = DownloadUtil.getDownloadTempFilePath(requestItem.mDBItem, requestItem.mDownloadItem.getType());
            MediaFileUtils.deleteFileType(FileType.TEMP, downloadTempFilePath);
        }
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:36:0x0088=Splitter:B:36:0x0088, B:42:0x009b=Splitter:B:42:0x009b, B:48:0x00ae=Splitter:B:48:0x00ae} */
    private String downloadData(RequestItem requestItem, String str) {
        ParcelFileDescriptor parcelFileDescriptor;
        OutputStream outputStream;
        File file = new File(DownloadUtil.getDownloadTempFilePath(requestItem.mDBItem, requestItem.mDownloadItem.getType()));
        OutputStream outputStream2 = null;
        try {
            if (DocumentProviderUtils.needUseDocumentProvider(file.getAbsolutePath())) {
                DocumentFile documentFile = DocumentProviderUtils.getDocumentFile(GalleryApp.sGetAndroidContext(), file);
                if (documentFile == null) {
                    MiscUtil.closeSilently(null);
                    MiscUtil.closeSilently(null);
                    return null;
                }
                ParcelFileDescriptor openFileDescriptor = GalleryApp.sGetAndroidContext().getContentResolver().openFileDescriptor(documentFile.getUri(), "w");
                try {
                    OutputStream fileOutputStream = new FileOutputStream(openFileDescriptor.getFileDescriptor());
                    parcelFileDescriptor = openFileDescriptor;
                    outputStream = fileOutputStream;
                } catch (UnsupportedEncodingException e) {
                    e = e;
                    parcelFileDescriptor = openFileDescriptor;
                    outputStream = null;
                    Log.e(getTag(), "download data error.", (Object) e);
                    MiscUtil.closeSilently(outputStream);
                    MiscUtil.closeSilently(parcelFileDescriptor);
                    return null;
                } catch (FileNotFoundException e2) {
                    e = e2;
                    parcelFileDescriptor = openFileDescriptor;
                    outputStream = null;
                    Log.e(getTag(), "download data error.", (Object) e);
                    MiscUtil.closeSilently(outputStream);
                    MiscUtil.closeSilently(parcelFileDescriptor);
                    return null;
                } catch (IOException e3) {
                    e = e3;
                    parcelFileDescriptor = openFileDescriptor;
                    outputStream = null;
                    try {
                        Log.e(getTag(), "download data error.", (Object) e);
                        MiscUtil.closeSilently(outputStream);
                        MiscUtil.closeSilently(parcelFileDescriptor);
                        return null;
                    } catch (Throwable th) {
                        th = th;
                        outputStream2 = outputStream;
                        MiscUtil.closeSilently(outputStream2);
                        MiscUtil.closeSilently(parcelFileDescriptor);
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    parcelFileDescriptor = openFileDescriptor;
                    MiscUtil.closeSilently(outputStream2);
                    MiscUtil.closeSilently(parcelFileDescriptor);
                    throw th;
                }
            } else {
                outputStream = new FileOutputStream(file, false);
                parcelFileDescriptor = null;
            }
            try {
                outputStream.write(Base64.decode(str.getBytes(Keyczar.DEFAULT_ENCODING), 2));
                MiscUtil.closeSilently(outputStream);
                MiscUtil.closeSilently(parcelFileDescriptor);
                return file.getAbsolutePath();
            } catch (UnsupportedEncodingException e4) {
                e = e4;
                Log.e(getTag(), "download data error.", (Object) e);
                MiscUtil.closeSilently(outputStream);
                MiscUtil.closeSilently(parcelFileDescriptor);
                return null;
            } catch (FileNotFoundException e5) {
                e = e5;
                Log.e(getTag(), "download data error.", (Object) e);
                MiscUtil.closeSilently(outputStream);
                MiscUtil.closeSilently(parcelFileDescriptor);
                return null;
            } catch (IOException e6) {
                e = e6;
                Log.e(getTag(), "download data error.", (Object) e);
                MiscUtil.closeSilently(outputStream);
                MiscUtil.closeSilently(parcelFileDescriptor);
                return null;
            }
        } catch (UnsupportedEncodingException e7) {
            e = e7;
            outputStream = null;
            parcelFileDescriptor = null;
            Log.e(getTag(), "download data error.", (Object) e);
            MiscUtil.closeSilently(outputStream);
            MiscUtil.closeSilently(parcelFileDescriptor);
            return null;
        } catch (FileNotFoundException e8) {
            e = e8;
            outputStream = null;
            parcelFileDescriptor = null;
            Log.e(getTag(), "download data error.", (Object) e);
            MiscUtil.closeSilently(outputStream);
            MiscUtil.closeSilently(parcelFileDescriptor);
            return null;
        } catch (IOException e9) {
            e = e9;
            outputStream = null;
            parcelFileDescriptor = null;
            Log.e(getTag(), "download data error.", (Object) e);
            MiscUtil.closeSilently(outputStream);
            MiscUtil.closeSilently(parcelFileDescriptor);
            return null;
        } catch (Throwable th3) {
            th = th3;
            parcelFileDescriptor = null;
            MiscUtil.closeSilently(outputStream2);
            MiscUtil.closeSilently(parcelFileDescriptor);
            throw th;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0048, code lost:
        r0 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0049, code lost:
        r21 = r4;
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:178:0x03c6, code lost:
        r0 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:179:0x03c7, code lost:
        r21 = r4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x0053, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:180:0x03ca, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:181:0x03cb, code lost:
        r21 = r4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:182:0x03ce, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:183:0x03cf, code lost:
        r21 = r4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:184:0x03d2, code lost:
        r0 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:185:0x03d3, code lost:
        r21 = r4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:187:0x03d9, code lost:
        r0 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:188:0x03da, code lost:
        r21 = r4;
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:189:0x03de, code lost:
        r22 = r13;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0054, code lost:
        r21 = r4;
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:192:0x03e3, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:193:0x03e4, code lost:
        r21 = r4;
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:194:0x03e8, code lost:
        r22 = r13;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:197:0x03ee, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:198:0x03ef, code lost:
        r21 = r4;
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:199:0x03f3, code lost:
        r22 = r13;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:200:0x03f5, code lost:
        r7 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x005e, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x005f, code lost:
        r21 = r4;
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:245:0x05af, code lost:
        com.miui.gallery.sdk.download.util.DownloadUtil.statDownloadRetryTimes(r2, r8, MAX_TRY_COUNT);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:246:0x05b8, code lost:
        return r21.getAbsolutePath();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:47:0x012d, code lost:
        r0 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x012e, code lost:
        r21 = r4;
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x0134, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x0135, code lost:
        r21 = r4;
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x013b, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x013c, code lost:
        r21 = r4;
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:79:0x01ba, code lost:
        r0 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:0x01bb, code lost:
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:81:0x01be, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:82:0x01bf, code lost:
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:83:0x01c2, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:84:0x01c3, code lost:
        r18 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:91:0x01d8, code lost:
        r0 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:92:0x01d9, code lost:
        r21 = r4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:93:0x01dd, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:94:0x01de, code lost:
        r21 = r4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:95:0x01e2, code lost:
        r0 = e;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:102:0x01f5 A[Catch:{ ConnectTimeoutException -> 0x0347, SocketTimeoutException -> 0x0341, Throwable -> 0x033b, all -> 0x0335 }] */
    /* JADX WARNING: Removed duplicated region for block: B:121:0x027b A[SYNTHETIC, Splitter:B:121:0x027b] */
    /* JADX WARNING: Removed duplicated region for block: B:126:0x028e A[SYNTHETIC, Splitter:B:126:0x028e] */
    /* JADX WARNING: Removed duplicated region for block: B:137:0x02cc A[EDGE_INSN: B:137:0x02cc->B:138:? ?: BREAK  
EDGE_INSN: B:137:0x02cc->B:138:? ?: BREAK  , SYNTHETIC, Splitter:B:137:0x02cc] */
    /* JADX WARNING: Removed duplicated region for block: B:144:0x02e8  */
    /* JADX WARNING: Removed duplicated region for block: B:184:0x03d2 A[ExcHandler: all (th java.lang.Throwable), Splitter:B:7:0x002f] */
    /* JADX WARNING: Removed duplicated region for block: B:209:0x0412 A[Catch:{ all -> 0x0563 }] */
    /* JADX WARNING: Removed duplicated region for block: B:210:0x0427 A[Catch:{ all -> 0x0563 }] */
    /* JADX WARNING: Removed duplicated region for block: B:213:0x043c  */
    /* JADX WARNING: Removed duplicated region for block: B:220:0x0493 A[Catch:{ all -> 0x0563 }] */
    /* JADX WARNING: Removed duplicated region for block: B:223:0x04b4  */
    /* JADX WARNING: Removed duplicated region for block: B:230:0x0503 A[Catch:{ all -> 0x0563 }] */
    /* JADX WARNING: Removed duplicated region for block: B:233:0x0524  */
    /* JADX WARNING: Removed duplicated region for block: B:241:0x0570  */
    /* JADX WARNING: Removed duplicated region for block: B:89:0x01d1 A[SYNTHETIC, Splitter:B:89:0x01d1] */
    private String downloadFile(RequestItem requestItem, String str) {
        File file;
        int i;
        long currentTimeMillis;
        long j;
        File file2;
        HttpURLConnection httpURLConnection;
        HttpURLConnection httpURLConnection2;
        Object[] objArr;
        String str2;
        String str3;
        int i2;
        HttpURLConnection httpURLConnection3;
        HttpURLConnection httpURLConnection4;
        HttpURLConnection httpURLConnection5;
        File file3;
        File file4;
        File file5;
        File file6;
        Object[] objArr2;
        String str4;
        String str5;
        long contentLength;
        InputStream inputStream;
        int i3;
        int i4;
        byte[] bArr;
        long j2;
        int read;
        long j3;
        long j4;
        AbsThumbnailDownloader absThumbnailDownloader = this;
        RequestItem requestItem2 = requestItem;
        String str6 = str;
        File file7 = new File(DownloadUtil.getDownloadTempFilePath(requestItem2.mDBItem, requestItem2.mDownloadItem.getType()));
        boolean z = true;
        int i5 = 0;
        OutputStream outputStream = null;
        ParcelFileDescriptor parcelFileDescriptor = null;
        InputStream inputStream2 = null;
        HttpURLConnection httpURLConnection6 = null;
        while (true) {
            if (!z || i5 >= MAX_TRY_COUNT) {
                file = file7;
                i = i5;
            } else {
                currentTimeMillis = System.currentTimeMillis();
                try {
                    httpURLConnection = NetworkUtils.getHttpConn(str6, RequestType.GET);
                    try {
                        int connTimeout = FileDownload.getConnTimeout(requestItem2.mDownloadItem.getType());
                        if (requestItem2.mDBItem.isVideoType()) {
                            connTimeout = FileDownload.clampConnTimeout(connTimeout * 2);
                        }
                        httpURLConnection.setConnectTimeout(connTimeout);
                        httpURLConnection.setReadTimeout(connTimeout);
                        httpURLConnection.connect();
                        int responseCode = httpURLConnection.getResponseCode();
                        if (responseCode >= 200) {
                            if (responseCode >= 300) {
                            }
                            i2 = i5;
                            contentLength = (long) httpURLConnection.getContentLength();
                            if (contentLength <= 0) {
                                contentLength = requestItem2.mDBItem.getSize();
                            }
                            try {
                                inputStream = httpURLConnection.getInputStream();
                                try {
                                    if (!DocumentProviderUtils.needUseDocumentProvider(file7.getAbsolutePath())) {
                                        DocumentFile documentFile = DocumentProviderUtils.getDocumentFile(GalleryApp.sGetAndroidContext(), file7);
                                        if (documentFile == null) {
                                            MiscUtil.closeSilently(inputStream);
                                            MiscUtil.closeSilently(outputStream);
                                            MiscUtil.closeSilently(parcelFileDescriptor);
                                            if (httpURLConnection != null) {
                                                httpURLConnection.disconnect();
                                            }
                                            str5 = getTag();
                                            str4 = "download %s, origin file %s, cost %d, success %s";
                                            objArr2 = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - currentTimeMillis), Boolean.valueOf(FileUtils.isFileExist(file7.getAbsolutePath()))};
                                        } else {
                                            ParcelFileDescriptor openFileDescriptor = GalleryApp.sGetAndroidContext().getContentResolver().openFileDescriptor(documentFile.getUri(), "w");
                                            try {
                                                outputStream = new FileOutputStream(openFileDescriptor.getFileDescriptor());
                                                parcelFileDescriptor = openFileDescriptor;
                                                i3 = 0;
                                            } catch (ConnectTimeoutException e) {
                                                e = e;
                                                file4 = file7;
                                                inputStream2 = inputStream;
                                                parcelFileDescriptor = openFileDescriptor;
                                                j3 = currentTimeMillis;
                                                httpURLConnection4 = httpURLConnection;
                                                httpURLConnection3 = null;
                                                absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                                                i5 = i2 + 1;
                                                if (i5 >= MAX_TRY_COUNT) {
                                                    absThumbnailDownloader.fireFailEvent(requestItem2, str6, new DownloadFailReason(ErrorCode.CONNECT_TIMEOUT, String.format("connect timeout: %s", new Object[]{str6}), e));
                                                }
                                                MiscUtil.closeSilently(inputStream2);
                                                MiscUtil.closeSilently(outputStream);
                                                MiscUtil.closeSilently(parcelFileDescriptor);
                                                if (httpURLConnection2 != null) {
                                                    httpURLConnection2.disconnect();
                                                    httpURLConnection2 = httpURLConnection3;
                                                }
                                                str3 = getTag();
                                                str2 = "download %s, origin file %s, cost %d, success %s";
                                                objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                                                Log.d(str3, str2, objArr);
                                                httpURLConnection6 = httpURLConnection2;
                                                z = true;
                                                file7 = file2;
                                            } catch (SocketTimeoutException e2) {
                                                e = e2;
                                                file5 = file7;
                                                inputStream2 = inputStream;
                                                parcelFileDescriptor = openFileDescriptor;
                                                j4 = currentTimeMillis;
                                                httpURLConnection5 = httpURLConnection;
                                                httpURLConnection3 = null;
                                                try {
                                                    absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                                                    i5 = i2 + 1;
                                                    if (i5 >= MAX_TRY_COUNT) {
                                                        absThumbnailDownloader.fireFailEvent(requestItem2, str6, new DownloadFailReason(ErrorCode.SOCKET_TIMEOUT, String.format("socket timeout: %s", new Object[]{str6}), e));
                                                    }
                                                    MiscUtil.closeSilently(inputStream2);
                                                    MiscUtil.closeSilently(outputStream);
                                                    MiscUtil.closeSilently(parcelFileDescriptor);
                                                    if (httpURLConnection2 != null) {
                                                        httpURLConnection2.disconnect();
                                                        httpURLConnection2 = httpURLConnection3;
                                                    }
                                                    str3 = getTag();
                                                    str2 = "download %s, origin file %s, cost %d, success %s";
                                                    objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                                                    Log.d(str3, str2, objArr);
                                                    httpURLConnection6 = httpURLConnection2;
                                                    z = true;
                                                    file7 = file2;
                                                } catch (Throwable th) {
                                                    th = th;
                                                    httpURLConnection = httpURLConnection2;
                                                    MiscUtil.closeSilently(inputStream2);
                                                    MiscUtil.closeSilently(outputStream);
                                                    MiscUtil.closeSilently(parcelFileDescriptor);
                                                    if (httpURLConnection != null) {
                                                        httpURLConnection.disconnect();
                                                    }
                                                    Log.d(getTag(), "download %s, origin file %s, cost %d, success %s", requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath())));
                                                    throw th;
                                                }
                                            } catch (Throwable th2) {
                                                th = th2;
                                                file3 = file7;
                                                inputStream2 = inputStream;
                                                parcelFileDescriptor = openFileDescriptor;
                                                j = currentTimeMillis;
                                                MiscUtil.closeSilently(inputStream2);
                                                MiscUtil.closeSilently(outputStream);
                                                MiscUtil.closeSilently(parcelFileDescriptor);
                                                if (httpURLConnection != null) {
                                                }
                                                Log.d(getTag(), "download %s, origin file %s, cost %d, success %s", requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath())));
                                                throw th;
                                            }
                                        }
                                    } else {
                                        i3 = 0;
                                        outputStream = new FileOutputStream(file7, false);
                                    }
                                    i4 = 8192;
                                    bArr = new byte[8192];
                                    j2 = 0;
                                    while (true) {
                                        read = inputStream.read(bArr, i3, i4);
                                        if (read < 0) {
                                            try {
                                                outputStream.write(bArr, i3, read);
                                                long j5 = j2 + ((long) read);
                                                DownloadItem.callbackProgress(requestItem2.mDownloadItem, j5, contentLength);
                                                j2 = j5;
                                                i4 = 8192;
                                                i3 = 0;
                                            } catch (ConnectTimeoutException e3) {
                                                e = e3;
                                                file4 = file7;
                                                inputStream2 = inputStream;
                                                j3 = currentTimeMillis;
                                                httpURLConnection4 = httpURLConnection;
                                                absThumbnailDownloader = this;
                                                httpURLConnection3 = null;
                                                absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                                                i5 = i2 + 1;
                                                if (i5 >= MAX_TRY_COUNT) {
                                                }
                                                MiscUtil.closeSilently(inputStream2);
                                                MiscUtil.closeSilently(outputStream);
                                                MiscUtil.closeSilently(parcelFileDescriptor);
                                                if (httpURLConnection2 != null) {
                                                }
                                                str3 = getTag();
                                                str2 = "download %s, origin file %s, cost %d, success %s";
                                                objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                                                Log.d(str3, str2, objArr);
                                                httpURLConnection6 = httpURLConnection2;
                                                z = true;
                                                file7 = file2;
                                            } catch (SocketTimeoutException e4) {
                                                e = e4;
                                                file5 = file7;
                                                inputStream2 = inputStream;
                                                j4 = currentTimeMillis;
                                                httpURLConnection5 = httpURLConnection;
                                                absThumbnailDownloader = this;
                                                httpURLConnection3 = null;
                                                absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                                                i5 = i2 + 1;
                                                if (i5 >= MAX_TRY_COUNT) {
                                                }
                                                MiscUtil.closeSilently(inputStream2);
                                                MiscUtil.closeSilently(outputStream);
                                                MiscUtil.closeSilently(parcelFileDescriptor);
                                                if (httpURLConnection2 != null) {
                                                }
                                                str3 = getTag();
                                                str2 = "download %s, origin file %s, cost %d, success %s";
                                                objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                                                Log.d(str3, str2, objArr);
                                                httpURLConnection6 = httpURLConnection2;
                                                z = true;
                                                file7 = file2;
                                            } catch (Throwable th3) {
                                                th = th3;
                                                file2 = file7;
                                                inputStream2 = inputStream;
                                                j = currentTimeMillis;
                                                MiscUtil.closeSilently(inputStream2);
                                                MiscUtil.closeSilently(outputStream);
                                                MiscUtil.closeSilently(parcelFileDescriptor);
                                                if (httpURLConnection != null) {
                                                }
                                                Log.d(getTag(), "download %s, origin file %s, cost %d, success %s", requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath())));
                                                throw th;
                                            }
                                        } else {
                                            try {
                                                break;
                                            } catch (ConnectTimeoutException e5) {
                                                e = e5;
                                                absThumbnailDownloader = this;
                                                file4 = file7;
                                                inputStream2 = inputStream;
                                                j3 = currentTimeMillis;
                                                httpURLConnection4 = httpURLConnection;
                                                httpURLConnection3 = null;
                                                absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                                                i5 = i2 + 1;
                                                if (i5 >= MAX_TRY_COUNT) {
                                                }
                                                MiscUtil.closeSilently(inputStream2);
                                                MiscUtil.closeSilently(outputStream);
                                                MiscUtil.closeSilently(parcelFileDescriptor);
                                                if (httpURLConnection2 != null) {
                                                }
                                                str3 = getTag();
                                                str2 = "download %s, origin file %s, cost %d, success %s";
                                                objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                                                Log.d(str3, str2, objArr);
                                                httpURLConnection6 = httpURLConnection2;
                                                z = true;
                                                file7 = file2;
                                            } catch (SocketTimeoutException e6) {
                                                e = e6;
                                                absThumbnailDownloader = this;
                                                file5 = file7;
                                                inputStream2 = inputStream;
                                                j4 = currentTimeMillis;
                                                httpURLConnection5 = httpURLConnection;
                                                httpURLConnection3 = null;
                                                absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                                                i5 = i2 + 1;
                                                if (i5 >= MAX_TRY_COUNT) {
                                                }
                                                MiscUtil.closeSilently(inputStream2);
                                                MiscUtil.closeSilently(outputStream);
                                                MiscUtil.closeSilently(parcelFileDescriptor);
                                                if (httpURLConnection2 != null) {
                                                }
                                                str3 = getTag();
                                                str2 = "download %s, origin file %s, cost %d, success %s";
                                                objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                                                Log.d(str3, str2, objArr);
                                                httpURLConnection6 = httpURLConnection2;
                                                z = true;
                                                file7 = file2;
                                            } catch (Throwable th4) {
                                                th = th4;
                                                file3 = file7;
                                                inputStream2 = inputStream;
                                                j = currentTimeMillis;
                                                MiscUtil.closeSilently(inputStream2);
                                                MiscUtil.closeSilently(outputStream);
                                                MiscUtil.closeSilently(parcelFileDescriptor);
                                                if (httpURLConnection != null) {
                                                }
                                                Log.d(getTag(), "download %s, origin file %s, cost %d, success %s", requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath())));
                                                throw th;
                                            }
                                        }
                                    }
                                    outputStream.flush();
                                    absThumbnailDownloader = this;
                                    absThumbnailDownloader.decreaseConnTimeout(requestItem2.mDownloadItem.getType());
                                    DownloadUtil.statDownloadSuccess(requestItem2, currentTimeMillis, contentLength);
                                    MiscUtil.closeSilently(inputStream);
                                    MiscUtil.closeSilently(outputStream);
                                    MiscUtil.closeSilently(parcelFileDescriptor);
                                    if (httpURLConnection != null) {
                                        httpURLConnection.disconnect();
                                    }
                                    Log.d(getTag(), "download %s, origin file %s, cost %d, success %s", requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - currentTimeMillis), Boolean.valueOf(FileUtils.isFileExist(file7.getAbsolutePath())));
                                    i = i2 + 1;
                                    file = file7;
                                } catch (ConnectTimeoutException e7) {
                                    e = e7;
                                } catch (SocketTimeoutException e8) {
                                    e = e8;
                                    file5 = file7;
                                    inputStream2 = inputStream;
                                    j4 = currentTimeMillis;
                                    httpURLConnection5 = httpURLConnection;
                                    httpURLConnection3 = null;
                                    absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                                    i5 = i2 + 1;
                                    if (i5 >= MAX_TRY_COUNT) {
                                    }
                                    MiscUtil.closeSilently(inputStream2);
                                    MiscUtil.closeSilently(outputStream);
                                    MiscUtil.closeSilently(parcelFileDescriptor);
                                    if (httpURLConnection2 != null) {
                                    }
                                    str3 = getTag();
                                    str2 = "download %s, origin file %s, cost %d, success %s";
                                    objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                                    Log.d(str3, str2, objArr);
                                    httpURLConnection6 = httpURLConnection2;
                                    z = true;
                                    file7 = file2;
                                } catch (Throwable th5) {
                                    th = th5;
                                    file3 = file7;
                                    inputStream2 = inputStream;
                                    j = currentTimeMillis;
                                    MiscUtil.closeSilently(inputStream2);
                                    MiscUtil.closeSilently(outputStream);
                                    MiscUtil.closeSilently(parcelFileDescriptor);
                                    if (httpURLConnection != null) {
                                    }
                                    Log.d(getTag(), "download %s, origin file %s, cost %d, success %s", requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath())));
                                    throw th;
                                }
                            } catch (FileNotFoundException e9) {
                                FileNotFoundException fileNotFoundException = e9;
                                ThumbnailPreference.putThumbnailKey(requestItem2.mDBItem.getSha1());
                                file2 = file7;
                                j = currentTimeMillis;
                                try {
                                    absThumbnailDownloader.fireFailEvent(requestItem2, str6, new DownloadFailReason(ErrorCode.THUMBNAIL_BUILD_ERROR, String.format(Locale.US, "thumbnail build error, ret %s", new Object[]{Integer.valueOf(responseCode)}), fileNotFoundException));
                                    MiscUtil.closeSilently(inputStream2);
                                    MiscUtil.closeSilently(outputStream);
                                    MiscUtil.closeSilently(parcelFileDescriptor);
                                    if (httpURLConnection != null) {
                                        httpURLConnection.disconnect();
                                    }
                                    Log.d(getTag(), "download %s, origin file %s, cost %d, success %s", requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath())));
                                    return null;
                                } catch (ConnectTimeoutException e10) {
                                    e = e10;
                                } catch (SocketTimeoutException e11) {
                                    e = e11;
                                    httpURLConnection3 = null;
                                    httpURLConnection5 = httpURLConnection;
                                    absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                                    i5 = i2 + 1;
                                    if (i5 >= MAX_TRY_COUNT) {
                                    }
                                    MiscUtil.closeSilently(inputStream2);
                                    MiscUtil.closeSilently(outputStream);
                                    MiscUtil.closeSilently(parcelFileDescriptor);
                                    if (httpURLConnection2 != null) {
                                    }
                                    str3 = getTag();
                                    str2 = "download %s, origin file %s, cost %d, success %s";
                                    objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                                    Log.d(str3, str2, objArr);
                                    httpURLConnection6 = httpURLConnection2;
                                    z = true;
                                    file7 = file2;
                                } catch (Throwable th6) {
                                    th = th6;
                                    MiscUtil.closeSilently(inputStream2);
                                    MiscUtil.closeSilently(outputStream);
                                    MiscUtil.closeSilently(parcelFileDescriptor);
                                    if (httpURLConnection != null) {
                                    }
                                    Log.d(getTag(), "download %s, origin file %s, cost %d, success %s", requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath())));
                                    throw th;
                                }
                            }
                        }
                        if (CheckResult.checkKSSThumbnailResult(responseCode) == GallerySyncCode.NOT_RETRY_ERROR) {
                            ThumbnailPreference.putThumbnailKey(requestItem2.mDBItem.getSha1());
                            Log.e(getTag(), "thumbnail can't be download forever, just add sha1 to preference %d, %s", Integer.valueOf(responseCode), requestItem2.mDBItem.getSha1());
                            HashMap hashMap = new HashMap();
                            hashMap.put("statusCode", String.valueOf(responseCode));
                            hashMap.put("downloadType", String.valueOf(requestItem2.mDownloadItem.getType()));
                            GallerySamplingStatHelper.recordErrorEvent("Sync", "sync_thumbnail_build_error", hashMap);
                            httpURLConnection3 = null;
                            absThumbnailDownloader.fireFailEvent(requestItem2, str6, new DownloadFailReason(ErrorCode.THUMBNAIL_BUILD_ERROR, String.format("thumbnail can't build: %s", new Object[]{requestItem2.mDBItem.getFileName()}), null));
                            MiscUtil.closeSilently(inputStream2);
                            MiscUtil.closeSilently(outputStream);
                            MiscUtil.closeSilently(parcelFileDescriptor);
                            if (httpURLConnection != null) {
                                httpURLConnection.disconnect();
                            }
                            str5 = getTag();
                            str4 = "download %s, origin file %s, cost %d, success %s";
                            objArr2 = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - currentTimeMillis), Boolean.valueOf(FileUtils.isFileExist(file7.getAbsolutePath()))};
                        } else {
                            if (CheckResult.isNotRetryCode(responseCode)) {
                                i2 = i5;
                                httpURLConnection3 = null;
                                absThumbnailDownloader.fireFailEvent(requestItem2, str6, new DownloadFailReason(ErrorCode.SERVER_ERROR, String.format("server ret: %s", new Object[]{Integer.valueOf(responseCode)}), null));
                                MiscUtil.closeSilently(inputStream2);
                                MiscUtil.closeSilently(outputStream);
                                MiscUtil.closeSilently(parcelFileDescriptor);
                                if (httpURLConnection != null) {
                                    httpURLConnection.disconnect();
                                }
                                str5 = getTag();
                                str4 = "download %s, origin file %s, cost %d, success %s";
                                objArr2 = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - currentTimeMillis), Boolean.valueOf(FileUtils.isFileExist(file7.getAbsolutePath()))};
                            }
                            i2 = i5;
                            contentLength = (long) httpURLConnection.getContentLength();
                            if (contentLength <= 0) {
                            }
                            inputStream = httpURLConnection.getInputStream();
                            if (!DocumentProviderUtils.needUseDocumentProvider(file7.getAbsolutePath())) {
                            }
                            i4 = 8192;
                            bArr = new byte[8192];
                            j2 = 0;
                            while (true) {
                                read = inputStream.read(bArr, i3, i4);
                                if (read < 0) {
                                }
                                j2 = j5;
                                i4 = 8192;
                                i3 = 0;
                            }
                            outputStream.flush();
                            absThumbnailDownloader = this;
                            absThumbnailDownloader.decreaseConnTimeout(requestItem2.mDownloadItem.getType());
                            DownloadUtil.statDownloadSuccess(requestItem2, currentTimeMillis, contentLength);
                            MiscUtil.closeSilently(inputStream);
                            MiscUtil.closeSilently(outputStream);
                            MiscUtil.closeSilently(parcelFileDescriptor);
                            if (httpURLConnection != null) {
                            }
                            Log.d(getTag(), "download %s, origin file %s, cost %d, success %s", requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - currentTimeMillis), Boolean.valueOf(FileUtils.isFileExist(file7.getAbsolutePath())));
                            i = i2 + 1;
                            file = file7;
                        }
                    } catch (ConnectTimeoutException e12) {
                        e = e12;
                        File file8 = file7;
                        j = currentTimeMillis;
                        httpURLConnection4 = httpURLConnection;
                        absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                        i5 = i2 + 1;
                        if (i5 >= MAX_TRY_COUNT) {
                        }
                        MiscUtil.closeSilently(inputStream2);
                        MiscUtil.closeSilently(outputStream);
                        MiscUtil.closeSilently(parcelFileDescriptor);
                        if (httpURLConnection2 != null) {
                        }
                        str3 = getTag();
                        str2 = "download %s, origin file %s, cost %d, success %s";
                        objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                        Log.d(str3, str2, objArr);
                        httpURLConnection6 = httpURLConnection2;
                        z = true;
                        file7 = file2;
                    } catch (SocketTimeoutException e13) {
                        e = e13;
                        File file9 = file7;
                        j = currentTimeMillis;
                        httpURLConnection5 = httpURLConnection;
                        absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                        i5 = i2 + 1;
                        if (i5 >= MAX_TRY_COUNT) {
                        }
                        MiscUtil.closeSilently(inputStream2);
                        MiscUtil.closeSilently(outputStream);
                        MiscUtil.closeSilently(parcelFileDescriptor);
                        if (httpURLConnection2 != null) {
                        }
                        str3 = getTag();
                        str2 = "download %s, origin file %s, cost %d, success %s";
                        objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                        Log.d(str3, str2, objArr);
                        httpURLConnection6 = httpURLConnection2;
                        z = true;
                        file7 = file2;
                    } catch (Throwable th7) {
                    }
                } catch (ConnectTimeoutException e14) {
                    e = e14;
                    file2 = file7;
                    i2 = i5;
                    j = currentTimeMillis;
                    httpURLConnection3 = null;
                    httpURLConnection4 = httpURLConnection6;
                    absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                    i5 = i2 + 1;
                    if (i5 >= MAX_TRY_COUNT) {
                    }
                    MiscUtil.closeSilently(inputStream2);
                    MiscUtil.closeSilently(outputStream);
                    MiscUtil.closeSilently(parcelFileDescriptor);
                    if (httpURLConnection2 != null) {
                    }
                    str3 = getTag();
                    str2 = "download %s, origin file %s, cost %d, success %s";
                    objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                    Log.d(str3, str2, objArr);
                    httpURLConnection6 = httpURLConnection2;
                    z = true;
                    file7 = file2;
                } catch (SocketTimeoutException e15) {
                    e = e15;
                    file2 = file7;
                    i2 = i5;
                    j = currentTimeMillis;
                    httpURLConnection3 = null;
                    httpURLConnection5 = httpURLConnection6;
                    absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
                    i5 = i2 + 1;
                    if (i5 >= MAX_TRY_COUNT) {
                    }
                    MiscUtil.closeSilently(inputStream2);
                    MiscUtil.closeSilently(outputStream);
                    MiscUtil.closeSilently(parcelFileDescriptor);
                    if (httpURLConnection2 != null) {
                    }
                    str3 = getTag();
                    str2 = "download %s, origin file %s, cost %d, success %s";
                    objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
                    Log.d(str3, str2, objArr);
                    httpURLConnection6 = httpURLConnection2;
                    z = true;
                    file7 = file2;
                } catch (Throwable th8) {
                    th = th8;
                    file2 = file7;
                    j = currentTimeMillis;
                    httpURLConnection = httpURLConnection6;
                    MiscUtil.closeSilently(inputStream2);
                    MiscUtil.closeSilently(outputStream);
                    MiscUtil.closeSilently(parcelFileDescriptor);
                    if (httpURLConnection != null) {
                    }
                    Log.d(getTag(), "download %s, origin file %s, cost %d, success %s", requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath())));
                    throw th;
                }
            }
            file7 = file2;
        }
        Log.d(str5, str4, objArr2);
        return null;
        file4 = file7;
        j3 = currentTimeMillis;
        httpURLConnection4 = httpURLConnection;
        httpURLConnection3 = null;
        absThumbnailDownloader.increaseConnTimeout(requestItem2.mDownloadItem.getType());
        i5 = i2 + 1;
        if (i5 >= MAX_TRY_COUNT) {
        }
        MiscUtil.closeSilently(inputStream2);
        MiscUtil.closeSilently(outputStream);
        MiscUtil.closeSilently(parcelFileDescriptor);
        if (httpURLConnection2 != null) {
        }
        str3 = getTag();
        str2 = "download %s, origin file %s, cost %d, success %s";
        objArr = new Object[]{requestItem2.mDownloadItem, requestItem2.mDBItem.getFileName(), Long.valueOf(System.currentTimeMillis() - j), Boolean.valueOf(FileUtils.isFileExist(file2.getAbsolutePath()))};
        Log.d(str3, str2, objArr);
        httpURLConnection6 = httpURLConnection2;
        z = true;
        file7 = file2;
    }

    private void downloadInternal(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, List<RequestItem> list) {
        JSONObject requestUrls = requestUrls(account, galleryExtendedAuthToken, list);
        if (requestUrls != null) {
            doFileDownload(list, requestUrls);
        }
    }

    private void fireFailEvent(RequestItem requestItem, String str, DownloadFailReason downloadFailReason) {
        Log.d(getTag(), "download fail %s", (Object) downloadFailReason);
        if ((downloadFailReason != null ? downloadFailReason.getCause() : null) != null) {
            Log.e(getTag(), downloadFailReason.getCause());
        }
        deleteTempFile(requestItem);
        if (requestItem.mDownloadItem.isStatusOk()) {
            DownloadItem.callbackError(requestItem.mDownloadItem, downloadFailReason);
        }
        DownloadUtil.statDownloadError(requestItem, str, downloadFailReason);
    }

    private String getRequestUrl(RequestItem requestItem, String str) {
        return requestItem.mDBItem.isShareItem() ? ShareMedia.getRequestThumbnailUrl() : OwnerMedia.getRequestThumbnailUrl();
    }

    private void increaseConnTimeout(DownloadType downloadType) {
        int connTimeout = FileDownload.getConnTimeout(downloadType) + 3000;
        if (FileDownload.setConnTimeout(downloadType, connTimeout)) {
            Log.i(getTag(), "increase conn timeout %d, type %s", Integer.valueOf(connTimeout), downloadType.name());
        }
    }

    private boolean isValidUrl(Uri uri) {
        String scheme = uri.getScheme();
        return "http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme);
    }

    private void onPostDownload(RequestItem requestItem, String str) {
        if (FileUtils.isFileExist(str)) {
            byte[] bArr = null;
            if (!handleDownloadTempFile(requestItem, str)) {
                ThumbnailPreference.putThumbnailKey(requestItem.mDBItem.getSha1());
                fireFailEvent(requestItem, null, new DownloadFailReason(ErrorCode.WRITE_EXIF_ERROR, "write exif error", null));
                return;
            }
            ErrorCode ensureDownloadFolder = DownloadUtil.ensureDownloadFolder(requestItem.mDBItem, requestItem.mDownloadItem.getType());
            if (ensureDownloadFolder != ErrorCode.NO_ERROR) {
                fireFailEvent(requestItem, null, new DownloadFailReason(ensureDownloadFolder, String.format(Locale.US, "error create folder: %s", new Object[]{DownloadUtil.getDownloadFolderPath(requestItem.mDBItem, requestItem.mDownloadItem.getType())}), null));
            } else if (requestItem.mDownloadItem.isCancelled()) {
                Log.d(getTag(), "downloading for image[%s] is cancelled", (Object) requestItem.mDBItem);
                deleteTempFile(requestItem);
            } else {
                File file = new File(DownloadUtil.getDownloadFilePath(requestItem.mDBItem, requestItem.mDownloadItem.getType()));
                if (requestItem.mDBItem.isSecretItem()) {
                    boolean encryptFile = CryptoUtil.encryptFile(str, file.getAbsolutePath(), requestItem.mDBItem.getSecretKey());
                    MediaFileUtils.deleteFileType(FileType.TEMP, str);
                    if (!encryptFile) {
                        fireFailEvent(requestItem, null, new DownloadFailReason(ErrorCode.FILE_OPERATE_ERROR, "encrypt error", null));
                        return;
                    }
                } else if (!FileUtils.move(new File(str), file)) {
                    fireFailEvent(requestItem, null, new DownloadFailReason(ErrorCode.FILE_OPERATE_ERROR, "rename error", null));
                    return;
                }
                DBImage dBItemForUri = requestItem.mDownloadItem.getUriAdapter().getDBItemForUri(requestItem.mDownloadItem.getUri());
                RequestItem requestItem2 = new RequestItem(requestItem.mDownloadItem, dBItemForUri);
                if (!checkItemValid(requestItem2)) {
                    Log.d(getTag(), "DBImage [%s] is invalid after download file for uri [%s] finished", dBItemForUri, requestItem2.mDownloadItem.getUri());
                    MediaFileUtils.deleteFileType(FileType.NORMAL, file.getAbsolutePath());
                    return;
                }
                updateDataBase(requestItem, file.getAbsolutePath());
                if (requestItem.mDownloadItem.compareAnsSetStatus(0, 3)) {
                    DownloadItem downloadItem = requestItem.mDownloadItem;
                    String absolutePath = file.getAbsolutePath();
                    if (requestItem.mDBItem.isSecretItem()) {
                        bArr = requestItem.mDBItem.getSecretKey();
                    }
                    DownloadItem.callbackSuccess(downloadItem, new DownloadedItem(absolutePath, bArr));
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:41:0x00fa  */
    /* JADX WARNING: Removed duplicated region for block: B:54:0x012d A[LOOP:2: B:52:0x0127->B:54:0x012d, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:62:0x0158 A[LOOP:3: B:60:0x0152->B:62:0x0158, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x017f A[LOOP:4: B:68:0x0179->B:70:0x017f, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x01a6 A[LOOP:5: B:76:0x01a0->B:78:0x01a6, LOOP_END] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:81:0x01b2=Splitter:B:81:0x01b2, B:65:0x0164=Splitter:B:65:0x0164, B:49:0x0116=Splitter:B:49:0x0116, B:57:0x0139=Splitter:B:57:0x0139, B:73:0x018b=Splitter:B:73:0x018b} */
    private JSONObject requestUrls(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, List<RequestItem> list) {
        JSONObject jSONObject;
        JSONObject jSONObject2;
        JSONObject jSONObject3;
        JSONObject jSONObject4;
        JSONObject jSONObject5;
        DownloadFailReason downloadFailReason;
        JSONObject jSONObject6;
        StringBuilder sb = new StringBuilder();
        for (RequestItem requestItem : list) {
            if (sb.length() > 0) {
                sb.append(",");
            }
            sb.append(requestItem.mDBItem.getRequestId());
        }
        String requestUrl = getRequestUrl((RequestItem) list.get(0), account.name);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair(nexExportFormat.TAG_FORMAT_WIDTH, Integer.toString(getRequestWidth())));
        arrayList.add(new BasicNameValuePair(nexExportFormat.TAG_FORMAT_HEIGHT, Integer.toString(getRequestHeight())));
        arrayList.add(new BasicNameValuePair("ids", sb.toString()));
        arrayList.add(new BasicNameValuePair("priority", ((RequestItem) list.get(0)).mDownloadItem.getType().isBackground() ? "low" : "high"));
        try {
            JSONObject fromXiaomi = CloudUtils.getFromXiaomi(requestUrl, arrayList, account, galleryExtendedAuthToken, 0, false);
            if (fromXiaomi == null) {
                downloadFailReason = new DownloadFailReason(ErrorCode.SERVER_ERROR, "data empty", null);
            } else if (fromXiaomi.optInt("code") == 0) {
                JSONObject optJSONObject = fromXiaomi.optJSONObject("data");
                jSONObject6 = optJSONObject != null ? optJSONObject.optJSONObject("content") : null;
                if (jSONObject6 == null) {
                    try {
                        downloadFailReason = new DownloadFailReason(ErrorCode.SERVER_ERROR, "data empty", null);
                    } catch (JSONException e) {
                        Throwable th = e;
                        jSONObject = jSONObject6;
                        e = th;
                    } catch (ConnectTimeoutException e2) {
                        Throwable th2 = e2;
                        jSONObject2 = jSONObject6;
                        e = th2;
                        DownloadFailReason downloadFailReason2 = new DownloadFailReason(ErrorCode.CONNECT_TIMEOUT, String.format("connect timeout: %s", new Object[]{requestUrl}), e);
                        for (RequestItem fireFailEvent : list) {
                        }
                        return jSONObject2;
                    } catch (SocketTimeoutException e3) {
                        Throwable th3 = e3;
                        jSONObject3 = jSONObject6;
                        e = th3;
                        DownloadFailReason downloadFailReason3 = new DownloadFailReason(ErrorCode.SOCKET_TIMEOUT, String.format("connect timeout: %s", new Object[]{requestUrl}), e);
                        for (RequestItem fireFailEvent2 : list) {
                        }
                        return jSONObject3;
                    } catch (GalleryMiCloudServerException e4) {
                        GalleryMiCloudServerException galleryMiCloudServerException = e4;
                        jSONObject4 = jSONObject6;
                        e = galleryMiCloudServerException;
                        DownloadFailReason downloadFailReason4 = new DownloadFailReason(ErrorParseUtil.parseError(e, null), e.getCloudServerException().getMessage(), e.getCloudServerException());
                        for (RequestItem fireFailEvent3 : list) {
                        }
                        return jSONObject4;
                    } catch (Throwable th4) {
                        Throwable th5 = th4;
                        jSONObject5 = jSONObject6;
                        th = th5;
                        DownloadFailReason downloadFailReason5 = new DownloadFailReason(ErrorParseUtil.parseError(th, null), th.getMessage(), th);
                        for (RequestItem fireFailEvent4 : list) {
                        }
                        return jSONObject5;
                    }
                } else {
                    downloadFailReason = null;
                }
                if (downloadFailReason != null) {
                    for (RequestItem fireFailEvent5 : list) {
                        fireFailEvent(fireFailEvent5, null, downloadFailReason);
                    }
                }
                return jSONObject6;
            } else {
                downloadFailReason = new DownloadFailReason(ErrorCode.SERVER_ERROR, fromXiaomi.optString("description"), null);
            }
            jSONObject6 = null;
            if (downloadFailReason != null) {
            }
            return jSONObject6;
        } catch (JSONException e5) {
            e = e5;
            jSONObject = null;
            DownloadFailReason downloadFailReason6 = new DownloadFailReason(ErrorCode.DATA_PARSE_ERROR, "parse data error", e);
            for (RequestItem fireFailEvent6 : list) {
                fireFailEvent(fireFailEvent6, null, downloadFailReason6);
            }
            return jSONObject;
        } catch (ConnectTimeoutException e6) {
            e = e6;
            jSONObject2 = null;
            DownloadFailReason downloadFailReason22 = new DownloadFailReason(ErrorCode.CONNECT_TIMEOUT, String.format("connect timeout: %s", new Object[]{requestUrl}), e);
            while (r12.hasNext()) {
                fireFailEvent(fireFailEvent, null, downloadFailReason22);
            }
            return jSONObject2;
        } catch (SocketTimeoutException e7) {
            e = e7;
            jSONObject3 = null;
            DownloadFailReason downloadFailReason32 = new DownloadFailReason(ErrorCode.SOCKET_TIMEOUT, String.format("connect timeout: %s", new Object[]{requestUrl}), e);
            while (r12.hasNext()) {
                fireFailEvent(fireFailEvent2, null, downloadFailReason32);
            }
            return jSONObject3;
        } catch (GalleryMiCloudServerException e8) {
            e = e8;
            jSONObject4 = null;
            DownloadFailReason downloadFailReason42 = new DownloadFailReason(ErrorParseUtil.parseError(e, null), e.getCloudServerException().getMessage(), e.getCloudServerException());
            while (r12.hasNext()) {
                fireFailEvent(fireFailEvent3, null, downloadFailReason42);
            }
            return jSONObject4;
        } catch (Throwable th6) {
            th = th6;
            jSONObject5 = null;
            DownloadFailReason downloadFailReason52 = new DownloadFailReason(ErrorParseUtil.parseError(th, null), th.getMessage(), th);
            while (r12.hasNext()) {
                fireFailEvent(fireFailEvent4, null, downloadFailReason52);
            }
            return jSONObject5;
        }
    }

    /* access modifiers changed from: protected */
    public abstract String checkAndReturnValidPath(RequestItem requestItem);

    /* access modifiers changed from: protected */
    public void doFileDownload(List<RequestItem> list, JSONObject jSONObject) {
        for (RequestItem requestItem : list) {
            downloadFileItem(requestItem, jSONObject.optJSONObject(requestItem.mDBItem.getRequestId()));
        }
    }

    public void download(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, List<DownloadItem> list) {
        if (list != null && list.size() > 0) {
            ArrayList arrayList = new ArrayList();
            for (DownloadItem downloadItem : list) {
                if (!checkConditionPermitted(downloadItem)) {
                    Log.d(getTag(), "Download condition not ok type %s", (Object) downloadItem.getType());
                } else {
                    RequestItem requestItem = new RequestItem(downloadItem, downloadItem.getUriAdapter().getDBItemForUri(downloadItem.getUri()));
                    String checkAndReturnValidPath = checkAndReturnValidPath(requestItem);
                    byte[] bArr = null;
                    if (TextUtils.isEmpty(checkAndReturnValidPath)) {
                        if (ThumbnailPreference.containsThumbnailKey(requestItem.mDBItem.getSha1())) {
                            Log.i(getTag(), "build error sha1 %s", (Object) requestItem.mDBItem.getSha1());
                            fireFailEvent(requestItem, null, new DownloadFailReason(ErrorCode.THUMBNAIL_BUILD_ERROR, String.format("thumbnail can't build: %s", new Object[]{requestItem.mDBItem.getFileName()}), null));
                        } else {
                            arrayList.add(requestItem);
                        }
                    } else if (downloadItem.compareAnsSetStatus(0, 3)) {
                        DownloadItem downloadItem2 = requestItem.mDownloadItem;
                        if (requestItem.mDBItem.isSecretItem()) {
                            bArr = requestItem.mDBItem.getSecretKey();
                        }
                        DownloadItem.callbackSuccess(downloadItem2, new DownloadedItem(checkAndReturnValidPath, bArr));
                    }
                }
            }
            if (arrayList.size() > 0) {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    if (!checkItemValid((RequestItem) it.next())) {
                        it.remove();
                    }
                }
                if (arrayList.size() > 0) {
                    for (Entry entry : classifyRequest(arrayList).entrySet()) {
                        downloadInternal(account, galleryExtendedAuthToken, (List) entry.getValue());
                        Log.d(getTag(), "download batch %s", entry.getKey());
                    }
                }
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public boolean downloadFileItem(RequestItem requestItem, JSONObject jSONObject) {
        String str;
        Log.i(getTag(), "download id %s", (Object) requestItem.mDBItem.getId());
        if (Thread.currentThread().isInterrupted()) {
            Log.i(getTag(), "for download interrupt %s", (Object) Boolean.valueOf(Thread.currentThread().isInterrupted()));
            return false;
        } else if (!requestItem.mDownloadItem.isStatusOk()) {
            Log.i(getTag(), "item %s status %s", requestItem.mDownloadItem.getKey(), Integer.valueOf(requestItem.mDownloadItem.getStatus()));
            return false;
        } else {
            String requestId = requestItem.mDBItem.getRequestId();
            byte[] bArr = null;
            if (jSONObject == null) {
                Log.w(getTag(), "id: %s not found in content json", requestId);
                ThumbnailPreference.putThumbnailKey(requestItem.mDBItem.getSha1());
                fireFailEvent(requestItem, null, new DownloadFailReason(ErrorCode.THUMBNAIL_BUILD_ERROR, String.format(Locale.US, "request url for %s error", new Object[]{requestItem.mDBItem.getServerId()}), null));
                return false;
            }
            ReentrantLock uriLock = requestItem.mDownloadItem.getUriLock();
            if (uriLock.isLocked()) {
                if (shouldWaitUriLock()) {
                    Log.d(getTag(), "%s wait lock", (Object) requestItem.mDownloadItem);
                } else {
                    Log.d(getTag(), "%s is locked, skip download", (Object) requestItem.mDownloadItem);
                    return false;
                }
            }
            uriLock.lock();
            try {
                String checkAndReturnValidPath = checkAndReturnValidPath(requestItem);
                if (!TextUtils.isEmpty(checkAndReturnValidPath)) {
                    Log.d(getTag(), "no need download file: %s, thumb: %s", requestItem.mDBItem.getLocalFile(), requestItem.mDBItem.getThumbnailFile());
                    if (requestItem.mDownloadItem.compareAnsSetStatus(0, 3)) {
                        DownloadItem downloadItem = requestItem.mDownloadItem;
                        if (requestItem.mDBItem.isSecretItem()) {
                            bArr = requestItem.mDBItem.getSecretKey();
                        }
                        DownloadItem.callbackSuccess(downloadItem, new DownloadedItem(checkAndReturnValidPath, bArr));
                    }
                    return true;
                }
                boolean optBoolean = jSONObject.optBoolean("isUrl");
                String optString = jSONObject.optString("data");
                ErrorCode ensureDownloadTempFolder = DownloadUtil.ensureDownloadTempFolder(requestItem.mDBItem, requestItem.mDownloadItem.getType());
                if (ensureDownloadTempFolder != ErrorCode.NO_ERROR) {
                    fireFailEvent(requestItem, null, new DownloadFailReason(ensureDownloadTempFolder, String.format(Locale.US, "error create folder: %s", new Object[]{DownloadUtil.getDownloadTempFolderPath(requestItem.mDBItem, requestItem.mDownloadItem.getType())}), null));
                    uriLock.unlock();
                    return false;
                }
                if (optBoolean) {
                    Uri parse = Uri.parse(optString);
                    if (!isValidUrl(parse)) {
                        ThumbnailPreference.putThumbnailKey(requestItem.mDBItem.getSha1());
                        fireFailEvent(requestItem, null, new DownloadFailReason(ErrorCode.THUMBNAIL_BUILD_ERROR, String.format(Locale.US, "invalid url %s for %s", new Object[]{parse, requestItem.mDBItem.getServerId()}), null));
                        uriLock.unlock();
                        return false;
                    }
                    str = downloadFile(requestItem, parse.toString());
                } else {
                    str = downloadData(requestItem, optString);
                }
                onPostDownload(requestItem, str);
                uriLock.unlock();
                return true;
            } finally {
                uriLock.unlock();
            }
        }
    }

    /* access modifiers changed from: protected */
    public abstract int getRequestHeight();

    /* access modifiers changed from: protected */
    public abstract int getRequestWidth();

    /* access modifiers changed from: protected */
    public abstract String getTag();

    /* access modifiers changed from: protected */
    public boolean handleDownloadTempFile(RequestItem requestItem, String str) {
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean shouldWaitUriLock() {
        return true;
    }

    /* access modifiers changed from: protected */
    public abstract boolean updateDataBase(RequestItem requestItem, String str);
}
