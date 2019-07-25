.class final Lcom/miui/gallery/util/DeleteDataUtil$2;
.super Ljava/lang/Object;
.source "DeleteDataUtil.java"

# interfaces
.implements Lcom/miui/gallery/util/GalleryUtils$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/DeleteDataUtil;->deleteSyncedFile(Landroid/content/Context;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
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
.field final synthetic val$deletingFiles:Ljava/util/ArrayList;

.field final synthetic val$tmp:[Ljava/io/File;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;[Ljava/io/File;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$deletingFiles:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$tmp:[Ljava/io/File;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/DeleteDataUtil$2;->handle(Landroid/database/Cursor;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/lang/Void;
    .locals 5

    if-eqz p1, :cond_5

    :cond_0
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$deletingFiles:Ljava/util/ArrayList;

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$deletingFiles:Ljava/util/ArrayList;

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$deletingFiles:Ljava/util/ArrayList;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$deletingFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, 0x3

    const/16 v1, 0x64

    if-gt v0, v1, :cond_4

    invoke-interface {p1}, Landroid/database/Cursor;->isLast()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$deletingFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$deletingFiles:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$tmp:[Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    iget-object v1, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$tmp:[Ljava/io/File;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    iget-object v0, p0, Lcom/miui/gallery/util/DeleteDataUtil$2;->val$deletingFiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    goto :goto_0

    :cond_5
    const/4 p1, 0x0

    return-object p1
.end method
