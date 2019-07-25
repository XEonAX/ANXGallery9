.class Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "LongCropViewAnimatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->animatorStart(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

.field final synthetic val$callback:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$1;->val$callback:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_END:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->access$002(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;)Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$1;->val$callback:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$Callback;->onInvalidate()V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;->access$002(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongCropViewAnimatorHelper;Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;)Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    return-void
.end method
