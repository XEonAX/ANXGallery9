.class Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;
.super Lcom/miui/gallery/provider/GalleryContentResolver;
.source "GalleryProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/GalleryProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContentResolver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/provider/GalleryProvider;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/provider/GalleryProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-direct {p0}, Lcom/miui/gallery/provider/GalleryContentResolver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/provider/GalleryProvider;Lcom/miui/gallery/provider/GalleryProvider$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;-><init>(Lcom/miui/gallery/provider/GalleryProvider;)V

    return-void
.end method


# virtual methods
.method protected matchUri(Landroid/net/Uri;)Ljava/lang/Object;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/provider/GalleryProvider;->access$200()Landroid/content/UriMatcher;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected notifyInternal(Landroid/net/Uri;Landroid/database/ContentObserver;J)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/provider/GalleryProvider;->access$300()Landroid/content/UriMatcher;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p1

    const/16 v0, 0x4b

    const/4 v1, 0x0

    if-eq p1, v0, :cond_5

    const/16 v0, 0x5c

    if-eq p1, v0, :cond_4

    const/16 v0, 0x6e

    if-eq p1, v0, :cond_3

    const/16 v0, 0x70

    if-eq p1, v0, :cond_2

    const/16 v0, 0x98

    if-eq p1, v0, :cond_1

    const/16 v0, 0xb4

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    packed-switch p1, :pswitch_data_1

    goto/16 :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$CloudUser;->CLOUD_USER_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Favorites;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_ALL:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI_COVER:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :cond_2
    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$ShareUser;->SHARE_USER_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OTHER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_ALL:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->IGNORE_PERSONS_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :cond_5
    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_ALL:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OTHER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI_COVER:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    :goto_0
    const-wide/16 p1, 0x0

    cmp-long v0, p3, p1

    if-eqz v0, :cond_6

    new-instance p1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object p2, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setDelayUpload(Z)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/GalleryProvider;

    invoke-virtual {p2}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    :cond_6
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x46
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x83
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
