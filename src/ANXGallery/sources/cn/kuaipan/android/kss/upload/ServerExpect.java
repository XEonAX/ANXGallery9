package cn.kuaipan.android.kss.upload;

import android.util.Log;
import cn.kuaipan.android.http.KscHttpResponse;
import cn.kuaipan.android.kss.KssDef;
import org.apache.http.Header;
import org.apache.http.HttpResponse;

public class ServerExpect implements KssDef {
    public boolean factoryMode = false;
    public long nextChunkSize = -1;
    public int uploadDelay = -1;

    private static int getInt(Header header) {
        int i = -1;
        if (header == null) {
            return -1;
        }
        try {
            i = Integer.parseInt(header.getValue());
        } catch (NumberFormatException unused) {
            StringBuilder sb = new StringBuilder();
            sb.append("Failed parser header: ");
            sb.append(header);
            Log.w("ServerExpect", sb.toString());
        }
        return i;
    }

    public static ServerExpect getServerExpect(KscHttpResponse kscHttpResponse) {
        ServerExpect serverExpect = null;
        HttpResponse response = kscHttpResponse == null ? null : kscHttpResponse.getResponse();
        if (response == null) {
            return null;
        }
        ServerExpect serverExpect2 = new ServerExpect();
        Header firstHeader = response.getFirstHeader("X-Factory-Mode");
        boolean z = false;
        if (firstHeader != null) {
            if (getInt(firstHeader) == 1) {
                z = true;
            }
            serverExpect2.factoryMode = z;
            z = true;
        }
        Header firstHeader2 = response.getFirstHeader("X-Upload-Delay");
        if (firstHeader2 != null) {
            serverExpect2.uploadDelay = getInt(firstHeader2);
            z = true;
        }
        Header firstHeader3 = response.getFirstHeader("X-Next-Chunk-Size");
        if (firstHeader3 != null) {
            serverExpect2.nextChunkSize = (long) getInt(firstHeader3);
            z = true;
        }
        if (z) {
            serverExpect = serverExpect2;
        }
        return serverExpect;
    }

    public void validate() {
        if (this.nextChunkSize >= 0) {
            this.nextChunkSize -= this.nextChunkSize % 65536;
            this.nextChunkSize = Math.min(this.nextChunkSize, MAX_CHUNKSIZE);
            this.nextChunkSize = Math.max(this.nextChunkSize, 65536);
        }
        if (this.uploadDelay > 0 && !this.factoryMode) {
            this.uploadDelay = Math.min(this.uploadDelay, 300);
        }
    }
}
