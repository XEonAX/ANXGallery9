.class Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;
.super Ljava/lang/Object;
.source "PickAlbumDetailFragmentBase.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SelectionHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/picker/helper/AdapterHolder;

.field private mItemStateListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;

.field private mSelection:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/miui/gallery/picker/helper/AdapterHolder;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mSelection:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mAdapter:Lcom/miui/gallery/picker/helper/AdapterHolder;

    return-void
.end method

.method private updateState()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mItemStateListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mItemStateListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;

    invoke-interface {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;->onStateChanged()V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mSelection:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result p1

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->updateState()V

    return p1
.end method

.method public copyFrom(Lcom/miui/gallery/picker/helper/Picker;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mSelection:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mAdapter:Lcom/miui/gallery/picker/helper/AdapterHolder;

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/AdapterHolder;->get()Landroid/widget/BaseAdapter;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Landroid/widget/Adapter;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-interface {v0, v1}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/database/Cursor;

    invoke-static {v2}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mSelection:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->updateState()V

    return-void
.end method

.method isAllSelected()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mAdapter:Lcom/miui/gallery/picker/helper/AdapterHolder;

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/AdapterHolder;->get()Landroid/widget/BaseAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mSelection:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->getCount()I

    move-result v0

    if-ne v1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isNoneSelected()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mSelection:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mSelection:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mSelection:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p1

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->updateState()V

    return p1
.end method

.method public setItemStateListener(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->mItemStateListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;

    return-void
.end method
