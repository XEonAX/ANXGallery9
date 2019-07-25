package com.miui.gallery.share;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.share.baby.BabyShareAlbumOwnerActivity;
import com.miui.gallery.share.baby.BabyShareAlbumSharerActivity;
import com.miui.gallery.util.ToastUtils;

public class UIHelper {
    public static void showAlbumShareInfo(Activity activity, Path path, int i) {
        if (path != null) {
            if (!CloudUtils.isActive(GalleryApp.sGetAndroidContext())) {
                ToastUtils.makeText((Context) activity, (int) R.string.no_network_connected);
            }
            Class cls = !path.isOtherShared() ? path.isBabyAlbum() ? BabyShareAlbumOwnerActivity.class : NormalShareAlbumOwnerActivity.class : path.isBabyAlbum() ? BabyShareAlbumSharerActivity.class : NormalShareAlbumSharerActivity.class;
            Intent intent = new Intent(activity, cls);
            intent.putExtra("share_path", path.toString());
            if (intent != null) {
                try {
                    activity.startActivityForResult(intent, i);
                } catch (ActivityNotFoundException unused) {
                }
            }
        }
    }

    public static void toast(int i) {
        toast((CharSequence) GalleryApp.sGetAndroidContext().getString(i));
    }

    public static void toast(Context context, CharSequence charSequence) {
        ToastUtils.makeText(context, charSequence);
    }

    private static void toast(CharSequence charSequence) {
    }

    public static void toastError(int i) {
        toastError(null, i);
    }

    public static void toastError(Context context, int i) {
        int i2 = R.string.operation_successful;
        switch (i) {
            case -1002:
                i2 = R.string.network_connected_rescan;
                break;
            case -112:
                i2 = R.string.error_unknown_host;
                break;
            case -111:
                i2 = R.string.error_socket_timeout;
                break;
            case -10:
            case 0:
                break;
            case -9:
                i2 = R.string.error_repeat_apply;
                break;
            case -4:
                i2 = R.string.error_cloud_not_active;
                break;
            case 50012:
                i2 = R.string.error_album_not_exist;
                break;
            case 50019:
                i2 = R.string.error_invalid_link;
                break;
            case 50025:
                i2 = R.string.error_link_has_expired;
                break;
            case 50030:
                i2 = R.string.error_share_with_creator;
                break;
            default:
                i2 = R.string.operation_failed;
                break;
        }
        if (context != null) {
            toast(context, context.getString(i2));
        }
    }
}
