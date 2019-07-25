package com.xiaomi.push.service;

import com.xiaomi.smack.packet.CommonPacketExtension;
import com.xiaomi.smack.provider.PacketExtensionProvider;
import com.xiaomi.smack.provider.ProviderManager;
import com.xiaomi.smack.util.StringUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

public class CommonPacketExtensionProvider implements PacketExtensionProvider {
    public static CommonPacketExtension parseExtensionFromStartTag(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        List list;
        String str;
        String[] strArr;
        String[] strArr2;
        if (xmlPullParser.getEventType() != 2) {
            return null;
        }
        String name = xmlPullParser.getName();
        String namespace = xmlPullParser.getNamespace();
        if (xmlPullParser.getAttributeCount() > 0) {
            String[] strArr3 = new String[xmlPullParser.getAttributeCount()];
            String[] strArr4 = new String[xmlPullParser.getAttributeCount()];
            for (int i = 0; i < xmlPullParser.getAttributeCount(); i++) {
                strArr3[i] = xmlPullParser.getAttributeName(i);
                strArr4[i] = StringUtils.unescapeFromXML(xmlPullParser.getAttributeValue(i));
            }
            strArr2 = strArr3;
            str = null;
            list = null;
            strArr = strArr4;
        } else {
            strArr2 = null;
            strArr = null;
            str = null;
            list = null;
        }
        while (true) {
            int next = xmlPullParser.next();
            if (next == 3) {
                CommonPacketExtension commonPacketExtension = new CommonPacketExtension(name, namespace, strArr2, strArr, str, list);
                return commonPacketExtension;
            } else if (next == 4) {
                str = xmlPullParser.getText().trim();
            } else if (next == 2) {
                if (list == null) {
                    list = new ArrayList();
                }
                CommonPacketExtension parseExtensionFromStartTag = parseExtensionFromStartTag(xmlPullParser);
                if (parseExtensionFromStartTag != null) {
                    list.add(parseExtensionFromStartTag);
                }
            }
        }
    }

    public CommonPacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        int eventType = xmlPullParser.getEventType();
        while (eventType != 1 && eventType != 2) {
            eventType = xmlPullParser.next();
        }
        if (eventType == 2) {
            return parseExtensionFromStartTag(xmlPullParser);
        }
        return null;
    }

    public void register() {
        ProviderManager.getInstance().addExtensionProvider("all", "xm:chat", this);
    }
}
