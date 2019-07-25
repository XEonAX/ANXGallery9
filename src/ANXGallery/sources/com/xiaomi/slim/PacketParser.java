package com.xiaomi.slim;

import com.xiaomi.smack.Connection;
import com.xiaomi.smack.XMPPException;
import com.xiaomi.smack.packet.Packet;
import com.xiaomi.smack.util.PacketParserUtils;
import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

public class PacketParser {
    private XmlPullParser mParser;

    PacketParser() {
        try {
            this.mParser = XmlPullParserFactory.newInstance().newPullParser();
            this.mParser.setFeature("http://xmlpull.org/v1/doc/features.html#process-namespaces", true);
        } catch (XmlPullParserException unused) {
        }
    }

    /* access modifiers changed from: 0000 */
    public Packet parse(byte[] bArr, Connection connection) throws Exception {
        this.mParser.setInput(new InputStreamReader(new ByteArrayInputStream(bArr)));
        this.mParser.next();
        int eventType = this.mParser.getEventType();
        String name = this.mParser.getName();
        if (eventType == 2) {
            if (name.equals("message")) {
                return PacketParserUtils.parseMessage(this.mParser);
            }
            if (name.equals("iq")) {
                return PacketParserUtils.parseIQ(this.mParser, connection);
            }
            if (name.equals("presence")) {
                return PacketParserUtils.parsePresence(this.mParser);
            }
            if (!this.mParser.getName().equals("stream")) {
                if (this.mParser.getName().equals("error")) {
                    throw new XMPPException(PacketParserUtils.parseStreamError(this.mParser));
                } else if (this.mParser.getName().equals("warning")) {
                    this.mParser.next();
                    boolean equals = this.mParser.getName().equals("multi-login");
                } else {
                    this.mParser.getName().equals("bind");
                }
            }
        }
        return null;
    }
}
