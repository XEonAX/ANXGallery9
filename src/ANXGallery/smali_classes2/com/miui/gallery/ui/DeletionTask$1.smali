.class Lcom/miui/gallery/ui/DeletionTask$1;
.super Ljava/lang/Object;
.source "DeletionTask.java"

# interfaces
.implements Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/DeletionTask;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/ui/ProcessTask$ProcessCallback<",
        "Lcom/miui/gallery/ui/DeletionTask$Param;",
        "[J>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic doProcess([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Lcom/miui/gallery/ui/DeletionTask$Param;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DeletionTask$1;->doProcess([Lcom/miui/gallery/ui/DeletionTask$Param;)[J

    move-result-object p1

    return-object p1
.end method

.method public doProcess([Lcom/miui/gallery/ui/DeletionTask$Param;)[J
    .locals 5

    const/4 v0, 0x1

    new-array v1, v0, [J

    const/4 v2, 0x0

    const-wide/16 v3, -0x70

    aput-wide v3, v1, v2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/util/DocumentProviderUtils;->needRequestExternalSDCardPermission(Landroid/content/Context;)Z

    move-result v3

    aget-object v4, p1, v2

    iget v4, v4, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteBy:I

    if-nez v4, :cond_1

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    aget-object v1, p1, v2

    iget v1, v1, Lcom/miui/gallery/ui/DeletionTask$Param;->mDupType:I

    aget-object v3, p1, v2

    iget v3, v3, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteOptions:I

    aget-object v4, p1, v2

    iget v4, v4, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteReason:I

    aget-object p1, p1, v2

    iget-object p1, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mIds:[J

    invoke-static {v0, v1, v3, v4, p1}, Lcom/miui/gallery/provider/CloudUtils;->deleteById(Landroid/content/Context;III[J)[J

    move-result-object v1

    :goto_0
    return-object v1

    :cond_1
    aget-object v4, p1, v2

    iget v4, v4, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteBy:I

    if-ne v4, v0, :cond_3

    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    aget-object v1, p1, v2

    iget v1, v1, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteOptions:I

    aget-object v3, p1, v2

    iget v3, v3, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteReason:I

    aget-object p1, p1, v2

    iget-object p1, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mPaths:[Ljava/lang/String;

    invoke-static {v0, v1, v3, p1}, Lcom/miui/gallery/provider/CloudUtils;->deleteByPath(Landroid/content/Context;II[Ljava/lang/String;)[J

    move-result-object v1

    :goto_1
    return-object v1

    :cond_3
    aget-object v0, p1, v2

    iget v0, v0, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteBy:I

    const/4 v4, 0x2

    if-ne v0, v4, :cond_5

    if-eqz v3, :cond_4

    goto :goto_2

    :cond_4
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    aget-object v1, p1, v2

    iget v1, v1, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteOptions:I

    aget-object v3, p1, v2

    iget v3, v3, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteReason:I

    aget-object p1, p1, v2

    iget-object p1, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mIds:[J

    invoke-static {v0, v1, v3, p1}, Lcom/miui/gallery/provider/CloudUtils;->deleteAlbum(Landroid/content/Context;II[J)[J

    move-result-object v1

    :goto_2
    return-object v1

    :cond_5
    const/4 p1, 0x0

    return-object p1
.end method
