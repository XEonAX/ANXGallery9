.class Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;
.super Ljava/lang/Object;
.source "SharerBabyAlbumSettingActivity.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->saveBabyInfo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

.field final synthetic val$newBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;Lcom/miui/gallery/cloud/baby/BabyInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    iput-object p2, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;->val$newBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 6

    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    invoke-static {p1}, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->access$000(Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    iget-object v0, v0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mIsAutoupdate:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    iget-object v0, v0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mPeopleId:Ljava/lang/String;

    iput-object v0, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;->val$newBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    :goto_0
    const/16 v0, 0x19

    invoke-static {v0}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "update %s set %s=%s, %s=\'%s\', %s=coalesce(replace(%s, \'%s\', \'\') || \'%s\', \'%s\') where %s=%s"

    const/16 v2, 0xc

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "shareAlbum"

    aput-object v4, v2, v3

    const-string v3, "babyInfoJson"

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const/4 v3, 0x2

    if-nez p1, :cond_1

    const-string v5, ""

    goto :goto_1

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/baby/BabyInfo;->toJSON()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_1
    aput-object v5, v2, v3

    const/4 v3, 0x3

    const-string v5, "peopleId"

    aput-object v5, v2, v3

    const/4 v3, 0x4

    if-nez p1, :cond_2

    const-string p1, ""

    goto :goto_2

    :cond_2
    iget-object p1, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    :goto_2
    aput-object p1, v2, v3

    const/4 p1, 0x5

    const-string v3, "editedColumns"

    aput-object v3, v2, p1

    const/4 p1, 0x6

    const-string v3, "editedColumns"

    aput-object v3, v2, p1

    const/4 p1, 0x7

    aput-object v0, v2, p1

    const/16 p1, 0x8

    aput-object v0, v2, p1

    const/16 p1, 0x9

    aput-object v0, v2, p1

    const/16 p1, 0xa

    const-string v0, "_id"

    aput-object v0, v2, p1

    const/16 p1, 0xb

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity$1;->this$0:Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;

    iget-object v0, v0, Lcom/miui/gallery/activity/facebaby/SharerBabyAlbumSettingActivity;->mBabyAlbumLocalId:Ljava/lang/Long;

    aput-object v0, v2, p1

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/GalleryUtils;->safeExec(Ljava/lang/String;)Z

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    return-object v1
.end method
