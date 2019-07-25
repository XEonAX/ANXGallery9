.class public Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;
.super Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
.source "CreationStrategy.java"


# instance fields
.field private mIsCollageEntryEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "collage_entry"
    .end annotation
.end field

.field private mIsPhotoMovieEntryEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_movie_entry"
    .end annotation
.end field

.field private mIsPrintEntryEnable:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "print_entry"
    .end annotation
.end field

.field private mMinPrintVersionCode:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "min_print_version_code"
    .end annotation
.end field

.field private mPrintIntentUri:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "print_intent_uri"
    .end annotation
.end field

.field private mPrintMaxImageCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "print_max_image_count"
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZZZ)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;-><init>()V

    iput-boolean p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mIsCollageEntryEnable:Z

    iput-boolean p2, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mIsPhotoMovieEntryEnable:Z

    iput-boolean p3, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mIsPrintEntryEnable:Z

    const-string p1, "xiaomiprint://start.uri.activity?action=createWork"

    iput-object p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mPrintIntentUri:Ljava/lang/String;

    const/16 p1, 0x22

    iput p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mMinPrintVersionCode:I

    const/16 p1, 0xc8

    iput p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mPrintMaxImageCount:I

    return-void
.end method

.method public static createDefault()Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;
    .locals 3

    new-instance v0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v1, v2}, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;-><init>(ZZZ)V

    return-object v0
.end method


# virtual methods
.method public doAdditionalProcessing()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mPrintIntentUri:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "xiaomiprint://start.uri.activity?action=createWork"

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mPrintIntentUri:Ljava/lang/String;

    :cond_0
    iget v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mMinPrintVersionCode:I

    if-gtz v0, :cond_1

    const/16 v0, 0x22

    iput v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mMinPrintVersionCode:I

    :cond_1
    iget v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mPrintMaxImageCount:I

    if-gtz v0, :cond_2

    const/16 v0, 0xc8

    iput v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mPrintMaxImageCount:I

    :cond_2
    return-void
.end method

.method public getMinPrintVersionCode()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mMinPrintVersionCode:I

    return v0
.end method

.method public getPrintIntentUri()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mPrintIntentUri:Ljava/lang/String;

    return-object v0
.end method

.method public getPrintMaxImageCount()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mPrintMaxImageCount:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mPrintMaxImageCount:I

    goto :goto_0

    :cond_0
    const/16 v0, 0xc8

    :goto_0
    return v0
.end method

.method public isCollageEntryEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mIsCollageEntryEnable:Z

    return v0
.end method

.method public isPhotoMovieEntryEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mIsPhotoMovieEntryEnable:Z

    return v0
.end method

.method public isPrintEntryEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->mIsPrintEntryEnable:Z

    return v0
.end method
