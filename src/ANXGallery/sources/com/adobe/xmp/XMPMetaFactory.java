package com.adobe.xmp;

import com.adobe.xmp.impl.XMPMetaParser;
import com.adobe.xmp.impl.XMPSchemaRegistryImpl;
import com.adobe.xmp.options.ParseOptions;

public final class XMPMetaFactory {
    private static XMPSchemaRegistry schema = new XMPSchemaRegistryImpl();
    private static XMPVersionInfo versionInfo = null;

    public static XMPSchemaRegistry getSchemaRegistry() {
        return schema;
    }

    public static XMPMeta parseFromBuffer(byte[] bArr) throws XMPException {
        return parseFromBuffer(bArr, null);
    }

    public static XMPMeta parseFromBuffer(byte[] bArr, ParseOptions parseOptions) throws XMPException {
        return XMPMetaParser.parse(bArr, parseOptions);
    }
}
