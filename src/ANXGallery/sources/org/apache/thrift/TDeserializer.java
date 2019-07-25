package org.apache.thrift;

import org.apache.thrift.protocol.TBinaryProtocol.Factory;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolFactory;
import org.apache.thrift.transport.TMemoryInputTransport;

public class TDeserializer {
    private final TProtocol protocol_;
    private final TMemoryInputTransport trans_;

    public TDeserializer() {
        this(new Factory());
    }

    public TDeserializer(TProtocolFactory tProtocolFactory) {
        this.trans_ = new TMemoryInputTransport();
        this.protocol_ = tProtocolFactory.getProtocol(this.trans_);
    }

    public void deserialize(TBase tBase, byte[] bArr) throws TException {
        try {
            this.trans_.reset(bArr);
            tBase.read(this.protocol_);
        } finally {
            this.protocol_.reset();
        }
    }
}
