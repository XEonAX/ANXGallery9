.class public Lcom/miui/gallery/model/DiscoveryMessage;
.super Ljava/lang/Object;
.source "DiscoveryMessage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;,
        Lcom/miui/gallery/model/DiscoveryMessage$Builder;
    }
.end annotation


# instance fields
.field private isConsumed:Z

.field private mActionUri:Ljava/lang/String;

.field private mExpireTime:J

.field private mMessage:Ljava/lang/String;

.field private mMessageDetail:Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;

.field private mMessageId:J

.field private mMessageSource:Ljava/lang/String;

.field private mPriority:I

.field private mReceiveTime:J

.field private mSubTitle:Ljava/lang/String;

.field private mTitle:Ljava/lang/String;

.field private mTriggerTime:J

.field private mType:I

.field private mUpdateTime:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)V
    .locals 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$000(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mMessageId:J

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$100(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mMessage:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$200(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mTitle:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$300(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mSubTitle:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$400(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mType:I

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$500(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mPriority:I

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$600(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$600(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mReceiveTime:J

    goto :goto_0

    :cond_0
    iput-wide v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mReceiveTime:J

    :goto_0
    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$700(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)J

    move-result-wide v2

    cmp-long v6, v2, v4

    if-eqz v6, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$700(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mUpdateTime:J

    goto :goto_1

    :cond_1
    iput-wide v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mUpdateTime:J

    :goto_1
    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$700(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)J

    move-result-wide v2

    cmp-long v6, v2, v4

    if-eqz v6, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$800(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mTriggerTime:J

    goto :goto_2

    :cond_2
    iput-wide v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mTriggerTime:J

    :goto_2
    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$700(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)J

    move-result-wide v2

    cmp-long v6, v2, v4

    if-eqz v6, :cond_3

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$900(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mExpireTime:J

    goto :goto_3

    :cond_3
    iput-wide v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mExpireTime:J

    :goto_3
    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$1000(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->isConsumed:Z

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$1100(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mActionUri:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$1200(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mMessageSource:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/model/DiscoveryMessage$Builder;->access$1300(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mMessageDetail:Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/model/DiscoveryMessage$Builder;Lcom/miui/gallery/model/DiscoveryMessage$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/model/DiscoveryMessage;-><init>(Lcom/miui/gallery/model/DiscoveryMessage$Builder;)V

    return-void
.end method


# virtual methods
.method public getActionUri()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mActionUri:Ljava/lang/String;

    return-object v0
.end method

.method public getExpireTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mExpireTime:J

    return-wide v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageDetail()Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mMessageDetail:Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;

    return-object v0
.end method

.method public getMessageId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mMessageId:J

    return-wide v0
.end method

.method public getMessageSource()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mMessageSource:Ljava/lang/String;

    return-object v0
.end method

.method public getPriority()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mPriority:I

    return v0
.end method

.method public getReceiveTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mReceiveTime:J

    return-wide v0
.end method

.method public getSubTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mSubTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getTriggerTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mTriggerTime:J

    return-wide v0
.end method

.method public getType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mType:I

    return v0
.end method

.method public getUpdateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mUpdateTime:J

    return-wide v0
.end method

.method public isConsumed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/model/DiscoveryMessage;->isConsumed:Z

    return v0
.end method

.method public setConsumed(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/model/DiscoveryMessage;->isConsumed:Z

    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mMessage:Ljava/lang/String;

    return-void
.end method

.method public setMessageDetail(Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/DiscoveryMessage;->mMessageDetail:Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;

    return-void
.end method
