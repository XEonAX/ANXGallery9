package com.xiaomi.push.protobuf;

import com.google.protobuf.micro.ByteStringMicro;
import com.google.protobuf.micro.CodedInputStreamMicro;
import com.google.protobuf.micro.CodedOutputStreamMicro;
import com.google.protobuf.micro.InvalidProtocolBufferMicroException;
import com.google.protobuf.micro.MessageMicro;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import java.io.IOException;

public final class ChannelMessage {

    public static final class ClientHeader extends MessageMicro {
        private int cachedSize = -1;
        private int chid_ = 0;
        private int cipher_ = 0;
        private String cmd_ = "";
        private int dirFlag_ = 1;
        private int errCode_ = 0;
        private String errStr_ = "";
        private boolean hasChid;
        private boolean hasCipher;
        private boolean hasCmd;
        private boolean hasDirFlag;
        private boolean hasErrCode;
        private boolean hasErrStr;
        private boolean hasId;
        private boolean hasResource;
        private boolean hasServer;
        private boolean hasSubcmd;
        private boolean hasUuid;
        private String id_ = "";
        private String resource_ = "";
        private String server_ = "";
        private String subcmd_ = "";
        private long uuid_ = 0;

        public ClientHeader clearSubcmd() {
            this.hasSubcmd = false;
            this.subcmd_ = "";
            return this;
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public int getChid() {
            return this.chid_;
        }

        public int getCipher() {
            return this.cipher_;
        }

        public String getCmd() {
            return this.cmd_;
        }

        public int getDirFlag() {
            return this.dirFlag_;
        }

        public int getErrCode() {
            return this.errCode_;
        }

        public String getErrStr() {
            return this.errStr_;
        }

        public String getId() {
            return this.id_;
        }

        public String getResource() {
            return this.resource_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasChid()) {
                i = 0 + CodedOutputStreamMicro.computeInt32Size(1, getChid());
            }
            if (hasUuid()) {
                i += CodedOutputStreamMicro.computeInt64Size(2, getUuid());
            }
            if (hasServer()) {
                i += CodedOutputStreamMicro.computeStringSize(3, getServer());
            }
            if (hasResource()) {
                i += CodedOutputStreamMicro.computeStringSize(4, getResource());
            }
            if (hasCmd()) {
                i += CodedOutputStreamMicro.computeStringSize(5, getCmd());
            }
            if (hasSubcmd()) {
                i += CodedOutputStreamMicro.computeStringSize(6, getSubcmd());
            }
            if (hasId()) {
                i += CodedOutputStreamMicro.computeStringSize(7, getId());
            }
            if (hasDirFlag()) {
                i += CodedOutputStreamMicro.computeInt32Size(8, getDirFlag());
            }
            if (hasCipher()) {
                i += CodedOutputStreamMicro.computeInt32Size(9, getCipher());
            }
            if (hasErrCode()) {
                i += CodedOutputStreamMicro.computeInt32Size(10, getErrCode());
            }
            if (hasErrStr()) {
                i += CodedOutputStreamMicro.computeStringSize(11, getErrStr());
            }
            this.cachedSize = i;
            return i;
        }

        public String getServer() {
            return this.server_;
        }

        public String getSubcmd() {
            return this.subcmd_;
        }

        public long getUuid() {
            return this.uuid_;
        }

        public boolean hasChid() {
            return this.hasChid;
        }

        public boolean hasCipher() {
            return this.hasCipher;
        }

        public boolean hasCmd() {
            return this.hasCmd;
        }

        public boolean hasDirFlag() {
            return this.hasDirFlag;
        }

        public boolean hasErrCode() {
            return this.hasErrCode;
        }

        public boolean hasErrStr() {
            return this.hasErrStr;
        }

        public boolean hasId() {
            return this.hasId;
        }

        public boolean hasResource() {
            return this.hasResource;
        }

        public boolean hasServer() {
            return this.hasServer;
        }

        public boolean hasSubcmd() {
            return this.hasSubcmd;
        }

        public boolean hasUuid() {
            return this.hasUuid;
        }

        public ClientHeader mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 8:
                        setChid(codedInputStreamMicro.readInt32());
                        break;
                    case 16:
                        setUuid(codedInputStreamMicro.readInt64());
                        break;
                    case 26:
                        setServer(codedInputStreamMicro.readString());
                        break;
                    case 34:
                        setResource(codedInputStreamMicro.readString());
                        break;
                    case 42:
                        setCmd(codedInputStreamMicro.readString());
                        break;
                    case 50:
                        setSubcmd(codedInputStreamMicro.readString());
                        break;
                    case 58:
                        setId(codedInputStreamMicro.readString());
                        break;
                    case 64:
                        setDirFlag(codedInputStreamMicro.readInt32());
                        break;
                    case 72:
                        setCipher(codedInputStreamMicro.readInt32());
                        break;
                    case BaiduSceneResult.SKI /*80*/:
                        setErrCode(codedInputStreamMicro.readInt32());
                        break;
                    case 90:
                        setErrStr(codedInputStreamMicro.readString());
                        break;
                    default:
                        if (parseUnknownField(codedInputStreamMicro, readTag)) {
                            break;
                        } else {
                            return this;
                        }
                }
            }
        }

        public ClientHeader setChid(int i) {
            this.hasChid = true;
            this.chid_ = i;
            return this;
        }

        public ClientHeader setCipher(int i) {
            this.hasCipher = true;
            this.cipher_ = i;
            return this;
        }

        public ClientHeader setCmd(String str) {
            this.hasCmd = true;
            this.cmd_ = str;
            return this;
        }

        public ClientHeader setDirFlag(int i) {
            this.hasDirFlag = true;
            this.dirFlag_ = i;
            return this;
        }

        public ClientHeader setErrCode(int i) {
            this.hasErrCode = true;
            this.errCode_ = i;
            return this;
        }

        public ClientHeader setErrStr(String str) {
            this.hasErrStr = true;
            this.errStr_ = str;
            return this;
        }

        public ClientHeader setId(String str) {
            this.hasId = true;
            this.id_ = str;
            return this;
        }

        public ClientHeader setResource(String str) {
            this.hasResource = true;
            this.resource_ = str;
            return this;
        }

        public ClientHeader setServer(String str) {
            this.hasServer = true;
            this.server_ = str;
            return this;
        }

        public ClientHeader setSubcmd(String str) {
            this.hasSubcmd = true;
            this.subcmd_ = str;
            return this;
        }

        public ClientHeader setUuid(long j) {
            this.hasUuid = true;
            this.uuid_ = j;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasChid()) {
                codedOutputStreamMicro.writeInt32(1, getChid());
            }
            if (hasUuid()) {
                codedOutputStreamMicro.writeInt64(2, getUuid());
            }
            if (hasServer()) {
                codedOutputStreamMicro.writeString(3, getServer());
            }
            if (hasResource()) {
                codedOutputStreamMicro.writeString(4, getResource());
            }
            if (hasCmd()) {
                codedOutputStreamMicro.writeString(5, getCmd());
            }
            if (hasSubcmd()) {
                codedOutputStreamMicro.writeString(6, getSubcmd());
            }
            if (hasId()) {
                codedOutputStreamMicro.writeString(7, getId());
            }
            if (hasDirFlag()) {
                codedOutputStreamMicro.writeInt32(8, getDirFlag());
            }
            if (hasCipher()) {
                codedOutputStreamMicro.writeInt32(9, getCipher());
            }
            if (hasErrCode()) {
                codedOutputStreamMicro.writeInt32(10, getErrCode());
            }
            if (hasErrStr()) {
                codedOutputStreamMicro.writeString(11, getErrStr());
            }
        }
    }

    public static final class PushServiceConfigMsg extends MessageMicro {
        private int cachedSize = -1;
        private int clientVersion_ = 0;
        private int cloudVersion_ = 0;
        private int dots_ = 0;
        private boolean fetchBucket_ = false;
        private boolean hasClientVersion;
        private boolean hasCloudVersion;
        private boolean hasDots;
        private boolean hasFetchBucket;

        public static PushServiceConfigMsg parseFrom(byte[] bArr) throws InvalidProtocolBufferMicroException {
            return (PushServiceConfigMsg) new PushServiceConfigMsg().mergeFrom(bArr);
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public int getClientVersion() {
            return this.clientVersion_;
        }

        public int getCloudVersion() {
            return this.cloudVersion_;
        }

        public int getDots() {
            return this.dots_;
        }

        public boolean getFetchBucket() {
            return this.fetchBucket_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasFetchBucket()) {
                i = 0 + CodedOutputStreamMicro.computeBoolSize(1, getFetchBucket());
            }
            if (hasClientVersion()) {
                i += CodedOutputStreamMicro.computeInt32Size(3, getClientVersion());
            }
            if (hasCloudVersion()) {
                i += CodedOutputStreamMicro.computeInt32Size(4, getCloudVersion());
            }
            if (hasDots()) {
                i += CodedOutputStreamMicro.computeInt32Size(5, getDots());
            }
            this.cachedSize = i;
            return i;
        }

        public boolean hasClientVersion() {
            return this.hasClientVersion;
        }

        public boolean hasCloudVersion() {
            return this.hasCloudVersion;
        }

        public boolean hasDots() {
            return this.hasDots;
        }

        public boolean hasFetchBucket() {
            return this.hasFetchBucket;
        }

        public PushServiceConfigMsg mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 8) {
                    setFetchBucket(codedInputStreamMicro.readBool());
                } else if (readTag == 24) {
                    setClientVersion(codedInputStreamMicro.readInt32());
                } else if (readTag == 32) {
                    setCloudVersion(codedInputStreamMicro.readInt32());
                } else if (readTag == 40) {
                    setDots(codedInputStreamMicro.readInt32());
                } else if (!parseUnknownField(codedInputStreamMicro, readTag)) {
                    return this;
                }
            }
        }

        public PushServiceConfigMsg setClientVersion(int i) {
            this.hasClientVersion = true;
            this.clientVersion_ = i;
            return this;
        }

        public PushServiceConfigMsg setCloudVersion(int i) {
            this.hasCloudVersion = true;
            this.cloudVersion_ = i;
            return this;
        }

        public PushServiceConfigMsg setDots(int i) {
            this.hasDots = true;
            this.dots_ = i;
            return this;
        }

        public PushServiceConfigMsg setFetchBucket(boolean z) {
            this.hasFetchBucket = true;
            this.fetchBucket_ = z;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasFetchBucket()) {
                codedOutputStreamMicro.writeBool(1, getFetchBucket());
            }
            if (hasClientVersion()) {
                codedOutputStreamMicro.writeInt32(3, getClientVersion());
            }
            if (hasCloudVersion()) {
                codedOutputStreamMicro.writeInt32(4, getCloudVersion());
            }
            if (hasDots()) {
                codedOutputStreamMicro.writeInt32(5, getDots());
            }
        }
    }

    public static final class XMMsgBind extends MessageMicro {
        private int cachedSize = -1;
        private String clientAttrs_ = "";
        private String cloudAttrs_ = "";
        private boolean hasClientAttrs;
        private boolean hasCloudAttrs;
        private boolean hasKick;
        private boolean hasMethod;
        private boolean hasSig;
        private boolean hasToken;
        private String kick_ = "";
        private String method_ = "";
        private String sig_ = "";
        private String token_ = "";

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public String getClientAttrs() {
            return this.clientAttrs_;
        }

        public String getCloudAttrs() {
            return this.cloudAttrs_;
        }

        public String getKick() {
            return this.kick_;
        }

        public String getMethod() {
            return this.method_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasToken()) {
                i = 0 + CodedOutputStreamMicro.computeStringSize(1, getToken());
            }
            if (hasKick()) {
                i += CodedOutputStreamMicro.computeStringSize(2, getKick());
            }
            if (hasMethod()) {
                i += CodedOutputStreamMicro.computeStringSize(3, getMethod());
            }
            if (hasClientAttrs()) {
                i += CodedOutputStreamMicro.computeStringSize(4, getClientAttrs());
            }
            if (hasCloudAttrs()) {
                i += CodedOutputStreamMicro.computeStringSize(5, getCloudAttrs());
            }
            if (hasSig()) {
                i += CodedOutputStreamMicro.computeStringSize(6, getSig());
            }
            this.cachedSize = i;
            return i;
        }

        public String getSig() {
            return this.sig_;
        }

        public String getToken() {
            return this.token_;
        }

        public boolean hasClientAttrs() {
            return this.hasClientAttrs;
        }

        public boolean hasCloudAttrs() {
            return this.hasCloudAttrs;
        }

        public boolean hasKick() {
            return this.hasKick;
        }

        public boolean hasMethod() {
            return this.hasMethod;
        }

        public boolean hasSig() {
            return this.hasSig;
        }

        public boolean hasToken() {
            return this.hasToken;
        }

        public XMMsgBind mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    setToken(codedInputStreamMicro.readString());
                } else if (readTag == 18) {
                    setKick(codedInputStreamMicro.readString());
                } else if (readTag == 26) {
                    setMethod(codedInputStreamMicro.readString());
                } else if (readTag == 34) {
                    setClientAttrs(codedInputStreamMicro.readString());
                } else if (readTag == 42) {
                    setCloudAttrs(codedInputStreamMicro.readString());
                } else if (readTag == 50) {
                    setSig(codedInputStreamMicro.readString());
                } else if (!parseUnknownField(codedInputStreamMicro, readTag)) {
                    return this;
                }
            }
        }

        public XMMsgBind setClientAttrs(String str) {
            this.hasClientAttrs = true;
            this.clientAttrs_ = str;
            return this;
        }

        public XMMsgBind setCloudAttrs(String str) {
            this.hasCloudAttrs = true;
            this.cloudAttrs_ = str;
            return this;
        }

        public XMMsgBind setKick(String str) {
            this.hasKick = true;
            this.kick_ = str;
            return this;
        }

        public XMMsgBind setMethod(String str) {
            this.hasMethod = true;
            this.method_ = str;
            return this;
        }

        public XMMsgBind setSig(String str) {
            this.hasSig = true;
            this.sig_ = str;
            return this;
        }

        public XMMsgBind setToken(String str) {
            this.hasToken = true;
            this.token_ = str;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasToken()) {
                codedOutputStreamMicro.writeString(1, getToken());
            }
            if (hasKick()) {
                codedOutputStreamMicro.writeString(2, getKick());
            }
            if (hasMethod()) {
                codedOutputStreamMicro.writeString(3, getMethod());
            }
            if (hasClientAttrs()) {
                codedOutputStreamMicro.writeString(4, getClientAttrs());
            }
            if (hasCloudAttrs()) {
                codedOutputStreamMicro.writeString(5, getCloudAttrs());
            }
            if (hasSig()) {
                codedOutputStreamMicro.writeString(6, getSig());
            }
        }
    }

    public static final class XMMsgBindResp extends MessageMicro {
        private int cachedSize = -1;
        private String errorDesc_ = "";
        private String errorReason_ = "";
        private String errorType_ = "";
        private boolean hasErrorDesc;
        private boolean hasErrorReason;
        private boolean hasErrorType;
        private boolean hasResult;
        private boolean result_ = false;

        public static XMMsgBindResp parseFrom(byte[] bArr) throws InvalidProtocolBufferMicroException {
            return (XMMsgBindResp) new XMMsgBindResp().mergeFrom(bArr);
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public String getErrorDesc() {
            return this.errorDesc_;
        }

        public String getErrorReason() {
            return this.errorReason_;
        }

        public String getErrorType() {
            return this.errorType_;
        }

        public boolean getResult() {
            return this.result_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasResult()) {
                i = 0 + CodedOutputStreamMicro.computeBoolSize(1, getResult());
            }
            if (hasErrorType()) {
                i += CodedOutputStreamMicro.computeStringSize(2, getErrorType());
            }
            if (hasErrorReason()) {
                i += CodedOutputStreamMicro.computeStringSize(3, getErrorReason());
            }
            if (hasErrorDesc()) {
                i += CodedOutputStreamMicro.computeStringSize(4, getErrorDesc());
            }
            this.cachedSize = i;
            return i;
        }

        public boolean hasErrorDesc() {
            return this.hasErrorDesc;
        }

        public boolean hasErrorReason() {
            return this.hasErrorReason;
        }

        public boolean hasErrorType() {
            return this.hasErrorType;
        }

        public boolean hasResult() {
            return this.hasResult;
        }

        public XMMsgBindResp mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 8) {
                    setResult(codedInputStreamMicro.readBool());
                } else if (readTag == 18) {
                    setErrorType(codedInputStreamMicro.readString());
                } else if (readTag == 26) {
                    setErrorReason(codedInputStreamMicro.readString());
                } else if (readTag == 34) {
                    setErrorDesc(codedInputStreamMicro.readString());
                } else if (!parseUnknownField(codedInputStreamMicro, readTag)) {
                    return this;
                }
            }
        }

        public XMMsgBindResp setErrorDesc(String str) {
            this.hasErrorDesc = true;
            this.errorDesc_ = str;
            return this;
        }

        public XMMsgBindResp setErrorReason(String str) {
            this.hasErrorReason = true;
            this.errorReason_ = str;
            return this;
        }

        public XMMsgBindResp setErrorType(String str) {
            this.hasErrorType = true;
            this.errorType_ = str;
            return this;
        }

        public XMMsgBindResp setResult(boolean z) {
            this.hasResult = true;
            this.result_ = z;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasResult()) {
                codedOutputStreamMicro.writeBool(1, getResult());
            }
            if (hasErrorType()) {
                codedOutputStreamMicro.writeString(2, getErrorType());
            }
            if (hasErrorReason()) {
                codedOutputStreamMicro.writeString(3, getErrorReason());
            }
            if (hasErrorDesc()) {
                codedOutputStreamMicro.writeString(4, getErrorDesc());
            }
        }
    }

    public static final class XMMsgConn extends MessageMicro {
        private int andver_ = 0;
        private int cachedSize = -1;
        private String connpt_ = "";
        private boolean hasAndver;
        private boolean hasConnpt;
        private boolean hasHost;
        private boolean hasLocale;
        private boolean hasModel;
        private boolean hasOs;
        private boolean hasPsc;
        private boolean hasSdk;
        private boolean hasUdid;
        private boolean hasVersion;
        private String host_ = "";
        private String locale_ = "";
        private String model_ = "";
        private String os_ = "";
        private PushServiceConfigMsg psc_ = null;
        private int sdk_ = 0;
        private String udid_ = "";
        private int version_ = 0;

        public int getAndver() {
            return this.andver_;
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public String getConnpt() {
            return this.connpt_;
        }

        public String getHost() {
            return this.host_;
        }

        public String getLocale() {
            return this.locale_;
        }

        public String getModel() {
            return this.model_;
        }

        public String getOs() {
            return this.os_;
        }

        public PushServiceConfigMsg getPsc() {
            return this.psc_;
        }

        public int getSdk() {
            return this.sdk_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasVersion()) {
                i = 0 + CodedOutputStreamMicro.computeUInt32Size(1, getVersion());
            }
            if (hasModel()) {
                i += CodedOutputStreamMicro.computeStringSize(2, getModel());
            }
            if (hasOs()) {
                i += CodedOutputStreamMicro.computeStringSize(3, getOs());
            }
            if (hasUdid()) {
                i += CodedOutputStreamMicro.computeStringSize(4, getUdid());
            }
            if (hasSdk()) {
                i += CodedOutputStreamMicro.computeInt32Size(5, getSdk());
            }
            if (hasConnpt()) {
                i += CodedOutputStreamMicro.computeStringSize(6, getConnpt());
            }
            if (hasHost()) {
                i += CodedOutputStreamMicro.computeStringSize(7, getHost());
            }
            if (hasLocale()) {
                i += CodedOutputStreamMicro.computeStringSize(8, getLocale());
            }
            if (hasPsc()) {
                i += CodedOutputStreamMicro.computeMessageSize(9, getPsc());
            }
            if (hasAndver()) {
                i += CodedOutputStreamMicro.computeInt32Size(10, getAndver());
            }
            this.cachedSize = i;
            return i;
        }

        public String getUdid() {
            return this.udid_;
        }

        public int getVersion() {
            return this.version_;
        }

        public boolean hasAndver() {
            return this.hasAndver;
        }

        public boolean hasConnpt() {
            return this.hasConnpt;
        }

        public boolean hasHost() {
            return this.hasHost;
        }

        public boolean hasLocale() {
            return this.hasLocale;
        }

        public boolean hasModel() {
            return this.hasModel;
        }

        public boolean hasOs() {
            return this.hasOs;
        }

        public boolean hasPsc() {
            return this.hasPsc;
        }

        public boolean hasSdk() {
            return this.hasSdk;
        }

        public boolean hasUdid() {
            return this.hasUdid;
        }

        public boolean hasVersion() {
            return this.hasVersion;
        }

        public XMMsgConn mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 8:
                        setVersion(codedInputStreamMicro.readUInt32());
                        break;
                    case 18:
                        setModel(codedInputStreamMicro.readString());
                        break;
                    case 26:
                        setOs(codedInputStreamMicro.readString());
                        break;
                    case 34:
                        setUdid(codedInputStreamMicro.readString());
                        break;
                    case 40:
                        setSdk(codedInputStreamMicro.readInt32());
                        break;
                    case 50:
                        setConnpt(codedInputStreamMicro.readString());
                        break;
                    case 58:
                        setHost(codedInputStreamMicro.readString());
                        break;
                    case 66:
                        setLocale(codedInputStreamMicro.readString());
                        break;
                    case 74:
                        PushServiceConfigMsg pushServiceConfigMsg = new PushServiceConfigMsg();
                        codedInputStreamMicro.readMessage(pushServiceConfigMsg);
                        setPsc(pushServiceConfigMsg);
                        break;
                    case BaiduSceneResult.SKI /*80*/:
                        setAndver(codedInputStreamMicro.readInt32());
                        break;
                    default:
                        if (parseUnknownField(codedInputStreamMicro, readTag)) {
                            break;
                        } else {
                            return this;
                        }
                }
            }
        }

        public XMMsgConn setAndver(int i) {
            this.hasAndver = true;
            this.andver_ = i;
            return this;
        }

        public XMMsgConn setConnpt(String str) {
            this.hasConnpt = true;
            this.connpt_ = str;
            return this;
        }

        public XMMsgConn setHost(String str) {
            this.hasHost = true;
            this.host_ = str;
            return this;
        }

        public XMMsgConn setLocale(String str) {
            this.hasLocale = true;
            this.locale_ = str;
            return this;
        }

        public XMMsgConn setModel(String str) {
            this.hasModel = true;
            this.model_ = str;
            return this;
        }

        public XMMsgConn setOs(String str) {
            this.hasOs = true;
            this.os_ = str;
            return this;
        }

        public XMMsgConn setPsc(PushServiceConfigMsg pushServiceConfigMsg) {
            if (pushServiceConfigMsg != null) {
                this.hasPsc = true;
                this.psc_ = pushServiceConfigMsg;
                return this;
            }
            throw new NullPointerException();
        }

        public XMMsgConn setSdk(int i) {
            this.hasSdk = true;
            this.sdk_ = i;
            return this;
        }

        public XMMsgConn setUdid(String str) {
            this.hasUdid = true;
            this.udid_ = str;
            return this;
        }

        public XMMsgConn setVersion(int i) {
            this.hasVersion = true;
            this.version_ = i;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasVersion()) {
                codedOutputStreamMicro.writeUInt32(1, getVersion());
            }
            if (hasModel()) {
                codedOutputStreamMicro.writeString(2, getModel());
            }
            if (hasOs()) {
                codedOutputStreamMicro.writeString(3, getOs());
            }
            if (hasUdid()) {
                codedOutputStreamMicro.writeString(4, getUdid());
            }
            if (hasSdk()) {
                codedOutputStreamMicro.writeInt32(5, getSdk());
            }
            if (hasConnpt()) {
                codedOutputStreamMicro.writeString(6, getConnpt());
            }
            if (hasHost()) {
                codedOutputStreamMicro.writeString(7, getHost());
            }
            if (hasLocale()) {
                codedOutputStreamMicro.writeString(8, getLocale());
            }
            if (hasPsc()) {
                codedOutputStreamMicro.writeMessage(9, getPsc());
            }
            if (hasAndver()) {
                codedOutputStreamMicro.writeInt32(10, getAndver());
            }
        }
    }

    public static final class XMMsgConnResp extends MessageMicro {
        private int cachedSize = -1;
        private String challenge_ = "";
        private boolean hasChallenge;
        private boolean hasHost;
        private boolean hasPsc;
        private String host_ = "";
        private PushServiceConfigMsg psc_ = null;

        public static XMMsgConnResp parseFrom(byte[] bArr) throws InvalidProtocolBufferMicroException {
            return (XMMsgConnResp) new XMMsgConnResp().mergeFrom(bArr);
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public String getChallenge() {
            return this.challenge_;
        }

        public String getHost() {
            return this.host_;
        }

        public PushServiceConfigMsg getPsc() {
            return this.psc_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasChallenge()) {
                i = 0 + CodedOutputStreamMicro.computeStringSize(1, getChallenge());
            }
            if (hasHost()) {
                i += CodedOutputStreamMicro.computeStringSize(2, getHost());
            }
            if (hasPsc()) {
                i += CodedOutputStreamMicro.computeMessageSize(3, getPsc());
            }
            this.cachedSize = i;
            return i;
        }

        public boolean hasChallenge() {
            return this.hasChallenge;
        }

        public boolean hasHost() {
            return this.hasHost;
        }

        public boolean hasPsc() {
            return this.hasPsc;
        }

        public XMMsgConnResp mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    setChallenge(codedInputStreamMicro.readString());
                } else if (readTag == 18) {
                    setHost(codedInputStreamMicro.readString());
                } else if (readTag == 26) {
                    PushServiceConfigMsg pushServiceConfigMsg = new PushServiceConfigMsg();
                    codedInputStreamMicro.readMessage(pushServiceConfigMsg);
                    setPsc(pushServiceConfigMsg);
                } else if (!parseUnknownField(codedInputStreamMicro, readTag)) {
                    return this;
                }
            }
        }

        public XMMsgConnResp setChallenge(String str) {
            this.hasChallenge = true;
            this.challenge_ = str;
            return this;
        }

        public XMMsgConnResp setHost(String str) {
            this.hasHost = true;
            this.host_ = str;
            return this;
        }

        public XMMsgConnResp setPsc(PushServiceConfigMsg pushServiceConfigMsg) {
            if (pushServiceConfigMsg != null) {
                this.hasPsc = true;
                this.psc_ = pushServiceConfigMsg;
                return this;
            }
            throw new NullPointerException();
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasChallenge()) {
                codedOutputStreamMicro.writeString(1, getChallenge());
            }
            if (hasHost()) {
                codedOutputStreamMicro.writeString(2, getHost());
            }
            if (hasPsc()) {
                codedOutputStreamMicro.writeMessage(3, getPsc());
            }
        }
    }

    public static final class XMMsgKick extends MessageMicro {
        private int cachedSize = -1;
        private String desc_ = "";
        private boolean hasDesc;
        private boolean hasReason;
        private boolean hasType;
        private String reason_ = "";
        private String type_ = "";

        public static XMMsgKick parseFrom(byte[] bArr) throws InvalidProtocolBufferMicroException {
            return (XMMsgKick) new XMMsgKick().mergeFrom(bArr);
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public String getDesc() {
            return this.desc_;
        }

        public String getReason() {
            return this.reason_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasType()) {
                i = 0 + CodedOutputStreamMicro.computeStringSize(1, getType());
            }
            if (hasReason()) {
                i += CodedOutputStreamMicro.computeStringSize(2, getReason());
            }
            if (hasDesc()) {
                i += CodedOutputStreamMicro.computeStringSize(3, getDesc());
            }
            this.cachedSize = i;
            return i;
        }

        public String getType() {
            return this.type_;
        }

        public boolean hasDesc() {
            return this.hasDesc;
        }

        public boolean hasReason() {
            return this.hasReason;
        }

        public boolean hasType() {
            return this.hasType;
        }

        public XMMsgKick mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    setType(codedInputStreamMicro.readString());
                } else if (readTag == 18) {
                    setReason(codedInputStreamMicro.readString());
                } else if (readTag == 26) {
                    setDesc(codedInputStreamMicro.readString());
                } else if (!parseUnknownField(codedInputStreamMicro, readTag)) {
                    return this;
                }
            }
        }

        public XMMsgKick setDesc(String str) {
            this.hasDesc = true;
            this.desc_ = str;
            return this;
        }

        public XMMsgKick setReason(String str) {
            this.hasReason = true;
            this.reason_ = str;
            return this;
        }

        public XMMsgKick setType(String str) {
            this.hasType = true;
            this.type_ = str;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasType()) {
                codedOutputStreamMicro.writeString(1, getType());
            }
            if (hasReason()) {
                codedOutputStreamMicro.writeString(2, getReason());
            }
            if (hasDesc()) {
                codedOutputStreamMicro.writeString(3, getDesc());
            }
        }
    }

    public static final class XMMsgNotify extends MessageMicro {
        private int cachedSize = -1;
        private int errCode_ = 0;
        private String errStr_ = "";
        private boolean hasErrCode;
        private boolean hasErrStr;

        public static XMMsgNotify parseFrom(byte[] bArr) throws InvalidProtocolBufferMicroException {
            return (XMMsgNotify) new XMMsgNotify().mergeFrom(bArr);
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public int getErrCode() {
            return this.errCode_;
        }

        public String getErrStr() {
            return this.errStr_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasErrCode()) {
                i = 0 + CodedOutputStreamMicro.computeInt32Size(1, getErrCode());
            }
            if (hasErrStr()) {
                i += CodedOutputStreamMicro.computeStringSize(2, getErrStr());
            }
            this.cachedSize = i;
            return i;
        }

        public boolean hasErrCode() {
            return this.hasErrCode;
        }

        public boolean hasErrStr() {
            return this.hasErrStr;
        }

        public XMMsgNotify mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 8) {
                    setErrCode(codedInputStreamMicro.readInt32());
                } else if (readTag == 18) {
                    setErrStr(codedInputStreamMicro.readString());
                } else if (!parseUnknownField(codedInputStreamMicro, readTag)) {
                    return this;
                }
            }
        }

        public XMMsgNotify setErrCode(int i) {
            this.hasErrCode = true;
            this.errCode_ = i;
            return this;
        }

        public XMMsgNotify setErrStr(String str) {
            this.hasErrStr = true;
            this.errStr_ = str;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasErrCode()) {
                codedOutputStreamMicro.writeInt32(1, getErrCode());
            }
            if (hasErrStr()) {
                codedOutputStreamMicro.writeString(2, getErrStr());
            }
        }
    }

    public static final class XMMsgP extends MessageMicro {
        private int cachedSize = -1;
        private ByteStringMicro cookie_ = ByteStringMicro.EMPTY;
        private boolean hasCookie;

        public static XMMsgP parseFrom(byte[] bArr) throws InvalidProtocolBufferMicroException {
            return (XMMsgP) new XMMsgP().mergeFrom(bArr);
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public ByteStringMicro getCookie() {
            return this.cookie_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasCookie()) {
                i = 0 + CodedOutputStreamMicro.computeBytesSize(1, getCookie());
            }
            this.cachedSize = i;
            return i;
        }

        public boolean hasCookie() {
            return this.hasCookie;
        }

        public XMMsgP mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    setCookie(codedInputStreamMicro.readBytes());
                } else if (!parseUnknownField(codedInputStreamMicro, readTag)) {
                    return this;
                }
            }
        }

        public XMMsgP setCookie(ByteStringMicro byteStringMicro) {
            this.hasCookie = true;
            this.cookie_ = byteStringMicro;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasCookie()) {
                codedOutputStreamMicro.writeBytes(1, getCookie());
            }
        }
    }

    public static final class XMMsgPing extends MessageMicro {
        private int cachedSize = -1;
        private boolean hasPsc;
        private boolean hasStats;
        private PushServiceConfigMsg psc_ = null;
        private ByteStringMicro stats_ = ByteStringMicro.EMPTY;

        public static XMMsgPing parseFrom(byte[] bArr) throws InvalidProtocolBufferMicroException {
            return (XMMsgPing) new XMMsgPing().mergeFrom(bArr);
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public PushServiceConfigMsg getPsc() {
            return this.psc_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasStats()) {
                i = 0 + CodedOutputStreamMicro.computeBytesSize(1, getStats());
            }
            if (hasPsc()) {
                i += CodedOutputStreamMicro.computeMessageSize(2, getPsc());
            }
            this.cachedSize = i;
            return i;
        }

        public ByteStringMicro getStats() {
            return this.stats_;
        }

        public boolean hasPsc() {
            return this.hasPsc;
        }

        public boolean hasStats() {
            return this.hasStats;
        }

        public XMMsgPing mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    setStats(codedInputStreamMicro.readBytes());
                } else if (readTag == 18) {
                    PushServiceConfigMsg pushServiceConfigMsg = new PushServiceConfigMsg();
                    codedInputStreamMicro.readMessage(pushServiceConfigMsg);
                    setPsc(pushServiceConfigMsg);
                } else if (!parseUnknownField(codedInputStreamMicro, readTag)) {
                    return this;
                }
            }
        }

        public XMMsgPing setPsc(PushServiceConfigMsg pushServiceConfigMsg) {
            if (pushServiceConfigMsg != null) {
                this.hasPsc = true;
                this.psc_ = pushServiceConfigMsg;
                return this;
            }
            throw new NullPointerException();
        }

        public XMMsgPing setStats(ByteStringMicro byteStringMicro) {
            this.hasStats = true;
            this.stats_ = byteStringMicro;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasStats()) {
                codedOutputStreamMicro.writeBytes(1, getStats());
            }
            if (hasPsc()) {
                codedOutputStreamMicro.writeMessage(2, getPsc());
            }
        }
    }

    public static final class XMMsgU extends MessageMicro {
        private int cachedSize = -1;
        private long end_ = 0;
        private boolean force_ = false;
        private boolean hasEnd;
        private boolean hasForce;
        private boolean hasMaxlen;
        private boolean hasStart;
        private boolean hasToken;
        private boolean hasUrl;
        private int maxlen_ = 0;
        private long start_ = 0;
        private String token_ = "";
        private String url_ = "";

        public static XMMsgU parseFrom(byte[] bArr) throws InvalidProtocolBufferMicroException {
            return (XMMsgU) new XMMsgU().mergeFrom(bArr);
        }

        public int getCachedSize() {
            if (this.cachedSize < 0) {
                getSerializedSize();
            }
            return this.cachedSize;
        }

        public long getEnd() {
            return this.end_;
        }

        public boolean getForce() {
            return this.force_;
        }

        public int getMaxlen() {
            return this.maxlen_;
        }

        public int getSerializedSize() {
            int i = 0;
            if (hasUrl()) {
                i = 0 + CodedOutputStreamMicro.computeStringSize(1, getUrl());
            }
            if (hasToken()) {
                i += CodedOutputStreamMicro.computeStringSize(2, getToken());
            }
            if (hasStart()) {
                i += CodedOutputStreamMicro.computeUInt64Size(3, getStart());
            }
            if (hasEnd()) {
                i += CodedOutputStreamMicro.computeUInt64Size(4, getEnd());
            }
            if (hasForce()) {
                i += CodedOutputStreamMicro.computeBoolSize(5, getForce());
            }
            if (hasMaxlen()) {
                i += CodedOutputStreamMicro.computeInt32Size(6, getMaxlen());
            }
            this.cachedSize = i;
            return i;
        }

        public long getStart() {
            return this.start_;
        }

        public String getToken() {
            return this.token_;
        }

        public String getUrl() {
            return this.url_;
        }

        public boolean hasEnd() {
            return this.hasEnd;
        }

        public boolean hasForce() {
            return this.hasForce;
        }

        public boolean hasMaxlen() {
            return this.hasMaxlen;
        }

        public boolean hasStart() {
            return this.hasStart;
        }

        public boolean hasToken() {
            return this.hasToken;
        }

        public boolean hasUrl() {
            return this.hasUrl;
        }

        public XMMsgU mergeFrom(CodedInputStreamMicro codedInputStreamMicro) throws IOException {
            while (true) {
                int readTag = codedInputStreamMicro.readTag();
                if (readTag == 0) {
                    return this;
                }
                if (readTag == 10) {
                    setUrl(codedInputStreamMicro.readString());
                } else if (readTag == 18) {
                    setToken(codedInputStreamMicro.readString());
                } else if (readTag == 24) {
                    setStart(codedInputStreamMicro.readUInt64());
                } else if (readTag == 32) {
                    setEnd(codedInputStreamMicro.readUInt64());
                } else if (readTag == 40) {
                    setForce(codedInputStreamMicro.readBool());
                } else if (readTag == 48) {
                    setMaxlen(codedInputStreamMicro.readInt32());
                } else if (!parseUnknownField(codedInputStreamMicro, readTag)) {
                    return this;
                }
            }
        }

        public XMMsgU setEnd(long j) {
            this.hasEnd = true;
            this.end_ = j;
            return this;
        }

        public XMMsgU setForce(boolean z) {
            this.hasForce = true;
            this.force_ = z;
            return this;
        }

        public XMMsgU setMaxlen(int i) {
            this.hasMaxlen = true;
            this.maxlen_ = i;
            return this;
        }

        public XMMsgU setStart(long j) {
            this.hasStart = true;
            this.start_ = j;
            return this;
        }

        public XMMsgU setToken(String str) {
            this.hasToken = true;
            this.token_ = str;
            return this;
        }

        public XMMsgU setUrl(String str) {
            this.hasUrl = true;
            this.url_ = str;
            return this;
        }

        public void writeTo(CodedOutputStreamMicro codedOutputStreamMicro) throws IOException {
            if (hasUrl()) {
                codedOutputStreamMicro.writeString(1, getUrl());
            }
            if (hasToken()) {
                codedOutputStreamMicro.writeString(2, getToken());
            }
            if (hasStart()) {
                codedOutputStreamMicro.writeUInt64(3, getStart());
            }
            if (hasEnd()) {
                codedOutputStreamMicro.writeUInt64(4, getEnd());
            }
            if (hasForce()) {
                codedOutputStreamMicro.writeBool(5, getForce());
            }
            if (hasMaxlen()) {
                codedOutputStreamMicro.writeInt32(6, getMaxlen());
            }
        }
    }
}
