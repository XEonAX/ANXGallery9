package org.apache.thrift.protocol;

import org.apache.thrift.TException;

public class TProtocolException extends TException {
    private static final long serialVersionUID = 1;
    protected int type_ = 0;

    public TProtocolException() {
    }

    public TProtocolException(int i, String str) {
        super(str);
        this.type_ = i;
    }

    public TProtocolException(String str) {
        super(str);
    }
}
