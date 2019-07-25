.class public Lcom/miui/gallery/card/Card$Builder;
.super Ljava/lang/Object;
.source "Card.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/Card;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mAllMediaSha1s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mBaseColor:I

.field private final mContext:Landroid/content/Context;

.field private mCoverMediaFeatureItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation
.end field

.field private mCreateBy:I

.field private mCreateTime:J

.field private mDeletable:Z

.field private mDescription:Ljava/lang/String;

.field private mDetailUrl:Ljava/lang/String;

.field private mImageResId:I

.field private mImageUri:Landroid/net/Uri;

.field private mIsIgnored:Z

.field private mIsSyncable:Z

.field private mIsTop:Z

.field private mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

.field private mScenarioId:I

.field private mSelectedMediaSha1s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mServerId:Ljava/lang/String;

.field private mServerTag:J

.field private mTitle:Ljava/lang/String;

.field private mType:I

.field private mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

.field private mUpdateTime:J

.field private mValidEndTime:J

.field private mValidStartTime:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/card/Card$Builder;->mDeletable:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/card/Card$Builder;->mType:I

    iput-boolean v1, p0, Lcom/miui/gallery/card/Card$Builder;->mIsIgnored:Z

    iput-boolean v0, p0, Lcom/miui/gallery/card/Card$Builder;->mIsSyncable:Z

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/miui/gallery/card/Card$Builder;->mValidStartTime:J

    const-wide v2, 0x7fffffffffffffffL

    iput-wide v2, p0, Lcom/miui/gallery/card/Card$Builder;->mValidEndTime:J

    iput-boolean v1, p0, Lcom/miui/gallery/card/Card$Builder;->mIsTop:Z

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public build()Lcom/miui/gallery/card/Card;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/card/Card$Builder;->mTitle:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Card"

    const-string v1, "the title must not be empty."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    new-instance v0, Lcom/miui/gallery/card/Card;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/card/Card;-><init>(Lcom/miui/gallery/card/Card$1;)V

    iget-object v2, p0, Lcom/miui/gallery/card/Card$Builder;->mTitle:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/miui/gallery/card/Card;->access$102(Lcom/miui/gallery/card/Card;Ljava/lang/String;)Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/card/Card$Builder;->mDescription:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/miui/gallery/card/Card;->access$202(Lcom/miui/gallery/card/Card;Ljava/lang/String;)Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/card/Card$Builder;->mDetailUrl:Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/miui/gallery/card/Card;->access$302(Lcom/miui/gallery/card/Card;Ljava/lang/String;)Ljava/lang/String;

    iget-boolean v2, p0, Lcom/miui/gallery/card/Card$Builder;->mDeletable:Z

    invoke-static {v0, v2}, Lcom/miui/gallery/card/Card;->access$402(Lcom/miui/gallery/card/Card;Z)Z

    iget v2, p0, Lcom/miui/gallery/card/Card$Builder;->mBaseColor:I

    invoke-static {v0, v2}, Lcom/miui/gallery/card/Card;->access$502(Lcom/miui/gallery/card/Card;I)I

    iget-object v2, p0, Lcom/miui/gallery/card/Card$Builder;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    invoke-static {v0, v2}, Lcom/miui/gallery/card/Card;->access$602(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/card/scenario/Record$UniqueKey;)Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    iget-object v2, p0, Lcom/miui/gallery/card/Card$Builder;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    invoke-static {v0, v2}, Lcom/miui/gallery/card/Card;->access$702(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;)Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    iget-object v2, p0, Lcom/miui/gallery/card/Card$Builder;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/card/Card$Builder;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;->getUrl()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_1
    const-string v2, ""

    :goto_0
    invoke-static {v0, v2}, Lcom/miui/gallery/card/Card;->access$802(Lcom/miui/gallery/card/Card;Ljava/lang/String;)Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/card/Card$Builder;->mImageUri:Landroid/net/Uri;

    if-eqz v2, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/card/Card$Builder;->mImageUri:Landroid/net/Uri;

    invoke-static {v1}, Lcom/miui/gallery/card/Card;->access$1000(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v1

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/card/Card$Builder;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    if-eqz v2, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/card/Card$Builder;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;->getBackgroundUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :cond_3
    :goto_1
    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$902(Lcom/miui/gallery/card/Card;Landroid/net/Uri;)Landroid/net/Uri;

    iget-object v1, p0, Lcom/miui/gallery/card/Card$Builder;->mAllMediaSha1s:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$1102(Lcom/miui/gallery/card/Card;Ljava/util/List;)Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/card/Card$Builder;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$1202(Lcom/miui/gallery/card/Card;Ljava/util/List;)Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/card/Card$Builder;->mCoverMediaFeatureItems:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$1302(Lcom/miui/gallery/card/Card;Ljava/util/List;)Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/card/Card$Builder;->mScenarioId:I

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$1402(Lcom/miui/gallery/card/Card;I)I

    iget-object v1, p0, Lcom/miui/gallery/card/Card$Builder;->mServerId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$1502(Lcom/miui/gallery/card/Card;Ljava/lang/String;)Ljava/lang/String;

    iget-wide v1, p0, Lcom/miui/gallery/card/Card$Builder;->mServerTag:J

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->access$1602(Lcom/miui/gallery/card/Card;J)J

    iget v1, p0, Lcom/miui/gallery/card/Card$Builder;->mCreateBy:I

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$1702(Lcom/miui/gallery/card/Card;I)I

    iget-wide v1, p0, Lcom/miui/gallery/card/Card$Builder;->mCreateTime:J

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->access$1802(Lcom/miui/gallery/card/Card;J)J

    iget-wide v1, p0, Lcom/miui/gallery/card/Card$Builder;->mUpdateTime:J

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->access$1902(Lcom/miui/gallery/card/Card;J)J

    iget-boolean v1, p0, Lcom/miui/gallery/card/Card$Builder;->mIsIgnored:Z

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$2002(Lcom/miui/gallery/card/Card;Z)Z

    iget-boolean v1, p0, Lcom/miui/gallery/card/Card$Builder;->mIsSyncable:Z

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$2102(Lcom/miui/gallery/card/Card;Z)Z

    iget-wide v1, p0, Lcom/miui/gallery/card/Card$Builder;->mValidStartTime:J

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->access$2202(Lcom/miui/gallery/card/Card;J)J

    iget-wide v1, p0, Lcom/miui/gallery/card/Card$Builder;->mValidEndTime:J

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->access$2302(Lcom/miui/gallery/card/Card;J)J

    iget-boolean v1, p0, Lcom/miui/gallery/card/Card$Builder;->mIsTop:Z

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$2402(Lcom/miui/gallery/card/Card;Z)Z

    iget v1, p0, Lcom/miui/gallery/card/Card$Builder;->mImageResId:I

    if-lez v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/card/Card$Builder;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/miui/gallery/card/Card$Builder;->mImageResId:I

    invoke-static {v1, v2}, Lcom/miui/gallery/card/Card;->convertResIdToUri(Landroid/content/Context;I)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$902(Lcom/miui/gallery/card/Card;Landroid/net/Uri;)Landroid/net/Uri;

    :cond_4
    iget v1, p0, Lcom/miui/gallery/card/Card$Builder;->mType:I

    invoke-static {v0, v1}, Lcom/miui/gallery/card/Card;->access$2502(Lcom/miui/gallery/card/Card;I)I

    return-object v0
.end method

.method public setAllMediaSha1s(Ljava/util/List;)Lcom/miui/gallery/card/Card$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/card/Card$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mAllMediaSha1s:Ljava/util/List;

    return-object p0
.end method

.method public setCoverMediaFeatureItems(Ljava/util/List;)Lcom/miui/gallery/card/Card$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;)",
            "Lcom/miui/gallery/card/Card$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mCoverMediaFeatureItems:Ljava/util/List;

    return-object p0
.end method

.method public setCreateBy(I)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card$Builder;->mCreateBy:I

    return-object p0
.end method

.method public setCreateTime(J)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card$Builder;->mCreateTime:J

    return-object p0
.end method

.method public setDeletable(Z)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/Card$Builder;->mDeletable:Z

    return-object p0
.end method

.method public setDescription(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mDescription:Ljava/lang/String;

    return-object p0
.end method

.method public setDetailUrl(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mDetailUrl:Ljava/lang/String;

    return-object p0
.end method

.method public setImageUri(Landroid/net/Uri;)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mImageUri:Landroid/net/Uri;

    return-object p0
.end method

.method public setIsIgnored(Z)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/Card$Builder;->mIsIgnored:Z

    return-object p0
.end method

.method public setOperationInfo(Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    return-object p0
.end method

.method public setScenarioId(I)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card$Builder;->mScenarioId:I

    return-object p0
.end method

.method public setSelectedMediaSha1s(Ljava/util/List;)Lcom/miui/gallery/card/Card$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/card/Card$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mSelectedMediaSha1s:Ljava/util/List;

    return-object p0
.end method

.method public setServerId(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mServerId:Ljava/lang/String;

    return-object p0
.end method

.method public setServerTag(J)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card$Builder;->mServerTag:J

    return-object p0
.end method

.method public setSyncable(Z)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/Card$Builder;->mIsSyncable:Z

    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mTitle:Ljava/lang/String;

    return-object p0
.end method

.method public setTop(Z)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/Card$Builder;->mIsTop:Z

    return-object p0
.end method

.method public setType(I)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card$Builder;->mType:I

    return-object p0
.end method

.method public setUniqueKey(Lcom/miui/gallery/card/scenario/Record$UniqueKey;)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card$Builder;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    return-object p0
.end method

.method public setUpdateTime(J)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card$Builder;->mUpdateTime:J

    return-object p0
.end method

.method public setValidEndTime(J)Lcom/miui/gallery/card/Card$Builder;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_0

    const-wide p1, 0x7fffffffffffffffL

    :cond_0
    iput-wide p1, p0, Lcom/miui/gallery/card/Card$Builder;->mValidEndTime:J

    return-object p0
.end method

.method public setValidStartTime(J)Lcom/miui/gallery/card/Card$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card$Builder;->mValidStartTime:J

    return-object p0
.end method
