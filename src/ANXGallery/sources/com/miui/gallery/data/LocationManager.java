package com.miui.gallery.data;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.net.Uri;
import android.os.SystemClock;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.UriUtil;
import com.miui.os.Rom;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import miui.util.Pools;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class LocationManager {
    private static final String ALIAS_EXIF_GPS_VALID = String.format("((%s NOT NULL AND %s NOT NULL) or %s NOT NULL)", new Object[]{"exifGPSLatitude", "exifGPSLongitude", "extraGPS"});
    private static final String ALIAS_LOCATION_INFO_INVALID = String.format("(%s IS NULL)", new Object[]{"address"});
    private static final Locale FIXED_ADDRESS_LOCALE = Locale.ENGLISH;
    private static final HashMap<String, String> INVALID_NAME = new HashMap<>();
    private static final String[] LOCATION_INFO_PROJECTION = {"_id", "exifGPSLatitude", "exifGPSLatitudeRef", "exifGPSLongitude", "exifGPSLongitudeRef", "location", "address", "extraGPS"};
    private static final String LOCATION_INFO_SELECTION;
    private static LocationManager mInstance;
    private final String CONNECTOR = GalleryApp.sGetAndroidContext().getString(R.string.and);
    private final String SEPARATOR = GalleryApp.sGetAndroidContext().getString(R.string.name_split);
    private AddressCache mAddressCache = new AddressCache();
    private Map<String, String> mMediaGpsInfoStage = new ConcurrentHashMap();

    private class AddressCache extends ArrayList<CacheItem> {
        private AddressCache() {
        }

        private double distance(double d, double d2, double d3, double d4) {
            double d5 = d * 0.017453292519943295d;
            double d6 = d3 * 0.017453292519943295d;
            return Math.acos((Math.sin(d5) * Math.sin(d6)) + (Math.cos(d5) * Math.cos(d6) * Math.cos((d4 * 0.017453292519943295d) - (d2 * 0.017453292519943295d)))) * 6371.0d * 1000.0d;
        }

        public synchronized CacheItem get(Locale locale, double d, double d2) {
            Locale locale2 = locale;
            synchronized (this) {
                int size = size();
                for (int i = 0; i < size; i++) {
                    CacheItem cacheItem = (CacheItem) get(i);
                    if (locale2 == null || cacheItem.locale == null || locale.equals(cacheItem.locale)) {
                        double distance = distance(cacheItem.lat, cacheItem.lng, d, d2);
                        if (distance < 50.0d) {
                            cacheItem.distance = (int) distance;
                            return cacheItem;
                        }
                    }
                }
                return null;
            }
        }

        public synchronized void put(Locale locale, double d, double d2, Address address) {
            if (address != null) {
                CacheItem cacheItem = new CacheItem();
                cacheItem.locale = locale;
                cacheItem.lat = d;
                cacheItem.lng = d2;
                cacheItem.address = address;
                add(cacheItem);
            }
        }
    }

    public static class AddressParser {
        public static Address fromJson(String str) throws JSONException {
            if (str == null) {
                return null;
            }
            return fromJson(new JSONObject(str));
        }

        public static Address fromJson(JSONObject jSONObject) throws JSONException {
            if (jSONObject == null) {
                return null;
            }
            Address address = new Address(getLocaleFromJson(jSONObject));
            address.setCountryName(jSONObject.optString("countryName"));
            address.setAdminArea(jSONObject.optString("admin"));
            address.setSubAdminArea(jSONObject.optString("subAdmin"));
            address.setLocality(jSONObject.optString("locality"));
            address.setSubLocality(jSONObject.optString("subLocality"));
            address.setThoroughfare(jSONObject.optString("thoroughfare"));
            address.setSubThoroughfare(jSONObject.optString("subThoroughfare"));
            JSONArray optJSONArray = jSONObject.optJSONArray("addressLines");
            if (optJSONArray != null) {
                int length = optJSONArray.length();
                for (int i = 0; i < length; i++) {
                    address.setAddressLine(i, optJSONArray.optString(i));
                }
            }
            return address;
        }

        public static Locale getLocaleFromJson(JSONObject jSONObject) {
            if (LocaleParser.fromString(getLocaleStringFromJson(jSONObject)) == null) {
                return Locale.getDefault();
            }
            return null;
        }

        public static String getLocaleStringFromJson(JSONObject jSONObject) {
            return jSONObject.optString("locale");
        }

        public static String toJson(List<Address> list) throws JSONException {
            if (!MiscUtil.isValid(list)) {
                return null;
            }
            JSONArray jSONArray = new JSONArray();
            for (Address json : list) {
                jSONArray.put(toJson(json));
            }
            return jSONArray.toString();
        }

        public static JSONObject toJson(Address address) throws JSONException {
            JSONArray jSONArray = null;
            if (address == null) {
                return null;
            }
            JSONObject jSONObject = new JSONObject();
            jSONObject.putOpt("locale", LocaleParser.toString(address.getLocale()));
            jSONObject.putOpt("countryName", address.getCountryName());
            jSONObject.putOpt("admin", address.getAdminArea());
            jSONObject.putOpt("subAdmin", address.getSubAdminArea());
            jSONObject.putOpt("locality", address.getLocality());
            jSONObject.putOpt("subLocality", address.getSubLocality());
            jSONObject.putOpt("thoroughfare", address.getThoroughfare());
            jSONObject.putOpt("subThoroughfare", address.getSubThoroughfare());
            int min = Math.min(address.getMaxAddressLineIndex() + 1, 5);
            for (int i = 0; i < min; i++) {
                if (jSONArray == null) {
                    jSONArray = new JSONArray();
                }
                jSONArray.put(address.getAddressLine(i));
            }
            jSONObject.putOpt("addressLines", jSONArray);
            return jSONObject;
        }
    }

    private class CacheItem {
        public Address address;
        public int distance;
        public double lat;
        public double lng;
        public Locale locale;

        private CacheItem() {
        }
    }

    private class CloudItem {
        public String address;
        public int delayTime;
        public long id;
        public double lat;
        public double lng;
        public String location;

        private CloudItem() {
        }
    }

    private static class ExtraGps {
        public int delayTime;
        public float lat;
        public float lng;

        private ExtraGps() {
        }
    }

    public static class LocaleParser {
        public static Locale fromString(String str) {
            String str2 = null;
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            String[] split = str.split("_");
            if (split.length <= 0 || split[0] == null) {
                return null;
            }
            String str3 = split[0];
            String str4 = split.length > 1 ? split[1] : null;
            if (split.length > 2) {
                str2 = split[2];
            }
            return str4 == null ? new Locale(str3) : str2 == null ? new Locale(str3, str4) : new Locale(str3, str4, str2);
        }

        public static String toString(Locale locale) {
            if (locale == null) {
                return null;
            }
            String language = locale.getLanguage();
            String country = locale.getCountry();
            String variant = locale.getVariant();
            StringBuilder sb = new StringBuilder();
            sb.append(language);
            if (!TextUtils.isEmpty(country)) {
                sb.append("_");
                sb.append(country);
                if (!TextUtils.isEmpty(variant)) {
                    sb.append("_");
                    sb.append(variant);
                }
            }
            return sb.toString();
        }
    }

    private class Statistics {
        public int addressNull;
        public int cacheDistance;
        public int cacheHit;
        public int cost;
        public int count;
        public int error;
        public int latLngInvalid;
        public int saveFail;
        private long startTime;

        private Statistics() {
            this.count = 0;
            this.cacheHit = 0;
            this.cost = 0;
            this.error = 0;
            this.latLngInvalid = 0;
            this.addressNull = 0;
            this.saveFail = 0;
            this.startTime = 0;
        }

        public int getAverageCost() {
            int i = (this.count - this.cacheHit) - this.error;
            if (i <= 0 || this.cost <= 0) {
                return 0;
            }
            return this.cost / i;
        }

        public int getAvgCacheDistance() {
            if (this.cacheDistance <= 0 || this.cacheHit <= 0) {
                return 0;
            }
            return this.cacheDistance / this.cacheHit;
        }

        public int getCacheHitPercent() {
            if (this.count <= 0 || this.cacheHit > this.count) {
                return 0;
            }
            return (int) ((((float) this.cacheHit) * 100.0f) / ((float) this.count));
        }

        public int getTotalTime() {
            if (this.startTime > 0) {
                return (int) ((System.currentTimeMillis() - this.startTime) / 1000);
            }
            return 0;
        }

        public void start() {
            this.startTime = System.currentTimeMillis();
        }
    }

    static {
        StringBuilder sb = new StringBuilder();
        sb.append(ALIAS_EXIF_GPS_VALID);
        sb.append(" AND ");
        sb.append(ALIAS_LOCATION_INFO_INVALID);
        LOCATION_INFO_SELECTION = sb.toString();
        INVALID_NAME.put("奇纳", "中国");
    }

    private LocationManager() {
    }

    private void checkVersionAndUpgrade() {
        int locationDetailsVersion = com.miui.gallery.preference.GalleryPreferences.LocationManager.getLocationDetailsVersion(0);
        if (locationDetailsVersion > 0 && locationDetailsVersion < 3 && isSyncable()) {
            Log.d("LocationManager", "On clear old addresses due to location manager upgrade");
            ContentValues contentValues = new ContentValues();
            contentValues.putNull("address");
            GalleryUtils.safeUpdate(Cloud.CLOUD_URI, contentValues, null, null);
        }
        if (locationDetailsVersion != 3) {
            com.miui.gallery.preference.GalleryPreferences.LocationManager.setLocationDetailsVersion(3);
        }
    }

    private static int ensureAreaLevel(int i) {
        if (i == 0) {
            return 6;
        }
        if (i < 15) {
            return 4;
        }
        return i < 60 ? 3 : 0;
    }

    private static Address fixAddressFault(Address address) {
        if (address != null) {
            String str = (String) INVALID_NAME.get(address.getCountryName());
            if (str != null) {
                address.setCountryName(str);
            }
            String thoroughfare = address.getThoroughfare();
            if (thoroughfare != null && thoroughfare.indexOf("/") > 0) {
                address.setThoroughfare(thoroughfare.replaceAll("/", ""));
            }
            String subThoroughfare = address.getSubThoroughfare();
            if (subThoroughfare != null && subThoroughfare.indexOf("/") > 0) {
                address.setSubThoroughfare(subThoroughfare.replaceAll("/", ""));
            }
        }
        return address;
    }

    private static String formatAddress(Address address, int i) {
        if (address == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(obtainArea(address, 0, i));
        sb.append("/");
        sb.append(obtainArea(address, 1, i));
        sb.append("/");
        sb.append(obtainArea(address, 2, i));
        sb.append("/");
        sb.append(obtainArea(address, 3, i));
        sb.append("/");
        sb.append(obtainArea(address, 4, i));
        sb.append("/");
        String obtainArea = obtainArea(address, 5, i);
        sb.append(obtainArea);
        String obtainArea2 = obtainArea(address, 6, i);
        if (!TextUtils.equals(obtainArea, obtainArea2)) {
            sb.append(obtainArea2);
        }
        return sb.toString();
    }

    public static String formatAddress(String str, String str2) {
        if (str == null) {
            return null;
        }
        try {
            return formatAddress(AddressParser.fromJson(str), getAddressTargetLevel(str2));
        } catch (JSONException e) {
            Log.e("LocationManager", "formatAddress error.", (Object) e);
            return null;
        }
    }

    public static String formatAddress(JSONArray jSONArray, String str) {
        if (jSONArray == null || jSONArray.length() <= 0) {
            return null;
        }
        try {
            Locale locale = Locale.getDefault();
            int length = jSONArray.length() - 1;
            JSONObject jSONObject = null;
            while (true) {
                if (length < 0) {
                    break;
                }
                jSONObject = jSONArray.getJSONObject(length);
                if (LocaleParser.toString(locale).equals(AddressParser.getLocaleStringFromJson(jSONObject))) {
                    break;
                }
                length--;
            }
            return formatAddress(AddressParser.fromJson(jSONObject), getAddressTargetLevel(str));
        } catch (JSONException e) {
            Log.e("LocationManager", "formatAddress error.", (Object) e);
            return null;
        }
    }

    private String formatAreaNames(List<String> list) {
        if (!MiscUtil.isValid(list)) {
            return null;
        }
        int size = list.size();
        int i = 0;
        if (size == 1) {
            return (String) list.get(0);
        }
        StringBuilder sb = new StringBuilder();
        while (true) {
            int i2 = size - 2;
            if (i < i2) {
                sb.append((String) list.get(i));
                sb.append(this.SEPARATOR);
                i++;
            } else {
                sb.append((String) list.get(i2));
                sb.append(this.CONNECTOR);
                sb.append((String) list.get(size - 1));
                return sb.toString();
            }
        }
    }

    public static String formatExifGpsString(String str, String str2, String str3, String str4) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return "";
        }
        return String.format("%s,%s", new Object[]{Double.valueOf(LocationUtil.convertRationalLatLonToDouble(str, str3)), Double.valueOf(LocationUtil.convertRationalLatLonToDouble(str2, str4))});
    }

    private static String formatExtraGpsString(double d, double d2, long j) {
        return String.format("%s,%s,%s", new Object[]{Double.valueOf(d), Double.valueOf(d2), Long.valueOf(j)});
    }

    private Address getAddress(Context context, Locale locale, CloudItem cloudItem, boolean z, Statistics statistics) throws Exception {
        Address address;
        CacheItem cacheItem = this.mAddressCache.get(locale, cloudItem.lat, cloudItem.lng);
        if (cacheItem != null) {
            address = cacheItem.address;
            statistics.cacheHit++;
            statistics.cacheDistance += cacheItem.distance;
            if (z) {
                Log.d("LocationManager", "cache hit.");
            }
        } else {
            address = null;
        }
        if (address == null) {
            Geocoder geocoder = new Geocoder(context, locale);
            long currentTimeMillis = System.currentTimeMillis();
            List fromLocation = geocoder.getFromLocation(cloudItem.lat, cloudItem.lng, 1);
            long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
            statistics.cost = (int) (((long) statistics.cost) + currentTimeMillis2);
            if (z) {
                Log.d("LocationManager", "get location cost: %s", (Object) Long.valueOf(currentTimeMillis2));
            }
            if (MiscUtil.isValid(fromLocation)) {
                Address fixAddressFault = fixAddressFault((Address) fromLocation.get(0));
                this.mAddressCache.put(locale, cloudItem.lat, cloudItem.lng, fixAddressFault);
                return fixAddressFault;
            }
        }
        return address;
    }

    private List<Address> getAddressList(Context context, CloudItem cloudItem, boolean z, Statistics statistics) throws Exception {
        Locale locale = Locale.getDefault();
        Address address = getAddress(context, locale, cloudItem, z, statistics);
        if (address == null) {
            Log.w("LocationManager", "default address not valid.");
            statistics.addressNull++;
            return null;
        } else if (!Rom.IS_INTERNATIONAL || locale.equals(FIXED_ADDRESS_LOCALE)) {
            return Collections.singletonList(address);
        } else {
            Address address2 = getAddress(context, FIXED_ADDRESS_LOCALE, cloudItem, z, statistics);
            if (address2 == null) {
                Log.w("LocationManager", "fixed address not valid.");
                statistics.addressNull++;
                return null;
            }
            return Arrays.asList(new Address[]{address, address2});
        }
    }

    private static int getAddressTargetLevel(String str) {
        if (TextUtils.isEmpty(str)) {
            return 6;
        }
        ExtraGps parseGpsString = parseGpsString(str);
        if (parseGpsString != null) {
            return ensureAreaLevel(parseGpsString.delayTime);
        }
        return 0;
    }

    private static String getArea(Address address, int i) {
        switch (i) {
            case 0:
                return address.getCountryName();
            case 1:
                return address.getAdminArea();
            case 2:
                return address.getSubAdminArea();
            case 3:
                return address.getLocality();
            case 4:
                return address.getSubLocality();
            case 5:
                return address.getThoroughfare();
            case 6:
                return address.getSubThoroughfare();
            default:
                return null;
        }
    }

    public static synchronized LocationManager getInstance() {
        LocationManager locationManager;
        synchronized (LocationManager.class) {
            if (mInstance == null) {
                mInstance = new LocationManager();
            }
            locationManager = mInstance;
        }
        return locationManager;
    }

    private static void getNamesOfArea(String[][] strArr, int i, int i2, List<String> list) {
        list.clear();
        for (int i3 = 0; i3 < i; i3++) {
            if (strArr[i3].length == 6) {
                String str = strArr[i3][i2];
                if (!TextUtils.isEmpty(str) && !list.contains(str)) {
                    list.add(str);
                }
            }
        }
    }

    private static boolean isLatLngValid(double d, double d2) {
        return d >= -90.0d && d <= 90.0d && d2 >= -180.0d && d2 <= 180.0d;
    }

    private boolean isNetworkAvailable() {
        return NetworkUtils.isNetworkConnected() && !NetworkUtils.isActiveNetworkMetered();
    }

    private static boolean isSyncable() {
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x00c5  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x00d2  */
    private boolean loadLocationForItem(Context context, CloudItem cloudItem, boolean z, Statistics statistics) throws Exception {
        boolean z2;
        if (statistics == null) {
            statistics = new Statistics();
        }
        boolean z3 = false;
        if (!isLatLngValid(cloudItem.lat, cloudItem.lng)) {
            Log.w("LocationManager", "Lat or lng not valid.");
            statistics.latLngInvalid++;
            return false;
        }
        List addressList = getAddressList(context, cloudItem, z, statistics);
        if (!MiscUtil.isValid(addressList)) {
            return false;
        }
        String formatAddress = formatAddress((Address) addressList.get(0), ensureAreaLevel(cloudItem.delayTime));
        String json = AddressParser.toJson(addressList);
        if (!isSyncable()) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("location", formatAddress);
            contentValues.put("address", json);
            if (SafeDBUtil.safeUpdate(context, Cloud.CLOUD_URI, contentValues, "_id=?", new String[]{String.valueOf(cloudItem.id)}) > 0) {
                z3 = true;
            }
            if (!z3) {
                Log.w("LocationManager", "Save location info failed.");
                statistics.saveFail++;
            }
            return z3;
        }
        String str = "";
        if (z) {
            ContentValues contentValues2 = new ContentValues();
            contentValues2.put("location", formatAddress);
            contentValues2.put("address", json);
            if (SafeDBUtil.safeUpdate(context, Cloud.CLOUD_URI, contentValues2, "_id=?", new String[]{String.valueOf(cloudItem.id)}) <= 0) {
                z2 = false;
                if (z2) {
                    Log.w("LocationManager", "Save location info failed.");
                    statistics.saveFail++;
                    return false;
                }
                String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(70);
                boolean safeExec = GalleryUtils.safeExec(String.format("update %s set %s %s=coalesce(replace(%s, '%s', '') || '%s', '%s') where %s=%s", new Object[]{"cloud", str, "editedColumns", "editedColumns", transformToEditedColumnsElement, transformToEditedColumnsElement, transformToEditedColumnsElement, "_id", Long.valueOf(cloudItem.id)}));
                if (!safeExec) {
                    Log.w("LocationManager", "Save location info and update edited column failed.");
                    statistics.saveFail++;
                }
                return safeExec;
            }
        } else {
            str = String.format("%s=%s, %s=%s,", new Object[]{"location", DatabaseUtils.sqlEscapeString(formatAddress), "address", DatabaseUtils.sqlEscapeString(json)});
        }
        z2 = true;
        if (z2) {
        }
    }

    private static String obtainArea(Address address, int i, int i2) {
        return i <= i2 ? obtainString(getArea(address, i)) : "";
    }

    private static String obtainString(String str) {
        return obtainString(str, "");
    }

    private static String obtainString(String str, String str2) {
        return str == null ? str2 : str;
    }

    /* access modifiers changed from: private */
    public CloudItem parseCursor(Cursor cursor) {
        CloudItem cloudItem = new CloudItem();
        cloudItem.id = (long) cursor.getInt(0);
        cloudItem.location = cursor.getString(5);
        cloudItem.address = cursor.getString(6);
        String string = cursor.getString(1);
        String string2 = cursor.getString(2);
        String string3 = cursor.getString(3);
        String string4 = cursor.getString(4);
        String string5 = cursor.getString(7);
        if (TextUtils.isEmpty(string) || TextUtils.isEmpty(string3)) {
            ExtraGps parseGpsString = parseGpsString(string5);
            if (parseGpsString != null) {
                cloudItem.lat = (double) parseGpsString.lat;
                cloudItem.lng = (double) parseGpsString.lng;
                cloudItem.delayTime = parseGpsString.delayTime;
            }
        } else {
            cloudItem.lat = LocationUtil.convertRationalLatLonToDouble(string, string2);
            cloudItem.lng = LocationUtil.convertRationalLatLonToDouble(string3, string4);
        }
        return cloudItem;
    }

    private static ExtraGps parseGpsString(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        String[] split = str.split(",");
        int length = split.length;
        if (length != 2 && length != 3) {
            return null;
        }
        ExtraGps extraGps = new ExtraGps();
        try {
            extraGps.lat = Float.valueOf(split[0]).floatValue();
            extraGps.lng = Float.valueOf(split[1]).floatValue();
            if (length > 2) {
                extraGps.delayTime = Integer.valueOf(split[2]).intValue();
            }
            return extraGps;
        } catch (Exception unused) {
            return null;
        }
    }

    private static void recordStatistics(Statistics statistics) {
        HashMap hashMap = new HashMap();
        hashMap.put("count", String.valueOf(statistics.count));
        hashMap.put("error", String.valueOf(statistics.error));
        hashMap.put("costAvg", String.valueOf(statistics.getAverageCost()));
        hashMap.put("totalTime", String.valueOf(statistics.getTotalTime()));
        hashMap.put("cacheHitPercent", String.valueOf(statistics.getCacheHitPercent()));
        hashMap.put("cacheAvgDistance", String.valueOf(statistics.getAvgCacheDistance()));
        hashMap.put("latLngInvalid", String.valueOf(statistics.latLngInvalid));
        hashMap.put("addressNull", String.valueOf(statistics.addressNull));
        hashMap.put("saveFail", String.valueOf(statistics.saveFail));
        Log.d("LocationManager", "loadLocations: %s", (Object) hashMap.toString());
        GallerySamplingStatHelper.recordCountEvent("location_manager", "location_manager_load_stat", hashMap);
    }

    public static String[] segmentLocation(String str) {
        if (str == null) {
            return null;
        }
        String[] split = str.split("/", -1);
        if (split.length == 1 || split.length == 6) {
            return split;
        }
        Log.e("LocationManager", "the length of location is not correct. %s", (Object) Integer.valueOf(split.length));
        return null;
    }

    public void appendDefaultLocationValues(ContentValues contentValues) {
        double d;
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        String asString = contentValues.getAsString("exifGPSLatitude");
        String asString2 = contentValues.getAsString("exifGPSLatitudeRef");
        String asString3 = contentValues.getAsString("exifGPSLongitude");
        String asString4 = contentValues.getAsString("exifGPSLongitudeRef");
        String asString5 = contentValues.getAsString("extraGPS");
        boolean z = true;
        double d2 = 0.0d;
        if (TextUtils.isEmpty(asString) || TextUtils.isEmpty(asString3)) {
            if (!TextUtils.isEmpty(asString5)) {
                ExtraGps parseGpsString = parseGpsString(asString5);
                if (parseGpsString != null) {
                    d2 = (double) parseGpsString.lat;
                    d = (double) parseGpsString.lng;
                }
            }
            z = false;
            d = 0.0d;
        } else {
            d2 = LocationUtil.convertRationalLatLonToDouble(asString, asString2);
            d = LocationUtil.convertRationalLatLonToDouble(asString3, asString4);
        }
        if (z) {
            String decode = CitySearcher.getInstance().decode(new Coordinate(d2, d));
            if (LocationUtil.isLocationValidate(decode)) {
                contentValues.put("location", LocationUtil.getCityNameFromRes(sGetAndroidContext, decode));
            }
        }
    }

    public void appendExtraGpsInfo(String str, ContentValues contentValues) {
        String str2 = (String) this.mMediaGpsInfoStage.remove(str);
        if (str2 != null) {
            String asString = contentValues.getAsString("exifGPSLatitude");
            String asString2 = contentValues.getAsString("exifGPSLongitude");
            if (TextUtils.isEmpty(asString) || TextUtils.isEmpty(asString2)) {
                contentValues.put("extraGPS", str2);
            }
        }
    }

    public String generateTitleLine(String str) {
        if (TextUtils.isEmpty(str) || str.indexOf("/") == -1) {
            return str;
        }
        ArrayList arrayList = new ArrayList(1);
        arrayList.add(str);
        return generateTitleLine((List<String>) arrayList);
    }

    public String generateTitleLine(List<String> list) {
        if (!MiscUtil.isValid(list)) {
            return null;
        }
        int size = list.size();
        String[][] strArr = new String[size][];
        int i = 0;
        boolean z = false;
        int i2 = 0;
        while (true) {
            boolean z2 = true;
            if (i >= size) {
                break;
            }
            String[] segmentLocation = segmentLocation((String) list.get(i));
            if (segmentLocation != null) {
                int i3 = i2 + 1;
                strArr[i2] = segmentLocation;
                if (segmentLocation.length <= 1) {
                    z2 = false;
                }
                z |= z2;
                i2 = i3;
            }
            i++;
        }
        if (!z) {
            String str = "";
            for (int i4 = 0; i4 < i2; i4++) {
                String str2 = strArr[i4][0];
                if (LocationUtil.isLocationValidate(str2) && !str.contains(str2)) {
                    if (str.length() > 0) {
                        StringBuilder sb = new StringBuilder();
                        sb.append(str);
                        sb.append(this.SEPARATOR);
                        str = sb.toString();
                    }
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append(str);
                    sb2.append(str2);
                    str = sb2.toString();
                }
            }
            return str;
        }
        StringBuilder sb3 = new StringBuilder();
        ArrayList arrayList = new ArrayList(i2);
        String str3 = "";
        for (int i5 = 0; i5 < 6; i5++) {
            getNamesOfArea(strArr, i2, i5, arrayList);
            if (arrayList.size() > 1) {
                if (sb3.length() > 0) {
                    sb3.append("-");
                }
                sb3.append(formatAreaNames(arrayList));
                return sb3.toString();
            }
            if (arrayList.size() == 1) {
                String str4 = (String) arrayList.get(0);
                if (!str3.equals(str4)) {
                    if (i5 != 0 || !"中国".equals(str4)) {
                        if (sb3.length() > 0) {
                            sb3.append(this.SEPARATOR);
                        }
                        sb3.append(str4);
                    }
                    str3 = str4;
                }
            }
        }
        return sb3.toString();
    }

    public void loadAllLocation() {
        int i;
        if (!Geocoder.isPresent()) {
            GallerySamplingStatHelper.recordErrorEvent("location_manager", "location_manager_geocoder_error", GallerySamplingStatHelper.generatorCommonParams());
            Log.w("LocationManager", "loadAllLocation, geocoder is not present.");
            return;
        }
        Log.d("LocationManager", "loadAllLocation starts");
        checkVersionAndUpgrade();
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        if (!CTA.canConnectNetwork()) {
            Log.d("LocationManager", "CTA is not available");
        } else if (!isNetworkAvailable()) {
            Log.d("LocationManager", "Network is not available");
        } else {
            int dailyUpdateLimit = CloudControlStrategyHelper.getLocationStrategy().getDailyUpdateLimit();
            if (dailyUpdateLimit <= 0) {
                Log.d("LocationManager", "CloudControl limit is 0");
                return;
            }
            ArrayList arrayList = (ArrayList) SafeDBUtil.safeQuery(sGetAndroidContext, UriUtil.appendLimit(Cloud.CLOUD_URI, dailyUpdateLimit), LOCATION_INFO_PROJECTION, LOCATION_INFO_SELECTION, (String[]) null, "mixedDateTime DESC", (QueryHandler<T>) new QueryHandler<ArrayList<CloudItem>>() {
                public ArrayList<CloudItem> handle(Cursor cursor) {
                    if (cursor == null || !cursor.moveToFirst()) {
                        return null;
                    }
                    ArrayList<CloudItem> arrayList = new ArrayList<>();
                    do {
                        arrayList.add(LocationManager.this.parseCursor(cursor));
                    } while (cursor.moveToNext());
                    return arrayList;
                }
            });
            int i2 = 0;
            if (MiscUtil.isValid(arrayList)) {
                StringBuilder sb = new StringBuilder();
                sb.append("loadAllLocation size:");
                sb.append(arrayList.size());
                Log.d("LocationManager", sb.toString());
                Statistics statistics = new Statistics();
                statistics.start();
                statistics.count = arrayList.size();
                try {
                    Iterator it = arrayList.iterator();
                    i = 0;
                    while (true) {
                        try {
                            if (!it.hasNext()) {
                                break;
                            }
                            CloudItem cloudItem = (CloudItem) it.next();
                            if (!isNetworkAvailable()) {
                                Log.d("LocationManager", "Network is not available");
                                break;
                            } else if (loadLocationForItem(sGetAndroidContext, cloudItem, false, statistics)) {
                                i++;
                            } else {
                                statistics.error++;
                            }
                        } catch (Exception e) {
                            e = e;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("loadAllLocation occur exception:");
                            sb2.append(e.getMessage());
                            Log.e("LocationManager", sb2.toString());
                            i2 = i;
                            recordStatistics(statistics);
                            SyncUtil.requestSync(sGetAndroidContext, new Builder().setSyncType(SyncType.NORMAL).setSyncReason(32).build());
                            Log.d("LocationManager", "loadAllLocation success %s", (Object) Integer.valueOf(i2));
                        }
                    }
                } catch (Exception e2) {
                    e = e2;
                    i = 0;
                    StringBuilder sb22 = new StringBuilder();
                    sb22.append("loadAllLocation occur exception:");
                    sb22.append(e.getMessage());
                    Log.e("LocationManager", sb22.toString());
                    i2 = i;
                    recordStatistics(statistics);
                    SyncUtil.requestSync(sGetAndroidContext, new Builder().setSyncType(SyncType.NORMAL).setSyncReason(32).build());
                    Log.d("LocationManager", "loadAllLocation success %s", (Object) Integer.valueOf(i2));
                }
                i2 = i;
                if (i2 > 0 || statistics.error > 0) {
                    recordStatistics(statistics);
                    if (i2 > 0 && isSyncable()) {
                        SyncUtil.requestSync(sGetAndroidContext, new Builder().setSyncType(SyncType.NORMAL).setSyncReason(32).build());
                    }
                }
            }
            Log.d("LocationManager", "loadAllLocation success %s", (Object) Integer.valueOf(i2));
        }
    }

    public void loadLocation(long j) {
        boolean z;
        if (!Geocoder.isPresent()) {
            Log.w("LocationManager", "loadLocation, geocoder is not present.");
            return;
        }
        Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
        if (!CTA.canConnectNetwork()) {
            Log.d("LocationManager", "CTA is not available");
        } else if (!NetworkUtils.isNetworkConnected()) {
            Log.d("LocationManager", "Network is not available");
        } else {
            Uri uri = Cloud.CLOUD_URI;
            String[] strArr = LOCATION_INFO_PROJECTION;
            StringBuilder sb = new StringBuilder();
            sb.append("_id=? AND ");
            sb.append(LOCATION_INFO_SELECTION);
            Context context = sGetAndroidContext;
            CloudItem cloudItem = (CloudItem) SafeDBUtil.safeQuery(context, uri, strArr, sb.toString(), new String[]{String.valueOf(j)}, (String) null, (QueryHandler<T>) new QueryHandler<CloudItem>() {
                public CloudItem handle(Cursor cursor) {
                    if (cursor == null || !cursor.moveToFirst()) {
                        return null;
                    }
                    return LocationManager.this.parseCursor(cursor);
                }
            });
            if (cloudItem != null) {
                try {
                    z = loadLocationForItem(sGetAndroidContext, cloudItem, true, null);
                } catch (Exception e) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("loadLocation occur exception:");
                    sb2.append(e.getMessage());
                    Log.e("LocationManager", sb2.toString());
                }
                Log.d("LocationManager", "loadLocation success %s", (Object) Boolean.valueOf(z));
            }
            z = false;
            Log.d("LocationManager", "loadLocation success %s", (Object) Boolean.valueOf(z));
        }
    }

    public void loadLocationAsync(final long j) {
        ThreadManager.getNetworkPool().submit(new Job<Void>() {
            public Void run(JobContext jobContext) {
                LocationManager.this.loadLocation(j);
                return null;
            }
        });
    }

    public void recordMediaLocation(String str, Intent intent) {
        if (TextUtils.isEmpty(str) || intent == null) {
            Log.e("LocationManager", "recordMediaLocation path or intent null");
            return;
        }
        Location location = (Location) intent.getParcelableExtra("extra_cache_location");
        if (intent.hasExtra("extra_location_option")) {
            boolean hasExtra = intent.hasExtra("extra_cache_location");
            boolean booleanExtra = intent.getBooleanExtra("extra_location_option", true);
            boolean z = false;
            int i = hasExtra ? booleanExtra ? location == null ? 3 : 2 : 1 : 0;
            HashMap hashMap = new HashMap();
            hashMap.put("status", String.valueOf(i));
            GallerySamplingStatHelper.recordCountEvent("location_manager", "location_manager_gps_status", hashMap);
            String str2 = "LocationManager";
            String str3 = "record location| no location: %s, cache Location not null: %s, option: %s, result: %s";
            Object[] objArr = new Object[4];
            objArr[0] = Boolean.valueOf(hasExtra);
            if (location != null) {
                z = true;
            }
            objArr[1] = Boolean.valueOf(z);
            objArr[2] = Boolean.valueOf(booleanExtra);
            objArr[3] = Integer.valueOf(i);
            Log.d(str2, str3, objArr);
        }
        if (location != null) {
            long elapsedRealtimeNanos = (SystemClock.elapsedRealtimeNanos() - location.getElapsedRealtimeNanos()) / 60000000000L;
            HashMap hashMap2 = new HashMap();
            hashMap2.put("delay", String.valueOf(elapsedRealtimeNanos));
            GallerySamplingStatHelper.recordCountEvent("location_manager", "location_manager_gps_delay_min", hashMap2);
            if (elapsedRealtimeNanos < 0 || elapsedRealtimeNanos > 60) {
                Log.d("LocationManager", "record location out of date %s min", (Object) Long.valueOf(elapsedRealtimeNanos));
                return;
            }
            Log.d("LocationManager", "record location| delay %s min", (Object) Long.valueOf(elapsedRealtimeNanos));
            this.mMediaGpsInfoStage.put(str, formatExtraGpsString(location.getLatitude(), location.getLongitude(), elapsedRealtimeNanos));
        }
    }

    public String subToCity(String str) {
        StringBuilder sb = (StringBuilder) Pools.getStringBuilderPool().acquire();
        String[] segmentLocation = segmentLocation(str);
        if (segmentLocation != null) {
            if (segmentLocation.length == 1) {
                sb.append("中国");
                sb.append(segmentLocation[0]);
            } else {
                int min = Math.min(3, segmentLocation.length);
                for (int i = 0; i < min; i++) {
                    sb.append(segmentLocation[i]);
                }
            }
        }
        String sb2 = sb.length() == 0 ? null : sb.toString();
        Pools.getStringBuilderPool().release(sb);
        return sb2;
    }
}
