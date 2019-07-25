package com.miui.gallery.activity.facebaby;

import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.R;
import com.miui.gallery.activity.BaseActivity;
import com.miui.gallery.ui.renameface.InputFaceNameFragment;
import com.miui.gallery.util.StringUtils;

public class InputFaceNameActivity extends BaseActivity {
    InputFaceNameFragment mFragment;

    private String[] getOptionalPermissions() {
        return new String[]{"android.permission.READ_CONTACTS"};
    }

    public String[] getRuntimePermissions() {
        return StringUtils.mergeStringArray(super.getRuntimePermissions(), getOptionalPermissions());
    }

    public boolean isPermissionRequired(String str) {
        for (String equals : getOptionalPermissions()) {
            if (TextUtils.equals(equals, str)) {
                return false;
            }
        }
        return true;
    }

    public void onBackPressed() {
        this.mFragment.onBackPressed();
        super.onBackPressed();
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.input_face_name_activity);
        this.mFragment = (InputFaceNameFragment) getFragmentManager().findFragmentById(R.id.input_face_name_fragment);
    }

    public void onPermissionsChecked(String[] strArr, int[] iArr) {
        super.onPermissionsChecked(strArr, iArr);
        if (this.mFragment != null) {
            this.mFragment.updateNameList();
        }
    }
}
