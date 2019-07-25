.class Lcom/miui/gallery/data/OldThumbnailTransferer$1;
.super Ljava/lang/Object;
.source "OldThumbnailTransferer.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/data/OldThumbnailTransferer;->transfer(Landroid/net/Uri;[ILjava/util/List;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/SafeDBUtil$QueryHandler<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/data/OldThumbnailTransferer;

.field final synthetic val$maxTransferCount:[I

.field final synthetic val$thumbnailFolders:[Ljava/lang/String;

.field final synthetic val$transferedUbiIds:Ljava/util/List;

.field final synthetic val$transferedUbiServerIds:Ljava/util/List;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/miui/gallery/data/OldThumbnailTransferer;[ILandroid/net/Uri;[Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->this$0:Lcom/miui/gallery/data/OldThumbnailTransferer;

    iput-object p2, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$maxTransferCount:[I

    iput-object p3, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$uri:Landroid/net/Uri;

    iput-object p4, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$thumbnailFolders:[Ljava/lang/String;

    iput-object p5, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$transferedUbiIds:Ljava/util/List;

    iput-object p6, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$transferedUbiServerIds:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->handle(Landroid/database/Cursor;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/lang/Void;
    .locals 4

    if-eqz p1, :cond_1

    :cond_0
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$maxTransferCount:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$uri:Landroid/net/Uri;

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/CloudUtils;->createDBImageByUri(Landroid/net/Uri;Landroid/database/Cursor;)Lcom/miui/gallery/data/DBImage;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->this$0:Lcom/miui/gallery/data/OldThumbnailTransferer;

    iget-object v3, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$thumbnailFolders:[Ljava/lang/String;

    invoke-static {v2, v0, v3}, Lcom/miui/gallery/data/OldThumbnailTransferer;->access$200(Lcom/miui/gallery/data/OldThumbnailTransferer;Lcom/miui/gallery/data/DBImage;[Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$maxTransferCount:[I

    aget v3, v2, v1

    add-int/lit8 v3, v3, -0x1

    aput v3, v2, v1

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isUbiFocus()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$transferedUbiIds:Ljava/util/List;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$1;->val$transferedUbiServerIds:Ljava/util/List;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
