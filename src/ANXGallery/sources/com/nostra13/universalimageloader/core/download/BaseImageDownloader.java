package com.nostra13.universalimageloader.core.download;

import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.media.ThumbnailUtils;
import android.net.Uri;
import android.os.Build.VERSION;
import android.provider.ContactsContract.Contacts;
import android.provider.MediaStore.Images;
import android.provider.MediaStore.Video.Thumbnails;
import com.miui.gallery.preference.BaseGalleryPreferences.CTA;
import com.miui.gallery.util.BaseFileMimeUtil;
import com.miui.gallery.util.BaseFileUtils;
import com.miui.gallery.util.MediaStoreUtils;
import com.nostra13.universalimageloader.core.assist.ContentLengthInputStream;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.utils.IoUtils;
import com.nostra13.universalimageloader.utils.L;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class BaseImageDownloader implements ImageDownloader {
    protected final int connectTimeout;
    protected final Context context;
    protected final int readTimeout;

    public BaseImageDownloader(Context context2) {
        this(context2, 5000, 20000);
    }

    public BaseImageDownloader(Context context2, int i, int i2) {
        this.context = context2.getApplicationContext();
        this.connectTimeout = i;
        this.readTimeout = i2;
    }

    @TargetApi(8)
    private InputStream getVideoThumbnailStream(String str, ExtraInfo extraInfo) throws IOException {
        if (VERSION.SDK_INT >= 8) {
            if (extraInfo != null && extraInfo.requestThumbnail()) {
                long currentTimeMillis = System.currentTimeMillis();
                String queryThumbnailPath = queryThumbnailPath(str);
                if (BaseFileUtils.isFileExist(queryThumbnailPath)) {
                    L.d("query thumbnail cost %d", Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                    return new ContentLengthInputStream(new BufferedInputStream(new FileInputStream(queryThumbnailPath), 32768), (int) new File(queryThumbnailPath).length());
                }
            }
            Bitmap createVideoThumbnail = ThumbnailUtils.createVideoThumbnail(str, 2);
            if (createVideoThumbnail != null) {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                createVideoThumbnail.compress(CompressFormat.PNG, 0, byteArrayOutputStream);
                return new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
            }
        }
        return null;
    }

    private boolean isVideoContentUri(Uri uri) {
        return BaseFileMimeUtil.isVideoFromMimeType(this.context.getContentResolver().getType(uri));
    }

    private boolean isVideoFile(String str) {
        String mimeType = BaseFileMimeUtil.getMimeType(str);
        if ("*/*".equals(mimeType)) {
            mimeType = BaseFileMimeUtil.getMimeTypeByParseFile(str);
        }
        return BaseFileMimeUtil.isVideoFromMimeType(mimeType);
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x005b  */
    private String queryThumbnailPath(String str) {
        long mediaStoreId = MediaStoreUtils.getMediaStoreId(str);
        Cursor cursor = null;
        if (mediaStoreId > 0) {
            boolean isVideoFile = isVideoFile(str);
            try {
                Cursor query = this.context.getContentResolver().query(isVideoFile ? Thumbnails.EXTERNAL_CONTENT_URI : Images.Thumbnails.EXTERNAL_CONTENT_URI, new String[]{"_data"}, isVideoFile ? "video_id=?" : "image_id=?", new String[]{String.valueOf(mediaStoreId)}, null);
                if (query != null) {
                    try {
                        if (query.moveToFirst()) {
                            String string = query.getString(0);
                            if (query != null) {
                                query.close();
                            }
                            return string;
                        }
                    } catch (Throwable th) {
                        th = th;
                        cursor = query;
                        if (cursor != null) {
                        }
                        throw th;
                    }
                }
                if (query != null) {
                    query.close();
                }
            } catch (Throwable th2) {
                th = th2;
                if (cursor != null) {
                    cursor.close();
                }
                throw th;
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public HttpURLConnection createConnection(String str, ExtraInfo extraInfo) throws IOException {
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(Uri.encode(str, "@#&=*+-_.,:!?()/~'%")).openConnection();
        httpURLConnection.setConnectTimeout(this.connectTimeout);
        httpURLConnection.setReadTimeout(this.readTimeout);
        return httpURLConnection;
    }

    /* access modifiers changed from: protected */
    @TargetApi(14)
    public InputStream getContactPhotoStream(Uri uri) {
        ContentResolver contentResolver = this.context.getContentResolver();
        return VERSION.SDK_INT >= 14 ? Contacts.openContactPhotoInputStream(contentResolver, uri, true) : Contacts.openContactPhotoInputStream(contentResolver, uri);
    }

    public InputStream getStream(String str, ExtraInfo extraInfo) throws IOException {
        switch (Scheme.ofUri(str)) {
            case HTTP:
            case HTTPS:
                return getStreamFromNetwork(str, extraInfo);
            case FILE:
                return getStreamFromFile(str, extraInfo);
            case CONTENT:
                return getStreamFromContent(str, extraInfo);
            case ASSETS:
                return getStreamFromAssets(str, extraInfo);
            case DRAWABLE:
                return getStreamFromDrawable(str, extraInfo);
            default:
                return getStreamFromOtherSource(str, extraInfo);
        }
    }

    /* access modifiers changed from: protected */
    public InputStream getStreamFromAssets(String str, ExtraInfo extraInfo) throws IOException {
        return this.context.getAssets().open(Scheme.ASSETS.crop(str));
    }

    /* access modifiers changed from: protected */
    public InputStream getStreamFromContent(String str, ExtraInfo extraInfo) throws FileNotFoundException {
        ContentResolver contentResolver = this.context.getContentResolver();
        Uri parse = Uri.parse(str);
        if (isVideoContentUri(parse)) {
            Bitmap thumbnail = Thumbnails.getThumbnail(contentResolver, Long.valueOf(parse.getLastPathSegment()).longValue(), 1, null);
            if (thumbnail != null) {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                thumbnail.compress(CompressFormat.PNG, 0, byteArrayOutputStream);
                return new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
            }
        } else if (str.startsWith("content://com.android.contacts/")) {
            return getContactPhotoStream(parse);
        }
        return contentResolver.openInputStream(parse);
    }

    /* access modifiers changed from: protected */
    public InputStream getStreamFromDrawable(String str, ExtraInfo extraInfo) {
        return this.context.getResources().openRawResource(Integer.parseInt(Scheme.DRAWABLE.crop(str)));
    }

    /* access modifiers changed from: protected */
    public InputStream getStreamFromFile(String str, ExtraInfo extraInfo) throws IOException {
        String crop = Scheme.FILE.crop(str);
        return isVideoFile(crop) ? getVideoThumbnailStream(crop, extraInfo) : new ContentLengthInputStream(new BufferedInputStream(new FileInputStream(crop), 32768), (int) new File(crop).length());
    }

    /* access modifiers changed from: protected */
    public InputStream getStreamFromNetwork(String str, ExtraInfo extraInfo) throws IOException {
        if (CTA.canConnectNetwork()) {
            HttpURLConnection createConnection = createConnection(str, extraInfo);
            int i = 0;
            while (createConnection.getResponseCode() / 100 == 3 && i < 5) {
                createConnection = createConnection(createConnection.getHeaderField("Location"), extraInfo);
                i++;
            }
            try {
                InputStream inputStream = createConnection.getInputStream();
                if (shouldBeProcessed(createConnection)) {
                    return new ContentLengthInputStream(new BufferedInputStream(inputStream, 32768), createConnection.getContentLength());
                }
                IoUtils.closeSilently(inputStream);
                StringBuilder sb = new StringBuilder();
                sb.append("Image request failed with response code ");
                sb.append(createConnection.getResponseCode());
                throw new IOException(sb.toString());
            } catch (IOException e) {
                IoUtils.readAndCloseStream(createConnection.getErrorStream());
                throw e;
            }
        } else {
            throw new RuntimeException("CTA not confirmed.");
        }
    }

    /* access modifiers changed from: protected */
    public InputStream getStreamFromOtherSource(String str, ExtraInfo extraInfo) throws IOException {
        throw new UnsupportedOperationException(String.format("UIL doesn't support scheme(protocol) by default [%s]. You should implement this support yourself (BaseImageDownloader.getStreamFromOtherSource(...))", new Object[]{str}));
    }

    /* access modifiers changed from: protected */
    public boolean shouldBeProcessed(HttpURLConnection httpURLConnection) throws IOException {
        return httpURLConnection.getResponseCode() == 200;
    }
}
