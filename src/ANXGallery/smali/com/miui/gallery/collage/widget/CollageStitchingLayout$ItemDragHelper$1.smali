.class Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper$1;
.super Ljava/lang/Object;
.source "CollageStitchingLayout.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper$1;->this$1:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper$1;->this$1:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    iget-object p1, p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;->mCollageImageView:Lcom/miui/gallery/collage/widget/CollageImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/widget/CollageImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper$1;->this$1:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;->mDragBitmap:Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper$1;->this$1:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    iput-object v0, p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;->mCollageImageView:Lcom/miui/gallery/collage/widget/CollageImageView;

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper$1;->this$1:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    iget-object p1, p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;->this$0:Lcom/miui/gallery/collage/widget/CollageStitchingLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->invalidate()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
