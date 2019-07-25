.class Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixListener;
.super Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;
.source "ScreenCropView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BoundsFixListener"
.end annotation


# instance fields
.field private mCallback:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixListener;->this$0:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixListener;->mCallback:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixListener;->mCallback:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;->onDone()V

    return-void
.end method
