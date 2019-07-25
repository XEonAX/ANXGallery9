package com.miui.gallery.push;

import com.miui.gallery.push.messagehandler.CloudControlMessageHandler;
import com.miui.gallery.push.messagehandler.FeatureRedDotMessageHandler;
import com.miui.gallery.push.messagehandler.MessageHandler;
import com.miui.gallery.push.messagehandler.NotificationMessageHandler;
import com.miui.gallery.push.messagehandler.StoryNotificationMessageHandler;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MessageHandlerFactory {
    private static Map<String, Class<? extends MessageHandler>> sModuleHandlerMap = new HashMap();

    static {
        sModuleHandlerMap.put("cloud_control", CloudControlMessageHandler.class);
        sModuleHandlerMap.put("notification", NotificationMessageHandler.class);
        sModuleHandlerMap.put("feature_red_dot", FeatureRedDotMessageHandler.class);
        sModuleHandlerMap.put("story_notification", StoryNotificationMessageHandler.class);
    }

    public static MessageHandler create(String str) {
        Class cls = (Class) sModuleHandlerMap.get(str);
        if (cls != null) {
            try {
                return (MessageHandler) cls.newInstance();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e2) {
                e2.printStackTrace();
            }
        }
        return null;
    }

    public static List<MessageHandler> getAllMessageHandlers() {
        ArrayList arrayList = new ArrayList();
        for (Class newInstance : sModuleHandlerMap.values()) {
            try {
                arrayList.add(newInstance.newInstance());
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e2) {
                e2.printStackTrace();
            }
        }
        return arrayList;
    }
}
