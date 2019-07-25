package com.miui.gallery.provider;

import android.content.Context;
import android.net.Uri;
import android.provider.MediaStore.Images;
import android.provider.MediaStore.Video.Media;
import com.miui.gallery.photosapi.PhotosOemApi;
import com.miui.gallery.photosapi.ProcessingMetadataQuery.ProgressStatus;

public class ProcessingMedia {
    private final long mMediaStoreId;
    private final int mMediaType;
    private final String mPath;
    private final ProcessingMetadata mProcessingMetadata;
    private final String mSpecialTypeId;
    private final Uri mUri;

    static final class Factory {
        private final Context context;

        Factory(Context context2) {
            this.context = context2;
        }

        private Uri getMediaStoreUri(long j, int i) {
            return i == 3 ? Media.EXTERNAL_CONTENT_URI.buildUpon().appendPath(String.valueOf(j)).build() : Images.Media.EXTERNAL_CONTENT_URI.buildUpon().appendPath(String.valueOf(j)).build();
        }

        private Uri getProcessingUri(long j) {
            return PhotosOemApi.getQueryProcessingUri(this.context, j);
        }

        /* access modifiers changed from: 0000 */
        public ProcessingMedia build(long j, String str, int i, ProcessingMetadata processingMetadata) {
            ProcessingMedia processingMedia = new ProcessingMedia(i == 0 ? getProcessingUri(j) : getMediaStoreUri(j, i), j, str, null, i, processingMetadata);
            return processingMedia;
        }
    }

    public static final class ProcessingMetadata {
        private final int mProgressPercentage;
        private final ProgressStatus mProgressStatus;

        ProcessingMetadata(ProgressStatus progressStatus, int i) {
            this.mProgressStatus = progressStatus;
            this.mProgressPercentage = i;
        }

        public int getProgressPercentage() {
            return this.mProgressPercentage;
        }

        public ProgressStatus getProgressStatus() {
            return this.mProgressStatus;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("ProcessingMetadata{mProgressStatus=");
            sb.append(this.mProgressStatus);
            sb.append(", mProgressPercentage=");
            sb.append(this.mProgressPercentage);
            sb.append('}');
            return sb.toString();
        }
    }

    private ProcessingMedia(Uri uri, long j, String str, String str2, int i, ProcessingMetadata processingMetadata) {
        this.mUri = uri;
        this.mMediaStoreId = j;
        this.mPath = str;
        this.mSpecialTypeId = str2;
        this.mMediaType = i;
        this.mProcessingMetadata = processingMetadata;
    }

    public long getMediaStoreId() {
        return this.mMediaStoreId;
    }

    public String getPath() {
        return this.mPath;
    }

    public ProcessingMetadata getProcessingMetadata() {
        return this.mProcessingMetadata;
    }

    public Uri getUri() {
        return this.mUri;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ProcessingMedia{mUri=");
        sb.append(this.mUri);
        sb.append(", mMediaStoreId=");
        sb.append(this.mMediaStoreId);
        sb.append(", mPath='");
        sb.append(this.mPath);
        sb.append('\'');
        sb.append(", mSpecialTypeId='");
        sb.append(this.mSpecialTypeId);
        sb.append('\'');
        sb.append(", mMediaType=");
        sb.append(this.mMediaType);
        sb.append(", mProcessingMetadata=");
        sb.append(this.mProcessingMetadata);
        sb.append('}');
        return sb.toString();
    }
}
