package com.miui.gallery.cloudcontrol.strategies;

import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.text.TextUtils;
import com.google.gson.annotations.SerializedName;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

public class AlbumsStrategy extends BaseStrategy {
    @SerializedName("patterns")
    private List<AlbumPattern> mAlbumPatterns;
    @SerializedName("albums")
    private List<Album> mAlbums;
    private transient HashMap<String, Album> mAlbumsMap;
    private transient ArrayList<String> mWhiteList;
    private transient ArrayList<Pattern> mWhiteListPatterns;

    public static class Album {
        @SerializedName("attributes")
        private Attributes mAttributes;
        @SerializedName("name-string-res")
        private String mNameStringRes;
        @SerializedName("names")
        private List<NameData> mNames;
        @SerializedName("path")
        private String mPath;

        public static class NameData {
            @SerializedName("language-code")
            private String mLanguageCode;
            @SerializedName("name")
            private String mName;

            public String getLanguageCode() {
                return this.mLanguageCode;
            }

            public String getName() {
                return this.mName;
            }

            public String toString() {
                StringBuilder sb = new StringBuilder();
                sb.append("NameData{mLanguageCode='");
                sb.append(this.mLanguageCode);
                sb.append('\'');
                sb.append(", mName='");
                sb.append(this.mName);
                sb.append('\'');
                sb.append('}');
                return sb.toString();
            }
        }

        private String getLanguageCode() {
            return getLanguageCode(GalleryApp.sGetAndroidContext().getResources().getConfiguration().locale);
        }

        private String getLanguageCode(Locale locale) {
            String language = locale.getLanguage();
            if (TextUtils.isEmpty(locale.getCountry())) {
                return language;
            }
            StringBuilder sb = new StringBuilder();
            sb.append(language);
            sb.append("_");
            sb.append(locale.getCountry());
            return sb.toString();
        }

        public Attributes getAttributes() {
            return this.mAttributes;
        }

        /* JADX WARNING: Removed duplicated region for block: B:11:0x002f A[RETURN] */
        public String getBestName() {
            String str;
            Resources resources = GalleryApp.sGetAndroidContext().getResources();
            String str2 = null;
            if (!TextUtils.isEmpty(this.mNameStringRes)) {
                int identifier = resources.getIdentifier(this.mNameStringRes, "string", "com.miui.gallery");
                if (identifier != 0) {
                    try {
                        str = resources.getString(identifier);
                    } catch (NotFoundException e) {
                        Log.d("AlbumsStrategy", (Throwable) e);
                    }
                    if (!TextUtils.isEmpty(str)) {
                        return str;
                    }
                }
                str = null;
                if (!TextUtils.isEmpty(str)) {
                }
            } else {
                str = null;
            }
            if (this.mNames != null) {
                String languageCode = getLanguageCode();
                String languageCode2 = getLanguageCode(Locale.ENGLISH);
                boolean equals = TextUtils.equals(languageCode2, resources.getConfiguration().locale.getLanguage());
                Iterator it = this.mNames.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    NameData nameData = (NameData) it.next();
                    if (nameData.getLanguageCode().equals(languageCode)) {
                        str = nameData.getName();
                        break;
                    } else if (equals && nameData.getLanguageCode().equals(languageCode2)) {
                        str2 = nameData.getName();
                    }
                }
                if (!TextUtils.isEmpty(str)) {
                    return str;
                }
                if (!TextUtils.isEmpty(str2)) {
                    return str2;
                }
            }
            return str;
        }

        public String getPath() {
            return this.mPath;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("AlbumsStrategy{mPath='");
            sb.append(this.mPath);
            sb.append('\'');
            sb.append(", mNames=");
            sb.append(this.mNames);
            sb.append(", mAttributes=");
            sb.append(this.mAttributes);
            sb.append(", mNameStringRes=");
            sb.append(this.mNameStringRes);
            sb.append('}');
            return sb.toString();
        }
    }

    public static class AlbumPattern {
        @SerializedName("attributes")
        private Attributes mAttributes;
        @SerializedName("pattern")
        private String mPattern;

        public Attributes getAttributes() {
            return this.mAttributes;
        }

        public String getPattern() {
            return this.mPattern;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("AlbumPattern{mPattern='");
            sb.append(this.mPattern);
            sb.append('\'');
            sb.append(", mAttributes=");
            sb.append(this.mAttributes);
            sb.append('}');
            return sb.toString();
        }
    }

    public static class Attributes {
        @SerializedName("auto-upload")
        private boolean mAutoUpload;
        @SerializedName("hide")
        private boolean mHide;
        @SerializedName("in-whitelist")
        private boolean mInWhiteList;
        @SerializedName("manual-rename-restricted")
        private boolean mManualRenameRestricted;
        @SerializedName("show-in-photos-tab")
        private boolean mShowInPhotosTab;

        public boolean isAutoUpload() {
            return this.mAutoUpload;
        }

        public boolean isHide() {
            return this.mHide;
        }

        public boolean isInWhiteList() {
            return this.mInWhiteList;
        }

        public boolean isManualRenameRestricted() {
            return this.mManualRenameRestricted;
        }

        public boolean isShowInPhotosTab() {
            return this.mShowInPhotosTab;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("Attributes{mHide=");
            sb.append(this.mHide);
            sb.append(", mAutoUpload=");
            sb.append(this.mAutoUpload);
            sb.append(", mShowInPhotosTab=");
            sb.append(this.mShowInPhotosTab);
            sb.append(", mInWhiteList=");
            sb.append(this.mInWhiteList);
            sb.append(", mManualRenameRestricted=");
            sb.append(this.mManualRenameRestricted);
            sb.append('}');
            return sb.toString();
        }
    }

    public void doAdditionalProcessing() {
        if (MiscUtil.isValid(this.mAlbums)) {
            if (this.mAlbumsMap == null) {
                this.mAlbumsMap = new HashMap<>();
            } else {
                this.mAlbumsMap.clear();
            }
            if (this.mWhiteList == null) {
                this.mWhiteList = new ArrayList<>();
            } else {
                this.mWhiteList.clear();
            }
            for (Album album : this.mAlbums) {
                if (album.getPath() != null) {
                    this.mAlbumsMap.put(album.getPath().toLowerCase(), album);
                    if (album.getAttributes() != null && album.getAttributes().isInWhiteList()) {
                        this.mWhiteList.add(album.getPath());
                    }
                }
            }
        }
        if (MiscUtil.isValid(this.mAlbumPatterns)) {
            if (this.mWhiteListPatterns == null) {
                this.mWhiteListPatterns = new ArrayList<>();
            } else {
                this.mWhiteListPatterns.clear();
            }
            for (AlbumPattern albumPattern : this.mAlbumPatterns) {
                if (!TextUtils.isEmpty(albumPattern.getPattern()) && albumPattern.getAttributes() != null && albumPattern.getAttributes().isInWhiteList()) {
                    try {
                        this.mWhiteListPatterns.add(Pattern.compile(albumPattern.getPattern(), 2));
                    } catch (PatternSyntaxException e) {
                        Log.e("AlbumsStrategy", (Throwable) e);
                    }
                }
            }
        }
    }

    public Album getAlbumByPath(String str) {
        if (str == null || this.mAlbumsMap == null || this.mAlbumsMap.size() <= 0) {
            return null;
        }
        return (Album) this.mAlbumsMap.get(str.toLowerCase());
    }

    public List<AlbumPattern> getAlbumPatterns() {
        return this.mAlbumPatterns;
    }

    public ArrayList<String> getAlbumsInWhiteList() {
        return this.mWhiteList;
    }

    public ArrayList<Pattern> getWhiteListPatterns() {
        return this.mWhiteListPatterns;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("AlbumsStrategy{mAlbums=");
        sb.append(this.mAlbums);
        sb.append(", mAlbumPatterns=");
        sb.append(this.mAlbumPatterns);
        sb.append('}');
        return sb.toString();
    }
}
