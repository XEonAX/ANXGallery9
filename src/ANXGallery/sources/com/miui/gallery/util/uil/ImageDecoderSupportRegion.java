package com.miui.gallery.util.uil;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.media.ThumbnailUtils;
import android.net.Uri;
import com.miui.gallery.cloud.CloudUtils.SecretAlbumUtils;
import com.miui.gallery.util.CryptoUtil;
import com.miui.gallery.util.DecodeRegionImageUtils;
import com.miui.gallery.util.SecretAlbumCryptoUtils;
import com.nostra13.universalimageloader.core.decode.BaseImageDecoder;
import com.nostra13.universalimageloader.core.decode.ImageDecodingInfo;
import com.nostra13.universalimageloader.core.download.ImageDownloader.Scheme;
import com.nostra13.universalimageloader.utils.IoUtils;
import com.nostra13.universalimageloader.utils.L;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

public class ImageDecoderSupportRegion extends BaseImageDecoder {
    public ImageDecoderSupportRegion(boolean z) {
        super(z);
    }

    private InputStream getVideoThumbnailStream(String str) {
        Bitmap createVideoThumbnail = ThumbnailUtils.createVideoThumbnail(str, 2);
        if (createVideoThumbnail == null) {
            return null;
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        createVideoThumbnail.compress(CompressFormat.PNG, 0, byteArrayOutputStream);
        return new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
    }

    public Bitmap decode(ImageDecodingInfo imageDecodingInfo) throws IOException {
        InputStream inputStream;
        if (imageDecodingInfo.getRegionDecodeRect() == null) {
            return super.decode(imageDecodingInfo);
        }
        InputStream imageStream = getImageStream(imageDecodingInfo);
        try {
            ImageFileInfo defineImageSizeAndRotation = defineImageSizeAndRotation(imageStream, imageDecodingInfo);
            inputStream = resetStream(imageStream, imageDecodingInfo);
            try {
                Bitmap decodeFaceRegion = imageDecodingInfo.isRegionDecodeFace() ? DecodeRegionImageUtils.decodeFaceRegion(imageDecodingInfo.getRegionDecodeRect(), inputStream, 1.5f, imageDecodingInfo.getTargetSize().getWidth(), defineImageSizeAndRotation.exif.exifOrientation) : DecodeRegionImageUtils.decodeRegion(imageDecodingInfo.getRegionDecodeRect(), inputStream, imageDecodingInfo.getTargetSize().getWidth());
                IoUtils.closeSilently(inputStream);
                if (decodeFaceRegion == null) {
                    L.e("Image can't be decoded [%s]", imageDecodingInfo.getImageKey());
                } else {
                    decodeFaceRegion = considerExactScaleAndOrientation(decodeFaceRegion, imageDecodingInfo, defineImageSizeAndRotation.exif.rotation, defineImageSizeAndRotation.exif.flipHorizontal);
                }
                return decodeFaceRegion;
            } catch (Throwable th) {
                th = th;
                IoUtils.closeSilently(inputStream);
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            inputStream = imageStream;
            IoUtils.closeSilently(inputStream);
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public InputStream getImageStream(ImageDecodingInfo imageDecodingInfo) throws IOException {
        if (!imageDecodingInfo.isSecretImage() || imageDecodingInfo.getSecretKey() == null) {
            return super.getImageStream(imageDecodingInfo);
        }
        if (SecretAlbumUtils.isEncryptedVideoByPath(imageDecodingInfo.getImageUri())) {
            if (Scheme.ofUri(imageDecodingInfo.getImageUri()) == Scheme.FILE) {
                Uri decryptVideo2CacheFolder = SecretAlbumCryptoUtils.decryptVideo2CacheFolder(Uri.fromFile(new File(Scheme.FILE.crop(imageDecodingInfo.getImageUri()))), imageDecodingInfo.getSecretKey(), -1);
                if (decryptVideo2CacheFolder != null) {
                    return getVideoThumbnailStream(decryptVideo2CacheFolder.getPath());
                }
            }
            return null;
        } else if (SecretAlbumUtils.isUnencryptedVideoByPath(imageDecodingInfo.getImageUri()) || SecretAlbumUtils.isUnencryptedImageByPath(imageDecodingInfo.getImageUri())) {
            return super.getImageStream(imageDecodingInfo);
        } else {
            InputStream imageStream = super.getImageStream(imageDecodingInfo);
            if (imageStream != null) {
                return CryptoUtil.getDecryptCipherInputStream(imageStream, imageDecodingInfo.getSecretKey());
            }
            return null;
        }
    }
}
