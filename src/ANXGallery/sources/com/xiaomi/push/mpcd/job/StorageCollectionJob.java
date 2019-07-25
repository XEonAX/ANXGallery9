package com.xiaomi.push.mpcd.job;

import android.content.Context;
import android.os.Environment;
import android.os.StatFs;
import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.xiaomi.xmpush.thrift.ClientCollectionType;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class StorageCollectionJob extends CollectionJob {
    public StorageCollectionJob(Context context, int i) {
        super(context, i);
    }

    private double getNum(double d) {
        int i = 1;
        while (true) {
            double d2 = (double) i;
            if (d2 >= d) {
                return d2;
            }
            i <<= 1;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:24:0x006b A[SYNTHETIC, Splitter:B:24:0x006b] */
    private String getRamSize() {
        String str = MovieStatUtils.DOWNLOAD_SUCCESS;
        String str2 = "/proc/meminfo";
        if (new File(str2).exists()) {
            BufferedReader bufferedReader = null;
            try {
                BufferedReader bufferedReader2 = new BufferedReader(new FileReader(str2), 8192);
                try {
                    String readLine = bufferedReader2.readLine();
                    if (!TextUtils.isEmpty(readLine)) {
                        String[] split = readLine.split("\\s+");
                        if (split != null && split.length >= 2) {
                            double doubleValue = (Double.valueOf(split[1]).doubleValue() / 1024.0d) / 1024.0d;
                            if (doubleValue > 0.5d) {
                                doubleValue = Math.ceil(doubleValue);
                            }
                            StringBuilder sb = new StringBuilder();
                            sb.append(doubleValue);
                            sb.append("");
                            str = sb.toString();
                        }
                    }
                } catch (Exception unused) {
                    bufferedReader = bufferedReader2;
                    str = MovieStatUtils.DOWNLOAD_SUCCESS;
                    if (bufferedReader != null) {
                    }
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(str);
                    sb2.append("GB");
                    return sb2.toString();
                } catch (Throwable th) {
                    if (bufferedReader2 != null) {
                        try {
                            bufferedReader2.close();
                        } catch (IOException unused2) {
                        }
                    }
                    throw th;
                }
                try {
                    bufferedReader2.close();
                } catch (IOException unused3) {
                }
            } catch (Exception unused4) {
                str = MovieStatUtils.DOWNLOAD_SUCCESS;
                if (bufferedReader != null) {
                    bufferedReader.close();
                }
                StringBuilder sb22 = new StringBuilder();
                sb22.append(str);
                sb22.append("GB");
                return sb22.toString();
            }
        }
        StringBuilder sb222 = new StringBuilder();
        sb222.append(str);
        sb222.append("GB");
        return sb222.toString();
    }

    private String getRomSize() {
        double size = (double) getSize(Environment.getDataDirectory());
        Double.isNaN(size);
        double num = getNum(((size / 1024.0d) / 1024.0d) / 1024.0d);
        StringBuilder sb = new StringBuilder();
        sb.append(num);
        sb.append("GB");
        return sb.toString();
    }

    private long getSize(File file) {
        StatFs statFs = new StatFs(file.getPath());
        return ((long) statFs.getBlockSize()) * ((long) statFs.getBlockCount());
    }

    public String collectInfo() {
        StringBuilder sb = new StringBuilder();
        sb.append("ram:");
        sb.append(getRamSize());
        sb.append(",");
        sb.append("rom:");
        sb.append(getRomSize());
        return sb.toString();
    }

    public ClientCollectionType getCollectionType() {
        return ClientCollectionType.Storage;
    }

    public int getJobId() {
        return 23;
    }
}
