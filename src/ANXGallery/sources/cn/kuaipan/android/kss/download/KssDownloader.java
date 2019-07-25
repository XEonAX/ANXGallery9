package cn.kuaipan.android.kss.download;

import android.text.TextUtils;
import cn.kuaipan.android.exception.ErrorHelper;
import cn.kuaipan.android.exception.KscException;
import cn.kuaipan.android.exception.KscRuntimeException;
import cn.kuaipan.android.http.IKscDecoder;
import cn.kuaipan.android.http.IKscTransferListener;
import cn.kuaipan.android.http.KscHttpRequest;
import cn.kuaipan.android.http.KscHttpRequest.HttpMethod;
import cn.kuaipan.android.http.KscHttpResponse;
import cn.kuaipan.android.http.KscHttpTransmitter;
import cn.kuaipan.android.kss.IKssDownloadRequestResult;
import cn.kuaipan.android.kss.KssDef;
import cn.kuaipan.android.kss.RC4Encoder;
import cn.kuaipan.android.utils.FileUtils;
import com.xiaomi.micloudsdk.stat.MiCloudStatManager;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.InvalidKeyException;
import java.util.concurrent.atomic.AtomicInteger;
import org.apache.http.HttpEntity;

public class KssDownloader implements KssDef {
    private final KscHttpTransmitter mTransmitter;

    public KssDownloader(KscHttpTransmitter kscHttpTransmitter) {
        this.mTransmitter = kscHttpTransmitter;
    }

    /* JADX WARNING: Removed duplicated region for block: B:109:0x0129 A[SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x0137  */
    /* JADX WARNING: Removed duplicated region for block: B:92:0x0150  */
    /* JADX WARNING: Removed duplicated region for block: B:93:0x0158  */
    /* JADX WARNING: Removed duplicated region for block: B:95:0x015d  */
    private void download(IKssDownloadRequestResult iKssDownloadRequestResult, KssAccessor kssAccessor, LoadMap loadMap, AtomicInteger atomicInteger) throws InterruptedException, InvalidKeyException, KscException {
        KscHttpRequest kscHttpRequest;
        KscHttpResponse kscHttpResponse;
        long currentTimeMillis;
        KscHttpResponse execute;
        long currentTimeMillis2;
        long j;
        int statusCode;
        String str;
        KscHttpResponse kscHttpResponse2;
        KscHttpRequest kscHttpRequest2;
        KssAccessor kssAccessor2 = kssAccessor;
        LoadMap loadMap2 = loadMap;
        LoadRecorder obtainRecorder = loadMap.obtainRecorder();
        while (obtainRecorder != null) {
            if (!Thread.interrupted()) {
                long start = obtainRecorder.getSpace().getStart();
                String[] blockUrls = iKssDownloadRequestResult.getBlockUrls(start);
                long blockStart = start - loadMap2.getBlockStart(start);
                if (blockUrls == null || blockUrls.length <= 0) {
                    throw new IllegalArgumentException("No available urls to download.");
                }
                RC4Encoder rC4Encoder = new RC4Encoder(iKssDownloadRequestResult.getSecureKey());
                int i = 0;
                while (true) {
                    if (i >= blockUrls.length) {
                        AtomicInteger atomicInteger2 = atomicInteger;
                        break;
                    } else if (!Thread.interrupted()) {
                        try {
                            rC4Encoder.init();
                            String str2 = blockUrls[i];
                            kscHttpRequest = new KscHttpRequest(HttpMethod.GET, str2, (IKscDecoder) rC4Encoder, (IKscTransferListener) null);
                            long j2 = 0;
                            if (blockStart > 0) {
                                try {
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("bytes=");
                                    sb.append(blockStart);
                                    sb.append("-");
                                    kscHttpRequest.getRequest().addHeader("Range", sb.toString());
                                } catch (Exception e) {
                                    e = e;
                                    AtomicInteger atomicInteger3 = atomicInteger;
                                } catch (Throwable th) {
                                    th = th;
                                    kscHttpResponse = null;
                                    if (kscHttpRequest == null) {
                                    }
                                    if (obtainRecorder != null) {
                                    }
                                    throw th;
                                }
                            }
                            try {
                                currentTimeMillis = System.currentTimeMillis();
                                execute = this.mTransmitter.execute(kscHttpRequest, 4);
                            } catch (Exception e2) {
                                e = e2;
                                AtomicInteger atomicInteger4 = atomicInteger;
                                KscHttpRequest kscHttpRequest3 = kscHttpRequest;
                                kscHttpResponse = null;
                                try {
                                    ErrorHelper.handleInterruptException(e);
                                    if (i >= blockUrls.length - 1) {
                                        throw KscException.newException(e, kscHttpResponse == null ? "No response." : kscHttpResponse.dump());
                                    }
                                    if (kscHttpRequest != null) {
                                        kscHttpRequest.getRequest().abort();
                                    } else {
                                        releaseResponse(kscHttpResponse);
                                    }
                                    if (obtainRecorder != null) {
                                        obtainRecorder.recycle();
                                    }
                                    i++;
                                } catch (Throwable th2) {
                                    th = th2;
                                    if (kscHttpRequest == null) {
                                    }
                                    if (obtainRecorder != null) {
                                    }
                                    throw th;
                                }
                            } catch (Throwable th3) {
                                th = th3;
                                KscHttpRequest kscHttpRequest4 = kscHttpRequest;
                                kscHttpResponse = null;
                                if (kscHttpRequest == null) {
                                    kscHttpRequest.getRequest().abort();
                                } else {
                                    releaseResponse(kscHttpResponse);
                                }
                                if (obtainRecorder != null) {
                                    obtainRecorder.recycle();
                                }
                                throw th;
                            }
                            try {
                                currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
                                if (execute.getResponse() != null) {
                                    try {
                                        HttpEntity entity = execute.getResponse().getEntity();
                                        if (entity != null) {
                                            j2 = entity.getContentLength();
                                        }
                                    } catch (Exception e3) {
                                        e = e3;
                                        AtomicInteger atomicInteger5 = atomicInteger;
                                        kscHttpResponse = execute;
                                        ErrorHelper.handleInterruptException(e);
                                        if (i >= blockUrls.length - 1) {
                                        }
                                    } catch (Throwable th4) {
                                        th = th4;
                                        kscHttpResponse = execute;
                                        if (kscHttpRequest == null) {
                                        }
                                        if (obtainRecorder != null) {
                                        }
                                        throw th;
                                    }
                                }
                                j = j2;
                                statusCode = execute.getStatusCode();
                                str = "";
                                if (execute.getError() != null) {
                                    str = execute.getError().getClass().getSimpleName();
                                }
                                kscHttpResponse2 = execute;
                                kscHttpRequest2 = kscHttpRequest;
                            } catch (Exception e4) {
                                e = e4;
                                AtomicInteger atomicInteger6 = atomicInteger;
                                kscHttpResponse = execute;
                                KscHttpRequest kscHttpRequest5 = kscHttpRequest;
                                ErrorHelper.handleInterruptException(e);
                                if (i >= blockUrls.length - 1) {
                                }
                            } catch (Throwable th5) {
                                th = th5;
                                kscHttpResponse = execute;
                                KscHttpRequest kscHttpRequest6 = kscHttpRequest;
                                if (kscHttpRequest == null) {
                                }
                                if (obtainRecorder != null) {
                                }
                                throw th;
                            }
                            try {
                                MiCloudStatManager.getInstance().addHttpEvent(str2, currentTimeMillis2, j, statusCode, str);
                                ErrorHelper.throwError(kscHttpResponse2);
                                kscHttpResponse = kscHttpResponse2;
                                try {
                                    save(kscHttpResponse, kssAccessor2, obtainRecorder, atomicInteger);
                                    loadMap2.verify(kssAccessor2, true);
                                    releaseResponse(kscHttpResponse);
                                    if (obtainRecorder != null) {
                                        obtainRecorder.recycle();
                                    }
                                } catch (Exception e5) {
                                    e = e5;
                                } catch (Throwable th6) {
                                    th = th6;
                                    kscHttpRequest = kscHttpRequest2;
                                    if (kscHttpRequest == null) {
                                    }
                                    if (obtainRecorder != null) {
                                    }
                                    throw th;
                                }
                            } catch (Exception e6) {
                                e = e6;
                                AtomicInteger atomicInteger7 = atomicInteger;
                                kscHttpResponse = kscHttpResponse2;
                                kscHttpRequest = kscHttpRequest2;
                                ErrorHelper.handleInterruptException(e);
                                if (i >= blockUrls.length - 1) {
                                }
                            } catch (Throwable th7) {
                                th = th7;
                                kscHttpResponse = kscHttpResponse2;
                                kscHttpRequest = kscHttpRequest2;
                                if (kscHttpRequest == null) {
                                }
                                if (obtainRecorder != null) {
                                }
                                throw th;
                            }
                        } catch (Exception e7) {
                            e = e7;
                            AtomicInteger atomicInteger8 = atomicInteger;
                            kscHttpResponse = null;
                            kscHttpRequest = null;
                            ErrorHelper.handleInterruptException(e);
                            if (i >= blockUrls.length - 1) {
                            }
                        } catch (Throwable th8) {
                            th = th8;
                            kscHttpResponse = null;
                            kscHttpRequest = null;
                            if (kscHttpRequest == null) {
                            }
                            if (obtainRecorder != null) {
                            }
                            throw th;
                        }
                    } else {
                        throw new InterruptedException();
                    }
                    i++;
                }
                obtainRecorder = loadMap.obtainRecorder();
            } else {
                throw new InterruptedException();
            }
        }
    }

    private void releaseResponse(KscHttpResponse kscHttpResponse) throws InterruptedException {
        if (kscHttpResponse != null) {
            try {
                kscHttpResponse.release();
            } catch (Throwable th) {
                InterruptedException isInterrupted = ErrorHelper.isInterrupted(th);
                if (isInterrupted != null) {
                    throw isInterrupted;
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x004a  */
    private void save(KscHttpResponse kscHttpResponse, KssAccessor kssAccessor, LoadRecorder loadRecorder, AtomicInteger atomicInteger) throws IllegalStateException, IOException {
        boolean z = false;
        try {
            InputStream content = kscHttpResponse.getContent();
            if (content != null) {
                byte[] bArr = new byte[8192];
                boolean z2 = false;
                while (true) {
                    try {
                        int read = content.read(bArr);
                        if (read < 0) {
                            break;
                        }
                        z2 = true;
                        if (read > 0) {
                            try {
                                if (kssAccessor.write(bArr, 0, read, loadRecorder) < read) {
                                    break;
                                }
                            } catch (Throwable th) {
                                th = th;
                                z = true;
                                if (z) {
                                }
                                throw th;
                            }
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        z = z2;
                        if (z) {
                            atomicInteger.set(3);
                        }
                        throw th;
                    }
                }
                if (z2) {
                    atomicInteger.set(3);
                    return;
                }
                return;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Not meet exception, but no response.\n");
            sb.append(kscHttpResponse.dump());
            throw new KscRuntimeException(500008, sb.toString());
        } catch (Throwable th3) {
            th = th3;
            if (z) {
            }
            throw th;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:34:0x008f A[Catch:{ IOException -> 0x00f9 }] */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x009e A[SYNTHETIC, Splitter:B:39:0x009e] */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x010e A[SYNTHETIC, Splitter:B:84:0x010e] */
    /* JADX WARNING: Removed duplicated region for block: B:88:0x0113  */
    /* JADX WARNING: Removed duplicated region for block: B:96:0x00d2 A[SYNTHETIC] */
    public void download(File file, boolean z, IKscTransferListener iKscTransferListener, IKssDownloadRequestResult iKssDownloadRequestResult) throws KscException, InterruptedException {
        LoadMap loadMap;
        KInfo kInfo;
        boolean z2;
        KssAccessor kssAccessor;
        long totalSize;
        boolean isCompleted;
        boolean z3 = false;
        KssAccessor kssAccessor2 = null;
        try {
            long totalSize2 = iKssDownloadRequestResult.getTotalSize();
            if (!file.exists()) {
                file.getParentFile().mkdirs();
            } else if (!z || file.isDirectory() || file.length() > totalSize2) {
                if (!FileUtils.deletes(file)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed delete target file. Can't download to dest path: ");
                    sb.append(file);
                    throw new SecurityException(sb.toString());
                }
            }
            loadMap = new LoadMap(iKssDownloadRequestResult, iKscTransferListener);
            try {
                File infoFile = KInfo.getInfoFile(file);
                kInfo = new KInfo(infoFile);
                try {
                    if (infoFile.exists()) {
                        kInfo.load();
                        if (TextUtils.equals(kInfo.getHash(), iKssDownloadRequestResult.getHash())) {
                            z2 = kInfo.loadToMap(loadMap);
                            if (!z2 && file.exists()) {
                                loadMap.initSize(file.length());
                            }
                            kssAccessor = new KssAccessor(file);
                            loadMap.verify(kssAccessor, false);
                            totalSize = iKssDownloadRequestResult.getTotalSize();
                            if (file.length() != totalSize) {
                                kssAccessor.inflate(totalSize);
                            }
                            try {
                                AtomicInteger atomicInteger = new AtomicInteger(3);
                                while (true) {
                                    isCompleted = loadMap.isCompleted();
                                    if (isCompleted) {
                                        try {
                                            if (!Thread.interrupted()) {
                                                download(iKssDownloadRequestResult, kssAccessor, loadMap, atomicInteger);
                                                atomicInteger.set(3);
                                                boolean z4 = isCompleted;
                                            } else {
                                                throw new InterruptedException();
                                            }
                                        } catch (InvalidKeyException e) {
                                            throw KscException.newException(e, "Failed when download kss block.");
                                        } catch (KscException e2) {
                                            if (!ErrorHelper.isNetworkException(e2) || atomicInteger.decrementAndGet() < 0) {
                                                throw e2;
                                            }
                                            Thread.sleep(5000);
                                        } catch (Throwable th) {
                                            th = th;
                                            kssAccessor2 = kssAccessor;
                                            z3 = isCompleted;
                                            if (kssAccessor2 != null) {
                                            }
                                            if (kInfo != null) {
                                            }
                                            throw th;
                                        }
                                    } else {
                                        long modifyTime = iKssDownloadRequestResult.getModifyTime();
                                        if (modifyTime > 0) {
                                            file.setLastModified(modifyTime);
                                        }
                                        try {
                                            kssAccessor.close();
                                        } catch (Throwable unused) {
                                        }
                                        if (isCompleted) {
                                            kInfo.delete();
                                            return;
                                        }
                                        kInfo.setHash(iKssDownloadRequestResult.getHash());
                                        kInfo.setLoadMap(loadMap);
                                        kInfo.save();
                                        return;
                                    }
                                }
                                throw e2;
                            } catch (Throwable th2) {
                                th = th2;
                                kssAccessor2 = kssAccessor;
                                if (kssAccessor2 != null) {
                                }
                                if (kInfo != null) {
                                }
                                throw th;
                            }
                        }
                    }
                    z2 = false;
                    loadMap.initSize(file.length());
                    try {
                        kssAccessor = new KssAccessor(file);
                        try {
                            loadMap.verify(kssAccessor, false);
                            totalSize = iKssDownloadRequestResult.getTotalSize();
                            if (file.length() != totalSize) {
                            }
                            AtomicInteger atomicInteger2 = new AtomicInteger(3);
                            while (true) {
                                isCompleted = loadMap.isCompleted();
                                if (isCompleted) {
                                }
                                boolean z42 = isCompleted;
                            }
                            throw e2;
                        } catch (IOException e3) {
                            e = e3;
                            kssAccessor2 = kssAccessor;
                            throw KscException.newException(e, "Local IO error, when prepare kss download.");
                        }
                    } catch (IOException e4) {
                        e = e4;
                        throw KscException.newException(e, "Local IO error, when prepare kss download.");
                    }
                } catch (Throwable th3) {
                    th = th3;
                    if (kssAccessor2 != null) {
                        try {
                            kssAccessor2.close();
                        } catch (Throwable unused2) {
                        }
                    }
                    if (kInfo != null) {
                        if (z3) {
                            kInfo.delete();
                        } else if (loadMap != null) {
                            kInfo.setHash(iKssDownloadRequestResult.getHash());
                            kInfo.setLoadMap(loadMap);
                            kInfo.save();
                        }
                    }
                    throw th;
                }
            } catch (Throwable th4) {
                th = th4;
                kInfo = null;
                if (kssAccessor2 != null) {
                }
                if (kInfo != null) {
                }
                throw th;
            }
        } catch (Throwable th5) {
            th = th5;
            loadMap = null;
            kInfo = null;
            if (kssAccessor2 != null) {
            }
            if (kInfo != null) {
            }
            throw th;
        }
    }
}
