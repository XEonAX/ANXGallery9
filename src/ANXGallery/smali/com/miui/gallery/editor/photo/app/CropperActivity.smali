.class public Lcom/miui/gallery/editor/photo/app/CropperActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "CropperActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportFragment;,
        Lcom/miui/gallery/editor/photo/app/CropperActivity$ExportLoader;,
        Lcom/miui/gallery/editor/photo/app/CropperActivity$PrepareLoader;,
        Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;
    }
.end annotation


# instance fields
.field private mCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/app/LoaderManager$LoaderCallbacks<",
            "Lcom/miui/gallery/editor/photo/app/CropperActivity$DecodeResult;",
            ">;"
        }
    .end annotation
.end field

.field private mCancelButton:Landroid/view/View;

.field private mCropView:Lcom/edmodo/cropper/CropImageView;

.field private mData:Landroid/net/Uri;

.field private mOnClickListener:Landroid/view/View$OnClickListener;

.field private mOutput:Landroid/net/Uri;

.field private mOutputX:F

.field private mOutputY:F

.field private mReturnData:Z

.field private mSaveButton:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/CropperActivity$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/CropperActivity$1;-><init>(Lcom/miui/gallery/editor/photo/app/CropperActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/CropperActivity$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/CropperActivity$2;-><init>(Lcom/miui/gallery/editor/photo/app/CropperActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/CropperActivity;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mCancelButton:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/CropperActivity;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mSaveButton:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/CropperActivity;)Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mData:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/CropperActivity;)Lcom/edmodo/cropper/CropImageView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mCropView:Lcom/edmodo/cropper/CropImageView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/CropperActivity;)Landroid/graphics/Bitmap;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->createOutput()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/app/CropperActivity;)Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutput:Landroid/net/Uri;

    return-object p0
.end method

.method private createOutput()Landroid/graphics/Bitmap;
    .locals 10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mCropView:Lcom/edmodo/cropper/CropImageView;

    invoke-virtual {v2}, Lcom/edmodo/cropper/CropImageView;->getCroppedImage()Landroid/graphics/Bitmap;

    move-result-object v3

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutputX:F

    const/4 v4, 0x0

    cmpl-float v2, v2, v4

    if-lez v2, :cond_0

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutputY:F

    cmpl-float v2, v2, v4

    if-lez v2, :cond_0

    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutputX:F

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v2, v4

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutputY:F

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-virtual {v8, v2, v4}, Landroid/graphics/Matrix;->setScale(FF)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    const/4 v9, 0x1

    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v3

    :cond_0
    const-string v2, "CropperActivity"

    const-string v4, "create output costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v4, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v3
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0066

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->setContentView(I)V

    const p1, 0x7f0901f9

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mSaveButton:Landroid/view/View;

    const p1, 0x7f090073

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mCancelButton:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mSaveButton:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mCancelButton:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0900bf

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/edmodo/cropper/CropImageView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mCropView:Lcom/edmodo/cropper/CropImageView;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mSaveButton:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mData:Landroid/net/Uri;

    const-string v1, "output"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutput:Landroid/net/Uri;

    const-string v1, "return-data"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mReturnData:Z

    const-string v1, "outputX"

    const/4 v2, -0x1

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutputX:F

    const-string v1, "outputY"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutputY:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mData:Landroid/net/Uri;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutput:Landroid/net/Uri;

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    const-string v1, "CropperActivity"

    const-string v3, "cropper\'s input: %s, output: %s"

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mData:Landroid/net/Uri;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutput:Landroid/net/Uri;

    if-nez v5, :cond_1

    const-string v5, "bytes"

    goto :goto_0

    :cond_1
    iget-object v5, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutput:Landroid/net/Uri;

    :goto_0
    invoke-static {v1, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v1, "aspectX"

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "aspectY"

    invoke-virtual {p1, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    if-lez v1, :cond_2

    if-lez v2, :cond_2

    const-string v3, "fixed_aspect_ratio"

    const/4 v4, 0x1

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mCropView:Lcom/edmodo/cropper/CropImageView;

    invoke-virtual {v3, p1}, Lcom/edmodo/cropper/CropImageView;->setFixedAspectRatio(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mCropView:Lcom/edmodo/cropper/CropImageView;

    invoke-virtual {p1, v1, v2}, Lcom/edmodo/cropper/CropImageView;->setAspectRatio(II)V

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {p1, v0, v1, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void

    :cond_3
    :goto_1
    const-string p1, "CropperActivity"

    const-string v0, "src or des missed, src: %s, des: %s"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mData:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/CropperActivity;->mOutput:Landroid/net/Uri;

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/CropperActivity;->finish()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method
