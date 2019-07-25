package com.xiaomi.smack.provider;

import com.xiaomi.smack.packet.IQ;
import com.xiaomi.smack.packet.PacketExtension;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.keyczar.Keyczar;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserFactory;

public class ProviderManager {
    private static ProviderManager instance;
    private Map<String, Object> extensionProviders = new ConcurrentHashMap();
    private Map<String, Object> iqProviders = new ConcurrentHashMap();

    private ProviderManager() {
        initialize();
    }

    private ClassLoader[] getClassLoaders() {
        ClassLoader[] classLoaderArr = {ProviderManager.class.getClassLoader(), Thread.currentThread().getContextClassLoader()};
        ArrayList arrayList = new ArrayList();
        for (ClassLoader classLoader : classLoaderArr) {
            if (classLoader != null) {
                arrayList.add(classLoader);
            }
        }
        return (ClassLoader[]) arrayList.toArray(new ClassLoader[arrayList.size()]);
    }

    public static synchronized ProviderManager getInstance() {
        ProviderManager providerManager;
        synchronized (ProviderManager.class) {
            if (instance == null) {
                instance = new ProviderManager();
            }
            providerManager = instance;
        }
        return providerManager;
    }

    private String getProviderKey(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append("<");
        sb.append(str);
        sb.append("/>");
        if (str != null) {
            sb.append("<");
            sb.append(str2);
            sb.append("/>");
        }
        return sb.toString();
    }

    public void addExtensionProvider(String str, String str2, Object obj) {
        if ((obj instanceof PacketExtensionProvider) || (obj instanceof Class)) {
            this.extensionProviders.put(getProviderKey(str, str2), obj);
            return;
        }
        throw new IllegalArgumentException("Provider must be a PacketExtensionProvider or a Class instance.");
    }

    public Object getExtensionProvider(String str, String str2) {
        return this.extensionProviders.get(getProviderKey(str, str2));
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Exception block dominator not found, dom blocks: [] */
    /* JADX WARNING: Missing exception handler attribute for start block: B:52:0x010b */
    public void initialize() {
        InputStream inputStream;
        try {
            for (ClassLoader resources : getClassLoaders()) {
                Enumeration resources2 = resources.getResources("META-INF/smack.providers");
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
                                    if (newPullParser.getName().equals("iqProvider")) {
                                        newPullParser.next();
                                        newPullParser.next();
                                        String nextText = newPullParser.nextText();
                                        newPullParser.next();
                                        newPullParser.next();
                                        String nextText2 = newPullParser.nextText();
                                        newPullParser.next();
                                        newPullParser.next();
                                        String nextText3 = newPullParser.nextText();
                                        String providerKey = getProviderKey(nextText, nextText2);
                                        if (!this.iqProviders.containsKey(providerKey)) {
                                            Class cls = Class.forName(nextText3);
                                            if (IQProvider.class.isAssignableFrom(cls)) {
                                                this.iqProviders.put(providerKey, cls.newInstance());
                                            } else if (IQ.class.isAssignableFrom(cls)) {
                                                this.iqProviders.put(providerKey, cls);
                                            }
                                        }
                                    } else if (newPullParser.getName().equals("extensionProvider")) {
                                        newPullParser.next();
                                        newPullParser.next();
                                        String nextText4 = newPullParser.nextText();
                                        newPullParser.next();
                                        newPullParser.next();
                                        String nextText5 = newPullParser.nextText();
                                        newPullParser.next();
                                        newPullParser.next();
                                        String nextText6 = newPullParser.nextText();
                                        String providerKey2 = getProviderKey(nextText4, nextText5);
                                        if (!this.extensionProviders.containsKey(providerKey2)) {
                                            try {
                                                Class cls2 = Class.forName(nextText6);
                                                if (PacketExtensionProvider.class.isAssignableFrom(cls2)) {
                                                    this.extensionProviders.put(providerKey2, cls2.newInstance());
                                                } else if (PacketExtension.class.isAssignableFrom(cls2)) {
                                                    this.extensionProviders.put(providerKey2, cls2);
                                                }
                                            } catch (ClassNotFoundException e) {
                                                e.printStackTrace();
                                            }
                                        }
                                    }
                                }
                                eventType = newPullParser.next();
                            } while (eventType != 1);
                        } catch (ClassNotFoundException e2) {
                            e2.printStackTrace();
                        } catch (Throwable th) {
                            th = th;
                            inputStream.close();
                            throw th;
                        }
                        try {
                            inputStream.close();
                        } catch (Exception unused) {
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        inputStream = null;
                        inputStream.close();
                        throw th;
                    }
                }
            }
        } catch (Exception e3) {
            e3.printStackTrace();
        }
    }
}
