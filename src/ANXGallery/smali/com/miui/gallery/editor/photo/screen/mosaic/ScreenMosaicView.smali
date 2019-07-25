.class public Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;
.super Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;
.source "ScreenMosaicView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/mosaic/IScreenMosaicOperation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;
    }
.end annotation


# instance fields
.field private mAllowDraw:Z

.field private mCurrentEntity:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;

.field private mCurrentMenuItemIndex:I

.field private mCurrentShaderHolder:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

.field private mGesListener:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;

.field private mMosaicNodeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;",
            ">;"
        }
    .end annotation
.end field

.field private mPaint:Landroid/graphics/Paint;

.field private mPaintSize:F

.field private mRenderListener:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;

.field private mRenderThread:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mAllowDraw:Z

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mGesListener:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;

    const/high16 v0, 0x42c40000    # 98.0f

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mPaintSize:F

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mMosaicNodeList:Ljava/util/ArrayList;

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentMenuItemIndex:I

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$1;-><init>(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mRenderListener:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->init()V

    return-void
.end method

.method static synthetic access$102(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;)Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentShaderHolder:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    return-object p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mAllowDraw:Z

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mAllowDraw:Z

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->invalidate()V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->addNewItem(Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;)V

    return-void
.end method

.method private addNewItem(Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->getMatrixValues()[F

    move-result-object v0

    const/4 v1, 0x0

    aget v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mPaintSize:F

    div-float/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->setPaintSize(F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentShaderHolder:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;->getBitmapShader()Landroid/graphics/BitmapShader;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentShaderHolder:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;->type:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    sget-object v2, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->BITMAP:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    if-eq v1, v2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    :cond_0
    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->setShader(Landroid/graphics/Shader;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mMosaicNodeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->addDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V

    return-void
.end method

.method private init()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mRenderThread:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mRenderThread:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mRenderListener:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->setRenderListener(Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->initPaint()V

    return-void
.end method

.method private initPaint()V
    .locals 3

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, -0x10000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/PorterDuffXfermode;

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->LIGHTEN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v1, v2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    return-void
.end method

.method private setCurrentEntity(Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentEntity:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;

    if-eq p1, v0, :cond_1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentEntity:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentEntity:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;->getMosaicShaderHolder()Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->refreshShaderByCurrentShader()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mAllowDraw:Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentEntity:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;->getMosaicShaderHolder()Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentShaderHolder:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public canvasMatrixChange()V
    .locals 0

    return-void
.end method

.method public clearActivation()V
    .locals 0

    return-void
.end method

.method public drawOverlay(Landroid/graphics/Canvas;)V
    .locals 0

    return-void
.end method

.method public getCurrentMenuItemIndex()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentMenuItemIndex:I

    return v0
.end method

.method public onChangeOperation(Z)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mGesListener:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView$GesListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setFeatureGestureListener(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mMosaicNodeList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :goto_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mRenderThread:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->setRenderListener(Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mRenderThread:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->quitSafely()Z

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/core/ScreenProviderManager;->INSTANCE:Lcom/miui/gallery/editor/photo/screen/core/ScreenProviderManager;

    const-class v1, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/screen/core/ScreenProviderManager;->getProvider(Ljava/lang/Class;)Lcom/miui/gallery/editor/photo/screen/core/ScreenProvider;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->clearShader()V

    :cond_0
    return-void
.end method

.method public refreshShaderByCurrentShader()V
    .locals 4

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mAllowDraw:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mRenderThread:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentEntity:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getOriginBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v3

    iget-object v3, v3, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->sendGenerateShaderMsg(Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V

    return-void
.end method

.method public setMosaicData(Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->setCurrentEntity(Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;)V

    iput p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mCurrentMenuItemIndex:I

    return-void
.end method

.method public setMosaicPaintSize(I)V
    .locals 0

    int-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->mPaintSize:F

    return-void
.end method
