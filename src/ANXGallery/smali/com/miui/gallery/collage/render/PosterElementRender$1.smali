.class Lcom/miui/gallery/collage/render/PosterElementRender$1;
.super Ljava/lang/Thread;
.source "PosterElementRender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/collage/render/PosterElementRender;->initializeAsync(Lcom/miui/gallery/collage/core/poster/PosterModel;IIFLandroid/content/Context;Lcom/miui/gallery/collage/render/PosterElementRender$LoadDataListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mBackground:I

.field private mImageDrawables:[Landroid/graphics/drawable/Drawable;

.field private mSpecifyDrawables:[Landroid/graphics/drawable/Drawable;

.field private mTextEditorHolders:[Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;

.field final synthetic this$0:Lcom/miui/gallery/collage/render/PosterElementRender;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$height:I

.field final synthetic val$loadDataListener:Lcom/miui/gallery/collage/render/PosterElementRender$LoadDataListener;

.field final synthetic val$posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

.field final synthetic val$scaleOffset:F

.field final synthetic val$width:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/render/PosterElementRender;Lcom/miui/gallery/collage/core/poster/PosterModel;Landroid/content/Context;IIFLcom/miui/gallery/collage/render/PosterElementRender$LoadDataListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->this$0:Lcom/miui/gallery/collage/render/PosterElementRender;

    iput-object p2, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iput-object p3, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$context:Landroid/content/Context;

    iput p4, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$width:I

    iput p5, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$height:I

    iput p6, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$scaleOffset:F

    iput-object p7, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$loadDataListener:Lcom/miui/gallery/collage/render/PosterElementRender$LoadDataListener;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/collage/render/PosterElementRender$1;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->mBackground:I

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/collage/render/PosterElementRender$1;)[Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->mImageDrawables:[Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/collage/render/PosterElementRender$1;)[Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->mSpecifyDrawables:[Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/collage/render/PosterElementRender$1;)[Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->mTextEditorHolders:[Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;

    return-object p0
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iget-object v0, v0, Lcom/miui/gallery/collage/core/poster/PosterModel;->imageElementModels:[Lcom/miui/gallery/collage/core/poster/ImageElementModel;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iget-object v1, v1, Lcom/miui/gallery/collage/core/poster/PosterModel;->specifyDrawableModels:[Lcom/miui/gallery/collage/core/poster/SpecifyDrawableModel;

    iget-object v2, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iget-object v2, v2, Lcom/miui/gallery/collage/core/poster/PosterModel;->textElementModels:[Lcom/miui/gallery/collage/core/poster/TextElementModel;

    iget-object v3, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iget-object v3, v3, Lcom/miui/gallery/collage/core/poster/PosterModel;->background:Ljava/lang/String;

    if-eqz v0, :cond_0

    array-length v4, v0

    if-lez v4, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v5, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$width:I

    iget v6, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$height:I

    invoke-static {v4, v0, v5, v6}, Lcom/miui/gallery/collage/render/PosterElementRender;->access$000(Landroid/content/res/Resources;[Lcom/miui/gallery/collage/core/poster/ImageElementModel;II)[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->mImageDrawables:[Landroid/graphics/drawable/Drawable;

    :cond_0
    if-eqz v1, :cond_1

    array-length v0, v1

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v4, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$width:I

    iget v5, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$height:I

    iget v6, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$scaleOffset:F

    invoke-static {v0, v1, v4, v5, v6}, Lcom/miui/gallery/collage/render/PosterElementRender;->access$100(Landroid/content/res/Resources;[Lcom/miui/gallery/collage/core/poster/SpecifyDrawableModel;IIF)[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->mSpecifyDrawables:[Landroid/graphics/drawable/Drawable;

    :cond_1
    if-eqz v2, :cond_2

    array-length v0, v2

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$context:Landroid/content/Context;

    iget v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$width:I

    iget v4, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$height:I

    iget v5, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$scaleOffset:F

    invoke-static {v0, v2, v1, v4, v5}, Lcom/miui/gallery/collage/render/PosterElementRender;->access$200(Landroid/content/Context;[Lcom/miui/gallery/collage/core/poster/TextElementModel;IIF)[Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->mTextEditorHolders:[Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;

    :cond_2
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->mBackground:I

    :cond_3
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$1;->val$context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/miui/gallery/collage/render/PosterElementRender$1$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/collage/render/PosterElementRender$1$1;-><init>(Lcom/miui/gallery/collage/render/PosterElementRender$1;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
