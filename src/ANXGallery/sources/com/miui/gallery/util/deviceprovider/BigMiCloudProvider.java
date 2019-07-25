package com.miui.gallery.util.deviceprovider;

import com.miui.gallery.cloud.GalleryMiCloudServerException;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.util.deviceprovider.MiCloudProviderInterface.GalleryCloudCoder;
import com.miui.gallery.util.deviceprovider.MiCloudProviderInterface.GalleryCloudManager;
import com.xiaomi.micloudsdk.cloudinfo.utils.CloudInfoUtils;
import com.xiaomi.micloudsdk.exception.CloudServerException;
import com.xiaomi.micloudsdk.file.MiCloudFileMaster;
import com.xiaomi.micloudsdk.request.CloudHttpClient;
import com.xiaomi.micloudsdk.request.utils.Request;
import com.xiaomi.opensdk.exception.AuthenticationException;
import com.xiaomi.opensdk.exception.RetriableException;
import com.xiaomi.opensdk.exception.UnretriableException;
import com.xiaomi.opensdk.file.model.MiCloudFileListener;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import miui.cloud.MiCloudCompat;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;

public class BigMiCloudProvider implements MiCloudProviderInterface {
    private static final GalleryCloudCoder sCloudCoder = new GalleryCloudCoder() {
    };
    private static final GalleryCloudManager sCloudManager = new GalleryCloudManager() {
        public String getGalleryBaseUrl() {
            return MiCloudCompat.GALLERY_BASE_URL;
        }

        public String getUserAgent() {
            return CloudInfoUtils.getUserAgent();
        }

        public boolean usePreview() {
            return MiCloudCompat.USE_PREVIEW;
        }
    };

    public void doFileSDKDownload(MiCloudFileMaster<RequestCloudItem> miCloudFileMaster, RequestCloudItem requestCloudItem, File file, MiCloudFileListener miCloudFileListener) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException {
        miCloudFileMaster.download(requestCloudItem, file, miCloudFileListener);
    }

    public void doFileSDKUpload(MiCloudFileMaster<RequestCloudItem> miCloudFileMaster, RequestCloudItem requestCloudItem, File file, MiCloudFileListener miCloudFileListener) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException {
        miCloudFileMaster.upload(requestCloudItem, file, miCloudFileListener);
    }

    public GalleryCloudManager getCloudManager() {
        return sCloudManager;
    }

    public HttpClient getHttpClient() {
        return CloudHttpClient.newInstance();
    }

    public String secureGet(String str, Map<String, String> map) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException, ClientProtocolException, IOException, GalleryMiCloudServerException {
        try {
            return Request.secureGet(str, map);
        } catch (CloudServerException e) {
            throw new GalleryMiCloudServerException(e);
        }
    }

    public String securePost(String str, Map<String, String> map) throws UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException, ClientProtocolException, IOException, GalleryMiCloudServerException {
        try {
            return Request.securePost(str, map);
        } catch (CloudServerException e) {
            throw new GalleryMiCloudServerException(e);
        }
    }
}
