package com.miui.gallery.push.messagehandler;

import android.annotation.TargetApi;
import android.app.Notification;
import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.view.View;
import com.miui.gallery.R;
import com.miui.gallery.assistant.manager.ImageFeatureManager;
import com.miui.gallery.card.Card;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.cloud.card.SyncCardFromServer;
import com.miui.gallery.cloud.card.SyncCardFromServer.OperationCardCallback;
import com.miui.gallery.push.GalleryPushMessage;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.NotificationHelper;
import com.nostra13.universalimageloader.core.ImageLoader;
import com.nostra13.universalimageloader.core.assist.FailReason;
import com.nostra13.universalimageloader.core.listener.ImageLoadingListener;
import com.xiaomi.micloudsdk.request.utils.CloudUtils;
import org.jcodec.containers.mp4.boxes.Box;
import org.json.JSONObject;

public class StoryNotificationMessageHandler extends MessageHandler {
    private static long mLastTime;

    private int getPushNotificationId(int i) {
        return NotificationHelper.getPushNotificationId(i);
    }

    /* access modifiers changed from: private */
    @TargetApi(23)
    public void publishStoryNotification(Context context, int i, Card card) {
        if (context == null || card == null) {
            Log.d("StoryNotificationMessageHandler", "No valid context or card!");
            return;
        }
        final String title = card.getTitle();
        final String description = card.getDescription();
        if (card.getOperationInfo() == null || card.getOperationInfo().getIconUrl() == null) {
            publishStoryNotificationInternal(context, i, title, description, null);
        } else {
            String iconUrl = card.getOperationInfo().getIconUrl();
            ImageLoader instance = ImageLoader.getInstance();
            final Context context2 = context;
            final int i2 = i;
            AnonymousClass2 r0 = new ImageLoadingListener() {
                public void onLoadingCancelled(String str, View view) {
                    StoryNotificationMessageHandler.this.publishStoryNotificationInternal(context2, i2, title, description, null);
                }

                public void onLoadingComplete(String str, View view, Bitmap bitmap) {
                    StoryNotificationMessageHandler.this.publishStoryNotificationInternal(context2, i2, title, description, bitmap);
                }

                public void onLoadingFailed(String str, View view, FailReason failReason) {
                    StoryNotificationMessageHandler.this.publishStoryNotificationInternal(context2, i2, title, description, null);
                }

                public void onLoadingStarted(String str, View view) {
                }
            };
            instance.loadImage(iconUrl, r0);
        }
    }

    /* access modifiers changed from: private */
    public void publishStoryNotificationInternal(Context context, int i, String str, String str2, Bitmap bitmap) {
        NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
        if (notificationManager == null) {
            Log.d("StoryNotificationMessageHandler", "notification manager is null");
            return;
        }
        Intent intent = new Intent("com.miui.gallery.action.VIEW_ALBUM");
        intent.putExtra("extra_start_page", 2);
        PendingIntent activity = PendingIntent.getActivity(context, 0, intent, Box.MAX_BOX_SIZE);
        Builder builder = new Builder(context);
        builder.setTicker(str);
        builder.setContentTitle(str);
        builder.setContentText(str2);
        if (bitmap != null) {
            builder.setLargeIcon(bitmap);
        }
        builder.setSmallIcon(R.mipmap.ic_launcher_gallery);
        NotificationHelper.setLowChannel(context, builder);
        builder.setContentIntent(activity);
        Notification build = builder.build();
        build.flags = 16;
        notificationManager.notify(i, build);
        Log.d("StoryNotificationMessageHandler", "publis notification %d success", (Object) Integer.valueOf(i));
    }

    public void handleDirect(final Context context, GalleryPushMessage galleryPushMessage) {
        if (context == null || !ImageFeatureManager.isStoryGenerateEnable()) {
            Log.d("StoryNotificationMessageHandler", "context is null");
            return;
        }
        String data = galleryPushMessage.getData();
        if (data == null) {
            Log.e("StoryNotificationMessageHandler", "message data is null");
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(galleryPushMessage.getData());
            final int pushNotificationId = getPushNotificationId(jSONObject.optInt("id", 0));
            if (jSONObject.optBoolean("isCancel", false)) {
                NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
                if (notificationManager != null) {
                    notificationManager.cancel(pushNotificationId);
                    Log.d("StoryNotificationMessageHandler", "is cancel message");
                }
                return;
            }
            long currentTimeMillis = System.currentTimeMillis();
            long j = currentTimeMillis - mLastTime;
            mLastTime = currentTimeMillis;
            if (j < 600000) {
                Log.e("StoryNotificationMessageHandler", "too frequently to push notification, time duration is %d", (Object) Long.valueOf(j));
                return;
            }
            int optInt = jSONObject.optInt("version", 0);
            if (optInt > 0) {
                Log.d("StoryNotificationMessageHandler", "message version is not fit, server version is %d, local version is %d", Integer.valueOf(optInt), Integer.valueOf(0));
                return;
            }
            long optLong = jSONObject.optLong("story_id", 0);
            StringBuilder sb = new StringBuilder();
            sb.append("story_");
            sb.append(optLong);
            GallerySamplingStatHelper.recordStringPropertyEvent("assistant", "assistant_operation_card_push_recieved", sb.toString());
            Card cardByServerId = CardManager.getInstance().getCardByServerId(String.valueOf(optLong), true);
            if (cardByServerId == null) {
                new SyncCardFromServer(CloudUtils.getXiaomiAccount()).getOperationCards(String.valueOf(optLong), new OperationCardCallback() {
                    public void onOperationCardGet(Card card) {
                        if (card != null && !card.isOutofDate()) {
                            StoryNotificationMessageHandler.this.publishStoryNotification(context, pushNotificationId, card);
                        }
                    }
                });
            } else if (!cardByServerId.isOutofDate()) {
                publishStoryNotification(context, pushNotificationId, cardByServerId);
            }
        } catch (Exception e) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("fail to parse notification data from");
            sb2.append(data);
            Log.e("StoryNotificationMessageHandler", sb2.toString(), (Object) e);
        }
    }

    public void handlePull(Context context, GalleryPushMessage galleryPushMessage) {
    }
}
