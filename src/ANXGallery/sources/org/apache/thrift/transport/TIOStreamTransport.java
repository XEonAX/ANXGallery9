package org.apache.thrift.transport;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class TIOStreamTransport extends TTransport {
    protected InputStream inputStream_ = null;
    protected OutputStream outputStream_ = null;

    protected TIOStreamTransport() {
    }

    public TIOStreamTransport(OutputStream outputStream) {
        this.outputStream_ = outputStream;
    }

    public int read(byte[] bArr, int i, int i2) throws TTransportException {
        if (this.inputStream_ != null) {
            try {
                int read = this.inputStream_.read(bArr, i, i2);
                if (read >= 0) {
                    return read;
                }
                throw new TTransportException(4);
            } catch (IOException e) {
                throw new TTransportException(0, (Throwable) e);
            }
        } else {
            throw new TTransportException(1, "Cannot read from null inputStream");
        }
    }

    public void write(byte[] bArr, int i, int i2) throws TTransportException {
        if (this.outputStream_ != null) {
            try {
                this.outputStream_.write(bArr, i, i2);
            } catch (IOException e) {
                throw new TTransportException(0, (Throwable) e);
            }
        } else {
            throw new TTransportException(1, "Cannot write to null outputStream");
        }
    }
}
