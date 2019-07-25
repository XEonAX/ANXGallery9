.class public Lcom/miui/gallery/cleaner/ScanResult;
.super Ljava/lang/Object;
.source "ScanResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cleaner/ScanResult$ResultImage;,
        Lcom/miui/gallery/cleaner/ScanResult$CenteredImageSpan;,
        Lcom/miui/gallery/cleaner/ScanResult$Builder;,
        Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;
    }
.end annotation


# instance fields
.field private mAction:I

.field private mCount:I

.field private mCountText:I

.field private mDescription:I

.field private mImages:[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

.field private mOnClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

.field private mSize:J

.field private mTitle:I

.field private mType:I


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cleaner/ScanResult$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/ScanResult;-><init>()V

    return-void
.end method

.method static synthetic access$102(Lcom/miui/gallery/cleaner/ScanResult;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult;->mType:I

    return p1
.end method

.method static synthetic access$202(Lcom/miui/gallery/cleaner/ScanResult;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/cleaner/ScanResult;->mSize:J

    return-wide p1
.end method

.method static synthetic access$302(Lcom/miui/gallery/cleaner/ScanResult;[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;)[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResult;->mImages:[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    return-object p1
.end method

.method static synthetic access$402(Lcom/miui/gallery/cleaner/ScanResult;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult;->mCount:I

    return p1
.end method

.method static synthetic access$502(Lcom/miui/gallery/cleaner/ScanResult;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult;->mTitle:I

    return p1
.end method

.method static synthetic access$602(Lcom/miui/gallery/cleaner/ScanResult;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult;->mDescription:I

    return p1
.end method

.method static synthetic access$702(Lcom/miui/gallery/cleaner/ScanResult;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult;->mAction:I

    return p1
.end method

.method static synthetic access$802(Lcom/miui/gallery/cleaner/ScanResult;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/cleaner/ScanResult;->mCountText:I

    return p1
.end method

.method static synthetic access$902(Lcom/miui/gallery/cleaner/ScanResult;Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;)Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cleaner/ScanResult;->mOnClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    return-object p1
.end method


# virtual methods
.method public getAction()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cleaner/ScanResult;->mAction:I

    return v0
.end method

.method public getDescription()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cleaner/ScanResult;->mDescription:I

    return v0
.end method

.method public getImages()[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResult;->mImages:[Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    return-object v0
.end method

.method public getMergedTitle(Landroid/content/Context;)Ljava/lang/CharSequence;
    .locals 8

    iget v0, p0, Lcom/miui/gallery/cleaner/ScanResult;->mTitle:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/cleaner/ScanResult;->mCount:I

    if-lez v1, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Lcom/miui/gallery/cleaner/ScanResult;->mCountText:I

    iget v3, p0, Lcom/miui/gallery/cleaner/ScanResult;->mCount:I

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Object;

    iget v6, p0, Lcom/miui/gallery/cleaner/ScanResult;->mCount:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-virtual {v1, v2, v3, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f0701a0

    invoke-static {p1, v2}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    invoke-virtual {p1, v7, v7, v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance v2, Lcom/miui/gallery/cleaner/ScanResult$CenteredImageSpan;

    invoke-direct {v2, p1}, Lcom/miui/gallery/cleaner/ScanResult$CenteredImageSpan;-><init>(Landroid/graphics/drawable/Drawable;)V

    new-instance p1, Landroid/text/SpannableString;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "+"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/2addr v0, v4

    const/16 v3, 0x21

    invoke-virtual {p1, v2, v1, v0, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    return-object p1

    :cond_0
    return-object v0
.end method

.method public getSize()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cleaner/ScanResult;->mSize:J

    return-wide v0
.end method

.method public getType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cleaner/ScanResult;->mType:I

    return v0
.end method

.method public onClick(Landroid/content/Context;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResult;->mOnClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScanResult;->mOnClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;->onClick(Landroid/content/Context;)V

    :cond_0
    return-void
.end method
