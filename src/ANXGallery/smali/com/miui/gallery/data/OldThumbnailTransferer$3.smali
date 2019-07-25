.class Lcom/miui/gallery/data/OldThumbnailTransferer$3;
.super Ljava/lang/Object;
.source "OldThumbnailTransferer.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/data/OldThumbnailTransferer;->transferSubUbiImage(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
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

.field final synthetic val$thumbnailFolders:[Ljava/lang/String;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/miui/gallery/data/OldThumbnailTransferer;Landroid/net/Uri;[Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$3;->this$0:Lcom/miui/gallery/data/OldThumbnailTransferer;

    iput-object p2, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$3;->val$uri:Landroid/net/Uri;

    iput-object p3, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$3;->val$thumbnailFolders:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/data/OldThumbnailTransferer$3;->handle(Landroid/database/Cursor;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/lang/Void;
    .locals 3

    if-eqz p1, :cond_0

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$3;->val$uri:Landroid/net/Uri;

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/CloudUtils;->createDBImageByUri(Landroid/net/Uri;Landroid/database/Cursor;)Lcom/miui/gallery/data/DBImage;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$3;->this$0:Lcom/miui/gallery/data/OldThumbnailTransferer;

    iget-object v2, p0, Lcom/miui/gallery/data/OldThumbnailTransferer$3;->val$thumbnailFolders:[Ljava/lang/String;

    invoke-static {v1, v0, v2}, Lcom/miui/gallery/data/OldThumbnailTransferer;->access$200(Lcom/miui/gallery/data/OldThumbnailTransferer;Lcom/miui/gallery/data/DBImage;[Ljava/lang/String;)Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
