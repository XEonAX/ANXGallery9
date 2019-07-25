.class public Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;
.super Landroid/content/ContentProvider;
.source "GalleryCloudProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;,
        Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;
    }
.end annotation


# static fields
.field private static final SAFE_INSERT_PROJECTION:[Ljava/lang/String;

.field public static final SYNC_SETTINGS_URI:Landroid/net/Uri;

.field public static final UPLOAD_STATE_URI:Landroid/net/Uri;

.field protected static sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

.field protected static final sUriMatcher:Landroid/content/UriMatcher;


# instance fields
.field private mContentResolver:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;

.field private mHasPendingItem:I

.field private mIsUploading:I

.field protected mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract;->AUTHORITY_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "uploadState"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->UPLOAD_STATE_URI:Landroid/net/Uri;

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract;->AUTHORITY_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "syncSettings"

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->SYNC_SETTINGS_URI:Landroid/net/Uri;

    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloud"

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloud/#"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloudSetting"

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloudSetting/#"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "shareAlbum"

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "shareAlbum/#"

    const/4 v3, 0x6

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "shareUser"

    const/4 v3, 0x7

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "shareUser/#"

    const/16 v3, 0x8

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "shareImage"

    const/16 v3, 0x9

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "shareImage/#"

    const/16 v3, 0xa

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloudUser"

    const/16 v3, 0xb

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloudUser/#"

    const/16 v3, 0xc

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloudCache"

    const/16 v3, 0xd

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloudCache/#"

    const/16 v3, 0xe

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "newFlagCache"

    const/16 v3, 0xf

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "newFlagCache/#"

    const/16 v3, 0x10

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "userInfo"

    const/16 v3, 0x11

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "userInfo/#"

    const/16 v3, 0x12

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "ownerSubUbifocus"

    const/16 v3, 0x13

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "ownerSubUbifocus/#"

    const/16 v3, 0x14

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "shareSubUbifocus"

    const/16 v3, 0x15

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "shareSubUbifocus/#"

    const/16 v3, 0x16

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "peopleFace"

    const/16 v3, 0x18

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "peopleFace/#"

    const/16 v3, 0x19

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "faceToImages"

    const/16 v3, 0x1a

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "faceToImages/#"

    const/16 v3, 0x1b

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "peopleFaceJoinFaceToImagesJoinCloud"

    const/16 v3, 0x1c

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "peopleFaceJoinFaceToImagesJoinCloud/#"

    const/16 v3, 0x1d

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "peopleFaceJoinFaceToImages"

    const/16 v3, 0x26

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "peopleFaceJoinFaceToImages/#"

    const/16 v3, 0x27

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "uploadState"

    const/16 v3, 0x17

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "peopleRecommend"

    const/16 v3, 0x1e

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "peopleRecommend/#"

    const/16 v3, 0x1f

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "event"

    const/16 v3, 0x20

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "event/#"

    const/16 v3, 0x21

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "eventPhoto"

    const/16 v3, 0x22

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "eventPhoto/#"

    const/16 v3, 0x23

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "albumCoverKey"

    const/16 v3, 0x24

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "albumCoverKey/#"

    const/16 v3, 0x25

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "syncInfo"

    const/16 v3, 0x28

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "syncSettings"

    const/16 v3, 0x29

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    const-string v0, "_id"

    const-string v1, "fileName"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->SAFE_INSERT_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mIsUploading:I

    iput v0, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mHasPendingItem:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    return-void
.end method

.method private appendIdSelection(Ljava/lang/String;J)Ljava/lang/String;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    const/4 v0, 0x0

    if-lez v2, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_id = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    move-object p2, v0

    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_1

    return-object v0

    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_2

    return-object p2

    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_3

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_3

    return-object p1

    :cond_3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_4

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_4

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "("

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " ) AND "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_4
    return-object v0
.end method

.method private deleteNonDBData(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 0

    sget-object p2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p1

    const/16 p2, 0x17

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private deleteSyncInfo(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 0

    sget-object p2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p1

    const/16 p2, 0x28

    if-ne p1, p2, :cond_0

    const-string p1, "GalleryCloudProvider"

    const-string p2, "operation is not supported!"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public static getIdFromString(Ljava/lang/String;)J
    .locals 2

    if-eqz p0, :cond_0

    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method private final getIdsSelection(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    const-string v1, "cloud"

    const-string v2, "_id"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, p1

    move-object v4, p2

    invoke-virtual/range {v0 .. v8}, Lcom/miui/gallery/provider/GalleryDBHelper;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_1

    :try_start_0
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-object p2

    :catchall_0
    move-exception p2

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw p2

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getMediaCount(Ljava/lang/String;Ljava/lang/String;)I
    .locals 10

    const-string v0, "count(_id)"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v3

    const/4 v0, 0x0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v2, p1

    move-object v4, p2

    invoke-virtual/range {v1 .. v9}, Lcom/miui/gallery/provider/GalleryDBHelper;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_0
    return p2

    :catchall_0
    move-exception p2

    goto :goto_0

    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_2
    return p2

    :catchall_1
    move-exception p2

    move-object p1, v0

    :goto_0
    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_3
    throw p2
.end method

.method private insertNonDBData(Landroid/net/Uri;Landroid/content/ContentValues;)Z
    .locals 0

    sget-object p2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p1

    const/16 p2, 0x17

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private insertSyncInfo(Landroid/net/Uri;Landroid/content/ContentValues;)Z
    .locals 0

    sget-object p2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p1

    const/16 p2, 0x28

    if-ne p1, p2, :cond_0

    const-string p1, "GalleryCloudProvider"

    const-string p2, "operation is not supported!"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public static isCloudUri(Landroid/net/Uri;)Z
    .locals 1

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract;->AUTHORITY_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static matchTableName(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p0

    packed-switch p0, :pswitch_data_0

    const-string p0, "GalleryCloudProvider"

    const-string v0, "match table name, uri is not cloud"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    goto :goto_0

    :pswitch_0
    const-string p0, "peopleFace join faceToImages"

    goto :goto_0

    :pswitch_1
    const-string p0, "albumCoverKey"

    goto :goto_0

    :pswitch_2
    const-string p0, "eventPhoto"

    goto :goto_0

    :pswitch_3
    const-string p0, "event"

    goto :goto_0

    :pswitch_4
    const-string p0, "peopleRecommend"

    goto :goto_0

    :pswitch_5
    const-string p0, "peopleFace join FaceToImages join cloud"

    goto :goto_0

    :pswitch_6
    const-string p0, "faceToImages"

    goto :goto_0

    :pswitch_7
    const-string p0, "peopleFace"

    goto :goto_0

    :pswitch_8
    const-string p0, "uploadState"

    goto :goto_0

    :pswitch_9
    const-string p0, "shareSubUbifocus"

    goto :goto_0

    :pswitch_a
    const-string p0, "ownerSubUbifocus"

    goto :goto_0

    :pswitch_b
    const-string p0, "userInfo"

    goto :goto_0

    :pswitch_c
    const-string p0, "newFlagCache"

    goto :goto_0

    :pswitch_d
    const-string p0, "cloudCache"

    goto :goto_0

    :pswitch_e
    const-string p0, "cloudUser"

    goto :goto_0

    :pswitch_f
    const-string p0, "shareImage"

    goto :goto_0

    :pswitch_10
    const-string p0, "shareUser"

    goto :goto_0

    :pswitch_11
    const-string p0, "shareAlbum"

    goto :goto_0

    :pswitch_12
    const-string p0, "cloudSetting"

    goto :goto_0

    :pswitch_13
    const-string p0, "cloud"

    :goto_0
    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_13
        :pswitch_13
        :pswitch_12
        :pswitch_12
        :pswitch_11
        :pswitch_11
        :pswitch_10
        :pswitch_10
        :pswitch_f
        :pswitch_f
        :pswitch_e
        :pswitch_e
        :pswitch_d
        :pswitch_d
        :pswitch_c
        :pswitch_c
        :pswitch_b
        :pswitch_b
        :pswitch_a
        :pswitch_a
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private queryNonDBData(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 2

    sget-object p2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p1

    const/4 p2, 0x0

    const/4 p3, 0x1

    const/16 p4, 0x17

    if-ne p1, p4, :cond_0

    new-instance p1, Landroid/database/MatrixCursor;

    const-string p4, "is_upload"

    const-string p5, "has_pending_item"

    filled-new-array {p4, p5}, [Ljava/lang/String;

    move-result-object p4

    invoke-direct {p1, p4, p3}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;I)V

    const-string p4, "GalleryCloudProvider"

    const-string p5, "query upload state isUploading[%d], hasPendingItem[%d]"

    iget v0, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mIsUploading:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mHasPendingItem:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p4, p5, v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p4, 0x2

    new-array p4, p4, [Ljava/lang/Object;

    iget p5, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mIsUploading:I

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    aput-object p5, p4, p2

    iget p2, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mHasPendingItem:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, p4, p3

    invoke-virtual {p1, p4}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    return-object p1

    :cond_0
    const/16 p4, 0x29

    if-ne p1, p4, :cond_1

    new-instance p1, Landroid/database/MatrixCursor;

    const-string p4, "backupOnlyInWifi"

    filled-new-array {p4}, [Ljava/lang/String;

    move-result-object p4

    invoke-direct {p1, p4, p3}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;I)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getBackupOnlyInWifi()Z

    move-result p4

    const-string p5, "GalleryCloudProvider"

    const-string v0, "query backup only wifi [%s]"

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p5, v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-array p3, p3, [Ljava/lang/Object;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    aput-object p4, p3, p2

    invoke-virtual {p1, p3}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private querySyncInfo(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 17

    move-object/from16 v0, p0

    sget-object v1, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v2, p1

    invoke-virtual {v1, v2}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    const/16 v2, 0x28

    if-ne v1, v2, :cond_6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "(%s) AND (%s = %s OR %s = %s) AND (%s = %s OR %s = %s) AND ((serverType = 1 AND size < %s) OR (serverType = 2 AND size < %s))"

    const/16 v3, 0xb

    new-array v3, v3, [Ljava/lang/Object;

    sget-object v4, Lcom/miui/gallery/cloud/CloudUtils;->SELECTION_OWNER_NEED_SYNC:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "serverType"

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v7, 0x2

    aput-object v4, v3, v7

    const-string v4, "serverType"

    const/4 v8, 0x3

    aput-object v4, v3, v8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v9, 0x4

    aput-object v4, v3, v9

    const-string v4, "localFlag"

    const/4 v10, 0x5

    aput-object v4, v3, v10

    const/4 v4, 0x7

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v12, 0x6

    aput-object v11, v3, v12

    const-string v11, "localFlag"

    aput-object v11, v3, v4

    const/16 v11, 0x8

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v3, v11

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getMaxImageSizeLimit()J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    const/16 v14, 0x9

    aput-object v13, v3, v14

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getMaxVideoSizeLimit()J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    const/16 v15, 0xa

    aput-object v13, v3, v15

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "(%s = %d OR %s = %d) AND (%s = %s OR %s = %s) AND ((serverType = 1 AND size < %s) OR (serverType = 2 AND size < %s))"

    new-array v13, v15, [Ljava/lang/Object;

    const-string v15, "localFlag"

    aput-object v15, v13, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v6

    const-string v15, "localFlag"

    aput-object v15, v13, v7

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v8

    const-string v15, "serverType"

    aput-object v15, v13, v9

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v10

    const-string v15, "serverType"

    aput-object v15, v13, v12

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v4

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getMaxImageSizeLimit()J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    aput-object v15, v13, v11

    invoke-static {}, Lcom/miui/gallery/cloud/CloudUtils;->getMaxVideoSizeLimit()J

    move-result-wide v15

    invoke-static/range {v15 .. v16}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v2, v3, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "%s = \'%s\' AND %s = %d AND (%s = %s OR %s = %s) "

    new-array v11, v11, [Ljava/lang/Object;

    const-string v14, "serverStatus"

    aput-object v14, v11, v5

    const-string v14, "custom"

    aput-object v14, v11, v6

    const-string v14, "localFlag"

    aput-object v14, v11, v7

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v11, v8

    const-string v8, "serverType"

    aput-object v8, v11, v9

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v11, v10

    const-string v8, "serverType"

    aput-object v8, v11, v12

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v11, v4

    invoke-static {v3, v13, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    if-nez p2, :cond_0

    const-string v4, "syncableCount"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_0
    move-object/from16 v4, p2

    :goto_0
    array-length v7, v4

    new-array v7, v7, [Ljava/lang/Integer;

    const/4 v8, -0x1

    const/4 v9, -0x1

    const/4 v10, -0x1

    :goto_1
    array-length v11, v4

    if-ge v5, v11, :cond_5

    aget-object v11, v4, v5

    const-string v12, "syncableCount"

    invoke-static {v11, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_2

    if-ne v9, v8, :cond_1

    const-string v9, "cloud"

    invoke-direct {v0, v9, v1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getMediaCount(Ljava/lang/String;Ljava/lang/String;)I

    move-result v9

    const-string v11, "shareImage"

    invoke-direct {v0, v11, v2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getMediaCount(Ljava/lang/String;Ljava/lang/String;)I

    move-result v11

    add-int/2addr v9, v11

    :cond_1
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v7, v5

    goto :goto_2

    :cond_2
    aget-object v11, v4, v5

    const-string v12, "syncedCount"

    invoke-static {v11, v12}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_4

    if-ne v10, v8, :cond_3

    const-string v10, "cloud"

    invoke-direct {v0, v10, v3}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getMediaCount(Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    const-string v11, "shareImage"

    invoke-direct {v0, v11, v3}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getMediaCount(Ljava/lang/String;Ljava/lang/String;)I

    move-result v11

    add-int/2addr v10, v11

    :cond_3
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v7, v5

    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unsupported argument: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v3, v4, v5

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_5
    const-string v1, "GalleryCloudProvider"

    const-string v2, "query syncInfo syncableCount[%d], syncedCount[%d]"

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v1, v2, v3, v5}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Landroid/database/MatrixCursor;

    invoke-direct {v1, v4, v6}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;I)V

    invoke-virtual {v1, v7}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    return-object v1

    :cond_6
    const/4 v1, 0x0

    return-object v1
.end method

.method public static rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    .locals 1

    sget-object p1, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    sget-object p1, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    invoke-virtual {p1, p0, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method private updateNonDBData(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 3

    sget-object p3, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p3

    const/4 p4, 0x0

    const/16 v0, 0x17

    if-ne p3, v0, :cond_4

    const-string p3, "is_upload"

    invoke-virtual {p2, p3}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p3

    const-string v0, "has_pending_item"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p2

    const/4 v0, 0x1

    if-eqz p3, :cond_1

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    if-nez p3, :cond_0

    iput p4, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mIsUploading:I

    goto :goto_0

    :cond_0
    iput v0, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mIsUploading:I

    :cond_1
    :goto_0
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_2

    iput v0, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mHasPendingItem:I

    goto :goto_1

    :cond_2
    iput p4, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mHasPendingItem:I

    :cond_3
    :goto_1
    iget-object p2, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mContentResolver:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;

    const/4 p3, 0x0

    const-wide/16 v1, 0x0

    invoke-virtual {p2, p1, p3, v1, v2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    return v0

    :cond_4
    return p4
.end method

.method private updateSyncInfo(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 0

    sget-object p2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p1

    const/16 p2, 0x28

    if-ne p1, p2, :cond_0

    const-string p1, "GalleryCloudProvider"

    const-string p2, "operation is not supported!"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private static validateInsertValues(Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 2

    const-string v0, "userInfo"

    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "date_modified"

    invoke-virtual {p1, p0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "date_modified"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :cond_0
    return-void
.end method

.method private static validateUpdateValues(Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 2

    const-string v0, "userInfo"

    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "date_modified"

    invoke-virtual {p1, p0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "date_modified"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected appendValuesForCloud(Landroid/content/ContentValues;Z)Landroid/content/ContentValues;
    .locals 2

    const-string v0, "fileName"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/miui/gallery/util/FileUtils;->getPackageNameFromScreenshotFileName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string p2, "location"

    invoke-virtual {p1, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    const-string p2, "location"

    invoke-virtual {p1, p2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->getInstance()Lcom/miui/gallery/data/LocationManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/data/LocationManager;->appendDefaultLocationValues(Landroid/content/ContentValues;)V

    :cond_1
    :goto_0
    return-object p1
.end method

.method public call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 3

    const-string v0, "raw_update"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "statement"

    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_1

    sget-object p2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->execSQL(Ljava/lang/String;)Z

    move-result p1

    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    const-string v1, "bool_result"

    invoke-virtual {p2, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    if-eqz p1, :cond_0

    const-string p1, "notify_uri"

    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    if-eqz p1, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mContentResolver:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;

    const-wide/16 v1, 0x0

    invoke-virtual {p3, p1, v0, v1, v2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->notifyChangeDelay(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    :cond_0
    return-object p2

    :cond_1
    return-object v0

    :cond_2
    invoke-super {p0, p1, p2, p3}, Landroid/content/ContentProvider;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 4

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->deleteNonDBData(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->deleteSyncInfo(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->matchTableName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "cloud"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    invoke-virtual {p0, p2, p3}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->genIDSelection(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_2
    move-object v1, v2

    :goto_0
    sget-object v3, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v3, v0, p2, p3}, Lcom/miui/gallery/provider/GalleryDBHelper;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p2

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_3

    iget-object p3, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {p3, v1, v2}, Lcom/miui/gallery/provider/cache/MediaManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {p0, v1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->deleteAttributes(Ljava/lang/String;)V

    :cond_3
    if-lez p2, :cond_4

    iget-object p3, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mContentResolver:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;

    const-wide/16 v0, 0x0

    invoke-virtual {p3, p1, v2, v0, v1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    :cond_4
    return p2

    :cond_5
    :goto_1
    return v1
.end method

.method protected final deleteAttributes(Ljava/lang/String;)V
    .locals 6

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->genSelectedAlbums(Ljava/lang/String;)[Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;

    move-result-object p1

    if-eqz p1, :cond_0

    array-length v0, p1

    if-lez v0, :cond_0

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    iget-wide v4, v2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;->mAlbumId:J

    invoke-virtual {v3, v4, v5}, Lcom/miui/gallery/provider/cache/MediaManager;->deleteAttributes(J)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected final genIDSelection(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_id"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " IN ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getIdsSelection(Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x29

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected final genSelectedAlbums(Ljava/lang/String;)[Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;
    .locals 10

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    const-string v1, "cloud"

    sget-object v2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;->PROJECTION:[Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " AND "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "serverType"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " = ?"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 p1, 0x1

    new-array v4, p1, [Ljava/lang/String;

    const/4 v9, 0x0

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Lcom/miui/gallery/provider/GalleryDBHelper;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    :goto_0
    new-array v1, v1, [Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;

    if-eqz v0, :cond_2

    :goto_1
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-interface {v0, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-interface {v0}, Landroid/database/Cursor;->getPosition()I

    move-result v6

    new-instance v7, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;

    invoke-direct {v7, v2, v3, v4, v5}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;-><init>(JJ)V

    aput-object v7, v1, v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_2

    :catchall_0
    move-exception p1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw p1

    :cond_2
    :goto_2
    return-object v1
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 12

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->insertNonDBData(Landroid/net/Uri;Landroid/content/ContentValues;)Z

    move-result v0

    if-nez v0, :cond_9

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->insertSyncInfo(Landroid/net/Uri;Landroid/content/ContentValues;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_2

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->matchTableName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransactionNonExclusive()V

    :try_start_0
    invoke-virtual {p0, v2, v0, p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->onPreInsert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    const-wide/16 v5, -0x1

    cmp-long v7, v3, v5

    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-nez v7, :cond_6

    invoke-static {v0, p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->validateInsertValues(Ljava/lang/String;Landroid/content/ContentValues;)V

    const-string v3, "cloud"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "shareImage"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_2
    invoke-virtual {p0, p2, v11}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->appendValuesForCloud(Landroid/content/ContentValues;Z)Landroid/content/ContentValues;

    :cond_3
    invoke-virtual {v2, v0, v1, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long v7, v3, v5

    if-nez v7, :cond_4

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object v1

    :cond_4
    :try_start_1
    const-string v7, "cloud"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v0, v3, v4, p2}, Lcom/miui/gallery/provider/cache/MediaManager;->insert(JLandroid/content/ContentValues;)J

    const-string v0, "serverType"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "serverType"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0, v10}, Lcom/miui/gallery/util/Numbers;->equals(Ljava/lang/Number;I)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "attributes"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    if-nez p2, :cond_5

    move-wide v10, v8

    goto :goto_0

    :cond_5
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    :goto_0
    invoke-virtual {v0, v3, v4, v10, v11}, Lcom/miui/gallery/provider/cache/MediaManager;->insertAttributes(JJ)V

    goto :goto_1

    :cond_6
    const-string v0, "_id=?"

    new-array v7, v11, [Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v7, v10

    invoke-virtual {p0, p1, p2, v0, v7}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_7
    :goto_1
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    cmp-long p2, v3, v5

    if-nez p2, :cond_8

    return-object v1

    :cond_8
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mContentResolver:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;

    invoke-virtual {p2, p1, v1, v8, v9}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->notifyChangeDelay(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1

    :cond_9
    :goto_2
    return-object v1
.end method

.method protected isMediaItem(Landroid/content/ContentValues;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    const-string v1, "serverType"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    const/4 v1, 0x1

    if-eqz p1, :cond_1

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Numbers;->equals(Ljava/lang/Number;I)Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x2

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Numbers;->equals(Ljava/lang/Number;I)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    return v0

    :cond_2
    return v0
.end method

.method protected needNotifyUpdate(Landroid/net/Uri;Landroid/content/ContentValues;)Z
    .locals 2

    if-eqz p2, :cond_2

    const-string v0, "localFlag"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const-string v0, "serverStatus"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    const-string v0, "specialTypeFlags"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    return v1

    :cond_2
    const-string p2, "requireNotifyUri"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public onCreate()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance(Landroid/content/Context;)Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    new-instance v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;-><init>(Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$1;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mContentResolver:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;

    const/4 v0, 0x1

    return v0
.end method

.method protected onPreInsert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/ContentValues;)J
    .locals 19

    move-object/from16 v0, p3

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "cloud"

    move-object/from16 v3, p2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-wide/16 v3, -0x1

    if-eqz v2, :cond_5

    const-string v2, "serverType"

    invoke-virtual {v0, v2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v7

    const/4 v8, 0x2

    if-eq v7, v6, :cond_1

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ne v7, v8, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-nez v2, :cond_4

    const-string v2, "localFile"

    invoke-virtual {v0, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_4

    const-string v9, "cloud"

    sget-object v10, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->SAFE_INSERT_PROJECTION:[Ljava/lang/String;

    const-string v11, "localFile like ? AND (serverType=0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    new-array v12, v6, [Ljava/lang/String;

    aput-object v2, v12, v5

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v15}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    :goto_0
    move-object v1, v2

    goto/16 :goto_3

    :cond_1
    :goto_1
    const-string v2, "sha1"

    invoke-virtual {v0, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v7, "localGroupId"

    invoke-virtual {v0, v7}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v9, "thumbnailFile"

    invoke-virtual {v0, v9}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "fileName"

    invoke-virtual {v0, v10}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_4

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_4

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_2

    goto :goto_2

    :cond_2
    const-string v12, "cloud"

    sget-object v13, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->SAFE_INSERT_PROJECTION:[Ljava/lang/String;

    const-string v14, "sha1=? AND localGroupId=? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND fileName=?"

    const/4 v9, 0x3

    new-array v15, v9, [Ljava/lang/String;

    aput-object v2, v15, v5

    aput-object v7, v15, v6

    aput-object v10, v15, v8

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v11, p1

    invoke-virtual/range {v11 .. v18}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_0

    :cond_3
    :goto_2
    const-string v9, "cloud"

    sget-object v10, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->SAFE_INSERT_PROJECTION:[Ljava/lang/String;

    const-string v11, "sha1=? AND localGroupId=? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    new-array v12, v8, [Ljava/lang/String;

    aput-object v2, v12, v5

    aput-object v7, v12, v6

    const/4 v2, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v7, p1

    move-object v8, v9

    move-object v9, v10

    move-object v10, v11

    move-object v11, v12

    move-object v12, v2

    invoke-virtual/range {v7 .. v14}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_0

    :cond_4
    :goto_3
    if-eqz v1, :cond_5

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-interface {v1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v5, "GalleryCloudProvider"

    const-string v6, "item conflict in onPreInsert %s"

    invoke-static {v5, v6, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v5

    const-string v6, "name"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "fileName"

    invoke-virtual {v0, v8}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v5, v6, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "Sync"

    const-string v2, "sync_insert_transaction"

    invoke-static {v0, v2, v5}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_5
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-wide v3

    :catchall_0
    move-exception v0

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 13

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->queryNonDBData(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->querySyncInfo(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getIdFromString(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v11

    invoke-static {p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static {p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v9

    invoke-static {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->matchTableName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "peopleFace join FaceToImages join cloud"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " as master"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_2
    move-object v4, v2

    sget-object v2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/UriUtil;->getDistinct(Landroid/net/Uri;)Z

    move-result v3

    move-object v12, p0

    move-object/from16 v5, p3

    invoke-direct {p0, v5, v0, v1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->appendIdSelection(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v6

    move-object v5, p2

    move-object/from16 v7, p4

    move-object/from16 v10, p5

    invoke-virtual/range {v2 .. v11}, Lcom/miui/gallery/provider/GalleryDBHelper;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 5

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->updateNonDBData(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->updateSyncInfo(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_1

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->matchTableName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "cloud"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    invoke-virtual {p0, p3, p4}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->genIDSelection(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "attributes"

    invoke-virtual {p2, v4}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    sget-object v4, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    invoke-virtual {p0, v4, v0, v2, p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->updateAttributes(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)V

    goto :goto_0

    :cond_2
    move-object v2, v3

    :cond_3
    :goto_0
    invoke-static {v0, p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->validateUpdateValues(Ljava/lang/String;Landroid/content/ContentValues;)V

    const-string v4, "cloud"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string v4, "shareImage"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    :cond_4
    invoke-virtual {p0, p2, v1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->appendValuesForCloud(Landroid/content/ContentValues;Z)Landroid/content/ContentValues;

    :cond_5
    sget-object v1, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v1, v0, p2, p3, p4}, Lcom/miui/gallery/provider/GalleryDBHelper;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    iget-object v1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v1, v2, v3, p2}, Lcom/miui/gallery/provider/cache/MediaManager;->update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    move-result v1

    if-eq v1, v0, :cond_6

    invoke-virtual {p0, p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->isMediaItem(Landroid/content/ContentValues;)Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v1, p2}, Lcom/miui/gallery/provider/cache/MediaManager;->isItemDeleted(Landroid/content/ContentValues;)Z

    move-result v1

    if-nez v1, :cond_6

    iget-object v1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    sget-object v2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    invoke-virtual {v1, v2, p3, p4}, Lcom/miui/gallery/provider/cache/MediaManager;->insert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_6
    if-lez v0, :cond_7

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->needNotifyUpdate(Landroid/net/Uri;Landroid/content/ContentValues;)Z

    move-result p2

    if-eqz p2, :cond_7

    iget-object p2, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mContentResolver:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;

    const-wide/16 p3, 0x0

    invoke-virtual {p2, p1, v3, p3, p4}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->notifyChangeDelay(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    :cond_7
    return v0

    :cond_8
    :goto_1
    return v1
.end method

.method protected final updateAttributes(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v0, v1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->genSelectedAlbums(Ljava/lang/String;)[Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;

    move-result-object v1

    if-eqz v1, :cond_4

    array-length v3, v1

    if-lez v3, :cond_4

    const-string v3, "attributes"

    invoke-virtual {v2, v3}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    array-length v5, v1

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    if-ge v7, v5, :cond_3

    aget-object v8, v1, v7

    iget-object v9, v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    iget-wide v10, v8, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;->mAlbumId:J

    if-nez v3, :cond_0

    const-wide/16 v12, 0x0

    goto :goto_1

    :cond_0
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    :goto_1
    invoke-virtual {v9, v10, v11, v12, v13}, Lcom/miui/gallery/provider/cache/MediaManager;->updateAttributes(JJ)V

    const-string v9, "editedColumns"

    invoke-virtual {v2, v9}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_2

    invoke-static {}, Lcom/miui/gallery/provider/AlbumManager;->getAlbumSyncAttributes()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    and-long/2addr v11, v13

    iget-wide v13, v8, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;->mAttributes:J

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v15

    and-long/2addr v13, v15

    cmp-long v10, v11, v13

    if-eqz v10, :cond_1

    iget-wide v8, v8, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$AlbumInfo;->mAlbumId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_3
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_4

    const/4 v1, 0x6

    invoke-static {v1}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "UPDATE %s SET %s=coalesce(replace(%s, \'%s\', \'\') || \'%s\', \'%s\') WHERE %s IN (%s)"

    const/16 v7, 0x8

    new-array v7, v7, [Ljava/lang/Object;

    aput-object p2, v7, v6

    const-string v6, "editedColumns"

    const/4 v8, 0x1

    aput-object v6, v7, v8

    const/4 v6, 0x2

    const-string v8, "editedColumns"

    aput-object v8, v7, v6

    const/4 v6, 0x3

    aput-object v2, v7, v6

    const/4 v6, 0x4

    aput-object v2, v7, v6

    const/4 v6, 0x5

    aput-object v2, v7, v6

    const-string v2, "_id"

    aput-object v2, v7, v1

    const/4 v1, 0x7

    const-string v2, ","

    invoke-static {v2, v4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v7, v1

    invoke-static {v3, v5, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v2, p1

    invoke-virtual {v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_4
    return-void
.end method
