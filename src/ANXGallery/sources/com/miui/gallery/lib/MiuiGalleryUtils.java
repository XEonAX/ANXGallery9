package com.miui.gallery.lib;

import android.text.TextUtils;
import com.google.common.collect.Lists;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.regex.Pattern;

public class MiuiGalleryUtils {
    private static final String[] ALBUM_SHARE_BARCODE_URLS = ALBUM_SHARE_INVITATION_URLS;
    private static final ArrayList<Pattern> ALBUM_SHARE_BARCODE_URL_PATTERNS = Lists.newArrayList();
    private static final ArrayList<Pattern> ALBUM_SHARE_BARCODE_URL_STRICT_PATTERNS = Lists.newArrayList();
    private static final String[] ALBUM_SHARE_INVITATION_URLS = {"http://mij.cc/[a-z]+/[a-zA-Z0-9\\-_]{16}#a", "http://mi1.cc/[a-zA-Z0-9\\-_]{16}#a", null};
    private static final ArrayList<Pattern> ALBUM_SHARE_INVITATION_URL_PATTERNS = Lists.newArrayList();
    private static final ArrayList<Pattern> ALBUM_SHARE_INVITATION_URL_STRICT_PATTERNS = Lists.newArrayList();

    static {
        initPatterns(ALBUM_SHARE_INVITATION_URLS, ALBUM_SHARE_INVITATION_URL_PATTERNS, ALBUM_SHARE_INVITATION_URL_STRICT_PATTERNS);
        initPatterns(ALBUM_SHARE_BARCODE_URLS, ALBUM_SHARE_BARCODE_URL_PATTERNS, ALBUM_SHARE_BARCODE_URL_STRICT_PATTERNS);
    }

    private static boolean hasMatch(ArrayList<Pattern> arrayList, String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            if (((Pattern) it.next()).matcher(str).matches()) {
                return true;
            }
        }
        return false;
    }

    private static void initPatterns(String[] strArr, ArrayList<Pattern> arrayList, ArrayList<Pattern> arrayList2) {
        for (String str : strArr) {
            if (str != null) {
                arrayList.add(Pattern.compile(str));
                arrayList2.add(Pattern.compile(String.format("^%s$", new Object[]{str})));
            }
        }
    }

    public static boolean isAlbumShareBarcodeUrl(String str) {
        return hasMatch(ALBUM_SHARE_BARCODE_URL_STRICT_PATTERNS, str);
    }

    public static boolean isAlbumShareInvitationUrl(String str) {
        return hasMatch(ALBUM_SHARE_INVITATION_URL_STRICT_PATTERNS, str);
    }

    public static boolean isAlbumShareUrl(String str) {
        return isAlbumShareInvitationUrl(str) || isAlbumShareBarcodeUrl(str);
    }
}
