package com.miui.gallery.util;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import com.miui.gallery.R;

public class DialogUtil {
    public static AlertDialog createLoadingDialog(Context context, String str) {
        try {
            View inflate = LayoutInflater.from(context).inflate(R.layout.alert_dialog_loading, null);
            ((TextView) inflate.findViewById(R.id.message)).setText(str);
            return new Builder(context).setView(inflate).setCancelable(false).create();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static AlertDialog showConfirmAlert(Context context, OnClickListener onClickListener, String str, CharSequence charSequence, String str2) {
        try {
            return new Builder(context).setCancelable(true).setIconAttribute(16843605).setTitle(str).setMessage(charSequence).setPositiveButton(str2, onClickListener).show();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static AlertDialog showConfirmAlertWithCancel(Context context, OnClickListener onClickListener, OnClickListener onClickListener2, String str, CharSequence charSequence, String str2, int i) {
        try {
            return new Builder(context).setCancelable(true).setIconAttribute(16843605).setTitle(str).setMessage(charSequence).setPositiveButton(str2, onClickListener).setNegativeButton(i, onClickListener2).show();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static AlertDialog showInfoDialog(Context context, int i, int i2, int i3, int i4, OnClickListener onClickListener, OnClickListener onClickListener2) {
        try {
            return new Builder(context).setMessage(i).setTitle(i2).setPositiveButton(i3, onClickListener).setNegativeButton(i4, onClickListener2).show();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static AlertDialog showInfoDialog(Context context, String str, String str2) {
        try {
            new Builder(context).setMessage(str).setTitle(str2).setPositiveButton(17039370, null).show();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static AlertDialog showInfoDialog(Context context, String str, String str2, int i, int i2, OnClickListener onClickListener, OnClickListener onClickListener2) {
        return showInfoDialog(context, true, str, str2, i, i2, onClickListener, onClickListener2);
    }

    public static AlertDialog showInfoDialog(Context context, String str, String str2, int i, int i2, OnClickListener onClickListener, OnClickListener onClickListener2, OnCancelListener onCancelListener) {
        return showInfoDialog(context, true, str, str2, i, i2, onClickListener, onClickListener2, onCancelListener);
    }

    public static AlertDialog showInfoDialog(Context context, boolean z, String str, String str2, int i, int i2, OnClickListener onClickListener, OnClickListener onClickListener2) {
        return showInfoDialog(context, z, str, str2, i, i2, onClickListener, onClickListener2, null);
    }

    public static AlertDialog showInfoDialog(Context context, boolean z, String str, String str2, int i, int i2, OnClickListener onClickListener, OnClickListener onClickListener2, OnCancelListener onCancelListener) {
        try {
            return new Builder(context).setMessage(str).setTitle(str2).setCancelable(z).setPositiveButton(i, onClickListener).setNegativeButton(i2, onClickListener2).setOnCancelListener(onCancelListener).show();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
