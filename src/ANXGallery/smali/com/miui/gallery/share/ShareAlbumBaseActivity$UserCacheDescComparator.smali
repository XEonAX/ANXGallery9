.class public Lcom/miui/gallery/share/ShareAlbumBaseActivity$UserCacheDescComparator;
.super Ljava/lang/Object;
.source "ShareAlbumBaseActivity.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/ShareAlbumBaseActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserCacheDescComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/miui/gallery/share/CloudUserCacheEntry;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/share/CloudUserCacheEntry;Lcom/miui/gallery/share/CloudUserCacheEntry;)I
    .locals 3

    iget-wide v0, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mCreateTime:J

    iget-wide p1, p2, Lcom/miui/gallery/share/CloudUserCacheEntry;->mCreateTime:J

    cmp-long v2, v0, p1

    if-nez v2, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    cmp-long v2, v0, p1

    if-gez v2, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    :goto_0
    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/share/CloudUserCacheEntry;

    check-cast p2, Lcom/miui/gallery/share/CloudUserCacheEntry;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/share/ShareAlbumBaseActivity$UserCacheDescComparator;->compare(Lcom/miui/gallery/share/CloudUserCacheEntry;Lcom/miui/gallery/share/CloudUserCacheEntry;)I

    move-result p1

    return p1
.end method
