package org.apache.thrift;

import java.io.ByteArrayOutputStream;
import org.apache.thrift.protocol.TBinaryProtocol.Factory;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.protocol.TProtocolFactory;
import org.apache.thrift.transport.TIOStreamTransport;

public class TSerializer {
    private final ByteArrayOutputStream baos_;
    private TProtocol protocol_;
    private final TIOStreamTransport transport_;

    public TSerializer() {
        this(new Factory());
    }

    public TSerializer(TProtocolFactory tProtocolFactory) {
        this.baos_ = new ByteArrayOutputStream();
        this.transport_ = new TIOStreamTransport(this.baos_);
        this.protocol_ = tProtocolFactory.getProtocol(this.transport_);
    }

    public byte[] serialize(TBase tBase) throws TException {
        this.baos_.reset();
        tBase.write(this.protocol_);
        return this.baos_.toByteArray();
    }
}
