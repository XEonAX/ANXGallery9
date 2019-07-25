package com.miui.gallery.ui;

import android.content.ContentUris;
import android.content.Context;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Bundle;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.miui.gallery.Config.ThumbConfig;
import com.miui.gallery.R;
import com.miui.gallery.model.FaceAlbumCover;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.util.BindImageHelper;
import com.nostra13.universalimageloader.core.DisplayImageOptions;
import com.nostra13.universalimageloader.core.DisplayImageOptions.Builder;
import java.util.ArrayList;
import java.util.List;

public class AlbumPageListFaceItem extends AlbumPageListItemBase {
    private static List<Integer> sAlbumCovers = new ArrayList();

    static {
        sAlbumCovers.add(Integer.valueOf(R.id.album_cover_first));
        sAlbumCovers.add(Integer.valueOf(R.id.album_cover_second));
        sAlbumCovers.add(Integer.valueOf(R.id.album_cover_third));
        sAlbumCovers.add(Integer.valueOf(R.id.album_cover_fourth));
    }

    public AlbumPageListFaceItem(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    private void bindImage(ImageView imageView, String str, Uri uri, DisplayImageOptions displayImageOptions, RectF rectF) {
        BindImageHelper.bindFaceImage(str, uri, imageView, displayImageOptions, ThumbConfig.get().sMicroTargetSize, rectF, false);
    }

    private DisplayImageOptions buildDisplayFaceOptions(Builder builder, long j) {
        return j > 0 ? builder.considerFileLength(true).fileLength(j).build() : builder.considerFileLength(false).build();
    }

    private Uri getDownloadUri(long j, int i) {
        if (i == 0) {
            return ContentUris.withAppendedId(Cloud.CLOUD_URI, j);
        }
        return null;
    }

    private ImageView getImageView(int i) {
        return (ImageView) findViewById(((Integer) sAlbumCovers.get(i)).intValue());
    }

    private void setDefaultCover() {
        for (int i = 0; i < sAlbumCovers.size(); i++) {
            getImageView(i).setImageDrawable(null);
        }
    }

    public void bindImageAndAlbumCount(Bundle bundle, Builder builder) {
        ArrayList arrayList;
        if (bundle != null) {
            bundle.setClassLoader(FaceAlbumCover.class.getClassLoader());
            arrayList = bundle.getParcelableArrayList("face_album_cover");
        } else {
            arrayList = null;
        }
        if (bundle == null || arrayList == null) {
            setDefaultCover();
            this.mAlbumPhotoCount.setText(MovieStatUtils.DOWNLOAD_SUCCESS);
            return;
        }
        int i = 0;
        while (i < arrayList.size() && i < 4) {
            FaceAlbumCover faceAlbumCover = (FaceAlbumCover) arrayList.get(i);
            bindImage(getImageView(i), faceAlbumCover.coverPath, getDownloadUri(faceAlbumCover.coverId, faceAlbumCover.coverSyncState), buildDisplayFaceOptions(builder, faceAlbumCover.coverSize), faceAlbumCover.faceRectF);
            i++;
        }
        if (i < sAlbumCovers.size()) {
            while (i < sAlbumCovers.size()) {
                getImageView(i).setImageDrawable(null);
                i++;
            }
        }
        this.mAlbumPhotoCount.setText(String.valueOf(bundle.getInt("face_album_count")));
    }
}
