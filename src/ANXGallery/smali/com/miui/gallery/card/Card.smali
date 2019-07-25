.class public Lcom/miui/gallery/card/Card;
.super Lcom/miui/gallery/dao/base/Entity;
.source "Card.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/Card$CardExtraInfo;,
        Lcom/miui/gallery/card/Card$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/dao/base/Entity;",
        "Ljava/lang/Comparable<",
        "Lcom/miui/gallery/card/Card;",
        ">;"
    }
.end annotation


# static fields
.field public static final BASE_UI_CARD_SELECTION:Ljava/lang/String;

.field public static final BASE_UNSYNC_CARD_SELECTION:Ljava/lang/String;


# instance fields
.field private mActionUrl:Ljava/lang/String;

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

.field private mDescription:Ljava/lang/String;

.field private mDetailUrl:Ljava/lang/String;

.field private mExtras:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mImageResId:I

.field private mImageUri:Landroid/net/Uri;

.field private mIsDeletable:Z

.field private mIsIgnored:Z

.field private mIsSyncable:Z

.field private mIsTop:Z

.field private mLocalFlag:I

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
.method static constructor <clinit>()V
    .locals 9

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ignored = 0 AND localFlag NOT IN (1,-2,-1,4) AND ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "%s > %s AND %s < %s"

    const/4 v2, 0x4

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "validStart"

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v7, 0x2

    aput-object v4, v3, v7

    const-string v4, "validEnd"

    const/4 v8, 0x3

    aput-object v4, v3, v8

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " OR "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "type"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "<>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/card/Card;->BASE_UI_CARD_SELECTION:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ignored = 0 AND syncable = 1 AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "%s = %s OR %s = %s OR %s = %s"

    const/4 v3, 0x6

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "localFlag"

    aput-object v4, v3, v5

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    const-string v4, "localFlag"

    aput-object v4, v3, v7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v8

    const-string v4, "localFlag"

    aput-object v4, v3, v2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x5

    aput-object v2, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/card/Card;->BASE_UNSYNC_CARD_SELECTION:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/card/Card;->mImageResId:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/card/Card$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/Card;-><init>()V

    return-void
.end method

.method static synthetic access$1000(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/card/Card;->decodeUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/card/Card;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1102(Lcom/miui/gallery/card/Card;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$1202(Lcom/miui/gallery/card/Card;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$1302(Lcom/miui/gallery/card/Card;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$1402(Lcom/miui/gallery/card/Card;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card;->mScenarioId:I

    return p1
.end method

.method static synthetic access$1502(Lcom/miui/gallery/card/Card;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mServerId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1602(Lcom/miui/gallery/card/Card;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card;->mServerTag:J

    return-wide p1
.end method

.method static synthetic access$1702(Lcom/miui/gallery/card/Card;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card;->mCreateBy:I

    return p1
.end method

.method static synthetic access$1802(Lcom/miui/gallery/card/Card;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card;->mCreateTime:J

    return-wide p1
.end method

.method static synthetic access$1902(Lcom/miui/gallery/card/Card;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card;->mUpdateTime:J

    return-wide p1
.end method

.method static synthetic access$2002(Lcom/miui/gallery/card/Card;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/Card;->mIsIgnored:Z

    return p1
.end method

.method static synthetic access$202(Lcom/miui/gallery/card/Card;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mDescription:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2102(Lcom/miui/gallery/card/Card;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/Card;->mIsSyncable:Z

    return p1
.end method

.method static synthetic access$2202(Lcom/miui/gallery/card/Card;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card;->mValidStartTime:J

    return-wide p1
.end method

.method static synthetic access$2302(Lcom/miui/gallery/card/Card;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card;->mValidEndTime:J

    return-wide p1
.end method

.method static synthetic access$2402(Lcom/miui/gallery/card/Card;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/Card;->mIsTop:Z

    return p1
.end method

.method static synthetic access$2502(Lcom/miui/gallery/card/Card;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card;->mType:I

    return p1
.end method

.method static synthetic access$302(Lcom/miui/gallery/card/Card;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mDetailUrl:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$402(Lcom/miui/gallery/card/Card;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/Card;->mIsDeletable:Z

    return p1
.end method

.method static synthetic access$502(Lcom/miui/gallery/card/Card;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card;->mBaseColor:I

    return p1
.end method

.method static synthetic access$602(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/card/scenario/Record$UniqueKey;)Lcom/miui/gallery/card/scenario/Record$UniqueKey;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    return-object p1
.end method

.method static synthetic access$702(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;)Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    return-object p1
.end method

.method static synthetic access$802(Lcom/miui/gallery/card/Card;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mActionUrl:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$902(Lcom/miui/gallery/card/Card;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mImageUri:Landroid/net/Uri;

    return-object p1
.end method

.method public static convertResIdToUri(Landroid/content/Context;I)Landroid/net/Uri;
    .locals 3

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "%s://%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const/4 v0, 0x1

    aput-object p0, v1, v0

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static convertUriToResId(Landroid/content/Context;Landroid/net/Uri;)I
    .locals 5

    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const-string v2, "%s/%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object p1, v3, v0

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private static decodeUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 0

    if-nez p0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method private getExtra(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mExtras:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mExtras:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private static mapToString(Ljava/util/HashMap;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v1, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v1, "Card"

    const-string v2, "mapToString occur error.\n"

    invoke-static {v1, v2, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method private parseStyles(Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Lcom/miui/gallery/card/Card;->stringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string v0, "baseColor"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/card/Card;->stringToInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/card/Card;->mBaseColor:I

    return-void
.end method

.method private putExtra(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mExtras:Ljava/util/HashMap;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mExtras:Ljava/util/HashMap;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mExtras:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setType(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card;->mType:I

    return-void
.end method

.method private static stringToInt(Ljava/lang/String;)I
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p0

    const-string v1, "Card"

    const-string v2, "stringToInt occur error.\n"

    invoke-static {v1, v2, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v0
.end method

.method private static stringToMap(Ljava/lang/String;)Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    new-instance v1, Lcom/miui/gallery/card/Card$1;

    invoke-direct {v1}, Lcom/miui/gallery/card/Card$1;-><init>()V

    invoke-virtual {v1}, Lcom/miui/gallery/card/Card$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v2, p0, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/HashMap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v1, "Card"

    const-string v2, "stringToMap occur error.\n"

    invoke-static {v1, v2, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method private wrapStyles()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "baseColor"

    iget v2, p0, Lcom/miui/gallery/card/Card;->mBaseColor:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Lcom/miui/gallery/card/Card;->mapToString(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public compareTo(Lcom/miui/gallery/card/Card;)I
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsTop:Z

    iget-boolean v1, p1, Lcom/miui/gallery/card/Card;->mIsTop:Z

    invoke-static {v0, v1}, Ljava/lang/Boolean;->compare(ZZ)I

    move-result v0

    neg-int v0, v0

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/card/Card;->mCreateTime:J

    iget-wide v2, p1, Lcom/miui/gallery/card/Card;->mCreateTime:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Long;->compare(JJ)I

    move-result p1

    neg-int p1, p1

    return p1

    :cond_0
    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/card/Card;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/Card;->compareTo(Lcom/miui/gallery/card/Card;)I

    move-result p1

    return p1
.end method

.method declared-synchronized copyFrom(Lcom/miui/gallery/card/Card;)V
    .locals 2

    monitor-enter p0

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getTitle()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mTitle:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getDescription()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mDescription:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getActionUrl()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mActionUrl:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getDetailUrl()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mDetailUrl:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getImageUri()Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mImageUri:Landroid/net/Uri;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getCreateTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/Card;->mCreateTime:J

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->isDeletable()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsDeletable:Z

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getType()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/Card;->mType:I

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getOperationInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getAllMediaSha1s()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getSelectedMediaSha1s()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getCoverMediaFeatureItems()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->getImageResId(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/Card;->mImageResId:I

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getBaseColor()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/Card;->mBaseColor:I

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getScenarioId()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/Card;->mScenarioId:I

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getServerId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mServerId:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getServerTag()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/Card;->mServerTag:J

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getLocalFlag()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/Card;->mLocalFlag:I

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getUpdateTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/Card;->mUpdateTime:J

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getCreateBy()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/Card;->mCreateBy:I

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->isIgnored()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsIgnored:Z

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->isSyncable()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsSyncable:Z

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getValidStartTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/Card;->mValidStartTime:J

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getValidEndTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/Card;->mValidEndTime:J

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->isTop()Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/card/Card;->mIsTop:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :cond_0
    :goto_0
    monitor-exit p0

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/miui/gallery/card/Card;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/miui/gallery/card/Card;

    iget-wide v3, p0, Lcom/miui/gallery/card/Card;->mId:J

    iget-wide v5, p1, Lcom/miui/gallery/card/Card;->mId:J

    cmp-long p1, v3, v5

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public generateDuplicateKey()Ljava/lang/String;
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/card/Card;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/card/Card;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Record$UniqueKey;->getStartTime()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/miui/gallery/card/Card;->mScenarioId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/card/Card;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/card/scenario/Record$UniqueKey;->getStartTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/card/Card;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/card/scenario/Record$UniqueKey;->getTargetTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/card/Card;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/card/scenario/Record$UniqueKey;->getLocation()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/miui/gallery/card/Card;->mScenarioId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/card/Card;->mCreateTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getActionUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mActionUrl:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getAllMediaSha1s()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getBaseColor()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/Card;->mBaseColor:I

    return v0
.end method

.method public getCardExtraInfo()Lcom/miui/gallery/card/Card$CardExtraInfo;
    .locals 3

    new-instance v0, Lcom/miui/gallery/card/Card$CardExtraInfo;

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    iget-boolean v2, p0, Lcom/miui/gallery/card/Card;->mIsIgnored:Z

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/card/Card$CardExtraInfo;-><init>(Lcom/miui/gallery/card/scenario/Record$UniqueKey;Z)V

    return-object v0
.end method

.method public getCoverMediaFeatureItems()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :goto_0
    return-object v0
.end method

.method public getCreateBy()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/Card;->mCreateBy:I

    return v0
.end method

.method public getCreateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/Card;->mCreateTime:J

    return-wide v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getDetailUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mDetailUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getImageResId(Landroid/content/Context;)I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mImageUri:Landroid/net/Uri;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/card/Card;->mImageResId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mImageUri:Landroid/net/Uri;

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->convertUriToResId(Landroid/content/Context;Landroid/net/Uri;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/card/Card;->mImageResId:I

    :cond_1
    iget p1, p0, Lcom/miui/gallery/card/Card;->mImageResId:I

    return p1
.end method

.method public getImageUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mImageUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getLocalFlag()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/Card;->mLocalFlag:I

    return v0
.end method

.method public getOperationInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    return-object v0
.end method

.method public getRecordStartTime()J
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/card/Card;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/card/Card;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Record$UniqueKey;->getStartTime()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method public getRecordTargetTime()J
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/card/Card;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/card/Card;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Record$UniqueKey;->getTargetTime()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method public getScenarioId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/Card;->mScenarioId:I

    return v0
.end method

.method public declared-synchronized getSelectedMediaSha1s()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getServerId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mServerId:Ljava/lang/String;

    return-object v0
.end method

.method public getServerTag()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/Card;->mServerTag:J

    return-wide v0
.end method

.method protected getTableColumns()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/dao/base/TableColumn;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "cardId"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "title"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "description"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "actionText"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "actionUrl"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "detailUrl"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "imageUri"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "createTime"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "deletable"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "type"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "styles"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "extras"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "scenarioId"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "serverId"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "serverTag"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "localFlag"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "updateTime"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "createdBy"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "ignored"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "syncable"

    const-string v2, "INTEGER"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "validStart"

    const-string v2, "INTEGER"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v1, v2, v4}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "validEnd"

    const-string v2, "INTEGER"

    const-wide v4, 0x7fffffffffffffffL

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v1, v2, v4}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "isTop"

    const-string v2, "INTEGER"

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/card/Card;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/card/Card;->mType:I

    return v0
.end method

.method protected getUniqueConstraints()[Ljava/lang/String;
    .locals 1

    const-string v0, "_id"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    return-object v0
.end method

.method public getUpdateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/Card;->mUpdateTime:J

    return-wide v0
.end method

.method public getValidEndTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/Card;->mValidEndTime:J

    return-wide v0
.end method

.method public getValidStartTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/Card;->mValidStartTime:J

    return-wide v0
.end method

.method public hashCode()I
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/Card;->mId:J

    long-to-int v0, v0

    return v0
.end method

.method public declared-synchronized isCoversNeedRefresh()Z
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    const/4 v2, 0x1

    if-eqz v0, :cond_6

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v3, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getSha1()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object v3, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v0, v4}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v3, 0x5

    if-ge v0, v3, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v3, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-le v0, v3, :cond_5

    :cond_4
    const/4 v1, 0x1

    :cond_5
    monitor-exit p0

    return v1

    :cond_6
    monitor-exit p0

    return v2

    :cond_7
    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isDeletable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsDeletable:Z

    return v0
.end method

.method public declared-synchronized isEmpty()Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/miui/gallery/card/Card;->mType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isIgnored()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsIgnored:Z

    return v0
.end method

.method public isLocalDeleted()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/card/Card;->mLocalFlag:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isOutofDate()Z
    .locals 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/card/Card;->mValidStartTime:J

    cmp-long v4, v2, v0

    if-gtz v4, :cond_1

    iget-wide v2, p0, Lcom/miui/gallery/card/Card;->mValidEndTime:J

    cmp-long v4, v2, v0

    if-gez v4, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isSyncable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsSyncable:Z

    return v0
.end method

.method public isTop()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsTop:Z

    return v0
.end method

.method public isValid()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/card/Card;->mLocalFlag:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/card/Card;->mLocalFlag:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/miui/gallery/card/Card;->mLocalFlag:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected declared-synchronized onConvertToContents(Landroid/content/ContentValues;)V
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "title"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mTitle:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "description"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mDescription:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "actionText"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v0, "actionUrl"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mActionUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "detailUrl"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mDetailUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mImageUri:Landroid/net/Uri;

    if-nez v0, :cond_0

    const-string v0, "imageUri"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v0, "imageUri"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mImageUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const-string v0, "createTime"

    iget-wide v1, p0, Lcom/miui/gallery/card/Card;->mCreateTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "deletable"

    iget-boolean v1, p0, Lcom/miui/gallery/card/Card;->mIsDeletable:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "type"

    invoke-virtual {p0}, Lcom/miui/gallery/card/Card;->getType()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "styles"

    invoke-direct {p0}, Lcom/miui/gallery/card/Card;->wrapStyles()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "unique_key"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    invoke-static {v1}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/card/Card;->putExtra(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "operation_info"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    invoke-static {v1}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/card/Card;->putExtra(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "all_images"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    invoke-static {v1}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/card/Card;->putExtra(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "selected_images"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-static {v1}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/card/Card;->putExtra(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "covers"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    invoke-static {v1}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/card/Card;->putExtra(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "extras"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mExtras:Ljava/util/HashMap;

    invoke-static {v1}, Lcom/miui/gallery/card/Card;->mapToString(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "scenarioId"

    iget v1, p0, Lcom/miui/gallery/card/Card;->mScenarioId:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "serverId"

    iget-object v1, p0, Lcom/miui/gallery/card/Card;->mServerId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "serverTag"

    iget-wide v1, p0, Lcom/miui/gallery/card/Card;->mServerTag:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "localFlag"

    iget v1, p0, Lcom/miui/gallery/card/Card;->mLocalFlag:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "updateTime"

    iget-wide v1, p0, Lcom/miui/gallery/card/Card;->mUpdateTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "createdBy"

    iget v1, p0, Lcom/miui/gallery/card/Card;->mCreateBy:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "ignored"

    iget-boolean v1, p0, Lcom/miui/gallery/card/Card;->mIsIgnored:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "syncable"

    iget-boolean v1, p0, Lcom/miui/gallery/card/Card;->mIsSyncable:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "validStart"

    iget-wide v1, p0, Lcom/miui/gallery/card/Card;->mValidStartTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "validEnd"

    iget-wide v1, p0, Lcom/miui/gallery/card/Card;->mValidEndTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "isTop"

    iget-boolean v1, p0, Lcom/miui/gallery/card/Card;->mIsTop:Z

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected onInitFromCursor(Landroid/database/Cursor;)V
    .locals 6

    const-string v0, "title"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mTitle:Ljava/lang/String;

    const-string v0, "description"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mDescription:Ljava/lang/String;

    const-string v0, "detailUrl"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mDetailUrl:Ljava/lang/String;

    const-string v0, "actionUrl"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mActionUrl:Ljava/lang/String;

    const-string v0, "imageUri"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mImageUri:Landroid/net/Uri;

    :cond_0
    const-string v0, "createTime"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/Card;->mCreateTime:J

    const-string v0, "deletable"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsDeletable:Z

    const-string v0, "type"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/card/Card;->setType(I)V

    const-string v0, "styles"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/card/Card;->parseStyles(Ljava/lang/String;)V

    const-string v0, "extras"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/card/Card;->stringToMap(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mExtras:Ljava/util/HashMap;

    const-string v0, "unique_key"

    invoke-direct {p0, v0}, Lcom/miui/gallery/card/Card;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-class v3, Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    invoke-static {v0, v3}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    const-string v0, "operation_info"

    invoke-direct {p0, v0}, Lcom/miui/gallery/card/Card;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-class v3, Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    invoke-static {v0, v3}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mOperationInfo:Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    :try_start_0
    const-string v0, "all_images"

    invoke-direct {p0, v0}, Lcom/miui/gallery/card/Card;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-class v3, Ljava/lang/String;

    invoke-static {v0, v3}, Lcom/miui/gallery/util/GsonUtils;->getArray(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    const-string v0, "selected_images"

    invoke-direct {p0, v0}, Lcom/miui/gallery/card/Card;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-class v3, Ljava/lang/String;

    invoke-static {v0, v3}, Lcom/miui/gallery/util/GsonUtils;->getArray(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    const-string v0, "covers"

    invoke-direct {p0, v0}, Lcom/miui/gallery/card/Card;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-class v3, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-static {v0, v3}, Lcom/miui/gallery/util/GsonUtils;->getArray(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v3, "Card"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Create card from cursor error:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    const-string v0, "scenarioId"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/Card;->mScenarioId:I

    iget v0, p0, Lcom/miui/gallery/card/Card;->mScenarioId:I

    if-gtz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Record$UniqueKey;->getScenarioId()I

    move-result v0

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    :goto_2
    iput v0, p0, Lcom/miui/gallery/card/Card;->mScenarioId:I

    :cond_3
    const-string v0, "serverId"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mServerId:Ljava/lang/String;

    const-string v0, "serverTag"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/miui/gallery/card/Card;->mServerTag:J

    const-string v0, "localFlag"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/Card;->mLocalFlag:I

    const-string v0, "updateTime"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/miui/gallery/card/Card;->mUpdateTime:J

    const-string v0, "createdBy"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/Card;->mCreateBy:I

    const-string v0, "ignored"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    if-ne v0, v2, :cond_4

    const/4 v0, 0x1

    goto :goto_3

    :cond_4
    const/4 v0, 0x0

    :goto_3
    iput-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsIgnored:Z

    const-string v0, "syncable"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    if-ne v0, v2, :cond_5

    const/4 v0, 0x1

    goto :goto_4

    :cond_5
    const/4 v0, 0x0

    :goto_4
    iput-boolean v0, p0, Lcom/miui/gallery/card/Card;->mIsSyncable:Z

    const-string v0, "validStart"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/miui/gallery/card/Card;->mValidStartTime:J

    const-string v0, "validEnd"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/miui/gallery/card/Card;->mValidEndTime:J

    const-string v0, "isTop"

    invoke-static {p1, v0}, Lcom/miui/gallery/card/Card;->getInt(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result p1

    if-ne p1, v2, :cond_6

    const/4 v1, 0x1

    :cond_6
    iput-boolean v1, p0, Lcom/miui/gallery/card/Card;->mIsTop:Z

    return-void
.end method

.method public declared-synchronized removeImages(Ljava/util/List;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    add-int/lit8 v0, v0, 0x1

    :cond_1
    iget-object v3, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :cond_3
    if-lez v0, :cond_4

    const-string p1, "Card"

    const-string v2, "Delete %d images from Card %d"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-wide v4, p0, Lcom/miui/gallery/card/Card;->mId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {p1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_4
    if-lez v0, :cond_5

    const/4 v1, 0x1

    :cond_5
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setAllMediaSha1s(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mAllMediaSha1s:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setCardExtraInfo(Lcom/miui/gallery/card/Card$CardExtraInfo;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/miui/gallery/card/Card$CardExtraInfo;->uniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mUniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    iget-boolean p1, p1, Lcom/miui/gallery/card/Card$CardExtraInfo;->isIgnored:Z

    iput-boolean p1, p0, Lcom/miui/gallery/card/Card;->mIsIgnored:Z

    :cond_0
    return-void
.end method

.method public declared-synchronized setCoverMediaFeatureItems(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mCoverMediaFeatureItems:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setCreateBy(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card;->mCreateBy:I

    return-void
.end method

.method public setCreateTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card;->mCreateTime:J

    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mDescription:Ljava/lang/String;

    return-void
.end method

.method public setLocalFlag(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card;->mLocalFlag:I

    return-void
.end method

.method public setScenarioId(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/Card;->mScenarioId:I

    return-void
.end method

.method public declared-synchronized setSelectedMediaSha1s(Ljava/util/List;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/card/Card;->mSelectedMediaSha1s:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/util/HashMap;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Ljava/util/HashMap;-><init>(I)V

    const-string v0, "from"

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "assistant"

    const-string v0, "assistant_card_remove_all_image"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GalleryStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-string p1, "Card"

    new-instance p2, Ljava/lang/Throwable;

    invoke-direct {p2}, Ljava/lang/Throwable;-><init>()V

    invoke-static {p2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setServerId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mServerId:Ljava/lang/String;

    return-void
.end method

.method public setServerTag(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card;->mServerTag:J

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/Card;->mTitle:Ljava/lang/String;

    return-void
.end method

.method public setUpdateTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/Card;->mUpdateTime:J

    return-void
.end method
