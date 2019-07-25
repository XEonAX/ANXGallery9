package com.miui.gallery.agreement;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.agreement.core.Agreement;
import com.miui.gallery.agreement.core.OnAgreementInvokedListener;
import com.miui.gallery.agreement.cta.CtaAgreement.Licence;
import com.miui.gallery.agreement.cta.CtaAgreementFragment;
import com.miui.gallery.permission.R;
import com.miui.gallery.preference.BaseGalleryPreferences;
import com.miui.gallery.preference.BaseGalleryPreferences.CTA;
import com.miui.gallery.util.BaseBuildUtil;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.Locale;

public class AgreementsUtils {
    private static ArrayList<Agreement> getAgreements(Context context) {
        ArrayList<Agreement> arrayList = new ArrayList<>();
        Agreement agreement = new Agreement(context.getResources().getString(R.string.user_agreement2), Licence.URL_MIUI_USER_AGREEMENT, true);
        Agreement agreement2 = new Agreement(context.getResources().getString(R.string.user_agreement4), Licence.URL_MIUI_PRIVACY_POLICY, true);
        arrayList.add(agreement);
        arrayList.add(agreement2);
        return arrayList;
    }

    public static boolean isKoreaRegion() {
        return "KR".equalsIgnoreCase(BaseBuildUtil.getRegion());
    }

    public static boolean isNetworkingAgreementAccepted() {
        if (!BaseBuildUtil.isInternational()) {
            return CTA.canConnectNetwork();
        }
        if (!isKoreaRegion()) {
            if (!CTA.canConnectNetwork()) {
                CTA.setCanConnectNetwork(true);
            }
            return true;
        } else if (!BaseGalleryPreferences.Agreement.isRequiredAgreementsAllowed()) {
            return CTA.canConnectNetwork();
        } else {
            if (!CTA.canConnectNetwork()) {
                CTA.setCanConnectNetwork(true);
            }
            return true;
        }
    }

    public static void showNetworkingAgreement(Activity activity, OnAgreementInvokedListener onAgreementInvokedListener) {
        new CtaAgreementFragment().invoke(activity, onAgreementInvokedListener);
    }

    public static void showUserAgreements(final Activity activity, final OnAgreementInvokedListener onAgreementInvokedListener) {
        if (isKoreaRegion()) {
            if (BaseGalleryPreferences.Agreement.isRequiredAgreementsAllowed()) {
                if (onAgreementInvokedListener != null) {
                    onAgreementInvokedListener.onAgreementInvoked(true);
                }
                return;
            }
            AgreementDialogFragment.newInstance(getAgreements(activity)).invoke(activity, new OnAgreementInvokedListener() {
                public void onAgreementInvoked(boolean z) {
                    BaseGalleryPreferences.Agreement.setRequiredAgreementsAllowed(z);
                    if (z) {
                        CTA.setCanConnectNetwork(true);
                    } else {
                        activity.finish();
                    }
                    if (onAgreementInvokedListener != null) {
                        onAgreementInvokedListener.onAgreementInvoked(z);
                    }
                }
            });
        } else if (!BaseBuildUtil.isInternational()) {
            new CtaAgreementFragment().invoke(activity, onAgreementInvokedListener);
        } else {
            CTA.setCanConnectNetwork(true);
            if (onAgreementInvokedListener != null) {
                onAgreementInvokedListener.onAgreementInvoked(true);
            }
        }
    }

    public static void viewAgreement(Context context, Agreement agreement) {
        if (agreement == null || TextUtils.isEmpty(agreement.mLink)) {
            Log.w("AgreementsUtils", "agreement can't view");
            return;
        }
        String format = String.format(Locale.US, "%s?region=%s&lang=%s", new Object[]{agreement.mLink, BaseBuildUtil.getRegion(), Locale.getDefault().toString()});
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(format));
        try {
            context.startActivity(intent);
        } catch (Exception e) {
            Log.e("AgreementsUtils", (Throwable) e);
        }
    }
}
