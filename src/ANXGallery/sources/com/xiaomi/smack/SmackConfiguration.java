package com.xiaomi.smack;

import java.io.InputStream;
import java.io.PrintStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Vector;
import org.keyczar.Keyczar;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

public final class SmackConfiguration {
    private static Vector<String> defaultMechs = new Vector<>();
    private static int keepAliveInterval = 330000;
    private static int packetReplyTimeout = 5000;
    private static int pingInterval = 600000;
    private static int serverShutdownTimeout = 330000;

    /* JADX WARNING: Can't wrap try/catch for region: R(6:34|35|40|41|42|43) */
    /* JADX WARNING: Missing exception handler attribute for start block: B:42:0x00ae */
    static {
        InputStream inputStream;
        Exception e;
        try {
            for (ClassLoader resources : getClassLoaders()) {
                Enumeration resources2 = resources.getResources("META-INF/smack-config.xml");
                while (resources2.hasMoreElements()) {
                    try {
                        inputStream = ((URL) resources2.nextElement()).openStream();
                        try {
                            XmlPullParser newPullParser = XmlPullParserFactory.newInstance().newPullParser();
                            newPullParser.setFeature("http://xmlpull.org/v1/doc/features.html#process-namespaces", true);
                            newPullParser.setInput(inputStream, Keyczar.DEFAULT_ENCODING);
                            int eventType = newPullParser.getEventType();
                            do {
                                if (eventType == 2) {
                                    if (newPullParser.getName().equals("className")) {
                                        parseClassToLoad(newPullParser);
                                    } else if (newPullParser.getName().equals("packetReplyTimeout")) {
                                        packetReplyTimeout = parseIntProperty(newPullParser, packetReplyTimeout);
                                    } else if (newPullParser.getName().equals("keepAliveInterval")) {
                                        keepAliveInterval = parseIntProperty(newPullParser, keepAliveInterval);
                                    } else if (newPullParser.getName().equals("mechName")) {
                                        defaultMechs.add(newPullParser.nextText());
                                    }
                                }
                                eventType = newPullParser.next();
                            } while (eventType != 1);
                        } catch (Exception e2) {
                            e = e2;
                            try {
                                e.printStackTrace();
                                inputStream.close();
                            } catch (Throwable th) {
                                th = th;
                            }
                        }
                    } catch (Exception e3) {
                        e = e3;
                        inputStream = null;
                        e.printStackTrace();
                        inputStream.close();
                    } catch (Throwable th2) {
                        th = th2;
                        inputStream = null;
                        inputStream.close();
                        throw th;
                    }
                    try {
                        inputStream.close();
                    } catch (Exception unused) {
                    }
                }
            }
        } catch (Exception e4) {
            e4.printStackTrace();
        }
    }

    private SmackConfiguration() {
    }

    public static int getCheckAliveInterval() {
        return keepAliveInterval;
    }

    private static ClassLoader[] getClassLoaders() {
        ClassLoader[] classLoaderArr = {SmackConfiguration.class.getClassLoader(), Thread.currentThread().getContextClassLoader()};
        ArrayList arrayList = new ArrayList();
        for (ClassLoader classLoader : classLoaderArr) {
            if (classLoader != null) {
                arrayList.add(classLoader);
            }
        }
        return (ClassLoader[]) arrayList.toArray(new ClassLoader[arrayList.size()]);
    }

    public static int getPingInteval() {
        return pingInterval;
    }

    public static String getVersion() {
        return "3.1.0";
    }

    private static void parseClassToLoad(XmlPullParser xmlPullParser) throws Exception {
        String nextText = xmlPullParser.nextText();
        try {
            Class.forName(nextText);
        } catch (ClassNotFoundException unused) {
            PrintStream printStream = System.err;
            StringBuilder sb = new StringBuilder();
            sb.append("Error! A startup class specified in smack-config.xml could not be loaded: ");
            sb.append(nextText);
            printStream.println(sb.toString());
        }
    }

    private static int parseIntProperty(XmlPullParser xmlPullParser, int i) throws Exception {
        try {
            return Integer.parseInt(xmlPullParser.nextText());
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return i;
        }
    }
}
