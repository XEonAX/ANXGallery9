package cn.kuaipan.android.kss.upload;

import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import android.util.Log;
import cn.kuaipan.android.exception.ErrorHelper;
import cn.kuaipan.android.exception.KscException;
import cn.kuaipan.android.exception.KscRuntimeException;
import cn.kuaipan.android.exception.ServerException;
import cn.kuaipan.android.exception.ServerMsgException;
import cn.kuaipan.android.http.DecoderInputStream;
import cn.kuaipan.android.http.IKscDecoder;
import cn.kuaipan.android.http.IKscTransferListener;
import cn.kuaipan.android.http.KscHttpRequest;
import cn.kuaipan.android.http.KscHttpRequest.HttpMethod;
import cn.kuaipan.android.http.KscHttpResponse;
import cn.kuaipan.android.http.KscHttpTransmitter;
import cn.kuaipan.android.kss.FileTranceListener;
import cn.kuaipan.android.kss.IKssUploadRequestResult;
import cn.kuaipan.android.kss.IKssUploadRequestResult.Block;
import cn.kuaipan.android.kss.KssDef;
import cn.kuaipan.android.kss.RC4Encoder;
import cn.kuaipan.android.kss.upload.UploadFileInfo.BlockInfo;
import cn.kuaipan.android.utils.ApiDataHelper;
import cn.kuaipan.android.utils.Encode;
import cn.kuaipan.android.utils.IObtainable;
import cn.kuaipan.android.utils.RandomFileInputStream;
import com.nexstreaming.nexeditorsdk.nexEngine;
import com.xiaomi.micloudsdk.stat.MiCloudStatManager;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.zip.CRC32;
import org.apache.http.HttpEntity;

public class KssUploader implements KssDef {
    public static volatile boolean sBreakForUT;
    private final CRC32 CRC32 = new CRC32();
    private final byte[] CRC_BUF = new byte[8192];
    private long mChunkSize = 65536;
    private final UploadTaskStore mTaskStore;
    private final KscHttpTransmitter mTransmitter;

    public KssUploader(KscHttpTransmitter kscHttpTransmitter, UploadTaskStore uploadTaskStore) {
        this.mTaskStore = uploadTaskStore;
        this.mTransmitter = kscHttpTransmitter;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:37:0x0115, code lost:
        r1 = r10;
        r3 = true;
        r4 = r12;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:?, code lost:
        updatePos(r0, r21, r1, r16);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x0125, code lost:
        if (r1 < r7.mChunkSize) goto L_0x0168;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x0127, code lost:
        r7.mChunkSize = java.lang.Math.min(MAX_CHUNKSIZE, r7.mChunkSize << 1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x0133, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x0168, code lost:
        return r0;
     */
    private UploadChunkInfo _uploadChunk(Uri uri, long j, RandomFileInputStream randomFileInputStream, RC4Encoder rC4Encoder, IKscTransferListener iKscTransferListener, KssUploadInfo kssUploadInfo) throws KscException, InterruptedException, IOException {
        long j2;
        long j3;
        AtomicInteger atomicInteger;
        int i;
        RandomFileInputStream randomFileInputStream2 = randomFileInputStream;
        RC4Encoder rC4Encoder2 = rC4Encoder;
        IKscTransferListener iKscTransferListener2 = iKscTransferListener;
        AtomicInteger atomicInteger2 = new AtomicInteger(3);
        loop0:
        while (true) {
            UploadChunkInfo uploadChunkInfo = null;
            while (true) {
                if (atomicInteger2.get() < 0) {
                    break loop0;
                }
                randomFileInputStream.reset();
                long min = Math.min(4194304, ((long) randomFileInputStream.available()) + j);
                if (min < 0) {
                    Log.d("KssUploader", "blockSize<0, adjust blockSize to 4M");
                    j2 = 4194304;
                } else {
                    j2 = min;
                }
                long min2 = Math.min(Math.min(this.mChunkSize, j2 - j), kssUploadInfo.getMaxChunkSize());
                ServerExpect serverExpect = kssUploadInfo.mExpectInfo;
                if (serverExpect != null) {
                    serverExpect.validate();
                    if (serverExpect.nextChunkSize > 0) {
                        j3 = Math.min(min2, serverExpect.nextChunkSize);
                        i = 1;
                        Log.v("KssUploader", String.format("Adjust chunk size from %d to %d", new Object[]{Long.valueOf(min2), Long.valueOf(j3)}));
                    } else {
                        i = 1;
                        j3 = min2;
                    }
                    if (serverExpect.uploadDelay > 0) {
                        Object[] objArr = new Object[i];
                        objArr[0] = Integer.valueOf(serverExpect.uploadDelay);
                        Log.v("KssUploader", String.format("Sleeping for delay %d(s)", objArr));
                        Thread.sleep((long) (serverExpect.uploadDelay * 1000));
                    }
                } else {
                    j3 = min2;
                }
                Uri build = uri.buildUpon().appendQueryParameter("body_sum", String.valueOf((long) getCRC(new DecoderInputStream(randomFileInputStream2, rC4Encoder2, 8192), j3))).build();
                randomFileInputStream.reset();
                DecoderInputStream decoderInputStream = new DecoderInputStream(randomFileInputStream2, rC4Encoder2, 8192);
                IKscTransferListener iKscTransferListener3 = iKscTransferListener;
                if (iKscTransferListener3 != null) {
                    try {
                        iKscTransferListener3.setSendPos(0);
                    } catch (KscException e) {
                        e = e;
                        atomicInteger = atomicInteger2;
                        boolean z = true;
                        if (ErrorHelper.isNetworkException(e) || atomicInteger.decrementAndGet() < 0) {
                            throw e;
                        }
                        this.mChunkSize = Math.max(65536, this.mChunkSize >> (z ? 1 : 0));
                        if (!Thread.interrupted()) {
                            Thread.sleep(5000);
                            randomFileInputStream2 = randomFileInputStream;
                            rC4Encoder2 = rC4Encoder;
                            IKscTransferListener iKscTransferListener4 = iKscTransferListener;
                            atomicInteger2 = atomicInteger;
                        } else {
                            throw new InterruptedException();
                        }
                    }
                }
                uploadChunkInfo = doUpload(build, decoderInputStream, j3, iKscTransferListener);
                if (uploadChunkInfo.isContinue()) {
                    break;
                } else if (uploadChunkInfo.isComplete()) {
                    break;
                } else if (!uploadChunkInfo.canRetry() || atomicInteger2.decrementAndGet() < 0) {
                    return uploadChunkInfo;
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("upload needChunkRetry: ");
                    sb.append(uploadChunkInfo.stat);
                    Log.d("KssUploader", sb.toString());
                    IKscTransferListener iKscTransferListener5 = iKscTransferListener3;
                }
            }
            Thread.sleep(5000);
            randomFileInputStream2 = randomFileInputStream;
            rC4Encoder2 = rC4Encoder;
            IKscTransferListener iKscTransferListener42 = iKscTransferListener;
            atomicInteger2 = atomicInteger;
        }
        throw e;
    }

    private void deleteUploadInfo(int i) throws InterruptedException {
        if (this.mTaskStore != null) {
            this.mTaskStore.removeUploadInfo(i);
        }
    }

    private UploadChunkInfo doUpload(Uri uri, InputStream inputStream, long j, IKscTransferListener iKscTransferListener) throws KscException, InterruptedException {
        Map map = null;
        try {
            KscHttpRequest kscHttpRequest = new KscHttpRequest(HttpMethod.POST, uri, (IKscDecoder) null, iKscTransferListener);
            kscHttpRequest.setPostEntity(new KssInputStreamEntity(inputStream, j));
            long currentTimeMillis = System.currentTimeMillis();
            try {
                KscHttpResponse execute = this.mTransmitter.execute(kscHttpRequest, 4);
                long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
                long j2 = 0;
                if (execute.getResponse() != null) {
                    HttpEntity entity = execute.getResponse().getEntity();
                    if (entity != null) {
                        j2 = entity.getContentLength();
                    }
                }
                long j3 = j2;
                int statusCode = execute.getStatusCode();
                String str = "";
                if (execute.getError() != null) {
                    str = execute.getError().getClass().getSimpleName();
                }
                MiCloudStatManager.getInstance().addHttpEvent(uri.toString(), currentTimeMillis2, j3, statusCode, str);
                ErrorHelper.throwError(execute);
                if (statusCode == 200) {
                    Map contentToMap = ApiDataHelper.contentToMap(execute);
                    try {
                        UploadChunkInfo uploadChunkInfo = new UploadChunkInfo(contentToMap);
                        uploadChunkInfo.expect_info = ServerExpect.getServerExpect(execute);
                        if (contentToMap != null && (contentToMap instanceof IObtainable)) {
                            ((IObtainable) contentToMap).recycle();
                        }
                        return uploadChunkInfo;
                    } catch (Throwable th) {
                        th = th;
                        map = contentToMap;
                        ((IObtainable) map).recycle();
                        throw th;
                    }
                } else {
                    ServerException serverException = new ServerException(statusCode, execute.dump());
                    Log.w("KssUploader", "Exception in doUpload", serverException);
                    throw serverException;
                }
            } catch (Throwable th2) {
                th = th2;
                ((IObtainable) map).recycle();
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            if (map != null && (map instanceof IObtainable)) {
                ((IObtainable) map).recycle();
            }
            throw th;
        }
    }

    private synchronized int getCRC(InputStream inputStream, long j) throws IOException {
        this.CRC32.reset();
        while (j > 0) {
            int read = inputStream.read(this.CRC_BUF, 0, (int) Math.min((long) this.CRC_BUF.length, j));
            if (read < 0) {
                break;
            }
            j -= (long) read;
            this.CRC32.update(this.CRC_BUF, 0, read);
        }
        return (int) this.CRC32.getValue();
    }

    private UploadChunkInfoPersist getUploadPos(int i) throws InterruptedException {
        if (this.mTaskStore == null) {
            return null;
        }
        return this.mTaskStore.getUploadPos(i);
    }

    private static void updatePos(UploadChunkInfo uploadChunkInfo, long j, long j2, long j3) {
        if (uploadChunkInfo != null) {
            if (uploadChunkInfo.isComplete()) {
                uploadChunkInfo.next_pos = j3;
                uploadChunkInfo.left_bytes = 0;
            } else if (uploadChunkInfo.isContinue()) {
                long j4 = j + j2;
                long j5 = j3 - j4;
                if (!(uploadChunkInfo.next_pos == j4 && uploadChunkInfo.left_bytes == j5)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Chunk pos is (");
                    sb.append(uploadChunkInfo.next_pos);
                    sb.append(", ");
                    sb.append(uploadChunkInfo.left_bytes);
                    sb.append("), but in process is (");
                    sb.append(j4);
                    sb.append(", ");
                    sb.append(j5);
                    sb.append(")");
                    Log.w("KssUploader", sb.toString());
                    uploadChunkInfo.next_pos = j4;
                    uploadChunkInfo.left_bytes = j5;
                }
            } else {
                uploadChunkInfo.next_pos = j;
                uploadChunkInfo.left_bytes = j3 - j;
            }
        }
    }

    private void updateUploadInfo(int i, KssUploadInfo kssUploadInfo, UploadChunkInfoPersist uploadChunkInfoPersist) {
        if (this.mTaskStore != null) {
            this.mTaskStore.updateUploadInfo(i, kssUploadInfo, uploadChunkInfoPersist);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:72:0x01c9, code lost:
        throw r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:79:0x01d6, code lost:
        r0 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:0x01d7, code lost:
        r23 = r2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:81:0x01da, code lost:
        r0 = th;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:82:0x01db, code lost:
        r23 = r2;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x0077 A[Catch:{ Throwable -> 0x01e8, all -> 0x01e4 }] */
    /* JADX WARNING: Removed duplicated region for block: B:79:0x01d6 A[ExcHandler: all (th java.lang.Throwable), Splitter:B:21:0x0087] */
    private void uploadBlock(int i, File file, FileTranceListener fileTranceListener, KssUploadInfo kssUploadInfo, int i2) throws KscException, InterruptedException {
        long j;
        String str;
        long j2;
        long j3;
        long j4;
        IKssUploadRequestResult requestResult;
        RandomFileInputStream randomFileInputStream;
        RandomFileInputStream randomFileInputStream2;
        String str2;
        AtomicInteger atomicInteger;
        String str3;
        RandomFileInputStream randomFileInputStream3;
        UploadChunkInfo uploadChunkInfo;
        UploadChunkInfo uploadChunkInfo2;
        AtomicInteger atomicInteger2;
        IKssUploadRequestResult iKssUploadRequestResult;
        long j5;
        long j6;
        IKscTransferListener iKscTransferListener;
        UploadChunkInfo uploadChunkInfo3;
        int i3 = i;
        FileTranceListener fileTranceListener2 = fileTranceListener;
        KssUploadInfo kssUploadInfo2 = kssUploadInfo;
        int i4 = i2;
        UploadChunkInfoPersist uploadPos = getUploadPos(i);
        if (uploadPos != null) {
            str = uploadPos.upload_id;
            if (!TextUtils.isEmpty(str)) {
                j = uploadPos.pos;
                j2 = j - (j % 65536);
                j3 = ((long) (i4 + 1)) * 4194304;
                if (j2 >= j3 || j2 < ((long) i4) * 4194304) {
                    j2 = ((long) i4) * 4194304;
                }
                j4 = j2;
                long min = Math.min(file.length(), j3);
                requestResult = kssUploadInfo.getRequestResult();
                StringBuilder sb = new StringBuilder();
                sb.append("RC4 key:");
                sb.append(Arrays.toString(requestResult.getSecureKey()));
                Log.d("KssUploader", sb.toString());
                atomicInteger = new AtomicInteger(3);
                str3 = str;
                randomFileInputStream3 = null;
                while (true) {
                    try {
                        if (atomicInteger.get() >= 0) {
                            RC4Encoder rC4Encoder = new RC4Encoder(requestResult.getSecureKey());
                            RandomFileInputStream randomFileInputStream4 = new RandomFileInputStream(file);
                            try {
                                randomFileInputStream4.moveToPos(j4);
                                if (fileTranceListener2 != null) {
                                    fileTranceListener2.setSendPos(j4);
                                }
                                uploadChunkInfo = new UploadChunkInfo(j4 % 4194304, min - j4, str3);
                                RandomFileInputStream randomFileInputStream5 = randomFileInputStream4;
                                RC4Encoder rC4Encoder2 = rC4Encoder;
                                while (true) {
                                    try {
                                        if (uploadChunkInfo.next_pos >= min) {
                                            uploadChunkInfo2 = uploadChunkInfo;
                                            atomicInteger2 = atomicInteger;
                                            iKssUploadRequestResult = requestResult;
                                            j5 = j3;
                                            randomFileInputStream = randomFileInputStream5;
                                            j6 = 0;
                                            break;
                                        }
                                        j6 = 0;
                                        if (uploadChunkInfo.left_bytes <= 0) {
                                            uploadChunkInfo2 = uploadChunkInfo;
                                            atomicInteger2 = atomicInteger;
                                            iKssUploadRequestResult = requestResult;
                                            j5 = j3;
                                            randomFileInputStream = randomFileInputStream5;
                                            break;
                                        } else if (!Thread.interrupted()) {
                                            if (fileTranceListener2 == null) {
                                                uploadChunkInfo3 = uploadChunkInfo;
                                                iKscTransferListener = null;
                                            } else {
                                                uploadChunkInfo3 = uploadChunkInfo;
                                                iKscTransferListener = fileTranceListener2.getChunkListaner(uploadChunkInfo.next_pos + j4);
                                            }
                                            randomFileInputStream = randomFileInputStream5;
                                            RC4Encoder rC4Encoder3 = rC4Encoder2;
                                            atomicInteger2 = atomicInteger;
                                            IKssUploadRequestResult iKssUploadRequestResult2 = requestResult;
                                            long j7 = j4;
                                            j5 = j3;
                                            try {
                                                uploadChunkInfo = uploadChunk(randomFileInputStream, rC4Encoder3, iKscTransferListener, kssUploadInfo, i2, uploadChunkInfo3);
                                                if (uploadChunkInfo == null) {
                                                    throw new KscRuntimeException(500008, "Return chunkInfo is null");
                                                } else if (uploadChunkInfo.isContinue()) {
                                                    UploadChunkInfoPersist uploadChunkInfoPersist = new UploadChunkInfoPersist();
                                                    uploadChunkInfoPersist.pos = (((long) i4) * 4194304) + uploadChunkInfo.next_pos;
                                                    uploadChunkInfoPersist.upload_id = uploadChunkInfo.upload_id;
                                                    updateUploadInfo(i3, kssUploadInfo2, uploadChunkInfoPersist);
                                                    if (sBreakForUT) {
                                                        Log.d("KssUploader", "break for UT");
                                                        Thread.currentThread().interrupt();
                                                    }
                                                    j3 = j5;
                                                    randomFileInputStream5 = randomFileInputStream;
                                                    rC4Encoder2 = rC4Encoder3;
                                                    atomicInteger = atomicInteger2;
                                                    requestResult = iKssUploadRequestResult2;
                                                    j4 = j7;
                                                } else if (uploadChunkInfo.isComplete()) {
                                                    UploadChunkInfoPersist uploadChunkInfoPersist2 = new UploadChunkInfoPersist();
                                                    uploadChunkInfoPersist2.pos = Math.min(j5, file.length());
                                                    uploadChunkInfoPersist2.upload_id = "";
                                                    iKssUploadRequestResult = iKssUploadRequestResult2;
                                                    Block block = iKssUploadRequestResult.getBlock(i4);
                                                    block.meta = uploadChunkInfo.commit_meta;
                                                    block.exist = true;
                                                    updateUploadInfo(i3, kssUploadInfo2, uploadChunkInfoPersist2);
                                                } else {
                                                    iKssUploadRequestResult = iKssUploadRequestResult2;
                                                }
                                            } catch (Throwable th) {
                                                th = th;
                                                randomFileInputStream.close();
                                                throw th;
                                            }
                                        } else {
                                            RandomFileInputStream randomFileInputStream6 = randomFileInputStream5;
                                            throw new InterruptedException();
                                        }
                                    } catch (Throwable th2) {
                                        th = th2;
                                        randomFileInputStream = randomFileInputStream5;
                                        randomFileInputStream.close();
                                        throw th;
                                    }
                                }
                                uploadChunkInfo = uploadChunkInfo2;
                                if (uploadChunkInfo.isComplete()) {
                                    randomFileInputStream3 = randomFileInputStream;
                                    break;
                                } else if (!uploadChunkInfo.needBlockRetry() || atomicInteger2.decrementAndGet() <= 0) {
                                    ServerMsgException serverMsgException = new ServerMsgException(200, uploadChunkInfo.stat);
                                    Log.w("KssUploader", "Exception in uploadBlock", serverMsgException);
                                    kssUploadInfo.markBroken();
                                    deleteUploadInfo(i);
                                } else {
                                    str3 = "";
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("upload needBlockRetry: ");
                                    sb2.append(uploadChunkInfo.stat);
                                    Log.d("KssUploader", sb2.toString());
                                    requestResult = iKssUploadRequestResult;
                                    j3 = j5;
                                    j4 = j6;
                                    randomFileInputStream3 = randomFileInputStream;
                                    atomicInteger = atomicInteger2;
                                }
                            } catch (Throwable th3) {
                            }
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        randomFileInputStream = randomFileInputStream3;
                        randomFileInputStream.close();
                        throw th;
                    }
                }
                randomFileInputStream3.close();
            }
        } else {
            str = null;
        }
        j = 0;
        j2 = j - (j % 65536);
        j3 = ((long) (i4 + 1)) * 4194304;
        j2 = ((long) i4) * 4194304;
        j4 = j2;
        long min2 = Math.min(file.length(), j3);
        requestResult = kssUploadInfo.getRequestResult();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("RC4 key:");
        sb3.append(Arrays.toString(requestResult.getSecureKey()));
        Log.d("KssUploader", sb3.toString());
        try {
            atomicInteger = new AtomicInteger(3);
            str3 = str;
            randomFileInputStream3 = null;
            while (true) {
                if (atomicInteger.get() >= 0) {
                }
                str3 = "";
                StringBuilder sb22 = new StringBuilder();
                sb22.append("upload needBlockRetry: ");
                sb22.append(uploadChunkInfo.stat);
                Log.d("KssUploader", sb22.toString());
                requestResult = iKssUploadRequestResult;
                j3 = j5;
                j4 = j6;
                randomFileInputStream3 = randomFileInputStream;
                atomicInteger = atomicInteger2;
            }
            try {
                randomFileInputStream3.close();
            } catch (Throwable unused) {
            }
        } catch (Throwable th5) {
            th = th5;
            randomFileInputStream = null;
            randomFileInputStream.close();
            throw th;
        }
    }

    private void uploadBlock(int i, File file, FileTranceListener fileTranceListener, KssUploadInfo kssUploadInfo, boolean z, int i2) throws KscException, InterruptedException {
        if (kssUploadInfo != null) {
            verifyBlock(file, kssUploadInfo.getFileInfo(), i2);
            Block block = kssUploadInfo.getRequestResult().getBlock(i2);
            if (block == null) {
                throw new KscRuntimeException(500008, "Block should not be null");
            } else if (!block.isComplete()) {
                uploadBlock(i, file, fileTranceListener, kssUploadInfo, i2);
            } else if (fileTranceListener != null) {
                fileTranceListener.setSendPos(Math.min(((long) (i2 + 1)) * 4194304, file.length()));
            }
        } else {
            throw new IllegalArgumentException("The KssUploadInfo can not be empty.");
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x00aa A[LOOP:0: B:5:0x0017->B:30:0x00aa, LOOP_END] */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00ae A[SYNTHETIC] */
    private UploadChunkInfo uploadChunk(RandomFileInputStream randomFileInputStream, RC4Encoder rC4Encoder, IKscTransferListener iKscTransferListener, KssUploadInfo kssUploadInfo, int i, UploadChunkInfo uploadChunkInfo) throws KscException, InterruptedException {
        RandomFileInputStream randomFileInputStream2 = randomFileInputStream;
        int i2 = i;
        UploadChunkInfo uploadChunkInfo2 = uploadChunkInfo;
        IKssUploadRequestResult requestResult = kssUploadInfo.getRequestResult();
        String[] nodeUrls = requestResult.getNodeUrls();
        if (nodeUrls == null || nodeUrls.length <= 0) {
            throw new IllegalArgumentException("No available urls.");
        }
        UploadChunkInfo uploadChunkInfo3 = null;
        int i3 = 0;
        while (i3 < nodeUrls.length) {
            if (!Thread.interrupted()) {
                try {
                    randomFileInputStream2.moveToPos((((long) i2) * 4194304) + uploadChunkInfo2.next_pos);
                    randomFileInputStream2.mark(nexEngine.ExportHEVCMainTierLevel61);
                    StringBuilder sb = new StringBuilder();
                    sb.append(nodeUrls[i3]);
                    sb.append("/upload_block_chunk");
                    Builder buildUpon = Uri.parse(sb.toString()).buildUpon();
                    buildUpon.appendQueryParameter("chunk_pos", String.valueOf(uploadChunkInfo2.next_pos));
                    if (!TextUtils.isEmpty(uploadChunkInfo2.upload_id)) {
                        buildUpon.appendQueryParameter("upload_id", uploadChunkInfo2.upload_id);
                    } else {
                        buildUpon.appendQueryParameter("file_meta", requestResult.getFileMeta());
                        buildUpon.appendQueryParameter("block_meta", requestResult.getBlock(i2).meta);
                    }
                    UploadChunkInfo _uploadChunk = _uploadChunk(buildUpon.build(), uploadChunkInfo2.next_pos, randomFileInputStream, rC4Encoder, iKscTransferListener, kssUploadInfo);
                    try {
                        try {
                            kssUploadInfo.mExpectInfo = _uploadChunk.expect_info;
                            return _uploadChunk;
                        } catch (Exception e) {
                            e = e;
                        }
                    } catch (Exception e2) {
                        e = e2;
                        KssUploadInfo kssUploadInfo2 = kssUploadInfo;
                        uploadChunkInfo3 = _uploadChunk;
                        ErrorHelper.handleInterruptException(e);
                        if (i3 >= nodeUrls.length - 1) {
                        }
                    }
                } catch (Exception e3) {
                    e = e3;
                    KssUploadInfo kssUploadInfo3 = kssUploadInfo;
                    ErrorHelper.handleInterruptException(e);
                    if (i3 >= nodeUrls.length - 1) {
                        i3++;
                    } else {
                        throw KscException.newException(e, "Failed when upload a kss chunk.");
                    }
                }
            } else {
                throw new InterruptedException();
            }
        }
        return uploadChunkInfo3;
    }

    private static void verifyBlock(File file, UploadFileInfo uploadFileInfo, int i) throws KscException, InterruptedException {
        InputStream inputStream;
        BlockInfo blockInfo = uploadFileInfo.getBlockInfo(i);
        long j = ((long) i) * 4194304;
        int min = (int) Math.min(file.length() - j, 4194304);
        if (min == blockInfo.size) {
            try {
                inputStream = new FileInputStream(file);
                try {
                    if (inputStream.skip(j) != j) {
                        throw new KscException(403002, "File size has changed.");
                    } else if (TextUtils.equals(Encode.SHA1Encode(inputStream, min), blockInfo.sha1)) {
                        try {
                            inputStream.close();
                        } catch (Throwable unused) {
                        }
                    } else {
                        throw new KscException(403002, "Block has changed.");
                    }
                } catch (IOException e) {
                    e = e;
                    try {
                        throw KscException.newException(e, null);
                    } catch (Throwable th) {
                        th = th;
                        try {
                            inputStream.close();
                        } catch (Throwable unused2) {
                        }
                        throw th;
                    }
                }
            } catch (IOException e2) {
                e = e2;
                inputStream = null;
                throw KscException.newException(e, null);
            } catch (Throwable th2) {
                th = th2;
                inputStream = null;
                inputStream.close();
                throw th;
            }
        } else {
            throw new KscException(403002, "Block size has changed.");
        }
    }

    public void upload(File file, IKscTransferListener iKscTransferListener, int i, KssUploadInfo kssUploadInfo) throws KscException, InterruptedException {
        FileTranceListener fileTranceListener;
        if (iKscTransferListener != null) {
            fileTranceListener = new FileTranceListener(iKscTransferListener, true);
            iKscTransferListener.setSendTotal(file.length());
        } else {
            fileTranceListener = null;
        }
        int i2 = 0;
        while (!Thread.interrupted()) {
            StringBuilder sb = new StringBuilder();
            sb.append("upload blockIndex: ");
            sb.append(i2);
            Log.d("KssUploader", sb.toString());
            uploadBlock(i, file, fileTranceListener, kssUploadInfo, true, i2);
            i2++;
            if (kssUploadInfo.isCompleted()) {
                return;
            }
        }
        throw new InterruptedException();
    }
}
