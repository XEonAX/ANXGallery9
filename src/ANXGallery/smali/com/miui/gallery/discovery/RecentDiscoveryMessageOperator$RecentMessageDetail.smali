.class public Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;
.super Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;
.source "RecentDiscoveryMessageOperator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RecentMessageDetail"
.end annotation


# instance fields
.field private thumbUrls:[Ljava/lang/String;

.field private unviewMediaCount:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/model/DiscoveryMessage$BaseMessageDetail;-><init>()V

    return-void
.end method

.method public static fromJson(Ljava/lang/String;)Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;
    .locals 4

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;->access$000()Lcom/google/gson/Gson;

    move-result-object v0

    const-class v2, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;

    invoke-virtual {v0, p0, v2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v2, "RecentDiscoveryMessageOperator"

    const-string v3, "Unable to parse extraData json to object: %s"

    invoke-static {v2, v3, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1

    :cond_0
    return-object v1
.end method


# virtual methods
.method public getThumbUrls()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->thumbUrls:[Ljava/lang/String;

    return-object v0
.end method

.method public getUnviewMediaCount()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->unviewMediaCount:I

    return v0
.end method

.method public setThumbUrls([Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->thumbUrls:[Ljava/lang/String;

    return-void
.end method

.method public setUnviewMediaCount(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator$RecentMessageDetail;->unviewMediaCount:I

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/discovery/RecentDiscoveryMessageOperator;->access$000()Lcom/google/gson/Gson;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
