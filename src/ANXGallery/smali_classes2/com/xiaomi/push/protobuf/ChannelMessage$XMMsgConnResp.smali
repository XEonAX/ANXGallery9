.class public final Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;
.super Lcom/google/protobuf/micro/MessageMicro;
.source "ChannelMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/protobuf/ChannelMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "XMMsgConnResp"
.end annotation


# instance fields
.field private cachedSize:I

.field private challenge_:Ljava/lang/String;

.field private hasChallenge:Z

.field private hasHost:Z

.field private hasPsc:Z

.field private host_:Ljava/lang/String;

.field private psc_:Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/google/protobuf/micro/MessageMicro;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->challenge_:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->host_:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->psc_:Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    const/4 v0, -0x1

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->cachedSize:I

    return-void
.end method

.method public static parseFrom([B)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;
        }
    .end annotation

    new-instance v0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;

    invoke-direct {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;-><init>()V

    invoke-virtual {v0, p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->mergeFrom([B)Lcom/google/protobuf/micro/MessageMicro;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;

    return-object p0
.end method


# virtual methods
.method public getCachedSize()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->cachedSize:I

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->getSerializedSize()I

    :cond_0
    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->cachedSize:I

    return v0
.end method

.method public getChallenge()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->challenge_:Ljava/lang/String;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->host_:Ljava/lang/String;

    return-object v0
.end method

.method public getPsc()Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->psc_:Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasChallenge()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->getChallenge()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasHost()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasPsc()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->getPsc()Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeMessageSize(ILcom/google/protobuf/micro/MessageMicro;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_2
    iput v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->cachedSize:I

    return v1
.end method

.method public hasChallenge()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasChallenge:Z

    return v0
.end method

.method public hasHost()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasHost:Z

    return v0
.end method

.method public hasPsc()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasPsc:Z

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/google/protobuf/micro/MessageMicro;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;

    move-result-object p1

    return-object p1
.end method

.method public mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;
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

    if-eqz v0, :cond_4

    const/16 v1, 0xa

    if-eq v0, v1, :cond_3

    const/16 v1, 0x12

    if-eq v0, v1, :cond_2

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_1

    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->parseUnknownField(Lcom/google/protobuf/micro/CodedInputStreamMicro;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :cond_1
    new-instance v0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    invoke-direct {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;-><init>()V

    invoke-virtual {p1, v0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readMessage(Lcom/google/protobuf/micro/MessageMicro;)V

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->setPsc(Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->setHost(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->setChallenge(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;

    goto :goto_0

    :cond_4
    return-object p0
.end method

.method public setChallenge(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasChallenge:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->challenge_:Ljava/lang/String;

    return-object p0
.end method

.method public setHost(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasHost:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->host_:Ljava/lang/String;

    return-object p0
.end method

.method public setPsc(Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;)Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasPsc:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->psc_:Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    invoke-direct {p1}, Ljava/lang/NullPointerException;-><init>()V

    throw p1
.end method

.method public writeTo(Lcom/google/protobuf/micro/CodedOutputStreamMicro;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasChallenge()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->getChallenge()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasHost()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->hasPsc()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$XMMsgConnResp;->getPsc()Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeMessage(ILcom/google/protobuf/micro/MessageMicro;)V

    :cond_2
    return-void
.end method
