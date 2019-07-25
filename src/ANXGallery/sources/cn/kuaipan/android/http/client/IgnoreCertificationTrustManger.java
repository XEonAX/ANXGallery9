package cn.kuaipan.android.http.client;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.X509TrustManager;

public class IgnoreCertificationTrustManger implements X509TrustManager {
    private X509Certificate[] certificates;

    public void checkClientTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException {
        if (this.certificates == null) {
            this.certificates = x509CertificateArr;
        }
    }

    public void checkServerTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException {
        if (this.certificates == null) {
            this.certificates = x509CertificateArr;
        }
    }

    public X509Certificate[] getAcceptedIssuers() {
        return null;
    }
}
