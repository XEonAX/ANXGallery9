package com.miui.gallery.permission.cta;

import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.method.LinkMovementMethod;
import com.miui.gallery.agreement.cta.CtaAgreement;
import com.miui.gallery.permission.R;
import com.miui.gallery.permission.core.OnPermissionIntroduced;
import com.miui.gallery.preference.BaseGalleryPreferences.PermissionIntroduction;
import com.miui.gallery.util.Log;
import miui.app.AlertDialog.Builder;

public class CtaPermissionIntroduceDialog extends DialogFragment {
    /* access modifiers changed from: private */
    public OnPermissionIntroduced mIntroduceListener;
    /* access modifiers changed from: private */
    public String mPermissionToRequest;

    public static CtaPermissionIntroduceDialog newInstance(String str, OnPermissionIntroduced onPermissionIntroduced) {
        CtaPermissionIntroduceDialog ctaPermissionIntroduceDialog = new CtaPermissionIntroduceDialog();
        Bundle bundle = new Bundle();
        bundle.putString("permission", str);
        ctaPermissionIntroduceDialog.setArguments(bundle);
        ctaPermissionIntroduceDialog.setOnIntroducedListener(onPermissionIntroduced);
        return ctaPermissionIntroduceDialog;
    }

    /* access modifiers changed from: protected */
    public SpannableStringBuilder getMessage() {
        String str;
        PackageManager packageManager = getActivity().getPackageManager();
        String str2 = this.mPermissionToRequest;
        try {
            CharSequence loadLabel = packageManager.getPermissionInfo(this.mPermissionToRequest, 128).loadLabel(packageManager);
            str2 = loadLabel != null ? loadLabel.toString() : str2;
        } catch (NameNotFoundException unused) {
            Log.w("CtaPrivacyPermissionRequestDialog", "Get permission info failed, %s", str2);
        } finally {
            String.format(getString(R.string.grant_permission_item), new Object[]{str2});
        }
        String string = getString(R.string.user_agreement2);
        String string2 = getString(R.string.user_agreement4);
        return CtaAgreement.buildUserNotice(getActivity(), getString(R.string.privacy_permission_request_message, new Object[]{string, string2, str}), string, string2);
    }

    /* access modifiers changed from: protected */
    public OnClickListener getNegativeListener() {
        return new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                PermissionIntroduction.setCtaPrivacyPermissionsAllowed(CtaPermissionIntroduceDialog.this.mPermissionToRequest, false);
                if (CtaPermissionIntroduceDialog.this.mIntroduceListener != null) {
                    CtaPermissionIntroduceDialog.this.mIntroduceListener.onPermissionIntroduced(false);
                }
            }
        };
    }

    /* access modifiers changed from: protected */
    public String getNegativeText() {
        return getString(R.string.privacy_permission_request_negative);
    }

    /* access modifiers changed from: protected */
    public OnClickListener getPositiveListener() {
        return new OnClickListener() {
            public void onClick(DialogInterface dialogInterface, int i) {
                PermissionIntroduction.setCtaPrivacyPermissionsAllowed(CtaPermissionIntroduceDialog.this.mPermissionToRequest, true);
                if (CtaPermissionIntroduceDialog.this.mIntroduceListener != null) {
                    CtaPermissionIntroduceDialog.this.mIntroduceListener.onPermissionIntroduced(true);
                }
            }
        };
    }

    /* access modifiers changed from: protected */
    public String getPositiveText() {
        return getString(R.string.privacy_permission_request_positive);
    }

    /* access modifiers changed from: protected */
    public String getTitle() {
        return getString(R.string.privacy_permission_request_title);
    }

    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setCancelable(false);
        this.mPermissionToRequest = getArguments().getString("permission");
    }

    public Dialog onCreateDialog(Bundle bundle) {
        return new Builder(getActivity()).setTitle(getTitle()).setMessage(getMessage()).setPositiveButton(getPositiveText(), getPositiveListener()).setNegativeButton(getNegativeText(), getNegativeListener()).create();
    }

    public void onStart() {
        super.onStart();
        getDialog().getMessageView().setMovementMethod(LinkMovementMethod.getInstance());
    }

    /* access modifiers changed from: 0000 */
    public void setOnIntroducedListener(OnPermissionIntroduced onPermissionIntroduced) {
        this.mIntroduceListener = onPermissionIntroduced;
    }
}
