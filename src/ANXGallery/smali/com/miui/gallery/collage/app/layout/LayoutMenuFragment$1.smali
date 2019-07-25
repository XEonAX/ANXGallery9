.class Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$1;
.super Ljava/lang/Object;
.source "LayoutMenuFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$1;->this$0:Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/collage/render/CollageMargin;->values()[Lcom/miui/gallery/collage/render/CollageMargin;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$1;->this$0:Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->access$000(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)Lcom/miui/gallery/collage/render/CollageMargin;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/collage/render/CollageMargin;->ordinal()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    array-length v1, p1

    rem-int/2addr v0, v1

    aget-object p1, p1, v0

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$1;->this$0:Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;

    invoke-static {v0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->access$100(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;)Landroid/widget/ImageView;

    move-result-object v0

    iget v1, p1, Lcom/miui/gallery/collage/render/CollageMargin;->iconRes:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$1;->this$0:Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->getRenderFragment()Lcom/miui/gallery/collage/app/common/CollageRenderFragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/collage/app/common/AbstractLayoutFragment;

    iget v1, p1, Lcom/miui/gallery/collage/render/CollageMargin;->marginSize:F

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/app/common/AbstractLayoutFragment;->onSelectMargin(F)V

    iget-object v0, p0, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment$1;->this$0:Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;->access$002(Lcom/miui/gallery/collage/app/layout/LayoutMenuFragment;Lcom/miui/gallery/collage/render/CollageMargin;)Lcom/miui/gallery/collage/render/CollageMargin;

    return-void
.end method
