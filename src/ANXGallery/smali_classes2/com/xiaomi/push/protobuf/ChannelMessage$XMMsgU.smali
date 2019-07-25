.class public final Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;
.super Lcom/google/protobuf/micro/MessageMicro;
.source "ChannelMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/protobuf/ChannelMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "XMMsgU"
.end annotation


# instance fields
.field private cachedSize:I

.field private end_:J

.field private force_:Z

.field private hasEnd:Z

.field private hasForce:Z

.field private hasMaxlen:Z

.field private hasStart:Z

.field private hasToken:Z

.field private hasUrl:Z

.field private maxlen_:I

.field private start_:J

.field private token_:Ljava/lang/String;

.field private url_:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/google/protobuf/micro/MessageMicro;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->url_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->token_:Ljava/lang/String;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->start_:J

    iput-wide v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->end_:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->force_:Z

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->maxlen_:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->cachedSize:I

    return-void
.end method

.method public static parseFrom([B)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;
        }
    .end annotation

    new-instance v0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;

    invoke-direct {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;-><init>()V

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->mergeFrom([B)Lcom/google/protobuf/micro/MessageMicro;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;

    return-object p0
.end method


# virtual methods
.method public getCachedSize()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->cachedSize:I

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getSerializedSize()I

    :cond_0
    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->cachedSize:I

    return v0
.end method

.method public getEnd()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->end_:J

    return-wide v0
.end method

.method public getForce()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->force_:Z

    return v0
.end method

.method public getMaxlen()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->maxlen_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasUrl()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasToken()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getToken()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasStart()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getStart()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeUInt64Size(IJ)I

    move-result v0

    add-int/2addr v1, v0

    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasEnd()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getEnd()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeUInt64Size(IJ)I

    move-result v0

    add-int/2addr v1, v0

    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasForce()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getForce()Z

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeBoolSize(IZ)I

    move-result v0

    add-int/2addr v1, v0

    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasMaxlen()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x6

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getMaxlen()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_5
    iput v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->cachedSize:I

    return v1
.end method

.method public getStart()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->start_:J

    return-wide v0
.end method

.method public getToken()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->token_:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->url_:Ljava/lang/String;

    return-object v0
.end method

.method public hasEnd()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasEnd:Z

    return v0
.end method

.method public hasForce()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasForce:Z

    return v0
.end method

.method public hasMaxlen()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasMaxlen:Z

    return v0
.end method

.method public hasStart()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasStart:Z

    return v0
.end method

.method public hasToken()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasToken:Z

    return v0
.end method

.method public hasUrl()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasUrl:Z

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/google/protobuf/micro/MessageMicro;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;

    move-result-object p1

    return-object p1
.end method

.method public mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readTag()I

    move-result v0

    if-eqz v0, :cond_7

    const/16 v1, 0xa

    if-eq v0, v1, :cond_6

    const/16 v1, 0x12

    if-eq v0, v1, :cond_5

    const/16 v1, 0x18

    if-eq v0, v1, :cond_4

    const/16 v1, 0x20

    if-eq v0, v1, :cond_3

    const/16 v1, 0x28

    if-eq v0, v1, :cond_2

    const/16 v1, 0x30

    if-eq v0, v1, :cond_1

    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->parseUnknownField(Lcom/google/protobuf/micro/CodedInputStreamMicro;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_1
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->setMaxlen(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readBool()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->setForce(Z)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readUInt64()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->setEnd(J)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readUInt64()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->setStart(J)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->setToken(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;

    goto :goto_0

    :cond_6
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->setUrl(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;

    goto :goto_0

    :cond_7
    return-object p0
.end method

.method public setEnd(J)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasEnd:Z

    iput-wide p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->end_:J

    return-object p0
.end method

.method public setForce(Z)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasForce:Z

    iput-boolean p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->force_:Z

    return-object p0
.end method

.method public setMaxlen(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasMaxlen:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->maxlen_:I

    return-object p0
.end method

.method public setStart(J)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasStart:Z

    iput-wide p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->start_:J

    return-object p0
.end method

.method public setToken(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasToken:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->token_:Ljava/lang/String;

    return-object p0
.end method

.method public setUrl(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasUrl:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->url_:Ljava/lang/String;

    return-object p0
.end method

.method public writeTo(Lcom/google/protobuf/micro/CodedOutputStreamMicro;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasUrl()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasToken()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasStart()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getStart()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeUInt64(IJ)V

    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasEnd()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getEnd()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeUInt64(IJ)V

    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasForce()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getForce()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeBool(IZ)V

    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->hasMaxlen()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x6

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgU;->getMaxlen()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_5
    return-void
.end method
