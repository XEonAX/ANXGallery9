.class Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;
.super Ljava/lang/Object;
.source "SimilarPhotoPickFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SimilarPhotoPickFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SimilarPhotoPickLoaderCallback"
.end annotation


# instance fields
.field public mLoader:Landroid/content/CursorLoader;

.field final synthetic this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;-><init>(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 0

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->mLoader:Landroid/content/CursorLoader;

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    iget-object p2, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->mLoader:Landroid/content/CursorLoader;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->configLoader(Landroid/content/CursorLoader;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->mLoader:Landroid/content/CursorLoader;

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 12

    check-cast p2, Landroid/database/Cursor;

    new-instance p1, Ljava/util/ArrayList;

    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    :cond_0
    invoke-interface {p2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$1400(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$1500(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$1600(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {v5}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$400(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v6, 0x0

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {p1, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->remove()V

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v7, v9, :cond_3

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    if-le v9, v6, :cond_2

    goto :goto_2

    :cond_2
    add-int/lit8 v8, v7, 0x1

    move v11, v8

    move v8, v7

    move v7, v11

    goto :goto_1

    :cond_3
    :goto_2
    add-int/lit8 v7, v8, 0x1

    :goto_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, 0x1

    if-ge v7, v9, :cond_5

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    sub-int/2addr v9, v10

    if-ltz v9, :cond_4

    goto :goto_4

    :cond_4
    const/4 v9, 0x0

    :goto_4
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v2, v7, v9}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_5
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-gt v7, v10, :cond_6

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_0

    :cond_6
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    sub-int/2addr v7, v10

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v8, v7}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    :cond_7
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    :cond_8
    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result p1

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne p1, v5, :cond_9

    new-instance p1, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;

    iget-object v5, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-direct {p1, v5, p2, v4}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;-><init>(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;Landroid/database/Cursor;Ljava/util/ArrayList;)V

    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    const-string v5, "extra_timeline_item_count_in_group"

    invoke-virtual {p2, v5, v0}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string v0, "extra_timeline_group_start_pos"

    invoke-virtual {p2, v0, v2}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string v0, "extra_timeline_group_ids"

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v2

    invoke-virtual {p2, v0, v2}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->setExtras(Landroid/os/Bundle;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_9

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$800(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V

    :cond_9
    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCount()I

    move-result p1

    if-nez p1, :cond_a

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->setEmptyViewVisibility(I)V

    goto :goto_5

    :cond_a
    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->setEmptyViewVisibility(I)V

    :goto_5
    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$200(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Lcom/miui/gallery/cleaner/SimilarScanner;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/SimilarScanner;->isLoadingValid()Z

    move-result p1

    if-eqz p1, :cond_b

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$1700(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Lcom/miui/gallery/widget/LoadMoreLayout;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/LoadMoreLayout;->startLoad()V

    goto :goto_6

    :cond_b
    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SimilarPhotoPickLoaderCallback;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$1700(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Lcom/miui/gallery/widget/LoadMoreLayout;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/LoadMoreLayout;->setLoadComplete()V

    :goto_6
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
