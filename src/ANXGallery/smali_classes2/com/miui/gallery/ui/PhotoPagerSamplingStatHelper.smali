.class public Lcom/miui/gallery/ui/PhotoPagerSamplingStatHelper;
.super Ljava/lang/Object;
.source "PhotoPagerSamplingStatHelper.java"


# static fields
.field private static mEditorSavedUri:Landroid/net/Uri;


# direct methods
.method public static onDestroy()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/miui/gallery/ui/PhotoPagerSamplingStatHelper;->mEditorSavedUri:Landroid/net/Uri;

    return-void
.end method

.method public static onEditorSaved(Landroid/net/Uri;)V
    .locals 0

    sput-object p0, Lcom/miui/gallery/ui/PhotoPagerSamplingStatHelper;->mEditorSavedUri:Landroid/net/Uri;

    return-void
.end method

.method public static onImageShared(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/miui/gallery/ui/PhotoPagerSamplingStatHelper;->mEditorSavedUri:Landroid/net/Uri;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/ui/PhotoPagerSamplingStatHelper;->mEditorSavedUri:Landroid/net/Uri;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "PhotoPagerSamplingStatHelper"

    const-string v0, "User share the photo after edit."

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "photo"

    const-string v0, "photo_share_after_edit"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 p0, 0x0

    sput-object p0, Lcom/miui/gallery/ui/PhotoPagerSamplingStatHelper;->mEditorSavedUri:Landroid/net/Uri;

    return-void
.end method
