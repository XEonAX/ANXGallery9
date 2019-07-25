.class public Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;
.super Lcom/miui/gallery/ui/PhotoListFragmentBase;
.source "AlbumNewPhotoDetailFragment.java"


# instance fields
.field private mAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

.field protected mIsOtherShareAlbum:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAdapter:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    return-object v0
.end method

.method protected getLayoutSource()I
    .locals 1

    const v0, 0x7f0b0010

    return v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "album_new_photo_detail"

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 7

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mIsOtherShareAlbum:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-eqz v0, :cond_0

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "(%s >= %s)"

    new-array v3, v3, [Ljava/lang/Object;

    const-string v5, "serverTag"

    aput-object v5, v3, v2

    iget-wide v5, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumId:J

    invoke-static {v5, v6}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->getMinServerTagOfNewPhoto(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v1

    invoke-static {v0, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "(%s >= ? AND %s = ?)"

    new-array v3, v3, [Ljava/lang/Object;

    const-string v5, "serverTag"

    aput-object v5, v3, v2

    const-string v2, "localGroupId"

    aput-object v2, v3, v1

    invoke-static {v0, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSelectionArgs()[Ljava/lang/String;
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mIsOtherShareAlbum:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-wide v2, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumId:J

    invoke-static {v2, v3}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->getMinServerTagOfNewPhoto(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-wide v2, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumId:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mIsOtherShareAlbum:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OTHER_ALBUM_MEDIA:Landroid/net/Uri;

    iget-wide v1, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumId:J

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .locals 4

    iget-wide v0, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumId:J

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->saveMinServerTagOfNewPhoto(JLjava/lang/Long;)V

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onDestroy()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    const-string p3, "album_name"

    invoke-virtual {p2, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumName:Ljava/lang/String;

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumName:Ljava/lang/String;

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p3}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object p3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumName:Ljava/lang/String;

    invoke-virtual {p3, v0}, Lmiui/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_0
    const-string p3, "album_id"

    const-wide/16 v0, -0x1

    invoke-virtual {p2, p3, v0, v1}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumId:J

    const-string p3, "other_share_album"

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mIsOtherShareAlbum:Z

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumNewPhotoDetailFragment;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p2, v0}, Landroid/widget/GridView;->setLongClickable(Z)V

    return-object p1
.end method
