.class public final Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;
.super Lcom/google/protobuf/micro/MessageMicro;
.source "ChannelConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/protobuf/ChannelConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "PushServiceConfig"
.end annotation


# instance fields
.field private cachedSize:I

.field private configVersion_:I

.field private connectTimeoutMs_:I

.field private enableDynamicPing_:Z

.field private hasConfigVersion:Z

.field private hasConnectTimeoutMs:Z

.field private hasEnableDynamicPing:Z

.field private hasUseBucketV2:Z

.field private testHosts_:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private useBucketV2_:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/micro/MessageMicro;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->configVersion_:I

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->useBucketV2_:Z

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->connectTimeoutMs_:I

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->enableDynamicPing_:Z

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->testHosts_:Ljava/util/List;

    const/4 v0, -0x1

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->cachedSize:I

    return-void
.end method

.method public static parseFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance v0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;

    invoke-direct {v0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;-><init>()V

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;

    move-result-object p0

    return-object p0
.end method

.method public static parseFrom([B)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;
        }
    .end annotation

    new-instance v0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;

    invoke-direct {v0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;-><init>()V

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->mergeFrom([B)Lcom/google/protobuf/micro/MessageMicro;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;

    return-object p0
.end method


# virtual methods
.method public addTestHosts(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;
    .locals 1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->testHosts_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->testHosts_:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->testHosts_:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0

    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method public getCachedSize()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->cachedSize:I

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getSerializedSize()I

    :cond_0
    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->cachedSize:I

    return v0
.end method

.method public getConfigVersion()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->configVersion_:I

    return v0
.end method

.method public getConnectTimeoutMs()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->connectTimeoutMs_:I

    return v0
.end method

.method public getEnableDynamicPing()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->enableDynamicPing_:Z

    return v0
.end method

.method public getSerializedSize()I
    .locals 5

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasConfigVersion()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getConfigVersion()I

    move-result v0

    invoke-static {v1, v0}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeUInt32Size(II)I

    move-result v0

    add-int/2addr v0, v2

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasUseBucketV2()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getUseBucketV2()Z

    move-result v4

    invoke-static {v3, v4}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeBoolSize(IZ)I

    move-result v3

    add-int/2addr v0, v3

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasConnectTimeoutMs()Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v3, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getConnectTimeoutMs()I

    move-result v4

    invoke-static {v3, v4}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v3

    add-int/2addr v0, v3

    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasEnableDynamicPing()Z

    move-result v3

    if-eqz v3, :cond_3

    const/4 v3, 0x4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getEnableDynamicPing()Z

    move-result v4

    invoke-static {v3, v4}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeBoolSize(IZ)I

    move-result v3

    add-int/2addr v0, v3

    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getTestHostsList()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSizeNoTag(Ljava/lang/String;)I

    move-result v4

    add-int/2addr v2, v4

    goto :goto_1

    :cond_4
    add-int/2addr v0, v2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getTestHostsList()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    mul-int/lit8 v2, v2, 0x1

    add-int/2addr v0, v2

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->cachedSize:I

    return v0
.end method

.method public getTestHostsCount()I
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->testHosts_:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getTestHostsList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->testHosts_:Ljava/util/List;

    return-object v0
.end method

.method public getUseBucketV2()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->useBucketV2_:Z

    return v0
.end method

.method public hasConfigVersion()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasConfigVersion:Z

    return v0
.end method

.method public hasConnectTimeoutMs()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasConnectTimeoutMs:Z

    return v0
.end method

.method public hasEnableDynamicPing()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasEnableDynamicPing:Z

    return v0
.end method

.method public hasUseBucketV2()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasUseBucketV2:Z

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/google/protobuf/micro/MessageMicro;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;

    move-result-object p1

    return-object p1
.end method

.method public mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;
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

    if-eqz v0, :cond_6

    const/16 v1, 0x8

    if-eq v0, v1, :cond_5

    const/16 v1, 0x10

    if-eq v0, v1, :cond_4

    const/16 v1, 0x18

    if-eq v0, v1, :cond_3

    const/16 v1, 0x20

    if-eq v0, v1, :cond_2

    const/16 v1, 0x2a

    if-eq v0, v1, :cond_1

    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->parseUnknownField(Lcom/google/protobuf/micro/CodedInputStreamMicro;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_1
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->addTestHosts(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readBool()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->setEnableDynamicPing(Z)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->setConnectTimeoutMs(I)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readBool()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->setUseBucketV2(Z)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;

    goto :goto_0

    :cond_5
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readUInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->setConfigVersion(I)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;

    goto :goto_0

    :cond_6
    return-object p0
.end method

.method public setConfigVersion(I)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasConfigVersion:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->configVersion_:I

    return-object p0
.end method

.method public setConnectTimeoutMs(I)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasConnectTimeoutMs:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->connectTimeoutMs_:I

    return-object p0
.end method

.method public setEnableDynamicPing(Z)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasEnableDynamicPing:Z

    iput-boolean p1, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->enableDynamicPing_:Z

    return-object p0
.end method

.method public setUseBucketV2(Z)Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasUseBucketV2:Z

    iput-boolean p1, p0, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->useBucketV2_:Z

    return-object p0
.end method

.method public writeTo(Lcom/google/protobuf/micro/CodedOutputStreamMicro;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasConfigVersion()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getConfigVersion()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeUInt32(II)V

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasUseBucketV2()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getUseBucketV2()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeBool(IZ)V

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasConnectTimeoutMs()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getConnectTimeoutMs()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->hasEnableDynamicPing()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getEnableDynamicPing()Z

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeBool(IZ)V

    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelConfig$PushServiceConfig;->getTestHostsList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x5

    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    goto :goto_0

    :cond_4
    return-void
.end method
