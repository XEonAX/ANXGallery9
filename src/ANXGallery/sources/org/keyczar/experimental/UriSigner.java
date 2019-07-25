package org.keyczar.experimental;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.TreeSet;
import org.keyczar.Signer;
import org.keyczar.annotations.Experimental;
import org.keyczar.exceptions.KeyczarException;
import org.keyczar.interfaces.KeyczarReader;

@Experimental
public class UriSigner {
    private static final String DEFAULT_SIG_PARAM = "sig";
    private Signer signer;

    public UriSigner(String str) throws KeyczarException {
        this.signer = new Signer(str);
    }

    public UriSigner(KeyczarReader keyczarReader) throws KeyczarException {
        this.signer = new Signer(keyczarReader);
    }

    private String canonicalQuery(String str) {
        StringBuffer stringBuffer = new StringBuffer();
        TreeSet treeSet = new TreeSet();
        if (str != null) {
            for (String add : str.split("&")) {
                treeSet.add(add);
            }
            Iterator it = treeSet.iterator();
            while (it.hasNext()) {
                stringBuffer.append((String) it.next());
                stringBuffer.append('&');
            }
            stringBuffer.deleteCharAt(stringBuffer.length() - 1);
        }
        return stringBuffer.toString();
    }

    private URI canonicalUri(URI uri) throws URISyntaxException {
        if (uri == null) {
            return null;
        }
        URI uri2 = new URI(uri.getScheme(), uri.getAuthority(), uri.getPath(), canonicalQuery(uri.getQuery()), uri.getFragment());
        return uri2;
    }

    public URI sign(URI uri) throws KeyczarException {
        return sign(uri, DEFAULT_SIG_PARAM);
    }

    public URI sign(URI uri, String str) throws KeyczarException {
        try {
            URI canonicalUri = canonicalUri(uri);
            String sign = this.signer.sign(canonicalUri.toASCIIString());
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("=");
            sb.append(sign);
            String sb2 = sb.toString();
            String query = canonicalUri.getQuery();
            if (query != null) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append(query);
                sb3.append("&");
                sb3.append(sb2);
                sb2 = sb3.toString();
            }
            try {
                URI uri2 = new URI(canonicalUri.getScheme(), canonicalUri.getAuthority(), canonicalUri.getPath(), sb2, canonicalUri.getFragment());
                return uri2;
            } catch (URISyntaxException e) {
                throw new KeyczarException((Throwable) e);
            }
        } catch (URISyntaxException e2) {
            throw new KeyczarException((Throwable) e2);
        }
    }

    public boolean verify(URI uri) throws KeyczarException {
        return verify(uri, DEFAULT_SIG_PARAM);
    }

    public boolean verify(URI uri, String str) throws KeyczarException {
        String[] split;
        URI uri2;
        if (uri == null) {
            return false;
        }
        String query = uri.getQuery();
        if (query == null) {
            return false;
        }
        StringBuffer stringBuffer = new StringBuffer();
        String str2 = null;
        for (String str3 : query.split("&")) {
            if (str3.startsWith(str)) {
                String[] split2 = str3.split("=");
                if (split2.length == 2) {
                    str2 = split2[1];
                }
            } else {
                stringBuffer.append(str3);
                stringBuffer.append('&');
            }
        }
        if (str2 == null) {
            return false;
        }
        try {
            if (stringBuffer.length() > 0) {
                stringBuffer.deleteCharAt(stringBuffer.length() - 1);
                uri2 = new URI(uri.getScheme(), uri.getAuthority(), uri.getPath(), stringBuffer.toString(), uri.getFragment());
            } else {
                uri2 = new URI(uri.getScheme(), uri.getAuthority(), uri.getPath(), null, uri.getFragment());
            }
            return this.signer.verify(canonicalUri(uri2).toASCIIString(), str2);
        } catch (URISyntaxException unused) {
            return false;
        }
    }
}
