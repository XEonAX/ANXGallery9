.class Lcom/miui/gallery/ui/PhotoListFragmentBase$PhotoListLoaderCallback;
.super Ljava/lang/Object;
.source "PhotoListFragmentBase.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoListFragmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhotoListLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoListFragmentBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoListFragmentBase$PhotoListLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoListFragmentBase;Lcom/miui/gallery/ui/PhotoListFragmentBase$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase$PhotoListLoaderCallback;-><init>(Lcom/miui/gallery/ui/PhotoListFragmentBase;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 0

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoListFragmentBase$PhotoListLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoListFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoListFragmentBase$PhotoListLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->configLoader(Landroid/content/CursorLoader;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoListFragmentBase$PhotoListLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->mayDoAdditionalWork(Landroid/database/Cursor;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoListFragmentBase$PhotoListLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoListFragmentBase$PhotoListLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCount()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoListFragmentBase$PhotoListLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->setEmptyViewVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoListFragmentBase$PhotoListLoaderCallback;->this$0:Lcom/miui/gallery/ui/PhotoListFragmentBase;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->setEmptyViewVisibility(I)V

    :goto_0
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
