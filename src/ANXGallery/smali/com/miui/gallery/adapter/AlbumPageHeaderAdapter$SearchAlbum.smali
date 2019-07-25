.class Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;
.super Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;
.source "AlbumPageHeaderAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SearchAlbum"
.end annotation


# instance fields
.field mCoverUris:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(IIILandroid/net/Uri;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;-><init>(IIILandroid/net/Uri;)V

    return-void
.end method
