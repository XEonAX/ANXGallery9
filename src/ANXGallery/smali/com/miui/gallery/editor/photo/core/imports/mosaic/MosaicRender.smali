.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;
.super Lcom/miui/gallery/editor/photo/widgets/glview/AbstractRender;
.source "MosaicRender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableCaptureTask;,
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$CaptureTask;,
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableEntityTask;,
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;,
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;,
        Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DestroyBufferTask;
    }
.end annotation


# instance fields
.field private mCurrentEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

.field private mEffectFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

.field mGLPosition:[F

.field private mGLTextureShader:Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

.field private mGLTransparentDrawable:Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;

.field private mIterator:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;

.field private mLastRect:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

.field private mMaskFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

.field private mMaskPosition:[F

.field private mMosaicEffectProcessor:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;

.field private mOriginBitmap:Landroid/graphics/Bitmap;

.field private mOriginFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

.field private mOriginTextureId:I

.field private mPenMask:Landroid/graphics/Bitmap;

.field private mPenTexture:I

.field private mViewHeight:I

.field private mViewWidth:I


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/glview/AbstractRender;-><init>()V

    const/16 v0, 0x8

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskPosition:[F

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLPosition:[F

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mLastRect:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mOriginBitmap:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mPenMask:Landroid/graphics/Bitmap;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mEffectFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mEffectFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mOriginFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mOriginFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    return-object p1
.end method

.method static synthetic access$102(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMosaicEffectProcessor:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMosaicEffectProcessor:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mCurrentEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    return-object p0
.end method

.method static synthetic access$1202(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mCurrentEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    return-object p1
.end method

.method static synthetic access$1302(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mIterator:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mLastRect:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)[F
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskPosition:[F

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;[F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->drawMask([F)V

    return-void
.end method

.method static synthetic access$1700(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->drawMaskBetween(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTransparentDrawable:Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTransparentDrawable:Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;

    return-object p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mOriginTextureId:I

    return p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mOriginTextureId:I

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mPenTexture:I

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mPenTexture:I

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mOriginBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mPenMask:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTextureShader:Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    return-object p0
.end method

.method static synthetic access$702(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;)Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTextureShader:Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    return-object p1
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mViewWidth:I

    return p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mViewHeight:I

    return p0
.end method

.method private drawMask([F)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->drawMaskPre()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTextureShader:Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mPenTexture:I

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->draw(I[F)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->drawMaskAfter()V

    return-void
.end method

.method private drawMaskAfter()V
    .locals 4

    const/4 v0, 0x0

    const/16 v1, 0x304

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBlendFunc(II)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTextureShader:Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mEffectFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->getTextureId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->drawFBO(I)V

    const/16 v1, 0xbe2

    invoke-static {v1}, Landroid/opengl/GLES20;->glDisable(I)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->unBind()V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mOriginFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->bind()V

    invoke-static {v1}, Landroid/opengl/GLES20;->glEnable(I)V

    const/4 v2, 0x1

    const/16 v3, 0x303

    invoke-static {v2, v3, v0, v2}, Landroid/opengl/GLES20;->glBlendFuncSeparate(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTextureShader:Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->getTextureId()I

    move-result v2

    sget-object v3, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->CUBE_REVERSE:[F

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->draw(I[F)V

    invoke-static {v1}, Landroid/opengl/GLES20;->glDisable(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mOriginFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->unBind()V

    return-void
.end method

.method private drawMaskBetween(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mIterator:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->countMiddleRect(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->drawMaskPre()V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mIterator:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mIterator:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskPosition:[F

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->next([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTextureShader:Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mPenTexture:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskPosition:[F

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->draw(I[F)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->drawMaskAfter()V

    return-void
.end method

.method private drawMaskPre()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->bind()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTransparentDrawable:Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;->draw()V

    const/16 v0, 0xbe2

    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    const/16 v0, 0x303

    const/4 v1, 0x1

    invoke-static {v1, v0, v1, v0}, Landroid/opengl/GLES20;->glBlendFuncSeparate(IIII)V

    return-void
.end method


# virtual methods
.method capture(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$CaptureTask;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$CaptureTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method drawMaskPaintingItems(Ljava/util/LinkedList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->drawMaskPre()V

    invoke-virtual {p1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem$PaintingItem;->points:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskPosition:[F

    invoke-virtual {v3, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->getVertex([F)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTextureShader:Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mPenTexture:I

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskPosition:[F

    invoke-virtual {v1, v2, v4}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->draw(I[F)V

    const/4 v1, 0x0

    goto :goto_2

    :cond_1
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mIterator:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;

    invoke-virtual {v4, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->countMiddleRect(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V

    :goto_1
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mIterator:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mIterator:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskPosition:[F

    invoke-virtual {v2, v4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;->next([F)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTextureShader:Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mPenTexture:I

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mMaskPosition:[F

    invoke-virtual {v2, v4, v5}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->draw(I[F)V

    goto :goto_1

    :cond_2
    :goto_2
    move-object v2, v3

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->drawMaskAfter()V

    return-void
.end method

.method drawRect(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Z)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Z)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method enableCapture(Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableCaptureTask;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableCaptureTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method enableEntity(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableEntityTask;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableEntityTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method init(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->runOnDraw(Ljava/lang/Runnable;)V

    if-eqz p1, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableEntityTask;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableEntityTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->runOnDraw(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/glview/AbstractRender;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    const/16 p1, 0x4100

    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLTextureShader:Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mOriginFBOManager:Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->getTextureId()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mGLPosition:[F

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->draw(I[F)V

    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0

    const/4 p1, 0x0

    invoke-static {p1, p1, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mViewWidth:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->mViewHeight:I

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0

    const/4 p1, 0x0

    invoke-static {p1, p1, p1, p1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 p1, 0xb71

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisable(I)V

    return-void
.end method
