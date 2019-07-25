.class public final Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
.super Lcom/google/protobuf/micro/MessageMicro;
.source "ChannelMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/protobuf/ChannelMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ClientHeader"
.end annotation


# instance fields
.field private cachedSize:I

.field private chid_:I

.field private cipher_:I

.field private cmd_:Ljava/lang/String;

.field private dirFlag_:I

.field private errCode_:I

.field private errStr_:Ljava/lang/String;

.field private hasChid:Z

.field private hasCipher:Z

.field private hasCmd:Z

.field private hasDirFlag:Z

.field private hasErrCode:Z

.field private hasErrStr:Z

.field private hasId:Z

.field private hasResource:Z

.field private hasServer:Z

.field private hasSubcmd:Z

.field private hasUuid:Z

.field private id_:Ljava/lang/String;

.field private resource_:Ljava/lang/String;

.field private server_:Ljava/lang/String;

.field private subcmd_:Ljava/lang/String;

.field private uuid_:J


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/google/protobuf/micro/MessageMicro;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->chid_:I

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->uuid_:J

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->server_:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->resource_:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->cmd_:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->subcmd_:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->id_:Ljava/lang/String;

    const/4 v1, 0x1

    iput v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->dirFlag_:I

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->cipher_:I

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->errCode_:I

    const-string v0, ""

    iput-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->errStr_:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->cachedSize:I

    return-void
.end method


# virtual methods
.method public clearSubcmd()Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasSubcmd:Z

    const-string v0, ""

    iput-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->subcmd_:Ljava/lang/String;

    return-object p0
.end method

.method public getCachedSize()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->cachedSize:I

    if-gez v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getSerializedSize()I

    :cond_0
    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->cachedSize:I

    return v0
.end method

.method public getChid()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->chid_:I

    return v0
.end method

.method public getCipher()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->cipher_:I

    return v0
.end method

.method public getCmd()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->cmd_:Ljava/lang/String;

    return-object v0
.end method

.method public getDirFlag()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->dirFlag_:I

    return v0
.end method

.method public getErrCode()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->errCode_:I

    return v0
.end method

.method public getErrStr()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->errStr_:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->id_:Ljava/lang/String;

    return-object v0
.end method

.method public getResource()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->resource_:Ljava/lang/String;

    return-object v0
.end method

.method public getSerializedSize()I
    .locals 4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasChid()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getChid()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasUuid()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getUuid()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt64Size(IJ)I

    move-result v0

    add-int/2addr v1, v0

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasServer()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getServer()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasResource()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getResource()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasCmd()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCmd()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasSubcmd()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x6

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getSubcmd()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasId()Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x7

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasDirFlag()Z

    move-result v0

    if-eqz v0, :cond_7

    const/16 v0, 0x8

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getDirFlag()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_7
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasCipher()Z

    move-result v0

    if-eqz v0, :cond_8

    const/16 v0, 0x9

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCipher()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_8
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasErrCode()Z

    move-result v0

    if-eqz v0, :cond_9

    const/16 v0, 0xa

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getErrCode()I

    move-result v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeInt32Size(II)I

    move-result v0

    add-int/2addr v1, v0

    :cond_9
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasErrStr()Z

    move-result v0

    if-eqz v0, :cond_a

    const/16 v0, 0xb

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getErrStr()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->computeStringSize(ILjava/lang/String;)I

    move-result v0

    add-int/2addr v1, v0

    :cond_a
    iput v1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->cachedSize:I

    return v1
.end method

.method public getServer()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->server_:Ljava/lang/String;

    return-object v0
.end method

.method public getSubcmd()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->subcmd_:Ljava/lang/String;

    return-object v0
.end method

.method public getUuid()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->uuid_:J

    return-wide v0
.end method

.method public hasChid()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasChid:Z

    return v0
.end method

.method public hasCipher()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasCipher:Z

    return v0
.end method

.method public hasCmd()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasCmd:Z

    return v0
.end method

.method public hasDirFlag()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasDirFlag:Z

    return v0
.end method

.method public hasErrCode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasErrCode:Z

    return v0
.end method

.method public hasErrStr()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasErrStr:Z

    return v0
.end method

.method public hasId()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasId:Z

    return v0
.end method

.method public hasResource()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasResource:Z

    return v0
.end method

.method public hasServer()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasServer:Z

    return v0
.end method

.method public hasSubcmd()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasSubcmd:Z

    return v0
.end method

.method public hasUuid()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasUuid:Z

    return v0
.end method

.method public bridge synthetic mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/google/protobuf/micro/MessageMicro;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    move-result-object p1

    return-object p1
.end method

.method public mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
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

    sparse-switch v0, :sswitch_data_0

    invoke-virtual {p0, p1, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->parseUnknownField(Lcom/google/protobuf/micro/CodedInputStreamMicro;I)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p0

    :sswitch_0
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setErrStr(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setErrCode(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setCipher(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_3
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setDirFlag(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setId(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_5
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setSubcmd(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setCmd(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setResource(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setServer(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt64()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setUuid(J)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_a
    invoke-virtual {p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->setChid(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;

    goto :goto_0

    :sswitch_b
    return-object p0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0x8 -> :sswitch_a
        0x10 -> :sswitch_9
        0x1a -> :sswitch_8
        0x22 -> :sswitch_7
        0x2a -> :sswitch_6
        0x32 -> :sswitch_5
        0x3a -> :sswitch_4
        0x40 -> :sswitch_3
        0x48 -> :sswitch_2
        0x50 -> :sswitch_1
        0x5a -> :sswitch_0
    .end sparse-switch
.end method

.method public setChid(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasChid:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->chid_:I

    return-object p0
.end method

.method public setCipher(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasCipher:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->cipher_:I

    return-object p0
.end method

.method public setCmd(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasCmd:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->cmd_:Ljava/lang/String;

    return-object p0
.end method

.method public setDirFlag(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasDirFlag:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->dirFlag_:I

    return-object p0
.end method

.method public setErrCode(I)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasErrCode:Z

    iput p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->errCode_:I

    return-object p0
.end method

.method public setErrStr(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasErrStr:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->errStr_:Ljava/lang/String;

    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasId:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->id_:Ljava/lang/String;

    return-object p0
.end method

.method public setResource(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasResource:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->resource_:Ljava/lang/String;

    return-object p0
.end method

.method public setServer(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasServer:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->server_:Ljava/lang/String;

    return-object p0
.end method

.method public setSubcmd(Ljava/lang/String;)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasSubcmd:Z

    iput-object p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->subcmd_:Ljava/lang/String;

    return-object p0
.end method

.method public setUuid(J)Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasUuid:Z

    iput-wide p1, p0, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->uuid_:J

    return-object p0
.end method

.method public writeTo(Lcom/google/protobuf/micro/CodedOutputStreamMicro;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasChid()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getChid()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasUuid()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getUuid()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt64(IJ)V

    :cond_1
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasServer()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getServer()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_2
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasResource()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getResource()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_3
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasCmd()Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCmd()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_4
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasSubcmd()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x6

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getSubcmd()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_5
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasId()Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 v0, 0x7

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_6
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasDirFlag()Z

    move-result v0

    if-eqz v0, :cond_7

    const/16 v0, 0x8

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getDirFlag()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_7
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasCipher()Z

    move-result v0

    if-eqz v0, :cond_8

    const/16 v0, 0x9

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getCipher()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_8
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasErrCode()Z

    move-result v0

    if-eqz v0, :cond_9

    const/16 v0, 0xa

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getErrCode()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeInt32(II)V

    :cond_9
    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->hasErrStr()Z

    move-result v0

    if-eqz v0, :cond_a

    const/16 v0, 0xb

    invoke-virtual {p0}, Lcom/xiaomi/push/protobuf/ChannelMessage$ClientHeader;->getErrStr()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/micro/CodedOutputStreamMicro;->writeString(ILjava/lang/String;)V

    :cond_a
    return-void
.end method
