.class public Lcom/miui/gallery/video/editor/util/TempFileCollector;
.super Ljava/lang/Object;
.source "TempFileCollector.java"


# static fields
.field private static tempFilePaths:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/miui/gallery/video/editor/util/TempFileCollector;->tempFilePaths:Ljava/util/LinkedList;

    return-void
.end method

.method public static add(Ljava/lang/String;)V
    .locals 2

    const-string v0, "TempFileCollector"

    const-string v1, "add %s"

    invoke-static {v0, v1, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/video/editor/util/TempFileCollector;->tempFilePaths:Ljava/util/LinkedList;

    invoke-virtual {v0, p0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static deleteAllTempFile(Landroid/content/Context;)V
    .locals 6

    sget-object v0, Lcom/miui/gallery/video/editor/util/TempFileCollector;->tempFilePaths:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-lez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v2, Lcom/miui/gallery/video/editor/util/TempFileCollector;->tempFilePaths:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    sget-object v3, Lcom/miui/gallery/video/editor/util/TempFileCollector;->tempFilePaths:Ljava/util/LinkedList;

    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    sget-object v3, Lcom/miui/gallery/video/editor/util/TempFileCollector;->tempFilePaths:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    const/16 v3, 0x38

    invoke-static {p0, v3, v2}, Lcom/miui/gallery/provider/CloudUtils;->deleteByPath(Landroid/content/Context;I[Ljava/lang/String;)[J

    const-string p0, "TempFileCollector"

    const-string v3, "deleteAllTempFile %s, cost %s"

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p0, v3, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
