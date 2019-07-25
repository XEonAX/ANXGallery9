package com.xiaomi.smack.packet;

import android.os.Bundle;
import android.os.Parcelable;
import android.text.TextUtils;
import com.xiaomi.smack.util.StringUtils;
import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.CopyOnWriteArrayList;

public abstract class Packet {
    protected static final String DEFAULT_LANGUAGE = Locale.getDefault().getLanguage().toLowerCase();
    private static String DEFAULT_XML_NS = null;
    public static final DateFormat XEP_0082_UTC_FORMAT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    private static long id = 0;
    private static String prefix;
    private String chId = null;
    private XMPPError error = null;
    private String from = null;
    private String packageName = null;
    private List<CommonPacketExtension> packetExtensions = new CopyOnWriteArrayList();
    private String packetID = null;
    private final Map<String, Object> properties = new HashMap();
    private String to = null;
    private String xmlns = DEFAULT_XML_NS;

    static {
        XEP_0082_UTC_FORMAT.setTimeZone(TimeZone.getTimeZone("UTC"));
        StringBuilder sb = new StringBuilder();
        sb.append(StringUtils.randomString(5));
        sb.append("-");
        prefix = sb.toString();
    }

    public Packet() {
    }

    public Packet(Bundle bundle) {
        this.to = bundle.getString("ext_to");
        this.from = bundle.getString("ext_from");
        this.chId = bundle.getString("ext_chid");
        this.packetID = bundle.getString("ext_pkt_id");
        Parcelable[] parcelableArray = bundle.getParcelableArray("ext_exts");
        if (parcelableArray != null) {
            this.packetExtensions = new ArrayList(parcelableArray.length);
            for (Parcelable parcelable : parcelableArray) {
                CommonPacketExtension parseFromBundle = CommonPacketExtension.parseFromBundle((Bundle) parcelable);
                if (parseFromBundle != null) {
                    this.packetExtensions.add(parseFromBundle);
                }
            }
        }
        Bundle bundle2 = bundle.getBundle("ext_ERROR");
        if (bundle2 != null) {
            this.error = new XMPPError(bundle2);
        }
    }

    public static String getDefaultLanguage() {
        return DEFAULT_LANGUAGE;
    }

    public static synchronized String nextID() {
        String sb;
        synchronized (Packet.class) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(prefix);
            long j = id;
            id = 1 + j;
            sb2.append(Long.toString(j));
            sb = sb2.toString();
        }
        return sb;
    }

    public void addExtension(CommonPacketExtension commonPacketExtension) {
        this.packetExtensions.add(commonPacketExtension);
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Packet packet = (Packet) obj;
        if (this.error == null ? packet.error != null : !this.error.equals(packet.error)) {
            return false;
        }
        if (this.from == null ? packet.from != null : !this.from.equals(packet.from)) {
            return false;
        }
        if (!this.packetExtensions.equals(packet.packetExtensions)) {
            return false;
        }
        if (this.packetID == null ? packet.packetID != null : !this.packetID.equals(packet.packetID)) {
            return false;
        }
        if (this.chId == null ? packet.chId != null : !this.chId.equals(packet.chId)) {
            return false;
        }
        if (this.properties == null ? packet.properties != null : !this.properties.equals(packet.properties)) {
            return false;
        }
        if (this.to == null ? packet.to != null : !this.to.equals(packet.to)) {
            return false;
        }
        if (this.xmlns == null ? packet.xmlns != null : !this.xmlns.equals(packet.xmlns)) {
            z = false;
        }
        return z;
    }

    public String getChannelId() {
        return this.chId;
    }

    public XMPPError getError() {
        return this.error;
    }

    public CommonPacketExtension getExtension(String str) {
        return getExtension(str, null);
    }

    public CommonPacketExtension getExtension(String str, String str2) {
        for (CommonPacketExtension commonPacketExtension : this.packetExtensions) {
            if ((str2 == null || str2.equals(commonPacketExtension.getNamespace())) && str.equals(commonPacketExtension.getElementName())) {
                return commonPacketExtension;
            }
        }
        return null;
    }

    public synchronized Collection<CommonPacketExtension> getExtensions() {
        if (this.packetExtensions == null) {
            return Collections.emptyList();
        }
        return Collections.unmodifiableList(new ArrayList(this.packetExtensions));
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Can't wrap try/catch for region: R(5:63|(0)|(0)|71|72) */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x011e, code lost:
        if (r4 == null) goto L_0x0121;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Missing exception handler attribute for start block: B:40:0x0102 */
    /* JADX WARNING: Missing exception handler attribute for start block: B:71:0x0133 */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x011b A[SYNTHETIC, Splitter:B:55:0x011b] */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x012b A[SYNTHETIC, Splitter:B:65:0x012b] */
    /* JADX WARNING: Removed duplicated region for block: B:69:0x0130 A[SYNTHETIC, Splitter:B:69:0x0130] */
    public synchronized String getExtensionsXML() {
        StringBuilder sb;
        ObjectOutputStream objectOutputStream;
        ByteArrayOutputStream byteArrayOutputStream;
        Exception e;
        sb = new StringBuilder();
        for (PacketExtension xml : getExtensions()) {
            sb.append(xml.toXML());
        }
        if (this.properties != null && !this.properties.isEmpty()) {
            sb.append("<properties xmlns=\"http://www.jivesoftware.com/xmlns/xmpp/properties\">");
            for (String str : getPropertyNames()) {
                Object property = getProperty(str);
                sb.append("<property>");
                sb.append("<name>");
                sb.append(StringUtils.escapeForXML(str));
                sb.append("</name>");
                sb.append("<value type=\"");
                if (property instanceof Integer) {
                    sb.append("integer\">");
                    sb.append(property);
                    sb.append("</value>");
                } else if (property instanceof Long) {
                    sb.append("long\">");
                    sb.append(property);
                    sb.append("</value>");
                } else if (property instanceof Float) {
                    sb.append("float\">");
                    sb.append(property);
                    sb.append("</value>");
                } else if (property instanceof Double) {
                    sb.append("double\">");
                    sb.append(property);
                    sb.append("</value>");
                } else if (property instanceof Boolean) {
                    sb.append("boolean\">");
                    sb.append(property);
                    sb.append("</value>");
                } else if (property instanceof String) {
                    sb.append("string\">");
                    sb.append(StringUtils.escapeForXML((String) property));
                    sb.append("</value>");
                } else {
                    try {
                        byteArrayOutputStream = new ByteArrayOutputStream();
                        try {
                            objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
                            try {
                                objectOutputStream.writeObject(property);
                                sb.append("java-object\">");
                                sb.append(StringUtils.encodeBase64(byteArrayOutputStream.toByteArray()));
                                sb.append("</value>");
                                objectOutputStream.close();
                            } catch (Exception e2) {
                                e = e2;
                                try {
                                    e.printStackTrace();
                                    if (objectOutputStream != null) {
                                    }
                                } catch (Throwable th) {
                                    th = th;
                                    if (objectOutputStream != null) {
                                    }
                                    if (byteArrayOutputStream != null) {
                                    }
                                    throw th;
                                }
                            }
                        } catch (Exception e3) {
                            e = e3;
                            objectOutputStream = null;
                            e = e;
                            e.printStackTrace();
                            if (objectOutputStream != null) {
                                try {
                                    objectOutputStream.close();
                                } catch (Exception unused) {
                                }
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            objectOutputStream = null;
                            if (objectOutputStream != null) {
                                try {
                                    objectOutputStream.close();
                                } catch (Exception unused2) {
                                }
                            }
                            if (byteArrayOutputStream != null) {
                                byteArrayOutputStream.close();
                            }
                            throw th;
                        }
                    } catch (Exception e4) {
                        e = e4;
                        byteArrayOutputStream = null;
                        objectOutputStream = null;
                        e = e;
                        e.printStackTrace();
                        if (objectOutputStream != null) {
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        byteArrayOutputStream = null;
                        objectOutputStream = null;
                        if (objectOutputStream != null) {
                        }
                        if (byteArrayOutputStream != null) {
                        }
                        throw th;
                    }
                    try {
                        byteArrayOutputStream.close();
                    } catch (Exception unused3) {
                    }
                }
                sb.append("</property>");
            }
            sb.append("</properties>");
        }
        return sb.toString();
    }

    public String getFrom() {
        return this.from;
    }

    public String getPackageName() {
        return this.packageName;
    }

    public String getPacketID() {
        if ("ID_NOT_AVAILABLE".equals(this.packetID)) {
            return null;
        }
        if (this.packetID == null) {
            this.packetID = nextID();
        }
        return this.packetID;
    }

    public synchronized Object getProperty(String str) {
        if (this.properties == null) {
            return null;
        }
        return this.properties.get(str);
    }

    public synchronized Collection<String> getPropertyNames() {
        if (this.properties == null) {
            return Collections.emptySet();
        }
        return Collections.unmodifiableSet(new HashSet(this.properties.keySet()));
    }

    public String getTo() {
        return this.to;
    }

    public String getXmlns() {
        return this.xmlns;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = (((((((((((((this.xmlns != null ? this.xmlns.hashCode() : 0) * 31) + (this.packetID != null ? this.packetID.hashCode() : 0)) * 31) + (this.to != null ? this.to.hashCode() : 0)) * 31) + (this.from != null ? this.from.hashCode() : 0)) * 31) + (this.chId != null ? this.chId.hashCode() : 0)) * 31) + this.packetExtensions.hashCode()) * 31) + this.properties.hashCode()) * 31;
        if (this.error != null) {
            i = this.error.hashCode();
        }
        return hashCode + i;
    }

    public void setChannelId(String str) {
        this.chId = str;
    }

    public void setError(XMPPError xMPPError) {
        this.error = xMPPError;
    }

    public void setFrom(String str) {
        this.from = str;
    }

    public void setPackageName(String str) {
        this.packageName = str;
    }

    public void setPacketID(String str) {
        this.packetID = str;
    }

    public void setTo(String str) {
        this.to = str;
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        if (!TextUtils.isEmpty(this.xmlns)) {
            bundle.putString("ext_ns", this.xmlns);
        }
        if (!TextUtils.isEmpty(this.from)) {
            bundle.putString("ext_from", this.from);
        }
        if (!TextUtils.isEmpty(this.to)) {
            bundle.putString("ext_to", this.to);
        }
        if (!TextUtils.isEmpty(this.packetID)) {
            bundle.putString("ext_pkt_id", this.packetID);
        }
        if (!TextUtils.isEmpty(this.chId)) {
            bundle.putString("ext_chid", this.chId);
        }
        if (this.error != null) {
            bundle.putBundle("ext_ERROR", this.error.toBundle());
        }
        if (this.packetExtensions != null) {
            Bundle[] bundleArr = new Bundle[this.packetExtensions.size()];
            int i = 0;
            for (CommonPacketExtension bundle2 : this.packetExtensions) {
                Bundle bundle3 = bundle2.toBundle();
                if (bundle3 != null) {
                    int i2 = i + 1;
                    bundleArr[i] = bundle3;
                    i = i2;
                }
            }
            bundle.putParcelableArray("ext_exts", bundleArr);
        }
        return bundle;
    }

    public abstract String toXML();
}
