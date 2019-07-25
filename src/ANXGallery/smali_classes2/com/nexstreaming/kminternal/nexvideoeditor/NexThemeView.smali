.class public Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;
.super Landroid/view/TextureView;
.source "NexThemeView.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;,
        Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$a;,
        Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;
    }
.end annotation


# static fields
.field private static LOG_TAG:Ljava/lang/String; = "VideoEditor_ThemeView"

.field public static final kEventType_Available:I = 0x1

.field public static final kEventType_Destroyed:I = 0x3

.field public static final kEventType_SizeChanged:I = 0x2

.field private static mAspectRatio:F = 1.7777778f


# instance fields
.field private actualSurface:Landroid/view/Surface;

.field private actualSurfaceTexture:Landroid/graphics/SurfaceTexture;

.field private isAvailable:Z

.field private mBlackOut:Z

.field private mClearListenerList:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentTime:I

.field private mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

.field private mHadNativeRenderSinceClear:Z

.field private mHandler:Landroid/os/Handler;

.field private mRenderType:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;

.field private m_captureListener:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$a;

.field private m_height:I

.field private m_width:I

.field private nexThemeViewCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;

.field private postOnPrepareSurfaceRunnables:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;->None:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mRenderType:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mHadNativeRenderSinceClear:Z

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mClearListenerList:Ljava/util/Queue;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mHandler:Landroid/os/Handler;

    iput-boolean v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mBlackOut:Z

    iput-boolean v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->isAvailable:Z

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_width:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_height:I

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_captureListener:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$a;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->postOnPrepareSurfaceRunnables:Ljava/util/List;

    const/4 p1, 0x1

    invoke-direct {p0, v0, v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->init(ZII)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    sget-object p2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;->None:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;

    iput-object p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mRenderType:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mHadNativeRenderSinceClear:Z

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mClearListenerList:Ljava/util/Queue;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mHandler:Landroid/os/Handler;

    iput-boolean p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mBlackOut:Z

    iput-boolean p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->isAvailable:Z

    iput p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_width:I

    iput p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_height:I

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_captureListener:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$a;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->postOnPrepareSurfaceRunnables:Ljava/util/List;

    invoke-direct {p0, p2, p2, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->init(ZII)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZII)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;->None:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mRenderType:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mHadNativeRenderSinceClear:Z

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mClearListenerList:Ljava/util/Queue;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mHandler:Landroid/os/Handler;

    iput-boolean v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mBlackOut:Z

    iput-boolean v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->isAvailable:Z

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_width:I

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_height:I

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_captureListener:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$a;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->postOnPrepareSurfaceRunnables:Ljava/util/List;

    invoke-direct {p0, p2, p3, p4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->init(ZII)V

    return-void
.end method

.method private diagString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getAspectRatio()F
    .locals 1

    sget v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mAspectRatio:F

    return v0
.end method

.method private init(ZII)V
    .locals 0

    invoke-virtual {p0, p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    return-void
.end method

.method public static setAspectRatio(F)V
    .locals 0

    sput p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mAspectRatio:F

    return-void
.end method

.method private updateActualSurface(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eq p1, v0, :cond_1

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurfaceTexture:Landroid/graphics/SurfaceTexture;

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz p1, :cond_0

    new-instance p1, Landroid/view/Surface;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {p1, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurface:Landroid/view/Surface;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurface:Landroid/view/Surface;

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public capture(Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$a;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_captureListener:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$a;

    return-void
.end method

.method public isSurfaceAvailable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->isAvailable:Z

    return v0
.end method

.method linkToEditor(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)V
    .locals 3

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "linkToEditor "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->diagString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " editor="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_0

    const-string v2, "NULL"

    goto :goto_0

    :cond_0
    const-string v2, "not-null"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurface:Landroid/view/Surface;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurface:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Landroid/view/Surface;)V

    :cond_1
    return-void
.end method

.method protected onMeasure(II)V
    .locals 7

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    if-ne v0, v4, :cond_0

    if-ne v1, v4, :cond_0

    move v0, v2

    :goto_0
    move v1, v3

    goto :goto_1

    :cond_0
    if-ne v0, v4, :cond_1

    int-to-float v0, v3

    int-to-float v1, v2

    sget v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mAspectRatio:F

    div-float/2addr v1, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    float-to-int v0, v0

    int-to-float v1, v0

    sget v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mAspectRatio:F

    mul-float v1, v1, v4

    float-to-int v1, v1

    move v6, v1

    move v1, v0

    move v0, v6

    goto :goto_1

    :cond_1
    if-ne v1, v4, :cond_2

    int-to-float v0, v2

    int-to-float v1, v3

    sget v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mAspectRatio:F

    mul-float v1, v1, v4

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    float-to-int v0, v0

    int-to-float v1, v0

    sget v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mAspectRatio:F

    div-float/2addr v1, v4

    float-to-int v1, v1

    goto :goto_1

    :cond_2
    int-to-float v0, v2

    int-to-float v1, v3

    sget v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mAspectRatio:F

    mul-float v4, v4, v1

    cmpl-float v4, v0, v4

    if-lez v4, :cond_3

    sget v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mAspectRatio:F

    mul-float v1, v1, v0

    float-to-int v0, v1

    goto :goto_0

    :cond_3
    sget v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mAspectRatio:F

    div-float/2addr v0, v1

    float-to-int v0, v0

    move v1, v0

    move v0, v2

    :goto_1
    invoke-virtual {p0, v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->setMeasuredDimension(II)V

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onMeasure(%X %X %d %d %f)"

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v5

    const/4 p1, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v4, p1

    const/4 p1, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v4, p1

    const/4 p1, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v4, p1

    const/4 p1, 0x4

    sget p2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mAspectRatio:F

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    aput-object p2, v4, p1

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 6

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->updateActualSurface(Landroid/graphics/SurfaceTexture;)V

    iput p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_width:I

    iput p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_height:I

    sget-object p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->LOG_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onSurfaceTextureAvailable "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->diagString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-nez v1, :cond_0

    const-string v1, "(editor is null)"

    goto :goto_0

    :cond_0
    const-string v1, "(editor is SET)"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurface:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Landroid/view/Surface;)V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->w()V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->postOnPrepareSurfaceRunnables:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->postOnPrepareSurfaceRunnables:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    :cond_2
    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->nexThemeViewCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;

    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->nexThemeViewCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v5, 0x0

    move v3, p2

    move v4, p3

    invoke-interface/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;->onEventNotify(ILjava/lang/Object;III)V

    :cond_3
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->isAvailable:Z

    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 6

    sget-object p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->LOG_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onSurfaceTextureDestroyed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->diagString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-nez v1, :cond_0

    const-string v1, "(editor is null)"

    goto :goto_0

    :cond_0
    const-string v1, "(editor is SET)"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Landroid/view/Surface;)V

    :cond_1
    iput-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurfaceTexture:Landroid/graphics/SurfaceTexture;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurface:Landroid/view/Surface;

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->nexThemeViewCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->nexThemeViewCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;->onEventNotify(ILjava/lang/Object;III)V

    :cond_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->isAvailable:Z

    const/4 p1, 0x1

    return p1
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 6

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->updateActualSurface(Landroid/graphics/SurfaceTexture;)V

    iput p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_width:I

    iput p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->m_height:I

    sget-object p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->LOG_TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onSurfaceTextureSizeChanged "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->diagString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-nez v1, :cond_0

    const-string v1, "(editor is null)"

    goto :goto_0

    :cond_0
    const-string v1, "(editor is SET)"

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->actualSurface:Landroid/view/Surface;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Landroid/view/Surface;)V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mEditor:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->w()V

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->nexThemeViewCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->nexThemeViewCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v5, 0x0

    move v3, p2

    move v4, p3

    invoke-interface/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;->onEventNotify(ILjava/lang/Object;III)V

    :cond_2
    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method

.method public postOnPrepareSurface(Ljava/lang/Runnable;)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->postOnPrepareSurfaceRunnables:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public requestDraw(I)V
    .locals 3

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestDraw("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;->Native:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;

    iput-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mRenderType:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$RenderType;

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mCurrentTime:I

    return-void
.end method

.method public setBlackOut(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->mBlackOut:Z

    return-void
.end method

.method protected setNotify(Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView;->nexThemeViewCallback:Lcom/nexstreaming/kminternal/nexvideoeditor/NexThemeView$b;

    return-void
.end method
