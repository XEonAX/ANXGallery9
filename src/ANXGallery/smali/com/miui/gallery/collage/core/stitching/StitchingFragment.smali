.class public Lcom/miui/gallery/collage/core/stitching/StitchingFragment;
.super Lcom/miui/gallery/collage/app/common/AbstractStitchingFragment;
.source "StitchingFragment.java"


# instance fields
.field private mInit:Z

.field private mModelReady:Z

.field private mStitchingLayout:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

.field private mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

.field private mViewReady:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/collage/app/common/AbstractStitchingFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mModelReady:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mViewReady:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mInit:Z

    return-void
.end method

.method private generateStitchingLayout(Lcom/miui/gallery/collage/core/stitching/StitchingModel;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingLayout:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    iget-object v1, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mBitmaps:[Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mBitmaps:[Landroid/graphics/Bitmap;

    array-length v2, v2

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->setBitmaps([Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingLayout:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->setStitchingModel(Lcom/miui/gallery/collage/core/stitching/StitchingModel;)V

    return-void
.end method

.method private refreshLayout()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mInit:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mModelReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mBitmapReady:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mViewReady:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->generateStitchingLayout(Lcom/miui/gallery/collage/core/stitching/StitchingModel;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingLayout:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    iget-object v1, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mReplaceImageListener:Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->setReplaceImageListener(Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mInit:Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->refreshStitchingLayout(Lcom/miui/gallery/collage/core/stitching/StitchingModel;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private refreshStitchingLayout(Lcom/miui/gallery/collage/core/stitching/StitchingModel;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingLayout:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->setStitchingModel(Lcom/miui/gallery/collage/core/stitching/StitchingModel;)V

    return-void
.end method


# virtual methods
.method public dismissControlWindow()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingLayout:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingLayout:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->dismissControlWindow()V

    :cond_0
    return-void
.end method

.method public export()Lcom/miui/gallery/collage/core/RenderData;
    .locals 2

    new-instance v0, Lcom/miui/gallery/collage/core/stitching/StitchingRenderData;

    iget-object v1, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingLayout:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->generateRenderData()Lcom/miui/gallery/collage/widget/CollageStitchingLayout$RenderData;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/collage/core/stitching/StitchingRenderData;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout$RenderData;)V

    const/16 v1, 0x438

    iput v1, v0, Lcom/miui/gallery/collage/core/stitching/StitchingRenderData;->mWidth:I

    return-object v0
.end method

.method public onBitmapReplace(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingLayout:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->notifyBitmapReplace(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onBitmapsReceive()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->refreshLayout()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0059

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onSelectModel(Lcom/miui/gallery/collage/core/stitching/StitchingModel;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mModelReady:Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->refreshLayout()V

    return-void
.end method

.method public onSimple()Ljava/util/HashMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "collage_save_type"

    const-string v2, "Stitching"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "collage_image_size"

    iget-object v2, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mBitmaps:[Landroid/graphics/Bitmap;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mBitmaps:[Landroid/graphics/Bitmap;

    array-length v2, v2

    :goto_0
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "Stitching"

    iget-object v2, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    if-nez v2, :cond_1

    const/4 v2, 0x0

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    iget-object v2, v2, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->name:Ljava/lang/String;

    :goto_1
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    const p2, 0x7f0900eb

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    iput-object p1, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mStitchingLayout:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->mViewReady:Z

    invoke-direct {p0}, Lcom/miui/gallery/collage/core/stitching/StitchingFragment;->refreshLayout()V

    return-void
.end method
