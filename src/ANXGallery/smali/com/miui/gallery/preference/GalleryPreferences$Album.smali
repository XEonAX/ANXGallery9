.class public Lcom/miui/gallery/preference/GalleryPreferences$Album;
.super Ljava/lang/Object;
.source "GalleryPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/preference/GalleryPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Album"
.end annotation


# direct methods
.method public static getCachedSortByModifyAlbumIds()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "key_cached_album_sort_by_modify_album_ids"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static getCachedSortByModifyAlbumPaths()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "key_cached_album_sort_by_modify_album_paths"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public static getNextForceTopTime()J
    .locals 5

    const-string v0, "key_next_force_top_create_time"

    const-wide/16 v1, -0x3ea

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    const-string v2, "key_next_force_top_create_time"

    const-wide/16 v3, 0x1

    sub-long v3, v0, v3

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    return-wide v0
.end method

.method public static getVirtualAlbumSortBy(JJ)J
    .locals 2

    const-string v0, "key_virtual_album_prefix_%d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x0

    aput-object p0, v1, p1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p2, p3}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static isForceTopAlbumByTopTime(J)Z
    .locals 5

    const-string v0, "key_next_force_top_create_time"

    const-wide/16 v1, -0x3ea

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v0, p0, v3

    if-ltz v0, :cond_0

    cmp-long v0, p0, v1

    if-gtz v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static setCachedSortByModifyAlbumIds(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "key_cached_album_sort_by_modify_album_ids"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putStringSet(Ljava/lang/String;Ljava/util/Set;)V

    return-void
.end method

.method public static setCachedSortByModifyAlbumPaths(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "key_cached_album_sort_by_modify_album_paths"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putStringSet(Ljava/lang/String;Ljava/util/Set;)V

    return-void
.end method

.method public static setVirtualAlbumSortBy(JJ)V
    .locals 2

    const-string v0, "key_virtual_album_prefix_%d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x0

    aput-object p0, v1, p1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p2, p3}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    return-void
.end method
