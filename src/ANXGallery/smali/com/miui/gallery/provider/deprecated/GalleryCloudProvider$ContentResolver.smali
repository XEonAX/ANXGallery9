.class Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;
.super Lcom/miui/gallery/provider/GalleryContentResolver;
.source "GalleryCloudProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContentResolver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-direct {p0}, Lcom/miui/gallery/provider/GalleryContentResolver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;-><init>(Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;)V

    return-void
.end method


# virtual methods
.method protected matchUri(Landroid/net/Uri;)Ljava/lang/Object;
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->matchTableName(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected notifyInternal(Landroid/net/Uri;Landroid/database/ContentObserver;J)V
    .locals 2

    sget-object v0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-virtual {v0, p1, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->RECOMMEND_FACES_OF_ONE_PERSON_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :pswitch_3
    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :pswitch_4
    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :pswitch_5
    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$CloudUser;->CLOUD_USER_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :pswitch_6
    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OTHER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_ALL:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto/16 :goto_0

    :pswitch_7
    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$ShareUser;->SHARE_USER_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto :goto_0

    :pswitch_8
    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    goto :goto_0

    :pswitch_9
    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_ALL:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    :goto_0
    const-wide/16 p1, 0x0

    cmp-long v0, p3, p1

    if-eqz v0, :cond_0

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

    iget-object p2, p0, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider$ContentResolver;->this$0:Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;

    invoke-virtual {p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_9
        :pswitch_0
        :pswitch_0
        :pswitch_8
        :pswitch_8
        :pswitch_7
        :pswitch_7
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
