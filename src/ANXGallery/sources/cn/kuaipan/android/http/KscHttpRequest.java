package cn.kuaipan.android.http;

import android.net.Uri;
import android.util.Log;
import cn.kuaipan.android.http.multipart.ByteArrayValuePair;
import cn.kuaipan.android.http.multipart.FilePart;
import cn.kuaipan.android.http.multipart.FileValuePair;
import cn.kuaipan.android.http.multipart.MultipartEntity;
import cn.kuaipan.android.http.multipart.Part;
import cn.kuaipan.android.http.multipart.StringPart;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.entity.AbstractHttpEntity;
import org.keyczar.Keyczar;

public class KscHttpRequest {
    private final IKscDecoder mDecoder;
    private final IKscTransferListener mListener;
    private final HttpMethod mMethod;
    private AbstractHttpEntity mPostEntity;
    private final ArrayList<NameValuePair> mPostForm;
    private HttpUriRequest mRequest;
    private boolean mTryGzip;
    private Uri mUri;

    public enum HttpMethod {
        GET,
        POST
    }

    public KscHttpRequest() {
        this(null);
    }

    public KscHttpRequest(Uri uri) {
        this((HttpMethod) null, uri, (IKscDecoder) null, (IKscTransferListener) null);
    }

    public KscHttpRequest(HttpMethod httpMethod, Uri uri, IKscDecoder iKscDecoder, IKscTransferListener iKscTransferListener) {
        this(httpMethod, uri, null, iKscDecoder, iKscTransferListener);
    }

    public KscHttpRequest(HttpMethod httpMethod, Uri uri, AbstractHttpEntity abstractHttpEntity, IKscDecoder iKscDecoder, IKscTransferListener iKscTransferListener) {
        this.mPostForm = new ArrayList<>();
        this.mTryGzip = false;
        this.mMethod = httpMethod;
        this.mUri = uri;
        this.mPostEntity = abstractHttpEntity;
        this.mDecoder = iKscDecoder;
        this.mListener = iKscTransferListener;
    }

    public KscHttpRequest(HttpMethod httpMethod, String str, IKscDecoder iKscDecoder, IKscTransferListener iKscTransferListener) {
        this(httpMethod, Uri.parse(str), null, iKscDecoder, iKscTransferListener);
    }

    private void checkRequest() {
        if (this.mRequest != null) {
            throw new RuntimeException("HttpRequest has been created. All input can't be changed.");
        }
    }

    private HttpUriRequest createHttpRequest() {
        if (isValidUri(this.mUri)) {
            String uri = this.mUri.toString();
            HttpMethod httpMethod = this.mMethod;
            if (httpMethod == null) {
                httpMethod = (this.mPostEntity != null || !this.mPostForm.isEmpty()) ? HttpMethod.POST : HttpMethod.GET;
            }
            HttpPost httpPost = null;
            switch (httpMethod) {
                case GET:
                    httpPost = new HttpGet(uri);
                    if (this.mPostEntity != null || !this.mPostForm.isEmpty()) {
                        Log.w("KscHttpRequest", "Post data is not empty, but method is GET. All post data is lost.");
                        break;
                    }
                case POST:
                    httpPost = new HttpPost(uri);
                    if (!this.mPostForm.isEmpty()) {
                        this.mPostEntity = makeFormEntity();
                    }
                    httpPost.setEntity(this.mPostEntity);
                    break;
            }
            if (this.mTryGzip) {
                httpPost.setHeader("Accept-Encoding", "gzip");
            }
            this.mRequest = httpPost;
            return httpPost;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Request uri is not valid. uri=");
        sb.append(this.mUri);
        throw new IllegalArgumentException(sb.toString());
    }

    private static ArrayList<NameValuePair> getMergedPostValue(AbstractHttpEntity abstractHttpEntity, List<NameValuePair> list) {
        ArrayList<NameValuePair> arrayList = new ArrayList<>();
        if (abstractHttpEntity != null) {
            try {
                arrayList.addAll(URLEncodedUtils.parse(abstractHttpEntity));
            } catch (IOException e) {
                Log.e("KscHttpRequest", "Failed parse an user entity.", e);
                throw new RuntimeException("Failed parse an user entity. The user entity should be parseable by URLEncodedUtils.parse(HttpEntity)", e);
            }
        }
        arrayList.addAll(list);
        return arrayList;
    }

    private static boolean isFormEntity(AbstractHttpEntity abstractHttpEntity) {
        return abstractHttpEntity == null || (abstractHttpEntity instanceof MultipartEntity) || URLEncodedUtils.isEncoded(abstractHttpEntity);
    }

    private boolean isValidUri(Uri uri) {
        boolean z = false;
        if (uri == null) {
            return false;
        }
        String scheme = uri.getScheme();
        if ("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme)) {
            z = true;
        }
        return z;
    }

    /* JADX WARNING: Removed duplicated region for block: B:20:0x0037  */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x0056 A[SYNTHETIC, Splitter:B:25:0x0056] */
    private AbstractHttpEntity makeFormEntity() {
        AbstractHttpEntity abstractHttpEntity;
        AbstractHttpEntity abstractHttpEntity2 = this.mPostEntity;
        ArrayList<NameValuePair> arrayList = this.mPostForm;
        if (this.mPostForm.isEmpty()) {
            return this.mPostEntity;
        }
        boolean z = true;
        boolean z2 = abstractHttpEntity2 != null && (abstractHttpEntity2 instanceof MultipartEntity);
        if (!z2) {
            Iterator it = arrayList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                NameValuePair nameValuePair = (NameValuePair) it.next();
                if (!(nameValuePair instanceof FileValuePair)) {
                    if (nameValuePair instanceof ByteArrayValuePair) {
                        break;
                    }
                } else {
                    break;
                }
            }
            if (z) {
                try {
                    abstractHttpEntity = new UrlEncodedFormEntity(this.mPostForm, Keyczar.DEFAULT_ENCODING);
                } catch (UnsupportedEncodingException e) {
                    Log.e("KscHttpRequest", "JVM not support UTF_8?", e);
                    throw new RuntimeException("JVM not support UTF_8?", e);
                }
            } else if (abstractHttpEntity2 == null || !(abstractHttpEntity2 instanceof MultipartEntity)) {
                abstractHttpEntity = new MultipartEntity(toPartArray(getMergedPostValue(abstractHttpEntity2, arrayList)));
            } else {
                abstractHttpEntity = (MultipartEntity) abstractHttpEntity2;
                abstractHttpEntity.appendPart(toPartArray(arrayList));
            }
            return abstractHttpEntity;
        }
        z = z2;
        if (z) {
        }
        return abstractHttpEntity;
    }

    private static Part[] toPartArray(List<NameValuePair> list) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        int size = list.size();
        Part[] partArr = new Part[size];
        for (int i = 0; i < size; i++) {
            FileValuePair fileValuePair = (NameValuePair) list.get(i);
            if (fileValuePair instanceof FileValuePair) {
                try {
                    partArr[i] = new FilePart(fileValuePair.getName(), fileValuePair.getFile());
                } catch (FileNotFoundException e) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("The file to be sent should be exist. file=");
                    sb.append(fileValuePair.getFile());
                    throw new RuntimeException(sb.toString(), e);
                }
            } else if (fileValuePair instanceof ByteArrayValuePair) {
                partArr[i] = new FilePart(fileValuePair.getName(), fileValuePair.getValue(), ((ByteArrayValuePair) fileValuePair).getData());
            } else {
                partArr[i] = new StringPart(fileValuePair.getName(), fileValuePair.getValue(), Keyczar.DEFAULT_ENCODING);
            }
        }
        return partArr;
    }

    public IKscDecoder getDecoder() {
        return this.mDecoder;
    }

    public IKscTransferListener getListener() {
        return this.mListener;
    }

    public HttpUriRequest getRequest() {
        if (this.mRequest == null) {
            this.mRequest = createHttpRequest();
        }
        return this.mRequest;
    }

    public void setPostEntity(AbstractHttpEntity abstractHttpEntity) {
        checkRequest();
        this.mPostEntity = abstractHttpEntity;
        if (!isFormEntity(abstractHttpEntity)) {
            this.mPostForm.clear();
        }
    }
}
