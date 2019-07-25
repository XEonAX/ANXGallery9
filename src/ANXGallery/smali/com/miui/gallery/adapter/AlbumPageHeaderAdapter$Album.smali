.class Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;
.super Ljava/lang/Object;
.source "AlbumPageHeaderAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Album"
.end annotation


# instance fields
.field mActionUri:Landroid/net/Uri;

.field mAlbumNameRes:I

.field mDefaultCoverRes:I

.field mIndex:I

.field mIsCoverDataValid:Z


# direct methods
.method public constructor <init>(IIILandroid/net/Uri;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mIndex:I

    iput p2, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mAlbumNameRes:I

    iput p3, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mDefaultCoverRes:I

    iput-object p4, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mActionUri:Landroid/net/Uri;

    return-void
.end method
