package cn.kuaipan.android.http;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.http.HttpEntity;
import org.apache.http.entity.HttpEntityWrapper;

public class ProcessMonitorEntity extends HttpEntityWrapper {
    private final IKscTransferListener mListener;
    private final KscSpeedMonitor mMonitor;
    private boolean mMonitorUsed = false;
    private final boolean mSendMode;

    public ProcessMonitorEntity(HttpEntity httpEntity, KscSpeedMonitor kscSpeedMonitor, IKscTransferListener iKscTransferListener, boolean z) {
        super(httpEntity);
        this.mMonitor = kscSpeedMonitor;
        this.mListener = iKscTransferListener;
        this.mSendMode = z;
    }

    public InputStream getContent() throws IOException {
        InputStream content = ProcessMonitorEntity.super.getContent();
        if (this.mMonitorUsed) {
            return content;
        }
        if (this.mListener != null) {
            if (this.mSendMode) {
                this.mListener.setSendTotal(getContentLength());
            } else {
                this.mListener.setReceiveTotal(getContentLength());
            }
        }
        ProcessMonitorInputStream processMonitorInputStream = new ProcessMonitorInputStream(content, this.mMonitor, this.mListener, this.mSendMode);
        this.mMonitorUsed = true;
        return processMonitorInputStream;
    }

    public void writeTo(OutputStream outputStream) throws IOException {
        if (!this.mMonitorUsed) {
            OutputStream processMonitorOutputStream = new ProcessMonitorOutputStream(outputStream, this.mMonitor, this.mListener, this.mSendMode);
            this.mMonitorUsed = true;
            outputStream = processMonitorOutputStream;
        }
        ProcessMonitorEntity.super.writeTo(outputStream);
    }
}
