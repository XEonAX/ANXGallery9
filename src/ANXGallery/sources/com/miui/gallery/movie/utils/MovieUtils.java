package com.miui.gallery.movie.utils;

import android.content.ClipData;
import android.content.ClipData.Item;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.miui.gallery.activity.ExternalPhotoPageActivity;
import com.miui.gallery.movie.entity.ImageEntity;
import com.miui.gallery.movie.entity.MovieResource;
import com.miui.gallery.util.ConvertFilepathUtil;
import com.miui.gallery.util.FileUtils;
import java.util.ArrayList;
import java.util.List;

public class MovieUtils {
    public static void checkResourceExist(List<? extends MovieResource> list) {
        if (list != null) {
            for (MovieResource movieResource : list) {
                if (FileUtils.isFileExist(movieResource.getDownloadSrcPath())) {
                    movieResource.downloadState = 17;
                }
            }
        }
    }

    public static List<ImageEntity> getImageFromClipData(Context context, Intent intent) {
        ArrayList arrayList = new ArrayList();
        ClipData clipData = intent.getClipData();
        if (clipData == null) {
            arrayList.add(new ImageEntity(ConvertFilepathUtil.getPath(context, intent.getData()), null));
        } else {
            for (int i = 0; i < clipData.getItemCount(); i++) {
                Item itemAt = clipData.getItemAt(i);
                if (itemAt != null) {
                    arrayList.add(new ImageEntity(ConvertFilepathUtil.getPath(context, itemAt.getUri()), String.valueOf(itemAt.getText())));
                }
            }
        }
        return arrayList;
    }

    public static void goDetail(Context context, Uri uri) {
        Intent intent = new Intent(context, ExternalPhotoPageActivity.class);
        intent.setData(uri);
        context.startActivity(intent);
    }
}
