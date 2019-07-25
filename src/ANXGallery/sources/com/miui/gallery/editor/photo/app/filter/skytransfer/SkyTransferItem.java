package com.miui.gallery.editor.photo.app.filter.skytransfer;

import com.miui.gallery.editor.photo.core.imports.filter.render.IFilterEmptyValidate;
import java.io.File;

public class SkyTransferItem implements IFilterEmptyValidate {
    private String mName;
    private int mProgress;

    public SkyTransferItem(String str, int i) {
        this.mName = str;
        this.mProgress = i;
    }

    private static final int getCateForSky(String str) {
        char c;
        switch (str.hashCode()) {
            case -1278996498:
                if (str.equals("filter_sky_dusk")) {
                    c = 4;
                    break;
                }
            case -1278915886:
                if (str.equals("filter_sky_glow")) {
                    c = 3;
                    break;
                }
            case -980337550:
                if (str.equals("filter_sky_sunny")) {
                    c = 0;
                    break;
                }
            case -792035095:
                if (str.equals("filter_sky_cloudy")) {
                    c = 1;
                    break;
                }
            case -325688677:
                if (str.equals("filter_sky_sunset")) {
                    c = 5;
                    break;
                }
            case 1323696721:
                if (str.equals("filter_sky_rainbow")) {
                    c = 2;
                    break;
                }
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                return 3;
            case 1:
                return 5;
            case 2:
                return 4;
            case 3:
                return 1;
            case 4:
                return 2;
            case 5:
                return 0;
            default:
                return 0;
        }
    }

    public int getCate() {
        return getCateForSky(this.mName);
    }

    public String getPath() {
        StringBuilder sb = new StringBuilder();
        sb.append(SkyResourceDownloadHelper.getInstance().getSkyResPathV1());
        sb.append(File.separator);
        sb.append(this.mName);
        return sb.toString();
    }

    public float getProgress() {
        return ((float) this.mProgress) / 100.0f;
    }

    public boolean isEmpty() {
        return this.mName == null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.mName);
        sb.append("-");
        sb.append(this.mProgress);
        return sb.toString();
    }
}
