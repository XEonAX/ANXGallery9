.class Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$5;
.super Ljava/lang/Object;
.source "MosaicMenuFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$5;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$5;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$1100(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;->doRevoke()V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment$5;->this$0:Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;->access$1200(Lcom/miui/gallery/editor/photo/app/mosaic/MosaicMenuFragment;)Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractMosaicFragment;->doRevert()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0901fe
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
