.class public Lcom/miui/gallery/ui/MonthView$MonthItem;
.super Ljava/lang/Object;
.source "MonthView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/MonthView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MonthItem"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;
    }
.end annotation


# instance fields
.field private mDate:J

.field private mDownloadUri:Landroid/net/Uri;

.field private mFileLength:J

.field private mId:J

.field private mLocalPath:Ljava/lang/String;

.field private mPosition:I


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->access$1000(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mId:J

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->access$1100(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mDownloadUri:Landroid/net/Uri;

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->access$1200(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mLocalPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->access$1300(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mPosition:I

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->access$1400(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mDate:J

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;->access$1500(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mFileLength:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;Lcom/miui/gallery/ui/MonthView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/MonthView$MonthItem;-><init>(Lcom/miui/gallery/ui/MonthView$MonthItem$Builder;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/MonthView$MonthItem;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mFileLength:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/MonthView$MonthItem;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mPosition:I

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/MonthView$MonthItem;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mLocalPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/MonthView$MonthItem;)Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mDownloadUri:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/MonthView$MonthItem;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mId:J

    return-wide v0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/MonthView$MonthItem;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mDate:J

    return-wide v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    if-eqz p1, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mId:J

    check-cast p1, Lcom/miui/gallery/ui/MonthView$MonthItem;

    iget-wide v2, p1, Lcom/miui/gallery/ui/MonthView$MonthItem;->mId:J

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public hashCode()I
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/MonthView$MonthItem;->mId:J

    long-to-int v0, v0

    return v0
.end method
