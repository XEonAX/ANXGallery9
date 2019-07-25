.class Lcom/miui/gallery/util/baby/BabyFaceFinder$1;
.super Ljava/lang/Object;
.source "BabyFaceFinder.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/baby/BabyFaceFinder;->startFindFace(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/baby/BabyFaceFinder;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/baby/BabyFaceFinder;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder$1;->this$0:Lcom/miui/gallery/util/baby/BabyFaceFinder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Boolean;
    .locals 8

    const/4 p1, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :cond_0
    if-eqz v0, :cond_2

    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/util/baby/BabyFaceFinder$1;->this$0:Lcom/miui/gallery/util/baby/BabyFaceFinder;

    invoke-static {v0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleName(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getRelationType(Landroid/database/Cursor;)I

    move-result v2

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/baby/BabyFaceFinder;->access$000(Lcom/miui/gallery/util/baby/BabyFaceFinder;Ljava/lang/String;I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_2
    if-eqz v0, :cond_4

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object v7, v0

    move-object v0, p1

    move-object p1, v7

    :goto_0
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    throw p1

    :catch_0
    move-object v0, p1

    :catch_1
    if-eqz v0, :cond_4

    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_4
    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/baby/BabyFaceFinder$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
