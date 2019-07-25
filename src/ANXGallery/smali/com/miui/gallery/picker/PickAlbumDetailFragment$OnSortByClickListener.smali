.class Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;
.super Ljava/lang/Object;
.source "PickAlbumDetailFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickAlbumDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnSortByClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Lcom/miui/gallery/picker/PickAlbumDetailFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v1, 0x7f0900c3

    if-eq p1, v1, :cond_2

    const v1, 0x7f0901eb

    if-eq p1, v1, :cond_1

    const v1, 0x7f0902ab

    if-eq p1, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    move-object v1, v0

    check-cast v1, Landroid/content/CursorLoader;

    sget-object v2, Lcom/miui/gallery/widget/SortByHeader$SortBy;->SIZE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$100(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    move-object v1, v0

    check-cast v1, Landroid/content/CursorLoader;

    sget-object v2, Lcom/miui/gallery/widget/SortByHeader$SortBy;->NAME:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$100(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    move-object v1, v0

    check-cast v1, Landroid/content/CursorLoader;

    sget-object v2, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$100(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    :goto_0
    invoke-virtual {v0}, Landroid/content/Loader;->forceLoad()V

    return-void
.end method
