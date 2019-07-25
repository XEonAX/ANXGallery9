package com.xiaomi.push.service;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.Notification;
import android.app.Notification.BigPictureStyle;
import android.app.Notification.BigTextStyle;
import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.service.notification.StatusBarNotification;
import android.text.TextUtils;
import android.util.Pair;
import android.widget.RemoteViews;
import com.xiaomi.channel.commonutils.android.AppInfoUtils;
import com.xiaomi.channel.commonutils.android.AppInfoUtils.AppNotificationOp;
import com.xiaomi.channel.commonutils.android.MIUIUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager;
import com.xiaomi.channel.commonutils.misc.ScheduledJobManager.Job;
import com.xiaomi.channel.commonutils.reflect.JavaCalls;
import com.xiaomi.push.service.NotificationIconHelper.GetIconResult;
import com.xiaomi.push.service.clientReport.PushClientReportManager;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.PushMetaInfo;
import com.xiaomi.xmpush.thrift.XmPushActionContainer;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.jcodec.containers.mp4.boxes.Box;
import org.json.JSONException;
import org.json.JSONObject;

public class MIPushNotificationHelper {
    public static long lastNotify;
    private static final LinkedList<Pair<Integer, XmPushActionContainer>> notifyContainerCache = new LinkedList<>();
    private static ExecutorService sThreadPool = Executors.newCachedThreadPool();

    private static class DownloadOnlinePicTask implements Callable<Bitmap> {
        private Context context;
        private boolean isSizeLimited;
        private String picUrl;

        public DownloadOnlinePicTask(String str, Context context2, boolean z) {
            this.context = context2;
            this.picUrl = str;
            this.isSizeLimited = z;
        }

        public Bitmap call() throws Exception {
            if (TextUtils.isEmpty(this.picUrl)) {
                MyLog.w("Failed get online picture/icon resource cause picUrl is empty");
                return null;
            } else if (this.picUrl.startsWith("http")) {
                GetIconResult iconFromUrl = NotificationIconHelper.getIconFromUrl(this.context, this.picUrl, this.isSizeLimited);
                if (iconFromUrl != null) {
                    return iconFromUrl.bitmap;
                }
                MyLog.w("Failed get online picture/icon resource");
                return null;
            } else {
                Bitmap iconFromUri = NotificationIconHelper.getIconFromUri(this.context, this.picUrl);
                if (iconFromUri != null) {
                    return iconFromUri;
                }
                MyLog.w("Failed get online picture/icon resource");
                return iconFromUri;
            }
        }
    }

    public static class GetNotificationResult {
        Notification notification;
        long trafficSize = 0;
    }

    public static class NotifyPushMessageInfo {
        public String targetPkgName;
        public long traffic = 0;
    }

    public static class ResultHolder {
        public boolean ifSummaryShow = false;
        public HashMap<String, Integer> notificationMap = new HashMap<>();
        public HashMap<String, HashSet<Integer>> notifyIdMap = new HashMap<>();
    }

    private static void cancelGroupSummary(NotificationManager notificationManager, String str, String str2) {
        int groupSummaryNotifyId = getGroupSummaryNotifyId(str, str2);
        StringBuilder sb = new StringBuilder();
        sb.append("GROUPSUMMARY  : cancelGroupSummarytargetPackageName = ");
        sb.append(str);
        sb.append(" id = ");
        sb.append(groupSummaryNotifyId);
        MyLog.i(sb.toString());
        notificationManager.cancel(groupSummaryNotifyId);
    }

    private static ResultHolder checkActiveNotification(NotificationManager notificationManager, String str, String str2) {
        ResultHolder resultHolder = new ResultHolder();
        if (notificationManager != null && VERSION.SDK_INT >= 23 && !TextUtils.isEmpty(str)) {
            StatusBarNotification[] activeNotifications = notificationManager.getActiveNotifications();
            if (activeNotifications != null && activeNotifications.length > 0) {
                for (StatusBarNotification statusBarNotification : activeNotifications) {
                    if (statusBarNotification != null) {
                        String packageName = statusBarNotification.getPackageName();
                        String str3 = "";
                        if (statusBarNotification.getNotification() != null) {
                            str3 = statusBarNotification.getNotification().getGroup();
                        }
                        if (!TextUtils.isEmpty(str3)) {
                            StringBuilder sb = new StringBuilder();
                            sb.append(packageName);
                            sb.append(str3);
                            String sb2 = sb.toString();
                            HashSet hashSet = null;
                            if (str2.equals(sb2)) {
                                Object callMethod = JavaCalls.callMethod(statusBarNotification.getNotification(), "isGroupSummary", null);
                                if (callMethod != null && (callMethod instanceof Boolean) && ((Boolean) Boolean.class.cast(callMethod)).booleanValue()) {
                                    resultHolder.ifSummaryShow = true;
                                }
                            }
                            resultHolder.notificationMap.put(sb2, Integer.valueOf((resultHolder.notificationMap.containsKey(sb2) ? ((Integer) resultHolder.notificationMap.get(sb2)).intValue() : 0) + 1));
                            if (resultHolder.notifyIdMap.containsKey(sb2)) {
                                hashSet = (HashSet) resultHolder.notifyIdMap.get(sb2);
                            }
                            if (hashSet == null) {
                                hashSet = new HashSet();
                                resultHolder.notifyIdMap.put(sb2, hashSet);
                            }
                            hashSet.add(Integer.valueOf(statusBarNotification.getId()));
                        }
                    }
                }
            }
        }
        return resultHolder;
    }

    private static boolean checkMatch(String str, String str2) {
        return TextUtils.isEmpty(str) || str2.contains(str);
    }

    @TargetApi(23)
    private static void checkNotificationAutoGroup(Context context, Notification notification, int i, String str) {
        NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
        StringBuilder sb = new StringBuilder();
        sb.append(context.getPackageName());
        sb.append(notification.getGroup());
        String sb2 = sb.toString();
        ResultHolder checkActiveNotification = checkActiveNotification(notificationManager, notification.getGroup(), sb2);
        boolean z = false;
        int intValue = checkActiveNotification.notificationMap.containsKey(sb2) ? ((Integer) checkActiveNotification.notificationMap.get(sb2)).intValue() : 0;
        if (checkActiveNotification.notifyIdMap.containsKey(sb2)) {
            HashSet hashSet = (HashSet) checkActiveNotification.notifyIdMap.get(sb2);
            if (hashSet != null && hashSet.contains(Integer.valueOf(i))) {
                z = true;
            }
        }
        if (intValue > 1 || (intValue == 1 && !z)) {
            if (!checkActiveNotification.ifSummaryShow) {
                showGroupSummary(context, str, notification, notificationManager);
            }
        } else if (intValue < 1 && checkActiveNotification.ifSummaryShow) {
            cancelGroupSummary(notificationManager, str, notification.getGroup());
        }
    }

    static void clearLocalNotifyType(Context context, String str) {
        context.getSharedPreferences("pref_notify_type", 0).edit().remove(str).commit();
    }

    public static void clearNotification(Context context, String str) {
        clearNotification(context, str, -1);
    }

    public static void clearNotification(Context context, String str, int i) {
        NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
        int hashCode = ((str.hashCode() / 10) * 10) + i;
        LinkedList linkedList = new LinkedList();
        if (i >= 0) {
            notificationManager.cancel(hashCode);
        }
        synchronized (notifyContainerCache) {
            Iterator it = notifyContainerCache.iterator();
            while (it.hasNext()) {
                Pair pair = (Pair) it.next();
                XmPushActionContainer xmPushActionContainer = (XmPushActionContainer) pair.second;
                if (xmPushActionContainer != null) {
                    String targetPackage = getTargetPackage(xmPushActionContainer);
                    if (i >= 0) {
                        if (hashCode == ((Integer) pair.first).intValue() && TextUtils.equals(targetPackage, str)) {
                            linkedList.add(pair);
                        }
                    } else if (i == -1 && TextUtils.equals(targetPackage, str)) {
                        notificationManager.cancel(((Integer) pair.first).intValue());
                        linkedList.add(pair);
                    }
                }
            }
            if (notifyContainerCache != null) {
                notifyContainerCache.removeAll(linkedList);
                uploadClearMessageData(context, linkedList);
            }
        }
    }

    public static void clearNotification(Context context, String str, String str2, String str3) {
        if (!TextUtils.isEmpty(str2) || !TextUtils.isEmpty(str3)) {
            NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
            LinkedList linkedList = new LinkedList();
            synchronized (notifyContainerCache) {
                Iterator it = notifyContainerCache.iterator();
                while (it.hasNext()) {
                    Pair pair = (Pair) it.next();
                    XmPushActionContainer xmPushActionContainer = (XmPushActionContainer) pair.second;
                    if (xmPushActionContainer != null) {
                        String targetPackage = getTargetPackage(xmPushActionContainer);
                        PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
                        if (metaInfo != null) {
                            if (TextUtils.equals(targetPackage, str)) {
                                String title = metaInfo.getTitle();
                                String description = metaInfo.getDescription();
                                if (!TextUtils.isEmpty(title) && !TextUtils.isEmpty(description) && checkMatch(str2, title) && checkMatch(str3, description)) {
                                    notificationManager.cancel(((Integer) pair.first).intValue());
                                    linkedList.add(pair);
                                }
                            }
                        }
                    }
                }
                if (notifyContainerCache != null) {
                    notifyContainerCache.removeAll(linkedList);
                    uploadClearMessageData(context, linkedList);
                }
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0070, code lost:
        if (android.text.TextUtils.isEmpty(r3) == false) goto L_0x0072;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:8:0x004e, code lost:
        if (android.text.TextUtils.isEmpty(r3) == false) goto L_0x0072;
     */
    private static String[] determineTitleAndDespByDIP(Context context, PushMetaInfo pushMetaInfo) {
        String str;
        String title = pushMetaInfo.getTitle();
        String description = pushMetaInfo.getDescription();
        Map extra = pushMetaInfo.getExtra();
        if (extra != null) {
            int intValue = Float.valueOf((((float) context.getResources().getDisplayMetrics().widthPixels) / context.getResources().getDisplayMetrics().density) + 0.5f).intValue();
            if (intValue <= 320) {
                String str2 = (String) extra.get("title_short");
                if (!TextUtils.isEmpty(str2)) {
                    title = str2;
                }
                str = (String) extra.get("description_short");
            } else if (intValue > 360) {
                String str3 = (String) extra.get("title_long");
                if (!TextUtils.isEmpty(str3)) {
                    title = str3;
                }
                str = (String) extra.get("description_long");
            }
            description = str;
        }
        return new String[]{title, description};
    }

    public static Bitmap drawableToBitmap(Drawable drawable) {
        if (drawable instanceof BitmapDrawable) {
            return ((BitmapDrawable) drawable).getBitmap();
        }
        int intrinsicWidth = drawable.getIntrinsicWidth();
        int i = 1;
        if (intrinsicWidth <= 0) {
            intrinsicWidth = 1;
        }
        int intrinsicHeight = drawable.getIntrinsicHeight();
        if (intrinsicHeight > 0) {
            i = intrinsicHeight;
        }
        Bitmap createBitmap = Bitmap.createBitmap(intrinsicWidth, i, Config.ARGB_8888);
        Canvas canvas = new Canvas(createBitmap);
        drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
        drawable.draw(canvas);
        return createBitmap;
    }

    private static Notification enableCustomIconForMiui(Notification notification) {
        Object field = JavaCalls.getField(notification, "extraNotification");
        if (field != null) {
            JavaCalls.callMethod(field, "setCustomizedIcon", Boolean.valueOf(true));
        }
        return notification;
    }

    private static Bitmap getBitmapFromId(Context context, int i) {
        return drawableToBitmap(context.getResources().getDrawable(i));
    }

    private static String getChannelName(Context context, String str, Map<String, String> map) {
        return (map == null || TextUtils.isEmpty((CharSequence) map.get("channel_name"))) ? AppInfoUtils.getAppLabel(context, str) : (String) map.get("channel_name");
    }

    private static PendingIntent getClickedPendingIntent(Context context, XmPushActionContainer xmPushActionContainer, PushMetaInfo pushMetaInfo, byte[] bArr) {
        Intent intent;
        int i = isNormalNotificationMessage(xmPushActionContainer) ? 1000 : isBusinessMessage(xmPushActionContainer) ? 3000 : -1;
        String str = "";
        if (pushMetaInfo != null) {
            str = pushMetaInfo.getId();
        }
        if (pushMetaInfo == null || TextUtils.isEmpty(pushMetaInfo.url)) {
            if (isBusinessMessage(xmPushActionContainer)) {
                intent = new Intent();
                intent.setComponent(new ComponentName("com.xiaomi.xmsf", "com.xiaomi.mipush.sdk.PushMessageHandler"));
                intent.putExtra("mipush_payload", bArr);
                intent.putExtra("mipush_notified", true);
                intent.addCategory(String.valueOf(pushMetaInfo.getNotifyId()));
            } else {
                intent = new Intent("com.xiaomi.mipush.RECEIVE_MESSAGE");
                intent.setComponent(new ComponentName(xmPushActionContainer.packageName, "com.xiaomi.mipush.sdk.PushMessageHandler"));
                intent.putExtra("mipush_payload", bArr);
                intent.putExtra("mipush_notified", true);
                intent.addCategory(String.valueOf(pushMetaInfo.getNotifyId()));
            }
            intent.putExtra("messageId", str);
            intent.putExtra("eventMessageType", i);
            if (!ComponentHelper.checkActivity(context, xmPushActionContainer.packageName, "com.xiaomi.mipush.MESSAGE_CLICKED")) {
                return PendingIntent.getService(context, 0, intent, Box.MAX_BOX_SIZE);
            }
            Intent intent2 = new Intent();
            intent2.setAction("com.xiaomi.mipush.MESSAGE_CLICKED");
            intent2.setClassName(xmPushActionContainer.packageName, "com.xiaomi.mipush.sdk.BridgeActivity");
            intent2.addFlags(276824064);
            intent2.putExtra("mipush_serviceIntent", intent);
            intent2.addCategory(String.valueOf(pushMetaInfo.getNotifyId()));
            return PendingIntent.getActivity(context, 0, intent2, Box.MAX_BOX_SIZE);
        }
        Intent intent3 = new Intent("android.intent.action.VIEW");
        intent3.setData(Uri.parse(pushMetaInfo.url));
        intent3.addFlags(268435456);
        intent3.putExtra("messageId", str);
        intent3.putExtra("eventMessageType", i);
        return PendingIntent.getActivity(context, 0, intent3, Box.MAX_BOX_SIZE);
    }

    private static int getGroupSummaryNotifyId(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(str2);
        return ((sb.toString().hashCode() / 10) * 10) + 32768;
    }

    private static int getIconId(Context context, String str, String str2) {
        if (str.equals(context.getPackageName())) {
            return context.getResources().getIdentifier(str2, "drawable", str);
        }
        return 0;
    }

    private static int getIdForSmallIcon(Context context, String str) {
        int iconId = getIconId(context, str, "mipush_notification");
        int iconId2 = getIconId(context, str, "mipush_small_notification");
        if (iconId <= 0) {
            iconId = iconId2 > 0 ? iconId2 : context.getApplicationInfo().icon;
        }
        return (iconId != 0 || VERSION.SDK_INT < 9) ? iconId : context.getApplicationInfo().logo;
    }

    public static String getInterfaceId(XmPushActionContainer xmPushActionContainer) {
        return isBusinessMessage(xmPushActionContainer) ? "E100002" : isNormalNotificationMessage(xmPushActionContainer) ? "E100000" : isPassThoughMessage(xmPushActionContainer) ? "E100001" : isRegisterMessage(xmPushActionContainer) ? "E100003" : "";
    }

    static int getLocalNotifyType(Context context, String str) {
        return context.getSharedPreferences("pref_notify_type", 0).getInt(str, Integer.MAX_VALUE);
    }

    private static RemoteViews getNotificationForCustomLayout(Context context, XmPushActionContainer xmPushActionContainer, byte[] bArr) {
        PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
        String targetPackage = getTargetPackage(xmPushActionContainer);
        Map extra = metaInfo.getExtra();
        if (extra == null) {
            return null;
        }
        String str = (String) extra.get("layout_name");
        String str2 = (String) extra.get("layout_value");
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return null;
        }
        try {
            Resources resourcesForApplication = context.getPackageManager().getResourcesForApplication(targetPackage);
            int identifier = resourcesForApplication.getIdentifier(str, "layout", targetPackage);
            if (identifier == 0) {
                return null;
            }
            RemoteViews remoteViews = new RemoteViews(targetPackage, identifier);
            try {
                JSONObject jSONObject = new JSONObject(str2);
                if (jSONObject.has("text")) {
                    JSONObject jSONObject2 = jSONObject.getJSONObject("text");
                    Iterator keys = jSONObject2.keys();
                    while (keys.hasNext()) {
                        String str3 = (String) keys.next();
                        String string = jSONObject2.getString(str3);
                        int identifier2 = resourcesForApplication.getIdentifier(str3, "id", targetPackage);
                        if (identifier2 > 0) {
                            remoteViews.setTextViewText(identifier2, string);
                        }
                    }
                }
                if (jSONObject.has("image")) {
                    JSONObject jSONObject3 = jSONObject.getJSONObject("image");
                    Iterator keys2 = jSONObject3.keys();
                    while (keys2.hasNext()) {
                        String str4 = (String) keys2.next();
                        String string2 = jSONObject3.getString(str4);
                        int identifier3 = resourcesForApplication.getIdentifier(str4, "id", targetPackage);
                        int identifier4 = resourcesForApplication.getIdentifier(string2, "drawable", targetPackage);
                        if (identifier3 > 0) {
                            remoteViews.setImageViewResource(identifier3, identifier4);
                        }
                    }
                }
                if (jSONObject.has("time")) {
                    JSONObject jSONObject4 = jSONObject.getJSONObject("time");
                    Iterator keys3 = jSONObject4.keys();
                    while (keys3.hasNext()) {
                        String str5 = (String) keys3.next();
                        String string3 = jSONObject4.getString(str5);
                        if (string3.length() == 0) {
                            string3 = "yy-MM-dd hh:mm";
                        }
                        int identifier5 = resourcesForApplication.getIdentifier(str5, "id", targetPackage);
                        if (identifier5 > 0) {
                            remoteViews.setTextViewText(identifier5, new SimpleDateFormat(string3).format(new Date(System.currentTimeMillis())));
                        }
                    }
                }
                return remoteViews;
            } catch (JSONException e) {
                MyLog.e((Throwable) e);
                return null;
            }
        } catch (NameNotFoundException e2) {
            MyLog.e((Throwable) e2);
            return null;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:105:0x0252  */
    /* JADX WARNING: Removed duplicated region for block: B:112:0x0263  */
    /* JADX WARNING: Removed duplicated region for block: B:119:0x02a5  */
    /* JADX WARNING: Removed duplicated region for block: B:120:0x02a7  */
    /* JADX WARNING: Removed duplicated region for block: B:127:0x02e7 A[Catch:{ Exception -> 0x03f6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:155:0x039f A[Catch:{ Exception -> 0x03f6 }] */
    /* JADX WARNING: Removed duplicated region for block: B:174:0x0408 A[SYNTHETIC, Splitter:B:174:0x0408] */
    /* JADX WARNING: Removed duplicated region for block: B:189:0x045e  */
    /* JADX WARNING: Removed duplicated region for block: B:75:0x0196  */
    /* JADX WARNING: Removed duplicated region for block: B:76:0x0198  */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x01a6  */
    /* JADX WARNING: Removed duplicated region for block: B:84:0x01c9  */
    /* JADX WARNING: Removed duplicated region for block: B:93:0x0209  */
    @SuppressLint({"NewApi"})
    private static GetNotificationResult getNotificationForLargeIcons(Context context, XmPushActionContainer xmPushActionContainer, byte[] bArr, RemoteViews remoteViews, PendingIntent pendingIntent) {
        boolean z;
        Bitmap onlinePictureResource;
        long currentTimeMillis;
        Uri uri;
        int i;
        Notification notification;
        int timeout;
        String str;
        String str2;
        NotificationManager notificationManager;
        Object callMethod;
        List list;
        int i2;
        String str3;
        Bitmap bitmap;
        Context context2 = context;
        RemoteViews remoteViews2 = remoteViews;
        GetNotificationResult getNotificationResult = new GetNotificationResult();
        PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
        String targetPackage = getTargetPackage(xmPushActionContainer);
        Map extra = metaInfo.getExtra();
        Builder builder = new Builder(context2);
        String[] determineTitleAndDespByDIP = determineTitleAndDespByDIP(context2, metaInfo);
        builder.setContentTitle(determineTitleAndDespByDIP[0]);
        builder.setContentText(determineTitleAndDespByDIP[1]);
        if (remoteViews2 != null) {
            builder.setContent(remoteViews2);
        } else if (VERSION.SDK_INT >= 16 && extra != null && extra.containsKey("notification_style_type")) {
            builder = setNotificationStyle(context2, extra, builder, determineTitleAndDespByDIP[1]);
        }
        Builder notificationStyleAction = setNotificationStyleAction(builder, context2, xmPushActionContainer.getPackageName(), extra);
        notificationStyleAction.setWhen(System.currentTimeMillis());
        String str4 = extra == null ? null : (String) extra.get("notification_show_when");
        if (!TextUtils.isEmpty(str4)) {
            notificationStyleAction.setShowWhen(Boolean.parseBoolean(str4));
        } else if (VERSION.SDK_INT >= 24) {
            notificationStyleAction.setShowWhen(true);
        }
        notificationStyleAction.setContentIntent(pendingIntent);
        int iconId = getIconId(context2, targetPackage, "mipush_notification");
        int iconId2 = getIconId(context2, targetPackage, "mipush_small_notification");
        if (iconId <= 0 || iconId2 <= 0) {
            notificationStyleAction.setSmallIcon(getIdForSmallIcon(context2, targetPackage));
        } else {
            notificationStyleAction.setLargeIcon(getBitmapFromId(context2, iconId));
            notificationStyleAction.setSmallIcon(iconId2);
        }
        if (VERSION.SDK_INT >= 23) {
            Bitmap onlinePictureResource2 = extra == null ? null : getOnlinePictureResource(context2, (String) extra.get("notification_small_icon_uri"), true);
            if (onlinePictureResource2 != null) {
                Object callStaticMethod = JavaCalls.callStaticMethod("android.graphics.drawable.Icon", "createWithBitmap", onlinePictureResource2);
                if (callStaticMethod != null) {
                    JavaCalls.callMethod(notificationStyleAction, "setSmallIcon", callStaticMethod);
                    Bundle bundle = new Bundle();
                    bundle.putBoolean("miui.isGrayscaleIcon", true);
                    notificationStyleAction.addExtras(bundle);
                } else {
                    StringBuilder sb = new StringBuilder();
                    sb.append("failed te get small icon with url:");
                    sb.append((String) extra.get("notification_small_icon_uri"));
                    MyLog.w(sb.toString());
                }
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("failed to get small icon url:");
                sb2.append(extra == null ? null : (String) extra.get("notification_small_icon_uri"));
                MyLog.w(sb2.toString());
            }
            String str5 = extra == null ? null : (String) extra.get("notification_small_icon_color");
            if (!TextUtils.isEmpty(str5)) {
                try {
                    JavaCalls.callMethod(notificationStyleAction, "setColor", Integer.valueOf(Color.parseColor(str5)));
                } catch (Exception e) {
                    MyLog.e((Throwable) e);
                }
            }
        }
        String str6 = extra == null ? null : (String) extra.get("__dynamic_icon_uri");
        boolean z2 = (extra != null && Boolean.parseBoolean((String) extra.get("__adiom"))) || !MIUIUtils.isMIUI();
        if (str6 != null && z2) {
            if (str6.startsWith("http")) {
                GetIconResult iconFromUrl = NotificationIconHelper.getIconFromUrl(context2, str6, true);
                if (iconFromUrl != null) {
                    bitmap = iconFromUrl.bitmap;
                    getNotificationResult.trafficSize = iconFromUrl.downloadSize;
                } else {
                    bitmap = null;
                }
            } else {
                bitmap = NotificationIconHelper.getIconFromUri(context2, str6);
            }
            if (bitmap != null) {
                notificationStyleAction.setLargeIcon(bitmap);
                z = true;
                onlinePictureResource = extra != null ? null : getOnlinePictureResource(context2, (String) extra.get("notification_large_icon_uri"), true);
                if (onlinePictureResource != null) {
                    notificationStyleAction.setLargeIcon(onlinePictureResource);
                }
                if (extra != null && VERSION.SDK_INT >= 24) {
                    str3 = (String) extra.get("notification_group");
                    boolean parseBoolean = Boolean.parseBoolean((String) extra.get("notification_is_summary"));
                    if (TextUtils.isEmpty(str3)) {
                        str3 = getTargetPackage(xmPushActionContainer);
                    }
                    JavaCalls.callMethod(notificationStyleAction, "setGroup", str3);
                    JavaCalls.callMethod(notificationStyleAction, "setGroupSummary", Boolean.valueOf(parseBoolean));
                }
                notificationStyleAction.setAutoCancel(true);
                currentTimeMillis = System.currentTimeMillis();
                if (extra != null && extra.containsKey("ticker")) {
                    notificationStyleAction.setTicker((CharSequence) extra.get("ticker"));
                }
                if (currentTimeMillis - lastNotify <= 10000) {
                    lastNotify = currentTimeMillis;
                    i = metaInfo.notifyType;
                    if (hasLocalNotifyType(context2, targetPackage)) {
                        i = getLocalNotifyType(context2, targetPackage);
                    }
                    notificationStyleAction.setDefaults(i);
                    if (!(extra == null || (i & 1) == 0)) {
                        String str7 = (String) extra.get("sound_uri");
                        if (!TextUtils.isEmpty(str7)) {
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("android.resource://");
                            sb3.append(targetPackage);
                            if (str7.startsWith(sb3.toString())) {
                                notificationStyleAction.setDefaults(i ^ 1);
                                uri = Uri.parse(str7);
                                notificationStyleAction.setSound(uri);
                                if (extra != null && VERSION.SDK_INT >= 26) {
                                    timeout = getTimeout(extra);
                                    if (timeout > 0) {
                                        JavaCalls.callMethod(notificationStyleAction, "setTimeoutAfter", Long.valueOf((long) (timeout * 1000)));
                                    }
                                    str = (String) extra.get("channel_id");
                                    if (!TextUtils.isEmpty(str) || context.getApplicationInfo().targetSdkVersion >= 26) {
                                        StringBuilder sb4 = new StringBuilder();
                                        sb4.append("mipush_");
                                        sb4.append(targetPackage);
                                        sb4.append("_default");
                                        String sb5 = sb4.toString();
                                        if (TextUtils.isEmpty(str)) {
                                            str = sb5;
                                        } else if (MIUIUtils.isMIUI()) {
                                            StringBuilder sb6 = new StringBuilder();
                                            sb6.append("mipush_");
                                            sb6.append(targetPackage);
                                            sb6.append("_");
                                            sb6.append(str);
                                            str = sb6.toString();
                                        }
                                        JavaCalls.callMethod(notificationStyleAction, "setChannelId", str);
                                        String channelName = getChannelName(context2, targetPackage, extra);
                                        notificationManager = (NotificationManager) context2.getSystemService("notification");
                                        if (JavaCalls.callMethod(notificationManager, "getNotificationChannel", str) == null) {
                                            Object newInstance = Class.forName("android.app.NotificationChannel").getConstructor(new Class[]{String.class, CharSequence.class, Integer.TYPE}).newInstance(new Object[]{str, channelName, Integer.valueOf(3)});
                                            if (i > -100) {
                                                notificationStyleAction.setSound(null, null);
                                                notificationStyleAction.setDefaults(0);
                                                int i3 = i & 1;
                                                int i4 = i & 2;
                                                int i5 = i & 4;
                                                if (i3 != 1) {
                                                    JavaCalls.callMethod(newInstance, "setSound", null, null);
                                                }
                                                if (uri != null) {
                                                    JavaCalls.callMethod(newInstance, "setSound", uri, Notification.AUDIO_ATTRIBUTES_DEFAULT);
                                                }
                                                String str8 = "enableVibration";
                                                Object[] objArr = new Object[1];
                                                objArr[0] = Boolean.valueOf(i4 == 2);
                                                JavaCalls.callMethod(newInstance, str8, objArr);
                                                String str9 = "enableLights";
                                                Object[] objArr2 = new Object[1];
                                                objArr2[0] = Boolean.valueOf(i5 == 4);
                                                JavaCalls.callMethod(newInstance, str9, objArr2);
                                            }
                                            setChannelDescription(newInstance, extra);
                                            JavaCalls.callMethod(notificationManager, "createNotificationChannel", newInstance);
                                        }
                                        callMethod = JavaCalls.callMethod(notificationManager, "getNotificationChannels", new Object[0]);
                                        if (callMethod != null && (callMethod instanceof List)) {
                                            list = (List) callMethod;
                                            if (list != null && list.size() > 0) {
                                                for (i2 = 0; i2 < list.size(); i2++) {
                                                    Object obj = list.get(i2);
                                                    Object callMethod2 = JavaCalls.callMethod(obj, "getName", new Object[0]);
                                                    Object callMethod3 = JavaCalls.callMethod(obj, "getId", new Object[0]);
                                                    String appLabel = AppInfoUtils.getAppLabel(context2, targetPackage);
                                                    if (callMethod2 != null && callMethod3 != null && (callMethod2 instanceof CharSequence) && (callMethod3 instanceof String) && callMethod2.equals(appLabel)) {
                                                        String str10 = (String) callMethod3;
                                                        StringBuilder sb7 = new StringBuilder();
                                                        sb7.append("mipush_");
                                                        sb7.append(targetPackage);
                                                        if (str10.startsWith(sb7.toString()) && !callMethod3.equals(sb5)) {
                                                            JavaCalls.callMethod(notificationManager, "deleteNotificationChannel", callMethod3);
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    str2 = (String) extra.get("background_color");
                                    if (!TextUtils.isEmpty(str2)) {
                                        try {
                                            int parseInt = Integer.parseInt(str2);
                                            notificationStyleAction.setOngoing(true);
                                            notificationStyleAction.setColor(parseInt);
                                            JavaCalls.callMethod(notificationStyleAction, "setColorized", Boolean.valueOf(true));
                                        } catch (Exception e2) {
                                            MyLog.e((Throwable) e2);
                                        }
                                    }
                                }
                                if (MIUIUtils.isXMS() && "com.xiaomi.xmsf".equals(context.getPackageName())) {
                                    JavaCalls.callStaticMethod("miui.util.NotificationHelper", "setTargetPkg", context2, notificationStyleAction, getTargetPackage(xmPushActionContainer));
                                }
                                notification = notificationStyleAction.getNotification();
                                if (z && MIUIUtils.isMIUI()) {
                                    enableCustomIconForMiui(notification);
                                }
                                if (extra != null) {
                                    Object field = JavaCalls.getField(notification, "extraNotification");
                                    if (field != null) {
                                        if (!TextUtils.isEmpty((CharSequence) extra.get("enable_keyguard"))) {
                                            JavaCalls.callMethod(field, "setEnableKeyguard", Boolean.valueOf(Boolean.parseBoolean((String) extra.get("enable_keyguard"))));
                                        }
                                        if (!TextUtils.isEmpty((CharSequence) extra.get("enable_float"))) {
                                            JavaCalls.callMethod(field, "setEnableFloat", Boolean.valueOf(Boolean.parseBoolean((String) extra.get("enable_float"))));
                                        }
                                    }
                                }
                                getNotificationResult.notification = notification;
                                return getNotificationResult;
                            }
                        }
                    }
                } else {
                    i = -100;
                }
                uri = null;
                timeout = getTimeout(extra);
                if (timeout > 0) {
                }
                str = (String) extra.get("channel_id");
                StringBuilder sb42 = new StringBuilder();
                sb42.append("mipush_");
                sb42.append(targetPackage);
                sb42.append("_default");
                String sb52 = sb42.toString();
                if (TextUtils.isEmpty(str)) {
                }
                JavaCalls.callMethod(notificationStyleAction, "setChannelId", str);
                String channelName2 = getChannelName(context2, targetPackage, extra);
                notificationManager = (NotificationManager) context2.getSystemService("notification");
                if (JavaCalls.callMethod(notificationManager, "getNotificationChannel", str) == null) {
                }
                callMethod = JavaCalls.callMethod(notificationManager, "getNotificationChannels", new Object[0]);
                list = (List) callMethod;
                while (i2 < list.size()) {
                }
                str2 = (String) extra.get("background_color");
                if (!TextUtils.isEmpty(str2)) {
                }
                JavaCalls.callStaticMethod("miui.util.NotificationHelper", "setTargetPkg", context2, notificationStyleAction, getTargetPackage(xmPushActionContainer));
                notification = notificationStyleAction.getNotification();
                enableCustomIconForMiui(notification);
                if (extra != null) {
                }
                getNotificationResult.notification = notification;
                return getNotificationResult;
            }
        }
        z = false;
        if (extra != null) {
        }
        if (onlinePictureResource != null) {
        }
        str3 = (String) extra.get("notification_group");
        boolean parseBoolean2 = Boolean.parseBoolean((String) extra.get("notification_is_summary"));
        if (TextUtils.isEmpty(str3)) {
        }
        JavaCalls.callMethod(notificationStyleAction, "setGroup", str3);
        JavaCalls.callMethod(notificationStyleAction, "setGroupSummary", Boolean.valueOf(parseBoolean2));
        notificationStyleAction.setAutoCancel(true);
        currentTimeMillis = System.currentTimeMillis();
        notificationStyleAction.setTicker((CharSequence) extra.get("ticker"));
        if (currentTimeMillis - lastNotify <= 10000) {
        }
        uri = null;
        timeout = getTimeout(extra);
        if (timeout > 0) {
        }
        str = (String) extra.get("channel_id");
        StringBuilder sb422 = new StringBuilder();
        sb422.append("mipush_");
        sb422.append(targetPackage);
        sb422.append("_default");
        String sb522 = sb422.toString();
        if (TextUtils.isEmpty(str)) {
        }
        JavaCalls.callMethod(notificationStyleAction, "setChannelId", str);
        String channelName22 = getChannelName(context2, targetPackage, extra);
        notificationManager = (NotificationManager) context2.getSystemService("notification");
        try {
            if (JavaCalls.callMethod(notificationManager, "getNotificationChannel", str) == null) {
            }
            callMethod = JavaCalls.callMethod(notificationManager, "getNotificationChannels", new Object[0]);
            list = (List) callMethod;
            while (i2 < list.size()) {
            }
        } catch (Exception e3) {
            MyLog.e((Throwable) e3);
        }
        str2 = (String) extra.get("background_color");
        if (!TextUtils.isEmpty(str2)) {
        }
        JavaCalls.callStaticMethod("miui.util.NotificationHelper", "setTargetPkg", context2, notificationStyleAction, getTargetPackage(xmPushActionContainer));
        notification = notificationStyleAction.getNotification();
        enableCustomIconForMiui(notification);
        if (extra != null) {
        }
        getNotificationResult.notification = notification;
        return getNotificationResult;
    }

    private static Bitmap getOnlinePictureResource(Context context, String str, boolean z) {
        Future submit = sThreadPool.submit(new DownloadOnlinePicTask(str, context, z));
        try {
            Bitmap bitmap = (Bitmap) submit.get(180, TimeUnit.SECONDS);
            if (bitmap != null) {
                return bitmap;
            }
            submit.cancel(true);
            return bitmap;
        } catch (InterruptedException e) {
            MyLog.e((Throwable) e);
        } catch (ExecutionException e2) {
            MyLog.e((Throwable) e2);
        } catch (TimeoutException e3) {
            MyLog.e((Throwable) e3);
        } catch (Throwable th) {
            submit.cancel(true);
            throw th;
        }
        submit.cancel(true);
        return null;
    }

    /* JADX WARNING: Removed duplicated region for block: B:73:0x014e  */
    private static Intent getPendingIntentFromExtra(Context context, String str, int i, Map<String, String> map) {
        Intent intent;
        Intent intent2;
        String str2 = i < 2 ? "notification_style_button_left_notify_effect" : i < 3 ? "notification_style_button_mid_notify_effect" : "notification_style_button_right_notify_effect";
        String str3 = (String) map.get(str2);
        if (TextUtils.isEmpty(str3)) {
            return null;
        }
        if (PushConstants.NOTIFICATION_CLICK_DEFAULT.equals(str3)) {
            try {
                intent = context.getPackageManager().getLaunchIntentForPackage(str);
            } catch (Exception e) {
                StringBuilder sb = new StringBuilder();
                sb.append("Cause: ");
                sb.append(e.getMessage());
                MyLog.e(sb.toString());
            }
        } else {
            if (PushConstants.NOTIFICATION_CLICK_INTENT.equals(str3)) {
                String str4 = i < 2 ? "notification_style_button_left_intent_uri" : i < 3 ? "notification_style_button_mid_intent_uri" : "notification_style_button_right_intent_uri";
                String str5 = i < 2 ? "notification_style_button_left_intent_class" : i < 3 ? "notification_style_button_mid_intent_class" : "notification_style_button_right_intent_class";
                if (map.containsKey(str4)) {
                    String str6 = (String) map.get(str4);
                    if (str6 != null) {
                        try {
                            intent2 = Intent.parseUri(str6, 1);
                            try {
                                intent2.setPackage(str);
                            } catch (URISyntaxException e2) {
                                e = e2;
                            }
                        } catch (URISyntaxException e3) {
                            e = e3;
                            intent2 = null;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("Cause: ");
                            sb2.append(e.getMessage());
                            MyLog.e(sb2.toString());
                            intent = intent2;
                            if (intent != null) {
                            }
                            return null;
                        }
                    }
                } else if (map.containsKey(str5)) {
                    String str7 = (String) map.get(str5);
                    Intent intent3 = new Intent();
                    intent3.setComponent(new ComponentName(str, str7));
                    intent2 = intent3;
                }
                intent2 = null;
            } else {
                if (PushConstants.NOTIFICATION_CLICK_WEB_PAGE.equals(str3)) {
                    String str8 = i < 2 ? "notification_style_button_left_web_uri" : i < 3 ? "notification_style_button_mid_web_uri" : "notification_style_button_right_web_uri";
                    String str9 = (String) map.get(str8);
                    if (!TextUtils.isEmpty(str9)) {
                        String trim = str9.trim();
                        if (!trim.startsWith("http://") && !trim.startsWith("https://")) {
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("http://");
                            sb3.append(trim);
                            trim = sb3.toString();
                        }
                        try {
                            String protocol = new URL(trim).getProtocol();
                            if ("http".equals(protocol) || "https".equals(protocol)) {
                                intent2 = new Intent("android.intent.action.VIEW");
                                try {
                                    intent2.setData(Uri.parse(trim));
                                    intent = setXiaomiBrowserDefault(context, intent2);
                                } catch (MalformedURLException e4) {
                                    e = e4;
                                    StringBuilder sb4 = new StringBuilder();
                                    sb4.append("Cause: ");
                                    sb4.append(e.getMessage());
                                    MyLog.e(sb4.toString());
                                    intent = intent2;
                                    if (intent != null) {
                                    }
                                    return null;
                                }
                            }
                        } catch (MalformedURLException e5) {
                            e = e5;
                            intent2 = null;
                            StringBuilder sb42 = new StringBuilder();
                            sb42.append("Cause: ");
                            sb42.append(e.getMessage());
                            MyLog.e(sb42.toString());
                            intent = intent2;
                            if (intent != null) {
                            }
                            return null;
                        }
                    }
                }
                intent = null;
            }
            intent = intent2;
        }
        if (intent != null) {
            intent.addFlags(268435456);
            try {
                if (context.getPackageManager().resolveActivity(intent, 65536) != null) {
                    return intent;
                }
            } catch (Exception e6) {
                StringBuilder sb5 = new StringBuilder();
                sb5.append("Cause: ");
                sb5.append(e6.getMessage());
                MyLog.e(sb5.toString());
            }
        }
        return null;
    }

    private static PendingIntent getStylePendingIntent(Context context, String str, int i, Map<String, String> map) {
        if (map == null) {
            return null;
        }
        Intent pendingIntentFromExtra = getPendingIntentFromExtra(context, str, i, map);
        if (pendingIntentFromExtra != null) {
            return PendingIntent.getActivity(context, 0, pendingIntentFromExtra, 0);
        }
        return null;
    }

    static String getTargetPackage(XmPushActionContainer xmPushActionContainer) {
        if ("com.xiaomi.xmsf".equals(xmPushActionContainer.packageName)) {
            PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
            if (!(metaInfo == null || metaInfo.getExtra() == null)) {
                String str = (String) metaInfo.getExtra().get("miui_package_name");
                if (!TextUtils.isEmpty(str)) {
                    return str;
                }
            }
        }
        return xmPushActionContainer.packageName;
    }

    private static int getTimeout(Map<String, String> map) {
        String str = map == null ? null : (String) map.get("timeout");
        if (TextUtils.isEmpty(str)) {
            return 0;
        }
        try {
            return Integer.parseInt(str);
        } catch (Exception unused) {
            return 0;
        }
    }

    static boolean hasLocalNotifyType(Context context, String str) {
        return context.getSharedPreferences("pref_notify_type", 0).contains(str);
    }

    public static boolean isApplicationForeground(Context context, String str) {
        List<RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) context.getSystemService("activity")).getRunningAppProcesses();
        if (runningAppProcesses != null) {
            for (RunningAppProcessInfo runningAppProcessInfo : runningAppProcesses) {
                if (runningAppProcessInfo.importance == 100 && Arrays.asList(runningAppProcessInfo.pkgList).contains(str)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean isBusinessMessage(XmPushActionContainer xmPushActionContainer) {
        PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
        return isIdVaild(metaInfo) && metaInfo.isIgnoreRegInfo();
    }

    private static boolean isIdVaild(PushMetaInfo pushMetaInfo) {
        if (pushMetaInfo == null) {
            return false;
        }
        String id = pushMetaInfo.getId();
        return !TextUtils.isEmpty(id) && id.length() == 22 && "satuigm".indexOf(id.charAt(0)) >= 0;
    }

    public static boolean isNPBMessage(XmPushActionContainer xmPushActionContainer) {
        return isBusinessMessage(xmPushActionContainer) || isNormalNotificationMessage(xmPushActionContainer) || isPassThoughMessage(xmPushActionContainer);
    }

    public static boolean isNormalNotificationMessage(XmPushActionContainer xmPushActionContainer) {
        PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
        return isIdVaild(metaInfo) && metaInfo.passThrough == 0 && !isBusinessMessage(xmPushActionContainer);
    }

    public static boolean isNotifyForeground(Map<String, String> map) {
        if (map == null || !map.containsKey("notify_foreground")) {
            return true;
        }
        return "1".equals((String) map.get("notify_foreground"));
    }

    public static boolean isPassThoughMessage(XmPushActionContainer xmPushActionContainer) {
        PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
        return isIdVaild(metaInfo) && metaInfo.passThrough == 1 && !isBusinessMessage(xmPushActionContainer);
    }

    public static boolean isRegisterMessage(XmPushActionContainer xmPushActionContainer) {
        return xmPushActionContainer.getAction() == ActionType.Registration;
    }

    public static NotifyPushMessageInfo notifyPushMessage(Context context, XmPushActionContainer xmPushActionContainer, byte[] bArr) {
        Notification notification;
        Context context2 = context;
        XmPushActionContainer xmPushActionContainer2 = xmPushActionContainer;
        byte[] bArr2 = bArr;
        NotifyPushMessageInfo notifyPushMessageInfo = new NotifyPushMessageInfo();
        if (AppInfoUtils.getAppNotificationOp(context2, getTargetPackage(xmPushActionContainer)) == AppNotificationOp.NOT_ALLOWED) {
            PushMetaInfo metaInfo = xmPushActionContainer.getMetaInfo();
            if (metaInfo != null) {
                PushClientReportManager instance = PushClientReportManager.getInstance(context.getApplicationContext());
                String packageName = xmPushActionContainer.getPackageName();
                String interfaceId = getInterfaceId(xmPushActionContainer);
                String id = metaInfo.getId();
                StringBuilder sb = new StringBuilder();
                sb.append("Do not notify because user block ");
                sb.append(getTargetPackage(xmPushActionContainer));
                sb.append("‘s notification");
                instance.reportEvent4NeedDrop(packageName, interfaceId, id, sb.toString());
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Do not notify because user block ");
            sb2.append(getTargetPackage(xmPushActionContainer));
            sb2.append("‘s notification");
            MyLog.w(sb2.toString());
            return notifyPushMessageInfo;
        }
        final NotificationManager notificationManager = (NotificationManager) context2.getSystemService("notification");
        PushMetaInfo metaInfo2 = xmPushActionContainer.getMetaInfo();
        RemoteViews notificationForCustomLayout = getNotificationForCustomLayout(context, xmPushActionContainer, bArr);
        PendingIntent clickedPendingIntent = getClickedPendingIntent(context2, xmPushActionContainer2, metaInfo2, bArr2);
        if (clickedPendingIntent == null) {
            if (metaInfo2 != null) {
                PushClientReportManager.getInstance(context.getApplicationContext()).reportEvent4NeedDrop(xmPushActionContainer.getPackageName(), getInterfaceId(xmPushActionContainer), metaInfo2.getId(), "The click PendingIntent is null. ");
            }
            MyLog.w("The click PendingIntent is null. ");
            return notifyPushMessageInfo;
        }
        String str = null;
        if (VERSION.SDK_INT >= 11) {
            GetNotificationResult notificationForLargeIcons = getNotificationForLargeIcons(context2, xmPushActionContainer2, bArr2, notificationForCustomLayout, clickedPendingIntent);
            notifyPushMessageInfo.traffic = notificationForLargeIcons.trafficSize;
            notifyPushMessageInfo.targetPkgName = getTargetPackage(xmPushActionContainer);
            notification = notificationForLargeIcons.notification;
        } else {
            notification = new Notification(getIdForSmallIcon(context2, getTargetPackage(xmPushActionContainer)), null, System.currentTimeMillis());
            String[] determineTitleAndDespByDIP = determineTitleAndDespByDIP(context2, metaInfo2);
            try {
                notification.getClass().getMethod("setLatestEventInfo", new Class[]{Context.class, CharSequence.class, CharSequence.class, PendingIntent.class}).invoke(notification, new Object[]{context2, determineTitleAndDespByDIP[0], determineTitleAndDespByDIP[1], clickedPendingIntent});
            } catch (NoSuchMethodException e) {
                if (metaInfo2 != null) {
                    PushClientReportManager.getInstance(context.getApplicationContext()).reportEvent4ERROR(xmPushActionContainer.getPackageName(), getInterfaceId(xmPushActionContainer), metaInfo2.getId(), (Throwable) e);
                }
                MyLog.e((Throwable) e);
            } catch (IllegalAccessException e2) {
                if (metaInfo2 != null) {
                    PushClientReportManager.getInstance(context.getApplicationContext()).reportEvent4ERROR(xmPushActionContainer.getPackageName(), getInterfaceId(xmPushActionContainer), metaInfo2.getId(), (Throwable) e2);
                }
                MyLog.e((Throwable) e2);
            } catch (IllegalArgumentException e3) {
                if (metaInfo2 != null) {
                    PushClientReportManager.getInstance(context.getApplicationContext()).reportEvent4ERROR(xmPushActionContainer.getPackageName(), getInterfaceId(xmPushActionContainer), metaInfo2.getId(), (Throwable) e3);
                }
                MyLog.e((Throwable) e3);
            } catch (InvocationTargetException e4) {
                if (metaInfo2 != null) {
                    PushClientReportManager.getInstance(context.getApplicationContext()).reportEvent4ERROR(xmPushActionContainer.getPackageName(), getInterfaceId(xmPushActionContainer), metaInfo2.getId(), (Throwable) e4);
                }
                MyLog.e((Throwable) e4);
            }
            Map extra = metaInfo2.getExtra();
            if (extra != null && extra.containsKey("ticker")) {
                notification.tickerText = (CharSequence) extra.get("ticker");
            }
            long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis - lastNotify > 10000) {
                lastNotify = currentTimeMillis;
                int i = metaInfo2.notifyType;
                if (hasLocalNotifyType(context2, getTargetPackage(xmPushActionContainer))) {
                    i = getLocalNotifyType(context2, getTargetPackage(xmPushActionContainer));
                }
                notification.defaults = i;
                if (!(extra == null || (i & 1) == 0)) {
                    String str2 = (String) extra.get("sound_uri");
                    if (!TextUtils.isEmpty(str2)) {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("android.resource://");
                        sb3.append(getTargetPackage(xmPushActionContainer));
                        if (str2.startsWith(sb3.toString())) {
                            notification.defaults = i ^ 1;
                            notification.sound = Uri.parse(str2);
                        }
                    }
                }
            }
            notification.flags |= 16;
            if (notificationForCustomLayout != null) {
                notification.contentView = notificationForCustomLayout;
            }
        }
        if (MIUIUtils.isMIUI() && VERSION.SDK_INT >= 19) {
            if (!TextUtils.isEmpty(metaInfo2.getId())) {
                notification.extras.putString("message_id", metaInfo2.getId());
            }
            String str3 = metaInfo2.getInternal() == null ? null : (String) metaInfo2.getInternal().get("score_info");
            if (!TextUtils.isEmpty(str3)) {
                notification.extras.putString("score_info", str3);
            }
            int i2 = -1;
            if (isNormalNotificationMessage(xmPushActionContainer)) {
                i2 = 1000;
            } else if (isBusinessMessage(xmPushActionContainer)) {
                i2 = 3000;
            }
            notification.extras.putString("eventMessageType", String.valueOf(i2));
            notification.extras.putString("target_package", getTargetPackage(xmPushActionContainer));
        }
        if (metaInfo2.getExtra() != null) {
            str = (String) metaInfo2.getExtra().get("message_count");
        }
        if (MIUIUtils.isMIUI() && str != null) {
            try {
                setMessageCount(notification, Integer.parseInt(str));
            } catch (NumberFormatException e5) {
                if (metaInfo2 != null) {
                    PushClientReportManager.getInstance(context.getApplicationContext()).reportEvent4ERROR(xmPushActionContainer.getPackageName(), getInterfaceId(xmPushActionContainer), metaInfo2.getId(), (Throwable) e5);
                }
                MyLog.e((Throwable) e5);
            }
        }
        if (!MIUIUtils.isXMS() && "com.xiaomi.xmsf".equals(context.getPackageName())) {
            setTargetPackage(notification, getTargetPackage(xmPushActionContainer));
        }
        final int hashCode = ((getTargetPackage(xmPushActionContainer).hashCode() / 10) * 10) + metaInfo2.getNotifyId();
        notificationManager.notify(hashCode, notification);
        if (MIUIUtils.isMIUI() && "com.xiaomi.xmsf".equals(context.getPackageName())) {
            checkNotificationAutoGroup(context2, notification, hashCode, getTargetPackage(xmPushActionContainer));
        }
        if (isBusinessMessage(xmPushActionContainer)) {
            PushClientReportManager.getInstance(context.getApplicationContext()).reportEvent(xmPushActionContainer.getPackageName(), getInterfaceId(xmPushActionContainer), metaInfo2.getId(), 3002, "try show business message");
        }
        if (isNormalNotificationMessage(xmPushActionContainer)) {
            PushClientReportManager.getInstance(context.getApplicationContext()).reportEvent(xmPushActionContainer.getPackageName(), getInterfaceId(xmPushActionContainer), metaInfo2.getId(), 1002, "try show notification message");
        }
        if (VERSION.SDK_INT < 26) {
            ScheduledJobManager instance2 = ScheduledJobManager.getInstance(context);
            instance2.cancelJob(hashCode);
            int timeout = getTimeout(metaInfo2.getExtra());
            if (timeout > 0) {
                instance2.addOneShootJob((Job) new Job() {
                    public int getJobId() {
                        return hashCode;
                    }

                    public void run() {
                        notificationManager.cancel(hashCode);
                    }
                }, timeout);
            }
        }
        Pair pair = new Pair(Integer.valueOf(hashCode), xmPushActionContainer2);
        synchronized (notifyContainerCache) {
            notifyContainerCache.add(pair);
            if (notifyContainerCache.size() > 100) {
                notifyContainerCache.remove();
            }
        }
        return notifyPushMessageInfo;
    }

    private static void setChannelDescription(Object obj, Map<String, String> map) {
        if (map != null && !TextUtils.isEmpty((CharSequence) map.get("channel_description"))) {
            JavaCalls.callMethod(obj, "setDescription", map.get("channel_description"));
        }
    }

    static void setLocalNotifyType(Context context, String str, int i) {
        context.getSharedPreferences("pref_notify_type", 0).edit().putInt(str, i).commit();
    }

    private static void setMessageCount(Notification notification, int i) {
        Object field = JavaCalls.getField(notification, "extraNotification");
        if (field != null) {
            JavaCalls.callMethod(field, "setMessageCount", Integer.valueOf(i));
        }
    }

    @TargetApi(16)
    private static Builder setNotificationStyle(Context context, Map<String, String> map, Builder builder, String str) {
        if ("2".equals(map.get("notification_style_type"))) {
            BigPictureStyle bigPictureStyle = new BigPictureStyle(builder);
            Bitmap onlinePictureResource = map == null ? null : getOnlinePictureResource(context, (String) map.get("notification_bigPic_uri"), false);
            if (onlinePictureResource == null) {
                return builder;
            }
            bigPictureStyle.bigPicture(onlinePictureResource);
            bigPictureStyle.setSummaryText(str);
            bigPictureStyle.bigLargeIcon(null);
            builder.setStyle(bigPictureStyle);
        } else if ("1".equals(map.get("notification_style_type"))) {
            builder.setStyle(new BigTextStyle().bigText(str));
            return builder;
        }
        return builder;
    }

    @TargetApi(16)
    private static Builder setNotificationStyleAction(Builder builder, Context context, String str, Map<String, String> map) {
        PendingIntent stylePendingIntent = getStylePendingIntent(context, str, 1, map);
        if (stylePendingIntent != null && !TextUtils.isEmpty((CharSequence) map.get("notification_style_button_left_name"))) {
            builder.addAction(0, (CharSequence) map.get("notification_style_button_left_name"), stylePendingIntent);
        }
        PendingIntent stylePendingIntent2 = getStylePendingIntent(context, str, 2, map);
        if (stylePendingIntent2 != null && !TextUtils.isEmpty((CharSequence) map.get("notification_style_button_mid_name"))) {
            builder.addAction(0, (CharSequence) map.get("notification_style_button_mid_name"), stylePendingIntent2);
        }
        PendingIntent stylePendingIntent3 = getStylePendingIntent(context, str, 3, map);
        if (stylePendingIntent3 != null && !TextUtils.isEmpty((CharSequence) map.get("notification_style_button_right_name"))) {
            builder.addAction(0, (CharSequence) map.get("notification_style_button_right_name"), stylePendingIntent3);
        }
        return builder;
    }

    private static Notification setTargetPackage(Notification notification, String str) {
        try {
            Field declaredField = Notification.class.getDeclaredField("extraNotification");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(notification);
            Method declaredMethod = obj.getClass().getDeclaredMethod("setTargetPkg", new Class[]{CharSequence.class});
            declaredMethod.setAccessible(true);
            declaredMethod.invoke(obj, new Object[]{str});
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
        return notification;
    }

    private static Intent setXiaomiBrowserDefault(Context context, Intent intent) {
        try {
            if (context.getPackageManager().getPackageInfo("com.android.browser", 4) != null) {
                intent.setClassName("com.android.browser", "com.android.browser.BrowserActivity");
            }
            return intent;
        } catch (NameNotFoundException e) {
            MyLog.e((Throwable) e);
            return intent;
        }
    }

    @TargetApi(23)
    private static void showGroupSummary(Context context, String str, Notification notification, NotificationManager notificationManager) {
        try {
            if (VERSION.SDK_INT >= 23) {
                String group = notification.getGroup();
                Notification notification2 = null;
                if (VERSION.SDK_INT >= 26) {
                    if (JavaCalls.callMethod(notificationManager, "getNotificationChannel", "groupSummary") == null) {
                        JavaCalls.callMethod(notificationManager, "createNotificationChannel", Class.forName("android.app.NotificationChannel").getConstructor(new Class[]{String.class, CharSequence.class, Integer.TYPE}).newInstance(new Object[]{"groupSummary", "group_summary", Integer.valueOf(3)}));
                    }
                    if (!TextUtils.isEmpty(group)) {
                        Builder builder = new Builder(context);
                        builder.setContentTitle("GroupSummary").setContentText("GroupSummary").setLargeIcon(notification.getLargeIcon()).setSmallIcon(notification.getSmallIcon()).setAutoCancel(true).setGroup(group).setGroupSummary(true);
                        JavaCalls.callMethod(builder, "setChannelId", "groupSummary");
                        notification2 = builder.build();
                    }
                } else if (!TextUtils.isEmpty(group)) {
                    Builder builder2 = new Builder(context);
                    builder2.setContentTitle("GroupSummary").setContentText("GroupSummary").setLargeIcon(notification.getLargeIcon()).setSmallIcon(notification.getSmallIcon()).setPriority(0).setDefaults(-1).setAutoCancel(true).setGroup(group).setGroupSummary(true);
                    notification2 = builder2.build();
                }
                if (notification2 != null && !MIUIUtils.isXMS() && "com.xiaomi.xmsf".equals(context.getPackageName())) {
                    setTargetPackage(notification2, str);
                    if (notification2.extras != null) {
                        notification2.extras.putString("target_package", str);
                    }
                }
                int groupSummaryNotifyId = getGroupSummaryNotifyId(str, group);
                if (notification2 != null) {
                    notificationManager.notify(groupSummaryNotifyId, notification2);
                    StringBuilder sb = new StringBuilder();
                    sb.append("GROUPSUMMARY  : showGroupSummary targetPackageName = ");
                    sb.append(str);
                    sb.append(" id = ");
                    sb.append(groupSummaryNotifyId);
                    MyLog.i(sb.toString());
                }
            }
        } catch (Exception e) {
            MyLog.e((Throwable) e);
        }
    }

    public static void uploadClearMessageData(Context context, LinkedList<? extends Object> linkedList) {
        if (linkedList != null && linkedList.size() > 0) {
            TinyDataHelper.cacheTinyData(context, "category_clear_notification", "clear_notification", (long) linkedList.size(), "");
        }
    }
}
