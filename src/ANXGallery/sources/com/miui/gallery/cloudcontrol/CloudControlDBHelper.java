package com.miui.gallery.cloudcontrol;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import com.miui.gallery.cloudcontrol.FeatureProfile.Status;
import com.miui.gallery.provider.GalleryContract.CloudControl;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;

public class CloudControlDBHelper {
    private static int deleteItem(Context context, FeatureProfile featureProfile) {
        Log.d("CloudControlDBHelper", "deleteItem: %s", (Object) String.valueOf(featureProfile));
        return SafeDBUtil.safeDelete(context, CloudControl.URI, "featureName = ?", new String[]{featureProfile.getName()}) > 0 ? 2 : 0;
    }

    private static int insertItem(Context context, FeatureProfile featureProfile) {
        Log.d("CloudControlDBHelper", "insertItem: %s", (Object) String.valueOf(featureProfile));
        ContentValues contentValues = new ContentValues();
        contentValues.put("status", featureProfile.getStatus());
        contentValues.put("strategy", featureProfile.getStrategy());
        contentValues.put("featureName", featureProfile.getName());
        return SafeDBUtil.safeInsert(context, CloudControl.URI, contentValues) != null ? 1 : 0;
    }

    private static FeatureDBItem queryItem(Context context, String str) {
        return (FeatureDBItem) SafeDBUtil.safeQuery(context, CloudControl.URI, FeatureDBItem.PROJECTION, "featureName = ?", new String[]{str}, (String) null, (QueryHandler<T>) new QueryHandler<FeatureDBItem>() {
            public FeatureDBItem handle(Cursor cursor) {
                if (cursor == null || !cursor.moveToFirst()) {
                    return null;
                }
                return FeatureDBItem.fromCursor(cursor);
            }
        });
    }

    public static int tryInsertToDB(Context context, FeatureProfile featureProfile) {
        FeatureDBItem queryItem = queryItem(context, featureProfile.getName());
        if (featureProfile.getStatus() == null || !featureProfile.getStatus().equals(Status.REMOVE.getValue())) {
            if (queryItem == null) {
                return insertItem(context, featureProfile);
            }
            if (queryItem.getStatus() != null && queryItem.getStatus().equals(Status.ENABLE.getValue())) {
                if (Status.DISABLE.getValue().equals(featureProfile.getStatus())) {
                    Log.d("CloudControlDBHelper", "Status 'disable' can't overwrite 'enable': %s", (Object) String.valueOf(featureProfile));
                }
                featureProfile.setStatus(Status.ENABLE.getValue());
            }
            if (!queryItem.equals(featureProfile)) {
                return updateItem(context, featureProfile);
            }
            Log.d("CloudControlDBHelper", "Unchanged item: %s, ignore", (Object) String.valueOf(featureProfile));
            return 4;
        } else if (queryItem != null) {
            return deleteItem(context, featureProfile);
        } else {
            return 4;
        }
    }

    private static int updateItem(Context context, FeatureProfile featureProfile) {
        Log.d("CloudControlDBHelper", "updateItem: %s", (Object) String.valueOf(featureProfile));
        ContentValues contentValues = new ContentValues();
        contentValues.put("status", featureProfile.getStatus());
        contentValues.put("strategy", featureProfile.getStrategy());
        return SafeDBUtil.safeUpdate(context, CloudControl.URI, contentValues, "featureName = ?", new String[]{featureProfile.getName()}) > 0 ? 3 : 0;
    }
}
