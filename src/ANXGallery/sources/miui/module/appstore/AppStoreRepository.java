package miui.module.appstore;

import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import java.io.File;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import miui.module.Repository;
import org.json.JSONObject;

public class AppStoreRepository extends Repository {
    private static final Set<String> WHITE_LIST = new HashSet(Arrays.asList(new String[]{"com.miui.system", "com.miui.rom"}));

    public boolean contains(String str) {
        return !WHITE_LIST.contains(str);
    }

    public String fetch(File file, String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        boolean z = false;
        try {
            Class cls = Class.forName("miui.os.Build");
            z = cls.getField("IS_GLOBAL_BUILD").getBoolean(cls);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e2) {
            e2.printStackTrace();
        } catch (IllegalAccessException e3) {
            e3.printStackTrace();
        }
        Builder buildUpon = z ? Uri.parse("https://global.market.xiaomi.com/apm/content/miuiapp/resource?").buildUpon() : Uri.parse("https://app.market.xiaomi.com/apm/content/miuiapp/resource?").buildUpon();
        buildUpon.appendQueryParameter("resourceId", str);
        JSONObject downloadMetadata = NetworkUtils.downloadMetadata(buildUpon.build().toString());
        if (downloadMetadata != null) {
            Metadata parse = Metadata.parse(downloadMetadata);
            if (parse != null) {
                StringBuilder sb = new StringBuilder();
                sb.append(parse.mHost);
                sb.append(parse.mUrl);
                String sb2 = sb.toString();
                File file2 = new File(file, parse.mResourceId);
                if (NetworkUtils.downloadFile(sb2, file2) && file2.exists() && MD5Utils.checkMD5(file2, parse.mFileHash)) {
                    return parse.mResourceId;
                }
            }
        }
        return null;
    }
}
