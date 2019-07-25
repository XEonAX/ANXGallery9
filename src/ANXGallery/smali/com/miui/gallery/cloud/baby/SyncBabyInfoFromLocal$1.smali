.class Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal$1;
.super Ljava/lang/Object;
.source "SyncBabyInfoFromLocal.java"

# interfaces
.implements Lcom/miui/gallery/util/GalleryUtils$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal;->sync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/GalleryUtils$QueryHandler<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal$1;->this$0:Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal$1;->handle(Landroid/database/Cursor;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/lang/Void;
    .locals 3

    if-eqz p1, :cond_1

    :catch_0
    :cond_0
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal$1;->this$0:Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal;->generateDBImage(Landroid/database/Cursor;)Lcom/miui/gallery/data/DBImage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getBabyInfoJson()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "localFlag"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "localFlag"

    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/miui/gallery/cloud/RequestCloudItem;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v0}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal$1;->this$0:Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal;

    invoke-static {v0}, Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal;->access$000(Lcom/miui/gallery/cloud/baby/SyncBabyInfoFromLocal;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
