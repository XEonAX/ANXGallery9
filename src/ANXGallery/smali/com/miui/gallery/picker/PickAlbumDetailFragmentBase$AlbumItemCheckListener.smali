.class public Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;
.super Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;
.source "PickAlbumDetailFragmentBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "AlbumItemCheckListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;Lcom/miui/gallery/picker/helper/Picker;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    invoke-direct {p0, p2}, Lcom/miui/gallery/picker/helper/PickerItemCheckedListener;-><init>(Lcom/miui/gallery/picker/helper/Picker;)V

    return-void
.end method


# virtual methods
.method public onItemChecked(Landroid/database/Cursor;Landroid/view/View;)V
    .locals 6

    invoke-static {p1}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p1}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object v1, v1, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->access$000(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;Lcom/miui/gallery/picker/helper/Picker;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->isFull()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object v1, v1, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->access$100(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;Lcom/miui/gallery/picker/helper/Picker;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f100595

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object v5, v5, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v5}, Lcom/miui/gallery/picker/helper/Picker;->capacity()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_0
    instance-of v0, p2, Landroid/widget/Checkable;

    if-eqz v0, :cond_2

    check-cast p2, Landroid/widget/Checkable;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p1}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result p1

    invoke-interface {p2, p1}, Landroid/widget/Checkable;->setChecked(Z)V

    :cond_2
    return-void
.end method
