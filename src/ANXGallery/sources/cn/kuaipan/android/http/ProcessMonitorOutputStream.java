package cn.kuaipan.android.http;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class ProcessMonitorOutputStream extends FilterOutputStream {
    private final IKscTransferListener mListener;
    private final KscSpeedMonitor mMonitor;
    private final boolean mSendMode;

    public ProcessMonitorOutputStream(OutputStream outputStream, KscSpeedMonitor kscSpeedMonitor, IKscTransferListener iKscTransferListener, boolean z) {
        super(outputStream);
        this.mMonitor = kscSpeedMonitor;
        this.mListener = iKscTransferListener;
        this.mSendMode = z;
    }

    private void process(long j) {
        if (j >= 0) {
            if (this.mMonitor != null) {
                this.mMonitor.recode(j);
            }
            if (this.mListener == null) {
                return;
            }
            if (this.mSendMode) {
                this.mListener.sended(j);
            } else {
                this.mListener.received(j);
            }
        }
    }

    public void write(int i) throws IOException {
        super.write(i);
        process(1);
    }

    public void write(byte[] bArr, int i, int i2) throws IOException {
        this.out.write(bArr, i, i2);
        process((long) i2);
    }
}
