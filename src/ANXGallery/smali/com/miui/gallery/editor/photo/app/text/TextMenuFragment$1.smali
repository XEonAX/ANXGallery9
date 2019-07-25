.class Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$1;
.super Ljava/lang/Object;
.source "TextMenuFragment.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 1

    const/4 p1, 0x1

    const v0, 0x7f090248

    if-ne p2, v0, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Landroid/support/v4/view/ViewPager;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, v0, p1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    goto :goto_0

    :cond_0
    const v0, 0x7f09024e

    if-ne p2, v0, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/app/text/TextMenuFragment;)Landroid/support/v4/view/ViewPager;

    move-result-object p2

    invoke-virtual {p2, p1, p1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    :cond_1
    :goto_0
    return-void
.end method
