.class public Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;
.super Ljava/lang/Object;
.source "CheckableAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Builder"
.end annotation


# instance fields
.field private mId:J

.field private mMicroThumbnailFile:Ljava/lang/String;

.field private mMimeType:Ljava/lang/String;

.field private mOriginFile:Ljava/lang/String;

.field private mSha1:Ljava/lang/String;

.field private mThumbnailFile:Ljava/lang/String;


# direct methods
.method protected constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mId:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mSha1:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mMicroThumbnailFile:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mThumbnailFile:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mOriginFile:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mMimeType:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method build()Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;
    .locals 2

    new-instance v0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem;-><init>(Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;Lcom/miui/gallery/adapter/CheckableAdapter$1;)V

    return-object v0
.end method

.method setId(J)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mId:J

    return-object p0
.end method

.method setMicroThumbnailFile(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mMicroThumbnailFile:Ljava/lang/String;

    return-object p0
.end method

.method setMimeType(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mMimeType:Ljava/lang/String;

    return-object p0
.end method

.method setOriginFile(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mOriginFile:Ljava/lang/String;

    return-object p0
.end method

.method setSha1(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mSha1:Ljava/lang/String;

    return-object p0
.end method

.method setThumbnailFile(Ljava/lang/String;)Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/CheckableAdapter$CheckedItem$Builder;->mThumbnailFile:Ljava/lang/String;

    return-object p0
.end method
