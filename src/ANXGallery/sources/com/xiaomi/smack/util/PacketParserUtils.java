package com.xiaomi.smack.util;

import android.text.TextUtils;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.CommonPacketExtensionProvider;
import com.xiaomi.push.service.PushClientsManager;
import com.xiaomi.push.service.PushClientsManager.ClientLoginInfo;
import com.xiaomi.push.service.RC4Cryption;
import com.xiaomi.smack.Connection;
import com.xiaomi.smack.XMPPException;
import com.xiaomi.smack.packet.CommonPacketExtension;
import com.xiaomi.smack.packet.IQ;
import com.xiaomi.smack.packet.IQ.Type;
import com.xiaomi.smack.packet.Message;
import com.xiaomi.smack.packet.Packet;
import com.xiaomi.smack.packet.Presence;
import com.xiaomi.smack.packet.Presence.Mode;
import com.xiaomi.smack.packet.StreamError;
import com.xiaomi.smack.packet.XMPPError;
import com.xiaomi.smack.packet.XMPPError.Condition;
import com.xiaomi.smack.provider.ProviderManager;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashMap;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class PacketParserUtils {
    private static XmlPullParser sDecryptedMsgParser;

    private static String getLanguageAttribute(XmlPullParser xmlPullParser) {
        for (int i = 0; i < xmlPullParser.getAttributeCount(); i++) {
            String attributeName = xmlPullParser.getAttributeName(i);
            if ("xml:lang".equals(attributeName) || ("lang".equals(attributeName) && "xml".equals(xmlPullParser.getAttributePrefix(i)))) {
                return xmlPullParser.getAttributeValue(i);
            }
        }
        return null;
    }

    private static String parseContent(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        String str = "";
        int depth = xmlPullParser.getDepth();
        while (true) {
            if (xmlPullParser.next() == 3 && xmlPullParser.getDepth() == depth) {
                return str;
            }
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(xmlPullParser.getText());
            str = sb.toString();
        }
    }

    public static XMPPError parseError(XmlPullParser xmlPullParser) throws Exception {
        String str = MovieStatUtils.DOWNLOAD_FAILED;
        ArrayList arrayList = new ArrayList();
        boolean z = false;
        String str2 = str;
        String str3 = null;
        String str4 = null;
        for (int i = 0; i < xmlPullParser.getAttributeCount(); i++) {
            if (xmlPullParser.getAttributeName(i).equals("code")) {
                str2 = xmlPullParser.getAttributeValue("", "code");
            }
            if (xmlPullParser.getAttributeName(i).equals(nexExportFormat.TAG_FORMAT_TYPE)) {
                str3 = xmlPullParser.getAttributeValue("", nexExportFormat.TAG_FORMAT_TYPE);
            }
            if (xmlPullParser.getAttributeName(i).equals("reason")) {
                str4 = xmlPullParser.getAttributeValue("", "reason");
            }
        }
        String str5 = null;
        String str6 = null;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("text")) {
                    str6 = xmlPullParser.nextText();
                } else {
                    String name = xmlPullParser.getName();
                    String namespace = xmlPullParser.getNamespace();
                    if ("urn:ietf:params:xml:ns:xmpp-stanzas".equals(namespace)) {
                        str5 = name;
                    } else {
                        arrayList.add(parsePacketExtension(name, namespace, xmlPullParser));
                    }
                }
            } else if (next == 3) {
                if (xmlPullParser.getName().equals("error")) {
                    z = true;
                }
            } else if (next == 4) {
                str6 = xmlPullParser.getText();
            }
        }
        XMPPError xMPPError = new XMPPError(Integer.parseInt(str2), str3 == null ? "cancel" : str3, str4, str5, str6, arrayList);
        return xMPPError;
    }

    public static IQ parseIQ(XmlPullParser xmlPullParser, Connection connection) throws Exception {
        String attributeValue = xmlPullParser.getAttributeValue("", "id");
        String attributeValue2 = xmlPullParser.getAttributeValue("", "to");
        String attributeValue3 = xmlPullParser.getAttributeValue("", "from");
        String attributeValue4 = xmlPullParser.getAttributeValue("", "chid");
        Type fromString = Type.fromString(xmlPullParser.getAttributeValue("", nexExportFormat.TAG_FORMAT_TYPE));
        HashMap hashMap = new HashMap();
        boolean z = false;
        for (int i = 0; i < xmlPullParser.getAttributeCount(); i++) {
            String attributeName = xmlPullParser.getAttributeName(i);
            hashMap.put(attributeName, xmlPullParser.getAttributeValue("", attributeName));
        }
        IQ iq = null;
        XMPPError xMPPError = null;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                String name = xmlPullParser.getName();
                String namespace = xmlPullParser.getNamespace();
                if (name.equals("error")) {
                    xMPPError = parseError(xmlPullParser);
                } else {
                    iq = new IQ();
                    iq.addExtension(parsePacketExtension(name, namespace, xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals("iq")) {
                z = true;
            }
        }
        if (iq == null) {
            if (Type.GET == fromString || Type.SET == fromString) {
                AnonymousClass1 r13 = new IQ() {
                    public String getChildElementXML() {
                        return null;
                    }
                };
                r13.setPacketID(attributeValue);
                r13.setTo(attributeValue3);
                r13.setFrom(attributeValue2);
                r13.setType(Type.ERROR);
                r13.setChannelId(attributeValue4);
                r13.setError(new XMPPError(Condition.feature_not_implemented));
                connection.sendPacket(r13);
                MyLog.e("iq usage error. send packet in packet parser.");
                return null;
            }
            iq = new IQ() {
                public String getChildElementXML() {
                    return null;
                }
            };
        }
        iq.setPacketID(attributeValue);
        iq.setTo(attributeValue2);
        iq.setChannelId(attributeValue4);
        iq.setFrom(attributeValue3);
        iq.setType(fromString);
        iq.setError(xMPPError);
        iq.setAttributes(hashMap);
        return iq;
    }

    public static Packet parseMessage(XmlPullParser xmlPullParser) throws Exception {
        String str;
        boolean z = false;
        String str2 = null;
        if ("1".equals(xmlPullParser.getAttributeValue("", "s"))) {
            String attributeValue = xmlPullParser.getAttributeValue("", "chid");
            String attributeValue2 = xmlPullParser.getAttributeValue("", "id");
            String attributeValue3 = xmlPullParser.getAttributeValue("", "from");
            String attributeValue4 = xmlPullParser.getAttributeValue("", "to");
            String attributeValue5 = xmlPullParser.getAttributeValue("", nexExportFormat.TAG_FORMAT_TYPE);
            ClientLoginInfo clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(attributeValue, attributeValue4);
            if (clientLoginInfoByChidAndUserId == null) {
                clientLoginInfoByChidAndUserId = PushClientsManager.getInstance().getClientLoginInfoByChidAndUserId(attributeValue, attributeValue3);
            }
            if (clientLoginInfoByChidAndUserId != null) {
                Packet packet = null;
                while (!z) {
                    int next = xmlPullParser.next();
                    if (next == 2) {
                        if (!"s".equals(xmlPullParser.getName())) {
                            throw new XMPPException("error while receiving a encrypted message with wrong format");
                        } else if (xmlPullParser.next() == 4) {
                            String text = xmlPullParser.getText();
                            if ("5".equals(attributeValue) || "6".equals(attributeValue)) {
                                Message message = new Message();
                                message.setChannelId(attributeValue);
                                message.setEncrypted(true);
                                message.setFrom(attributeValue3);
                                message.setTo(attributeValue4);
                                message.setPacketID(attributeValue2);
                                message.setType(attributeValue5);
                                String[] strArr = null;
                                CommonPacketExtension commonPacketExtension = new CommonPacketExtension("s", null, strArr, strArr);
                                commonPacketExtension.setText(text);
                                message.addExtension(commonPacketExtension);
                                return message;
                            }
                            resetDecryptedMsgParser(RC4Cryption.decrypt(RC4Cryption.generateKeyForRC4(clientLoginInfoByChidAndUserId.security, attributeValue2), text));
                            sDecryptedMsgParser.next();
                            packet = parseMessage(sDecryptedMsgParser);
                        } else {
                            throw new XMPPException("error while receiving a encrypted message with wrong format");
                        }
                    } else if (next == 3 && xmlPullParser.getName().equals("message")) {
                        z = true;
                    }
                }
                if (packet != null) {
                    return packet;
                }
                throw new XMPPException("error while receiving a encrypted message with wrong format");
            }
            throw new XMPPException("the channel id is wrong while receiving a encrypted message");
        }
        Message message2 = new Message();
        String attributeValue6 = xmlPullParser.getAttributeValue("", "id");
        if (attributeValue6 == null) {
            attributeValue6 = "ID_NOT_AVAILABLE";
        }
        message2.setPacketID(attributeValue6);
        message2.setTo(xmlPullParser.getAttributeValue("", "to"));
        message2.setFrom(xmlPullParser.getAttributeValue("", "from"));
        message2.setChannelId(xmlPullParser.getAttributeValue("", "chid"));
        message2.setAppId(xmlPullParser.getAttributeValue("", "appid"));
        try {
            str = xmlPullParser.getAttributeValue("", "transient");
        } catch (Exception unused) {
            str = null;
        }
        try {
            String attributeValue7 = xmlPullParser.getAttributeValue("", "seq");
            if (!TextUtils.isEmpty(attributeValue7)) {
                message2.setSeq(attributeValue7);
            }
        } catch (Exception unused2) {
        }
        try {
            String attributeValue8 = xmlPullParser.getAttributeValue("", "mseq");
            if (!TextUtils.isEmpty(attributeValue8)) {
                message2.setMSeq(attributeValue8);
            }
        } catch (Exception unused3) {
        }
        try {
            String attributeValue9 = xmlPullParser.getAttributeValue("", "fseq");
            if (!TextUtils.isEmpty(attributeValue9)) {
                message2.setFSeq(attributeValue9);
            }
        } catch (Exception unused4) {
        }
        try {
            String attributeValue10 = xmlPullParser.getAttributeValue("", "status");
            if (!TextUtils.isEmpty(attributeValue10)) {
                message2.setStatus(attributeValue10);
            }
        } catch (Exception unused5) {
        }
        message2.setIsTransient(!TextUtils.isEmpty(str) && str.equalsIgnoreCase("true"));
        message2.setType(xmlPullParser.getAttributeValue("", nexExportFormat.TAG_FORMAT_TYPE));
        String languageAttribute = getLanguageAttribute(xmlPullParser);
        if (languageAttribute == null || "".equals(languageAttribute.trim())) {
            Packet.getDefaultLanguage();
        } else {
            message2.setLanguage(languageAttribute);
        }
        while (!z) {
            int next2 = xmlPullParser.next();
            if (next2 == 2) {
                String name = xmlPullParser.getName();
                String namespace = xmlPullParser.getNamespace();
                if (TextUtils.isEmpty(namespace)) {
                    namespace = "xm";
                }
                if (name.equals("subject")) {
                    String languageAttribute2 = getLanguageAttribute(xmlPullParser);
                    message2.setSubject(parseContent(xmlPullParser));
                } else if (name.equals("body")) {
                    String attributeValue11 = xmlPullParser.getAttributeValue("", "encode");
                    String parseContent = parseContent(xmlPullParser);
                    if (!TextUtils.isEmpty(attributeValue11)) {
                        message2.setBody(parseContent, attributeValue11);
                    } else {
                        message2.setBody(parseContent);
                    }
                } else if (name.equals("thread")) {
                    if (str2 == null) {
                        str2 = xmlPullParser.nextText();
                    }
                } else if (name.equals("error")) {
                    message2.setError(parseError(xmlPullParser));
                } else {
                    message2.addExtension(parsePacketExtension(name, namespace, xmlPullParser));
                }
            } else if (next2 == 3 && xmlPullParser.getName().equals("message")) {
                z = true;
            }
        }
        message2.setThread(str2);
        return message2;
    }

    public static CommonPacketExtension parsePacketExtension(String str, String str2, XmlPullParser xmlPullParser) throws Exception {
        Object extensionProvider = ProviderManager.getInstance().getExtensionProvider("all", "xm:chat");
        if (extensionProvider == null || !(extensionProvider instanceof CommonPacketExtensionProvider)) {
            return null;
        }
        return ((CommonPacketExtensionProvider) extensionProvider).parseExtension(xmlPullParser);
    }

    public static Presence parsePresence(XmlPullParser xmlPullParser) throws Exception {
        Presence.Type type = Presence.Type.available;
        String attributeValue = xmlPullParser.getAttributeValue("", nexExportFormat.TAG_FORMAT_TYPE);
        if (attributeValue != null && !attributeValue.equals("")) {
            try {
                type = Presence.Type.valueOf(attributeValue);
            } catch (IllegalArgumentException unused) {
                PrintStream printStream = System.err;
                StringBuilder sb = new StringBuilder();
                sb.append("Found invalid presence type ");
                sb.append(attributeValue);
                printStream.println(sb.toString());
            }
        }
        Presence presence = new Presence(type);
        presence.setTo(xmlPullParser.getAttributeValue("", "to"));
        presence.setFrom(xmlPullParser.getAttributeValue("", "from"));
        presence.setChannelId(xmlPullParser.getAttributeValue("", "chid"));
        String attributeValue2 = xmlPullParser.getAttributeValue("", "id");
        if (attributeValue2 == null) {
            attributeValue2 = "ID_NOT_AVAILABLE";
        }
        presence.setPacketID(attributeValue2);
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                String name = xmlPullParser.getName();
                String namespace = xmlPullParser.getNamespace();
                if (name.equals("status")) {
                    presence.setStatus(xmlPullParser.nextText());
                } else if (name.equals("priority")) {
                    try {
                        presence.setPriority(Integer.parseInt(xmlPullParser.nextText()));
                    } catch (NumberFormatException unused2) {
                    } catch (IllegalArgumentException unused3) {
                        presence.setPriority(0);
                    }
                } else if (name.equals("show")) {
                    String nextText = xmlPullParser.nextText();
                    try {
                        presence.setMode(Mode.valueOf(nextText));
                    } catch (IllegalArgumentException unused4) {
                        PrintStream printStream2 = System.err;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Found invalid presence mode ");
                        sb2.append(nextText);
                        printStream2.println(sb2.toString());
                    }
                } else if (name.equals("error")) {
                    presence.setError(parseError(xmlPullParser));
                } else {
                    presence.addExtension(parsePacketExtension(name, namespace, xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals("presence")) {
                z = true;
            }
        }
        return presence;
    }

    public static StreamError parseStreamError(XmlPullParser xmlPullParser) throws IOException, XmlPullParserException {
        StreamError streamError = null;
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                streamError = new StreamError(xmlPullParser.getName());
            } else if (next == 3 && xmlPullParser.getName().equals("error")) {
                z = true;
            }
        }
        return streamError;
    }

    private static void resetDecryptedMsgParser(byte[] bArr) throws XmlPullParserException {
        if (sDecryptedMsgParser == null) {
            try {
                sDecryptedMsgParser = XmlPullParserFactory.newInstance().newPullParser();
                sDecryptedMsgParser.setFeature("http://xmlpull.org/v1/doc/features.html#process-namespaces", true);
            } catch (XmlPullParserException e) {
                e.printStackTrace();
            }
        }
        sDecryptedMsgParser.setInput(new InputStreamReader(new ByteArrayInputStream(bArr)));
    }
}
