package com.miui.gallery.permission;

import android.content.Context;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.pm.PermissionInfo;
import android.text.TextUtils;
import com.miui.gallery.permission.core.Permission;

public class RuntimePermissions {
    public static final String[] PERMISSIONS_REQUIRED = {"android.permission.READ_EXTERNAL_STORAGE", "android.permission.WRITE_EXTERNAL_STORAGE"};
    public static final String[] PERMISSION_OPTIONAL = {"android.permission.READ_CONTACTS", "android.permission.GET_ACCOUNTS", "android.permission.READ_PHONE_STATE"};

    public static Permission parsePermission(Context context, String str, boolean z) {
        int i;
        int i2;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            PermissionInfo permissionInfo = context.getPackageManager().getPermissionInfo(str, 0);
            if (permissionInfo != null) {
                if ("android.permission-group.STORAGE".equalsIgnoreCase(permissionInfo.group)) {
                    i2 = R.string.permission_storage_name;
                    i = R.string.permission_storage_desc;
                } else if ("android.permission-group.CONTACTS".equalsIgnoreCase(permissionInfo.group)) {
                    i2 = R.string.permission_contract_name;
                    i = R.string.permissin_contract_desc;
                } else if ("android.permission-group.PHONE".equalsIgnoreCase(permissionInfo.group)) {
                    i2 = R.string.permission_phone_name;
                    i = R.string.permission_phone_desc;
                } else {
                    i2 = -1;
                    i = -1;
                }
                return new Permission(permissionInfo.group, i2 != -1 ? context.getResources().getString(i2) : "", i != -1 ? context.getResources().getString(i) : "", z);
            }
        } catch (NameNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
}
