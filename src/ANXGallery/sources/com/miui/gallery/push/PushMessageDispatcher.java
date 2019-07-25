package com.miui.gallery.push;

import android.content.Context;
import android.text.TextUtils;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.push.PushConstants.MessageScope;
import com.miui.gallery.push.PushConstants.MessageType;
import com.miui.gallery.push.messagehandler.MessageHandler;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.Encode;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.xiaomi.mipush.sdk.MiPushMessage;
import java.util.HashMap;
import java.util.Locale;

public class PushMessageDispatcher {
    public static void dispatch(Context context, MiPushMessage miPushMessage) {
        String content = miPushMessage.getContent();
        if (TextUtils.isEmpty(content)) {
            Log.e("PushMessageDispatcher", "Message content is empty");
            GallerySamplingStatHelper.recordErrorEvent("mipush", "message_content_is_empty");
            return;
        }
        GalleryPushMessage fromJson = GalleryPushMessage.fromJson(content);
        if (fromJson == null) {
            Log.e("PushMessageDispatcher", "Parse message content failed: %s", (Object) content);
            GallerySamplingStatHelper.recordErrorEvent("mipush", "message_content_parse_failed");
            return;
        }
        MessageScope scope = MessageScope.getScope(fromJson.getMessageScope());
        if (scope == MessageScope.RELEASE || (scope == MessageScope.DEBUG && BuildUtil.IS_DEBUG_BUILD)) {
            MessageType type = MessageType.getType(fromJson.getType());
            if (type == null) {
                Log.e("PushMessageDispatcher", "Unknown message type: %s", (Object) fromJson.getType());
                HashMap hashMap = new HashMap();
                hashMap.put("msg_type", fromJson.getType());
                GallerySamplingStatHelper.recordErrorEvent("mipush", "unknown_message_type", hashMap);
                return;
            }
            String str = null;
            CharSequence userAccount = TextUtils.isEmpty(miPushMessage.getUserAccount()) ? null : miPushMessage.getUserAccount();
            if (AccountCache.getAccount() != null) {
                str = Encode.SHA1Encode(AccountCache.getAccount().name.getBytes());
            }
            if (userAccount == null || TextUtils.equals(userAccount, str)) {
                String businessModule = fromJson.getBusinessModule();
                MessageHandler create = MessageHandlerFactory.create(businessModule);
                if (create == null) {
                    Log.e("PushMessageDispatcher", "MessageHandler is undefined: %s", (Object) businessModule);
                    return;
                }
                switch (type) {
                    case SYNC:
                        create.handlePull(context, fromJson);
                        break;
                    case DIRECT:
                        create.handleDirect(context, fromJson);
                        break;
                }
                return;
            }
            Log.e("PushMessageDispatcher", "UserAccount doesn't match, skip handle");
            HashMap hashMap2 = new HashMap();
            hashMap2.put("pushAccount_localAccount", String.format(Locale.US, "%s_%s", new Object[]{userAccount, str}));
            GallerySamplingStatHelper.recordErrorEvent("mipush", "push_user_account_doesnt_match", hashMap2);
            return;
        }
        Log.e("PushMessageDispatcher", "Message scope does not match: %s", (Object) fromJson.getMessageScope());
        HashMap hashMap3 = new HashMap();
        hashMap3.put("msg_scope", fromJson.getMessageScope());
        GallerySamplingStatHelper.recordErrorEvent("mipush", "unknown_message_scope_doesnt_match", hashMap3);
    }
}
