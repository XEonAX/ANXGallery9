.class public final Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
.super Lcom/google/protobuf/micro/MessageMicro;
.source "ChannelMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/protobuf/ChannelMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "XMMsgConn"
.end annotation


# instance fields
.field private andver_:I

.field private cachedSize:I

.field private connpt_:Ljava/lang/String;

.field private hasAndver:Z

.field private hasConnpt:Z

.field private hasHost:Z

.field private hasLocale:Z

.field private hasModel:Z

.field private hasOs:Z

.field private hasPsc:Z

.field private hasSdk:Z

.field private hasUdid:Z

.field private hasVersion:Z

.field private host_:Ljava/lang/String;

.field private locale_:Ljava/lang/String;

.field private model_:Ljava/lang/String;

.field private os_:Ljava/lang/String;

.field private psc_:Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

.field private sdk_:I

.field private udid_:Ljava/lang/String;

.field private version_:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/google/protobuf/micro/MessageMicro;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->version_:I

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->model_:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->os_:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->udid_:Ljava/lang/String;

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->sdk_:I

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->connpt_:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->host_:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->locale_:Ljava/lang/String;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->psc_:Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->andver_:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->cachedSize:I

    return-void
.end method


# virtual methods
.method public getAndver()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->andver_:I

    return v0
.end method

.method public getCachedSize()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->cachedSize:I

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getSerializedSize()I

    :cond_0
    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->cachedSize:I

    return v0
.end method

.method public getConnpt()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->connpt_:Ljava/lang/String;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->host_:Ljava/lang/String;

    return-object v0
.end method

.method public getLocale()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->locale_:Ljava/lang/String;

    return-object v0
.end method

.method public getModel()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->model_:Ljava/lang/String;

    return-object v0
.end method

.method public getOs()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->os_:Ljava/lang/String;

    return-object v0
.end method

.method public getPsc()Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->psc_:Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    return-object v0
.end method

.method public getSdk()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->sdk_:I

    return v0
.end method

.method public getSerializedSize()I
    .locals 3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasVersion()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getVersion()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeUInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasModel()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getModel()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasOs()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getOs()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasUdid()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getUdid()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasSdk()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getSdk()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasConnpt()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x6

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getConnpt()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasHost()Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x7

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasLocale()Z

    move-result v0

    if-eqz v0, :cond_7

    const/16 v0, 0x8

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getLocale()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_7
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasPsc()Z

    move-result v0

    if-eqz v0, :cond_8

    const/16 v0, 0x9

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getPsc()Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeMessageSize(ILcom/google/protobuf/micro/MessageMicro;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_8
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasAndver()Z

    move-result v0

    if-eqz v0, :cond_9

    const/16 v0, 0xa

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getAndver()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_9
    iput v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->cachedSize:I

    return v1
.end method

.method public getUdid()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->udid_:Ljava/lang/String;

    return-object v0
.end method

.method public getVersion()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->version_:I

    return v0
.end method

.method public hasAndver()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasAndver:Z

    return v0
.end method

.method public hasConnpt()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasConnpt:Z

    return v0
.end method

.method public hasHost()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasHost:Z

    return v0
.end method

.method public hasLocale()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasLocale:Z

    return v0
.end method

.method public hasModel()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasModel:Z

    return v0
.end method

.method public hasOs()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasOs:Z

    return v0
.end method

.method public hasPsc()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasPsc:Z

    return v0
.end method

.method public hasSdk()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasSdk:Z

    return v0
.end method

.method public hasUdid()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasUdid:Z

    return v0
.end method

.method public hasVersion()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasVersion:Z

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/google/protobuf/micro/MessageMicro;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    move-result-object p1

    return-object p1
.end method

.method public mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readTag()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->parseUnknownField(Lcom/google/protobuf/micro/CodedInputStreamMicro;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :sswitch_0
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setAndver(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    goto :goto_0

    :sswitch_1
    new-instance v0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    invoke-direct {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;-><init>()V

    invoke-virtual {p1, v0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readMessage(Lcom/google/protobuf/micro/MessageMicro;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setPsc(Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setLocale(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setHost(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setConnpt(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    goto :goto_0

    :sswitch_5
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setSdk(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    goto :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setUdid(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    goto :goto_0

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setOs(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    goto :goto_0

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setModel(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    goto :goto_0

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readUInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->setVersion(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;

    goto :goto_0

    :sswitch_a
    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0x8 -> :sswitch_9
        0x12 -> :sswitch_8
        0x1a -> :sswitch_7
        0x22 -> :sswitch_6
        0x28 -> :sswitch_5
        0x32 -> :sswitch_4
        0x3a -> :sswitch_3
        0x42 -> :sswitch_2
        0x4a -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method public setAndver(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasAndver:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->andver_:I

    return-object p0
.end method

.method public setConnpt(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasConnpt:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->connpt_:Ljava/lang/String;

    return-object p0
.end method

.method public setHost(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasHost:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->host_:Ljava/lang/String;

    return-object p0
.end method

.method public setLocale(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasLocale:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->locale_:Ljava/lang/String;

    return-object p0
.end method

.method public setModel(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasModel:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->model_:Ljava/lang/String;

    return-object p0
.end method

.method public setOs(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasOs:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->os_:Ljava/lang/String;

    return-object p0
.end method

.method public setPsc(Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasPsc:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->psc_:Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method public setSdk(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasSdk:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->sdk_:I

    return-object p0
.end method

.method public setUdid(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasUdid:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->udid_:Ljava/lang/String;

    return-object p0
.end method

.method public setVersion(I)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasVersion:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->version_:I

    return-object p0
.end method

.method public writeTo(Lcom/google/protobuf/micro/CodedOutputStreamMicro;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasVersion()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getVersion()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeUInt32(II)V

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasModel()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getModel()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasOs()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getOs()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasUdid()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getUdid()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasSdk()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getSdk()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasConnpt()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x6

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getConnpt()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasHost()Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x7

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasLocale()Z

    move-result v0

    if-eqz v0, :cond_7

    const/16 v0, 0x8

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getLocale()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_7
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasPsc()Z

    move-result v0

    if-eqz v0, :cond_8

    const/16 v0, 0x9

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getPsc()Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeMessage(ILcom/google/protobuf/micro/MessageMicro;)V

    :cond_8
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->hasAndver()Z

    move-result v0

    if-eqz v0, :cond_9

    const/16 v0, 0xa

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConn;->getAndver()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_9
    return-void
.end method
