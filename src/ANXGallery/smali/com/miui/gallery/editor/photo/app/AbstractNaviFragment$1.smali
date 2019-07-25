.class Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$1;
.super Ljava/lang/Object;
.source "AbstractNaviFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f09010b

    if-ne v0, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;->onExport()V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0900dc

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;->onDiscard()V

    :goto_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "not support view"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
