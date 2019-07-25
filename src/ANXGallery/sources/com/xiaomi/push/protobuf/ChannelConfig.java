package com.xiaomi.push.protobuf;

import com.google.protobuf.micro.CodedInputStreamMicro;
import com.google.protobuf.micro.CodedOutputStreamMicro;
import com.google.protobuf.micro.InvalidProtocolBufferMicroException;
import com.google.protobuf.micro.MessageMicro;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public final class ChannelConfig {

    public static final class PushServiceConfig extends MessageMicro {
        private int cachedSize = -1;
        private int configVersion_ = 0;
        private int connectTimeoutMs_ = 0;
        private boolean enableDynamicPing_ = false;
        private boolean hasConfigVersion;
        private boolean hasConnectTimeoutMs;
        private boolean hasEnableDynamicPing;
        private boolean hasUseBucketV2;
        private List<String> testHosts_ = Collections.emptyList();
        private boolean useBucketV2_ = false;

        public static PushServiceConfig parseFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            return new PushServiceConfig().mergeFrom(codedInputStreamMicro);
        }

        public static PushServiceConfig parseFrom(byte[] bArr) throws InvalidProtocolBufferMicroException {
            return (PushServiceConfig) new PushServiceConfig().mergeFrom(bArr);
        }

        public PushServiceConfig addTestHosts(String str) {
            if (str != null) {
                if (this.testHosts_.isEmpty()) {
                    this.testHosts_ = new ArrayList();
                }
                this.testHosts_.add(str);
                return this;
            }
            throw new NullPointerException();
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public int getConfigVersion() {
            return this.configVersion_;
        }

        public int getConnectTimeoutMs() {
            return this.connectTimeoutMs_;
        }

        public boolean getEnableDynamicPing() {
            return this.enableDynamicPing_;
        }

        public int getSerializedSize() {
            int i = 0;
            int computeUInt32Size = hasConfigVersion() ? CodedOutputStreamMicro.computeUInt32Size(1, getConfigVersion()) + 0 : 0;
            if (hasUseBucketV2()) {
                computeUInt32Size += CodedOutputStreamMicro.computeBoolSize(2, getUseBucketV2());
            }
            if (hasConnectTimeoutMs()) {
                computeUInt32Size += CodedOutputStreamMicro.computeInt32Size(3, getConnectTimeoutMs());
            }
            if (hasEnableDynamicPing()) {
                computeUInt32Size += CodedOutputStreamMicro.computeBoolSize(4, getEnableDynamicPing());
            }
            for (String computeStringSizeNoTag : getTestHostsList()) {
                i += CodedOutputStreamMicro.computeStringSizeNoTag(computeStringSizeNoTag);
            }
            int size = computeUInt32Size + i + (getTestHostsList().size() * 1);
            this.cachedSize = size;
            return size;
        }

        public int getTestHostsCount() {
            return this.testHosts_.size();
        }

        public List<String> getTestHostsList() {
            return this.testHosts_;
        }

        public boolean getUseBucketV2() {
            return this.useBucketV2_;
        }

        public boolean hasConfigVersion() {
            return this.hasConfigVersion;
        }

        public boolean hasConnectTimeoutMs() {
            return this.hasConnectTimeoutMs;
        }

        public boolean hasEnableDynamicPing() {
            return this.hasEnableDynamicPing;
        }

        public boolean hasUseBucketV2() {
            return this.hasUseBucketV2;
        }

        public PushServiceConfig mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 8) {
                    setConfigVersion(codedInputStreamMicro.readUInt32());
                } else if (readTag == 16) {
                    setUseBucketV2(codedInputStreamMicro.readBool());
                } else if (readTag == 24) {
                    setConnectTimeoutMs(codedInputStreamMicro.readInt32());
                } else if (readTag == 32) {
                    setEnableDynamicPing(codedInputStreamMicro.readBool());
                } else if (readTag == 42) {
                    addTestHosts(codedInputStreamMicro.readString());
                } else if (!parseUnknownField(codedInputStreamMicro, readTag)) {
                    return this;
                }
            }
        }

        public PushServiceConfig setConfigVersion(int i) {
            this.hasConfigVersion = true;
            this.configVersion_ = i;
            return this;
        }

        public PushServiceConfig setConnectTimeoutMs(int i) {
            this.hasConnectTimeoutMs = true;
            this.connectTimeoutMs_ = i;
            return this;
        }

        public PushServiceConfig setEnableDynamicPing(boolean z) {
            this.hasEnableDynamicPing = true;
            this.enableDynamicPing_ = z;
            return this;
        }

        public PushServiceConfig setUseBucketV2(boolean z) {
            this.hasUseBucketV2 = true;
            this.useBucketV2_ = z;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasConfigVersion()) {
                codedOutputStreamMicro.writeUInt32(1, getConfigVersion());
            }
            if (hasUseBucketV2()) {
                codedOutputStreamMicro.writeBool(2, getUseBucketV2());
            }
            if (hasConnectTimeoutMs()) {
                codedOutputStreamMicro.writeInt32(3, getConnectTimeoutMs());
            }
            if (hasEnableDynamicPing()) {
                codedOutputStreamMicro.writeBool(4, getEnableDynamicPing());
            }
            for (String writeString : getTestHostsList()) {
                codedOutputStreamMicro.writeString(5, writeString);
            }
        }
    }
}
