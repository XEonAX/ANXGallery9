.class public Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;
.super Ljava/lang/Object;
.source "MonthView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/MonthView$MonthItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mDate:J

.field private mDownloadUri:Landroid/net/Uri;

.field private mFileLength:J

.field private mId:J

.field private mLocalPath:Ljava/lang/String;

.field private mPosition:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mId:J

    return-wide v0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mDownloadUri:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mLocalPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mPosition:I

    return p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mDate:J

    return-wide v0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mFileLength:J

    return-wide v0
.end method


# virtual methods
.method public build()Lcom/miui/gallery/ui/MonthView$MonthItem;
    .locals 2

    new-instance v0, Lcom/miui/gallery/ui/MonthView$MonthItem;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/MonthView$MonthItem;-><init>(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;Lcom/miui/gallery/ui/MonthView$1;)V

    return-object v0
.end method

.method public setDate(J)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mDate:J

    return-object p0
.end method

.method public setDownloadUri(Landroid/net/Uri;)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mDownloadUri:Landroid/net/Uri;

    return-object p0
.end method

.method public setFileLength(J)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mFileLength:J

    return-object p0
.end method

.method public setId(J)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mId:J

    return-object p0
.end method

.method public setLocalPath(Ljava/lang/String;)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mLocalPath:Ljava/lang/String;

    return-object p0
.end method

.method public setPosition(I)Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->mPosition:I

    return-object p0
.end method
