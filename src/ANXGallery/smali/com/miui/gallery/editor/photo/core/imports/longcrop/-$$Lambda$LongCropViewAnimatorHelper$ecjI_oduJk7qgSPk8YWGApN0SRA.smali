.class public final synthetic Lcom/miui/gallery/editor/photo/core/imports/longcrop/-$$Lambda$LongCropViewAnimatorHelper$ecjI_oduJk7qgSPk8YWGApN0SRA;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

.field private final synthetic f$1:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/-$$Lambda$LongCropViewAnimatorHelper$ecjI_oduJk7qgSPk8YWGApN0SRA;->f$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/-$$Lambda$LongCropViewAnimatorHelper$ecjI_oduJk7qgSPk8YWGApN0SRA;->f$1:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/-$$Lambda$LongCropViewAnimatorHelper$ecjI_oduJk7qgSPk8YWGApN0SRA;->f$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/-$$Lambda$LongCropViewAnimatorHelper$ecjI_oduJk7qgSPk8YWGApN0SRA;->f$1:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->lambda$animatorStart$50(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;Landroid/animation/ValueAnimator;)V

    return-void
.end method
