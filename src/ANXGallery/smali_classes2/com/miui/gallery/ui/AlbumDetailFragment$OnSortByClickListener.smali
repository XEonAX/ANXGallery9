.class Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;
.super Ljava/lang/Object;
.source "AlbumDetailFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnSortByClickListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/AlbumDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/AlbumDetailFragment;Lcom/miui/gallery/ui/AlbumDetailFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragment;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getLoaderManager()Landroid/app/LoaderManager;

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
    const-string p1, "album_detail"

    const-string v1, "sort_by_size"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    move-object v1, v0

    check-cast v1, Landroid/content/CursorLoader;

    sget-object v2, Lcom/miui/gallery/widget/SortByHeader$SortBy;->SIZE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/ui/AlbumDetailFragment;->access$100(Lcom/miui/gallery/ui/AlbumDetailFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    move-object v1, v0

    check-cast v1, Landroid/content/CursorLoader;

    sget-object v2, Lcom/miui/gallery/widget/SortByHeader$SortBy;->NAME:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/ui/AlbumDetailFragment;->access$100(Lcom/miui/gallery/ui/AlbumDetailFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    const-string p1, "album_detail"

    const-string v1, "sort_by_name"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$OnSortByClickListener;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    move-object v1, v0

    check-cast v1, Landroid/content/CursorLoader;

    sget-object v2, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/ui/AlbumDetailFragment;->access$100(Lcom/miui/gallery/ui/AlbumDetailFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    const-string p1, "album_detail"

    const-string v1, "sort_by_date"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    invoke-virtual {v0}, Landroid/content/Loader;->forceLoad()V

    return-void
.end method
