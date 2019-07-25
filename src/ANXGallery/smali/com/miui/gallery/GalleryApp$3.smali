.class Lcom/miui/gallery/GalleryApp$3;
.super Ljava/lang/Object;
.source "GalleryApp.java"

# interfaces
.implements Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy$UploadStatusChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/GalleryApp;->initDataInUIThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/GalleryApp;


# direct methods
.method constructor <init>(Lcom/miui/gallery/GalleryApp;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/GalleryApp$3;->this$0:Lcom/miui/gallery/GalleryApp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onUploadStatusChanged(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;)V
    .locals 6

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->getItemType()Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/sdk/uploadstatus/ItemType;->OWNER:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->getUserUri()Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "sync_status"

    iget-object p1, p1, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mStatus:Lcom/miui/gallery/sdk/SyncStatus;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/SyncStatus;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->access$400()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    const-string v2, "_id = ?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_0
    return-void
.end method
