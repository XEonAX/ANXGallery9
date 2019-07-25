package com.miui.gallery.ui.renameface;

import android.app.Activity;
import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.model.DisplayFolderItem;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.ui.renameface.FolderItemsLoader.LoaderUpdatedItems;
import com.miui.gallery.util.face.PeopleCursorHelper;
import java.util.ArrayList;

/* compiled from: FaceAlbumHandlerBase */
class FaceFolderItemsLoader extends FolderItemsLoader {
    public FaceFolderItemsLoader(Activity activity, String str, LoaderUpdatedItems loaderUpdatedItems, long[] jArr) {
        super(activity, str, loaderUpdatedItems, jArr, false);
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0052, code lost:
        if (r1 != null) goto L_0x0060;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x005e, code lost:
        if (r1 != null) goto L_0x0060;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0060, code lost:
        r1.close();
     */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x0059  */
    public ArrayList<DisplayFolderItem> refreshCloudFolderItems() {
        Cursor cursor;
        ArrayList<DisplayFolderItem> arrayList = new ArrayList<>();
        Activity activity = (Activity) this.mActivityRef.get();
        if (activity != null) {
            try {
                cursor = activity.getContentResolver().query(PeopleFace.PERSONS_URI, PeopleCursorHelper.PROJECTION, null, null, null);
                while (cursor != null) {
                    try {
                        if (!cursor.moveToNext()) {
                            break;
                        }
                        String thumbnailPath = PeopleCursorHelper.getThumbnailPath(cursor);
                        String peopleName = PeopleCursorHelper.getPeopleName(cursor);
                        if (!TextUtils.isEmpty(peopleName) && isMediaSetCandidate(PeopleCursorHelper.getPeopleLocalId(cursor))) {
                            arrayList.add(new FaceDisplayFolderItem(peopleName, thumbnailPath, PeopleCursorHelper.getPeopleLocalId(cursor), PeopleCursorHelper.getFaceRegionRectF(cursor)));
                        }
                    } catch (Exception unused) {
                    } catch (Throwable th) {
                        th = th;
                        if (cursor != null) {
                        }
                        throw th;
                    }
                }
            } catch (Exception unused2) {
                cursor = null;
            } catch (Throwable th2) {
                th = th2;
                cursor = null;
                if (cursor != null) {
                    cursor.close();
                }
                throw th;
            }
        }
        return arrayList;
    }
}
