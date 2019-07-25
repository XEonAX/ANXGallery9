.class Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;
.super Ljava/lang/Object;
.source "BackupDetailFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BackupDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BackupLoaderCallBack"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BackupDetailFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BackupDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 0

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/BackupDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/BackupDetailFragment;->configLoader(Landroid/content/CursorLoader;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BackupDetailFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/BackupDetailFragment;->access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    move-result-object v0

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->classifyCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BackupDetailFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCount()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/BackupDetailFragment;->setEmptyViewVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;->this$0:Lcom/miui/gallery/ui/BackupDetailFragment;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/BackupDetailFragment;->setEmptyViewVisibility(I)V

    :goto_0
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
