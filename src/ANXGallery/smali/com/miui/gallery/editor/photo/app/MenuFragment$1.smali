.class Lcom/miui/gallery/editor/photo/app/MenuFragment$1;
.super Ljava/lang/Object;
.source "MenuFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/MenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/MenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/MenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/MenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f0901f9

    if-ne v0, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/MenuFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->notifySave()V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090073

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/MenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/MenuFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->notifyDiscard()V

    :cond_1
    :goto_0
    return-void
.end method
