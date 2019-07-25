package cn.kuaipan.android.kss.download;

import android.os.Bundle;
import android.os.Parcel;
import android.text.TextUtils;
import android.util.Log;
import cn.kuaipan.android.utils.Base64;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

public class KInfo {
    private final Bundle mData = new Bundle();
    private final File mFile;
    private final Properties mProp = new Properties();

    public KInfo(File file) {
        this.mFile = file;
    }

    private static String bundleToString(Bundle bundle) {
        if (bundle == null) {
            return null;
        }
        Parcel obtain = Parcel.obtain();
        try {
            bundle.writeToParcel(obtain, 0);
            return Base64.encodeToString(obtain.marshall(), 0);
        } finally {
            obtain.recycle();
        }
    }

    public static File getInfoFile(File file) {
        String parent = file.getParent();
        StringBuilder sb = new StringBuilder();
        sb.append(file.getName());
        sb.append(".kinfo");
        String sb2 = sb.toString();
        if (!sb2.startsWith(".")) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(".");
            sb3.append(sb2);
            sb2 = sb3.toString();
        }
        return new File(parent, sb2);
    }

    private static Bundle stringToBundle(String str) {
        byte[] decode = Base64.decode(str, 0);
        Parcel obtain = Parcel.obtain();
        try {
            obtain.unmarshall(decode, 0, decode.length);
            obtain.setDataPosition(0);
            return (Bundle) Bundle.CREATOR.createFromParcel(obtain);
        } finally {
            obtain.recycle();
        }
    }

    public void delete() {
        this.mFile.delete();
    }

    public String getHash() {
        return this.mData.getString("hash");
    }

    public void load() {
        InputStream inputStream;
        Throwable e;
        if (this.mFile.exists()) {
            try {
                inputStream = new FileInputStream(this.mFile);
                try {
                    this.mProp.load(inputStream);
                    String property = this.mProp.getProperty("data");
                    if (!TextUtils.isEmpty(property)) {
                        Bundle stringToBundle = stringToBundle(property);
                        this.mData.clear();
                        this.mData.putAll(stringToBundle);
                    }
                } catch (IOException e2) {
                    e = e2;
                    String str = "KInfo";
                    try {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Failed load kinfo from ");
                        sb.append(this.mFile);
                        Log.w(str, sb.toString(), e);
                        inputStream.close();
                    } catch (Throwable th) {
                        th = th;
                    }
                }
            } catch (IOException e3) {
                Throwable th2 = e3;
                inputStream = null;
                e = th2;
                String str2 = "KInfo";
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Failed load kinfo from ");
                sb2.append(this.mFile);
                Log.w(str2, sb2.toString(), e);
                inputStream.close();
            } catch (Throwable th3) {
                Throwable th4 = th3;
                inputStream = null;
                th = th4;
                try {
                    inputStream.close();
                } catch (Throwable unused) {
                }
                throw th;
            }
            try {
                inputStream.close();
            } catch (Throwable unused2) {
            }
        }
    }

    public boolean loadToMap(LoadMap loadMap) {
        return loadMap.load(this.mData.getBundle("load_map"));
    }

    public void save() {
        OutputStream outputStream;
        Throwable e;
        this.mProp.put("data", bundleToString(this.mData));
        try {
            outputStream = new FileOutputStream(this.mFile);
            try {
                this.mProp.store(outputStream, null);
                outputStream.flush();
            } catch (IOException e2) {
                e = e2;
                String str = "KInfo";
                try {
                    StringBuilder sb = new StringBuilder();
                    sb.append("Failed save kinfo to ");
                    sb.append(this.mFile);
                    Log.w(str, sb.toString(), e);
                    outputStream.close();
                } catch (Throwable th) {
                    th = th;
                }
            }
        } catch (IOException e3) {
            Throwable th2 = e3;
            outputStream = null;
            e = th2;
            String str2 = "KInfo";
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Failed save kinfo to ");
            sb2.append(this.mFile);
            Log.w(str2, sb2.toString(), e);
            outputStream.close();
        } catch (Throwable th3) {
            Throwable th4 = th3;
            outputStream = null;
            th = th4;
            try {
                outputStream.close();
            } catch (Throwable unused) {
            }
            throw th;
        }
        try {
            outputStream.close();
        } catch (Throwable unused2) {
        }
    }

    public void setHash(String str) {
        this.mData.putString("hash", str);
    }

    public void setLoadMap(LoadMap loadMap) {
        Bundle bundle = new Bundle();
        loadMap.save(bundle);
        this.mData.putBundle("load_map", bundle);
    }
}
