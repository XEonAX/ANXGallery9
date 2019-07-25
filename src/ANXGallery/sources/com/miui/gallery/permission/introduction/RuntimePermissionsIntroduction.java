package com.miui.gallery.permission.introduction;

import android.app.Activity;
import android.content.Context;
import com.miui.gallery.permission.PermissionsDialogFragment;
import com.miui.gallery.permission.RuntimePermissions;
import com.miui.gallery.permission.core.OnPermissionIntroduced;
import com.miui.gallery.permission.core.Permission;
import com.miui.gallery.preference.BaseGalleryPreferences.PermissionIntroduction;
import java.util.ArrayList;
import java.util.HashSet;

public class RuntimePermissionsIntroduction {
    private static String[] getAllOptionalPermissions() {
        return RuntimePermissions.PERMISSION_OPTIONAL;
    }

    private static String[] getAllRequiredPermissions() {
        return RuntimePermissions.PERMISSIONS_REQUIRED;
    }

    private static ArrayList<Permission> parsePermissions(Context context) {
        ArrayList<Permission> arrayList = new ArrayList<>();
        HashSet hashSet = new HashSet();
        String[] allRequiredPermissions = getAllRequiredPermissions();
        if (allRequiredPermissions != null) {
            for (String parsePermission : allRequiredPermissions) {
                Permission parsePermission2 = RuntimePermissions.parsePermission(context, parsePermission, true);
                if (parsePermission2 != null && !hashSet.contains(parsePermission2)) {
                    hashSet.add(parsePermission2);
                    arrayList.add(parsePermission2);
                }
            }
        }
        String[] allOptionalPermissions = getAllOptionalPermissions();
        if (allOptionalPermissions != null) {
            for (String parsePermission3 : allOptionalPermissions) {
                Permission parsePermission4 = RuntimePermissions.parsePermission(context, parsePermission3, false);
                if (parsePermission4 != null && !hashSet.contains(parsePermission4)) {
                    hashSet.add(parsePermission4);
                    arrayList.add(parsePermission4);
                }
            }
        }
        return arrayList;
    }

    public void introduce(Activity activity, String str, final OnPermissionIntroduced onPermissionIntroduced) {
        if (PermissionIntroduction.isRuntimePermissionsIntroduced()) {
            onPermissionIntroduced.onPermissionIntroduced(true);
        } else {
            PermissionsDialogFragment.newInstance(parsePermissions(activity), new OnPermissionIntroduced() {
                public void onPermissionIntroduced(boolean z) {
                    PermissionIntroduction.setRuntimePermissionsIntroduced(true);
                    onPermissionIntroduced.onPermissionIntroduced(z);
                }
            }).show(activity.getFragmentManager(), "PermissionsDialogFragment");
        }
    }
}
