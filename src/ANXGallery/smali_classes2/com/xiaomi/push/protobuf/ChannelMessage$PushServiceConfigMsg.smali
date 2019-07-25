.class public final Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;
.super Lcom/google/protobuf/micro/MessageMicro;
.source "ChannelMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/protobuf/ChannelMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PushServiceConfigMsg"
.end annotation


# instance fields
.field private cachedSize:I

.field private clientVersion_:I

.field private cloudVersion_:I

.field private dots_:I

.field private fetchBucket_:Z

.field private hasClientVersion:Z

.field private hasCloudVersion:Z

.field private hasDots:Z

.field private hasFetchBucket:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/micro/MessageMicro;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->fetchBucket_:Z

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->clientVersion_:I

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->cloudVersion_:I

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->dots_:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->cachedSize:I

    return-void
.end method

.method public static parseFrom([B)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;
        }
    .end annotation

    new-instance v0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    invoke-direct {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;-><init>()V

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->mergeFrom([B)Lcom/google/protobuf/micro/MessageMicro;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    return-object p0
.end method


# virtual methods
.method public getCachedSize()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->cachedSize:I

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->getSerializedSize()I

    :cond_0
    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->cachedSize:I

    return v0
.end method

.method public getClientVersion()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->clientVersion_:I

    return v0
.end method

.method public getCloudVersion()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->cloudVersion_:I

    return v0
.end method

.method public getDots()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->dots_:I

    return v0
.end method

.method public getFetchBucket()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->fetchBucket_:Z

    return v0
.end method

.method public getSerializedSize()I
    .locals 3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasFetchBucket()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->getFetchBucket()Z

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeBoolSize(IZ)I

    move-result v0

    add-int/2addr v1, v0

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasClientVersion()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->getClientVersion()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasCloudVersion()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->getCloudVersion()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasDots()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->getDots()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_3
    iput v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->cachedSize:I

    return v1
.end method

.method public hasClientVersion()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasClientVersion:Z

    return v0
.end method

.method public hasCloudVersion()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasCloudVersion:Z

    return v0
.end method

.method public hasDots()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasDots:Z

    return v0
.end method

.method public hasFetchBucket()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasFetchBucket:Z

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/google/protobuf/micro/MessageMicro;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    move-result-object p1

    return-object p1
.end method

.method public mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;
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

    if-eqz v0, :cond_5

    const/16 v1, 0x8

    if-eq v0, v1, :cond_4

    const/16 v1, 0x18

    if-eq v0, v1, :cond_3

    const/16 v1, 0x20

    if-eq v0, v1, :cond_2

    const/16 v1, 0x28

    if-eq v0, v1, :cond_1

    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->parseUnknownField(Lcom/google/protobuf/micro/CodedInputStreamMicro;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_1
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->setDots(I)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->setCloudVersion(I)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->setClientVersion(I)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readBool()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->setFetchBucket(Z)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    goto :goto_0

    :cond_5
    return-object p0
.end method

.method public setClientVersion(I)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasClientVersion:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->clientVersion_:I

    return-object p0
.end method

.method public setCloudVersion(I)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasCloudVersion:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->cloudVersion_:I

    return-object p0
.end method

.method public setDots(I)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasDots:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->dots_:I

    return-object p0
.end method

.method public setFetchBucket(Z)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasFetchBucket:Z

    iput-boolean p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->fetchBucket_:Z

    return-object p0
.end method

.method public writeTo(Lcom/google/protobuf/micro/CodedOutputStreamMicro;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasFetchBucket()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->getFetchBucket()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeBool(IZ)V

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasClientVersion()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->getClientVersion()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasCloudVersion()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->getCloudVersion()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasDots()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->getDots()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_3
    return-void
.end method
