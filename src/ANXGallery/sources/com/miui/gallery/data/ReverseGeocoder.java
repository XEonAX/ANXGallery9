package com.miui.gallery.data;

import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

public class ReverseGeocoder {
    private ConnectivityManager mConnectivityManager;
    private Context mContext;
    private Geocoder mGeocoder = new Geocoder(this.mContext);

    public ReverseGeocoder(Context context) {
        this.mContext = context;
        this.mConnectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
    }

    public static final String readUTF(DataInputStream dataInputStream) throws IOException {
        String readUTF = dataInputStream.readUTF();
        if (readUTF.length() == 0) {
            return null;
        }
        return readUTF;
    }

    public static final void writeUTF(DataOutputStream dataOutputStream, String str) throws IOException {
        if (str == null) {
            dataOutputStream.writeUTF("");
        } else {
            dataOutputStream.writeUTF(str);
        }
    }

    public Address lookupAddress(double d, double d2, boolean z, JobContext jobContext) {
        DataOutputStream dataOutputStream;
        Address address;
        NetworkInfo activeNetworkInfo = this.mConnectivityManager.getActiveNetworkInfo();
        DataOutputStream dataOutputStream2 = null;
        if (!CTA.canConnectNetwork() || activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            return null;
        }
        try {
            if (jobContext.isCancelled()) {
                MiscUtil.closeSilently(null);
                return null;
            }
            List fromLocation = this.mGeocoder.getFromLocation(d, d2, 1);
            if (jobContext.isCancelled()) {
                MiscUtil.closeSilently(null);
                return null;
            }
            if (!fromLocation.isEmpty()) {
                address = (Address) fromLocation.get(0);
                try {
                    dataOutputStream = new DataOutputStream(new ByteArrayOutputStream());
                    try {
                        Locale locale = address.getLocale();
                        writeUTF(dataOutputStream, locale.getLanguage());
                        writeUTF(dataOutputStream, locale.getCountry());
                        writeUTF(dataOutputStream, locale.getVariant());
                        writeUTF(dataOutputStream, address.getThoroughfare());
                        int maxAddressLineIndex = address.getMaxAddressLineIndex();
                        dataOutputStream.writeInt(maxAddressLineIndex);
                        for (int i = 0; i < maxAddressLineIndex; i++) {
                            if (jobContext.isCancelled()) {
                                MiscUtil.closeSilently(dataOutputStream);
                                return null;
                            }
                            writeUTF(dataOutputStream, address.getAddressLine(i));
                        }
                        writeUTF(dataOutputStream, address.getFeatureName());
                        writeUTF(dataOutputStream, address.getLocality());
                        writeUTF(dataOutputStream, address.getAdminArea());
                        writeUTF(dataOutputStream, address.getSubAdminArea());
                        writeUTF(dataOutputStream, address.getCountryName());
                        writeUTF(dataOutputStream, address.getCountryCode());
                        writeUTF(dataOutputStream, address.getPostalCode());
                        writeUTF(dataOutputStream, address.getPhone());
                        writeUTF(dataOutputStream, address.getUrl());
                        dataOutputStream.flush();
                    } catch (Exception e) {
                        e = e;
                        dataOutputStream2 = dataOutputStream;
                        try {
                            Log.w("ReverseGeocoder", (Throwable) e);
                            MiscUtil.closeSilently(dataOutputStream2);
                            return address;
                        } catch (Throwable th) {
                            th = th;
                            dataOutputStream = dataOutputStream2;
                            MiscUtil.closeSilently(dataOutputStream);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        MiscUtil.closeSilently(dataOutputStream);
                        throw th;
                    }
                } catch (Exception e2) {
                    e = e2;
                    Log.w("ReverseGeocoder", (Throwable) e);
                    MiscUtil.closeSilently(dataOutputStream2);
                    return address;
                }
            } else {
                address = null;
                dataOutputStream = null;
            }
            MiscUtil.closeSilently(dataOutputStream);
            return address;
        } catch (Exception e3) {
            e = e3;
            address = null;
            Log.w("ReverseGeocoder", (Throwable) e);
            MiscUtil.closeSilently(dataOutputStream2);
            return address;
        }
    }
}
