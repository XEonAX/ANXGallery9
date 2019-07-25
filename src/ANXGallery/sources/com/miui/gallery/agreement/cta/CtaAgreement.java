package com.miui.gallery.agreement.cta;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.text.SpannableStringBuilder;
import com.miui.gallery.permission.R;
import com.miui.gallery.text.UrlSpan;
import com.miui.gallery.text.UrlSpan.UrlSpanOnClickListener;
import com.miui.settings.Settings;
import java.util.Locale;

public class CtaAgreement {

    public static class Licence {
        public static String URL_MIUI_PRIVACY_POLICY = "http://www.miui.com/res/doc/privacy.html";
        public static String URL_MIUI_USER_AGREEMENT = "http://www.miui.com/res/doc/eula.html";

        public static Intent getPrivacyIntent() {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getUrlByLocale(URL_MIUI_PRIVACY_POLICY)));
            return intent;
        }

        private static String getUrlByLocale(String str) {
            return String.format(Locale.US, "%s?region=%s&lang=%s", new Object[]{str, Settings.getRegion(), Locale.getDefault().toString()});
        }

        public static Intent getUserAgreementIntent() {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getUrlByLocale(URL_MIUI_USER_AGREEMENT)));
            return intent;
        }
    }

    public static SpannableStringBuilder buildUserNotice(Context context, int i) {
        Resources resources = context.getResources();
        String string = resources.getString(R.string.user_agreement2);
        String string2 = resources.getString(R.string.user_agreement4);
        return buildUserNotice(context, resources.getString(i, new Object[]{string, string2}), string, string2);
    }

    public static SpannableStringBuilder buildUserNotice(final Context context, String str, String str2, String str3) {
        AnonymousClass1 r0 = new UrlSpanOnClickListener() {
            public void onClick() {
                context.startActivity(Licence.getUserAgreementIntent());
            }
        };
        AnonymousClass2 r1 = new UrlSpanOnClickListener() {
            public void onClick() {
                context.startActivity(Licence.getPrivacyIntent());
            }
        };
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(str);
        int indexOf = str.indexOf(str2);
        spannableStringBuilder.setSpan(new UrlSpan(r0), indexOf, str2.length() + indexOf, 33);
        int indexOf2 = str.indexOf(str3);
        spannableStringBuilder.setSpan(new UrlSpan(r1), indexOf2, str3.length() + indexOf2, 33);
        return spannableStringBuilder;
    }
}
