package com.nexstreaming.app.common.util;

import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.StringReader;
import java.io.StringWriter;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;
import org.xmlpull.v1.XmlSerializer;

/* compiled from: NexEDLConverter */
public class h {
    public static String a(String str, String str2) {
        boolean z;
        try {
            XmlPullParserFactory newInstance = XmlPullParserFactory.newInstance();
            newInstance.setNamespaceAware(true);
            XmlPullParser newPullParser = newInstance.newPullParser();
            newPullParser.setInput(new StringReader(str));
            XmlSerializer newSerializer = newInstance.newSerializer();
            StringWriter stringWriter = new StringWriter();
            newSerializer.setOutput(stringWriter);
            int eventType = newPullParser.getEventType();
            boolean z2 = eventType == 1;
            String str3 = "video1";
            String str4 = "video2";
            boolean z3 = false;
            while (!z2) {
                if (eventType != 0) {
                    if (eventType == 1) {
                        newSerializer.endDocument();
                        z2 = true;
                    } else if (eventType == 2) {
                        if (newPullParser.getName().compareToIgnoreCase("texture") == 0) {
                            for (int i = 0; i < newPullParser.getAttributeCount(); i++) {
                                if (newPullParser.getAttributeName(i).compareToIgnoreCase("video") == 0) {
                                    if (newPullParser.getAttributeValue(i).compareToIgnoreCase("2") == 0) {
                                        StringBuilder sb = new StringBuilder();
                                        sb.append("@");
                                        sb.append(newPullParser.getAttributeValue(null, "id"));
                                        str4 = sb.toString();
                                        z3 = true;
                                    } else if (newPullParser.getAttributeValue(i).compareToIgnoreCase("1") == 0) {
                                        StringBuilder sb2 = new StringBuilder();
                                        sb2.append("@");
                                        sb2.append(newPullParser.getAttributeValue(null, "id"));
                                        str3 = sb2.toString();
                                    }
                                }
                            }
                        }
                        if (!z3) {
                            newSerializer.startTag(newPullParser.getNamespace(), newPullParser.getName());
                            for (int i2 = 0; i2 < newPullParser.getAttributeCount(); i2++) {
                                if (newPullParser.getAttributeName(i2).compareToIgnoreCase("texture") == 0 && newPullParser.getAttributeValue(i2).compareToIgnoreCase(str4) == 0) {
                                    newSerializer.attribute(newPullParser.getAttributeNamespace(i2), newPullParser.getAttributeName(i2), str3);
                                    z = true;
                                } else {
                                    z = false;
                                }
                                if (newPullParser.getAttributeName(i2).compareToIgnoreCase(nexExportFormat.TAG_FORMAT_TYPE) == 0 && newPullParser.getName().compareToIgnoreCase("effect") == 0) {
                                    newSerializer.attribute(newPullParser.getAttributeNamespace(i2), newPullParser.getAttributeName(i2), "title");
                                    z = true;
                                }
                                if (newPullParser.getAttributeName(i2).compareToIgnoreCase("id") == 0 && newPullParser.getName().compareToIgnoreCase("effect") == 0 && str2 != null && str2.length() > 0) {
                                    newSerializer.attribute(newPullParser.getAttributeNamespace(i2), newPullParser.getAttributeName(i2), str2);
                                    z = true;
                                }
                                if (!z) {
                                    newSerializer.attribute(newPullParser.getAttributeNamespace(i2), newPullParser.getAttributeName(i2), newPullParser.getAttributeValue(i2));
                                }
                            }
                        }
                    } else if (eventType == 3) {
                        if (z3 && newPullParser.getName().compareToIgnoreCase("texture") == 0) {
                            z3 = false;
                        } else {
                            newSerializer.endTag(newPullParser.getNamespace(), newPullParser.getName());
                        }
                    } else if (eventType == 4) {
                        newSerializer.text(newPullParser.getText());
                    }
                }
                eventType = newPullParser.next();
            }
            return stringWriter.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
