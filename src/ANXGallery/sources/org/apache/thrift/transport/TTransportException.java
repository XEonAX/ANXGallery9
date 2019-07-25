package org.apache.thrift.transport;

import org.apache.thrift.TException;

public class TTransportException extends TException {
    private static final long serialVersionUID = 1;
    protected int type_ = 0;

    public TTransportException() {
    }

    public TTransportException(int i) {
        this.type_ = i;
    }

    public TTransportException(int i, String str) {
        super(str);
        this.type_ = i;
    }

    public TTransportException(int i, Throwable th) {
        super(th);
        this.type_ = i;
    }

    public TTransportException(String str) {
        super(str);
    }
}
