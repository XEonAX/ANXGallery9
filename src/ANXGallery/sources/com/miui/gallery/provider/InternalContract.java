package com.miui.gallery.provider;

import android.text.TextUtils;
import com.miui.gallery.provider.GalleryContract.Album;
import java.io.File;
import java.util.Locale;

public interface InternalContract {

    public interface Cloud {
        public static final String ALIAS_ALBUM_CLASSIFICATION;
        public static final String ALIAS_CLEAR_FIRST;
        public static final String ALIAS_LOCAL_IMAGE;
        public static final String ALIAS_LOCAL_MEDIA;
        public static final String ALIAS_LOCAL_VIDEO;
        public static final String ALIAS_MICRO_VALID = String.format(Locale.US, "(%s NOT NULL and %s != '')", new Object[]{"microthumbfile", "microthumbfile"});
        public static final String ALIAS_NON_SYSTEM_ALBUM;
        public static final String ALIAS_ORIGIN_FILE_VALID = String.format(Locale.US, "(%s NOT NULL and %s != '')", new Object[]{"localFile", "localFile"});
        public static final String ALIAS_SIZE_FIRST;
        public static final String ALIAS_THUMBNAIL_VALID = String.format(Locale.US, "(%s NOT NULL and %s != '')", new Object[]{"thumbnailFile", "thumbnailFile"});
        public static final String ALIAS_USER_CREATE_ALBUM;
        public static final String INVALID_FILE_PATH_NULL_MARK = null;

        static {
            StringBuilder sb = new StringBuilder();
            sb.append(" CASE WHEN ");
            sb.append(ALIAS_MICRO_VALID);
            sb.append(" THEN ");
            sb.append("microthumbfile");
            sb.append(" ");
            sb.append("WHEN ");
            sb.append(ALIAS_THUMBNAIL_VALID);
            sb.append(" THEN ");
            sb.append("thumbnailFile");
            sb.append(" ");
            sb.append("ELSE ");
            sb.append("localFile");
            sb.append(" ");
            sb.append("END ");
            ALIAS_SIZE_FIRST = sb.toString();
            StringBuilder sb2 = new StringBuilder();
            sb2.append(" CASE WHEN ");
            sb2.append(ALIAS_ORIGIN_FILE_VALID);
            sb2.append(" THEN ");
            sb2.append("localFile");
            sb2.append(" ");
            sb2.append("WHEN ");
            sb2.append(ALIAS_THUMBNAIL_VALID);
            sb2.append(" THEN ");
            sb2.append("thumbnailFile");
            sb2.append(" ");
            sb2.append("ELSE ");
            sb2.append("microthumbfile");
            sb2.append(" ");
            sb2.append("END ");
            ALIAS_CLEAR_FIRST = sb2.toString();
            StringBuilder sb3 = new StringBuilder();
            sb3.append("local_path LIKE 'MIUI/Gallery/cloud/owner");
            sb3.append(File.separator);
            sb3.append("%' COLLATE NOCASE");
            ALIAS_USER_CREATE_ALBUM = sb3.toString();
            StringBuilder sb4 = new StringBuilder();
            sb4.append("(serverId IS NULL OR serverId NOT IN ('");
            sb4.append(TextUtils.join("','", Album.ALL_SYSTEM_ALBUM_SERVER_IDS));
            sb4.append("'))");
            ALIAS_NON_SYSTEM_ALBUM = sb4.toString();
            StringBuilder sb5 = new StringBuilder();
            sb5.append("(");
            sb5.append(ALIAS_ORIGIN_FILE_VALID);
            sb5.append(" OR ");
            sb5.append(ALIAS_THUMBNAIL_VALID);
            sb5.append(")");
            ALIAS_LOCAL_IMAGE = sb5.toString();
            StringBuilder sb6 = new StringBuilder();
            sb6.append("(");
            sb6.append(ALIAS_ORIGIN_FILE_VALID);
            sb6.append(")");
            ALIAS_LOCAL_VIDEO = sb6.toString();
            StringBuilder sb7 = new StringBuilder();
            sb7.append("((serverType=2 AND ");
            sb7.append(ALIAS_ORIGIN_FILE_VALID);
            sb7.append(")");
            sb7.append(" OR ");
            sb7.append("(");
            sb7.append("serverType");
            sb7.append("=");
            sb7.append(1);
            sb7.append(" AND (");
            sb7.append(ALIAS_ORIGIN_FILE_VALID);
            sb7.append(" OR ");
            sb7.append(ALIAS_THUMBNAIL_VALID);
            sb7.append("))");
            sb7.append(")");
            ALIAS_LOCAL_MEDIA = sb7.toString();
            StringBuilder sb8 = new StringBuilder();
            sb8.append(" CASE  WHEN (attributes&64<>0 AND ");
            sb8.append(ALIAS_NON_SYSTEM_ALBUM);
            sb8.append(")");
            sb8.append(" THEN ");
            sb8.append(1);
            sb8.append(" ELSE ");
            sb8.append(0);
            sb8.append(" END ");
            ALIAS_ALBUM_CLASSIFICATION = sb8.toString();
        }
    }

    public interface RecentDiscoveredMedia {
        public static final String ALIAS_CLEAR_THUMBNAIL = Cloud.ALIAS_CLEAR_FIRST;
        public static final String ALIAS_MICRO_THUMBNAIL = Cloud.ALIAS_SIZE_FIRST;
    }

    public interface ShareImage {
        public static final String ALIAS_CLEAR_FIRST = Cloud.ALIAS_CLEAR_FIRST;
        public static final String ALIAS_MICRO_THUMBNAIL;
        public static final String ALIAS_SIZE_FIRST = Cloud.ALIAS_SIZE_FIRST;

        static {
            StringBuilder sb = new StringBuilder();
            sb.append(" CASE WHEN ");
            sb.append(Cloud.ALIAS_MICRO_VALID);
            sb.append(" THEN ");
            sb.append("microthumbfile");
            sb.append(" ");
            sb.append("WHEN ");
            sb.append(Cloud.ALIAS_THUMBNAIL_VALID);
            sb.append(" THEN ");
            sb.append("thumbnailFile");
            sb.append(" ");
            sb.append("ELSE ");
            sb.append("localFile");
            sb.append(" ");
            sb.append("END ");
            ALIAS_MICRO_THUMBNAIL = sb.toString();
        }
    }
}
