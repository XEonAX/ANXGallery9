.class final Lcom/miui/gallery/cloud/CloudUtils$1;
.super Ljava/lang/Object;
.source "CloudUtils.java"

# interfaces
.implements Lcom/miui/gallery/util/BaseDocumentProviderUtils$WriteHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/CloudUtils;->copyImage(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/BaseDocumentProviderUtils$WriteHandler<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$destFilePath:Ljava/lang/String;

.field final synthetic val$inputStream:Ljava/io/InputStream;

.field final synthetic val$startTime:J


# direct methods
.method constructor <init>(Ljava/io/InputStream;Ljava/lang/String;J)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/CloudUtils$1;->val$inputStream:Ljava/io/InputStream;

    iput-object p2, p0, Lcom/miui/gallery/cloud/CloudUtils$1;->val$destFilePath:Ljava/lang/String;

    iput-wide p3, p0, Lcom/miui/gallery/cloud/CloudUtils$1;->val$startTime:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handle(Ljava/io/FileOutputStream;)Ljava/lang/Boolean;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cloud/CloudUtils$1;->val$inputStream:Ljava/io/InputStream;

    invoke-static {v0, p1}, Lcom/miui/gallery/util/GalleryUtils;->copyFile(Ljava/io/InputStream;Ljava/io/OutputStream;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloud/CloudUtils$1;->val$destFilePath:Ljava/lang/String;

    const/16 v0, 0x1b6

    const/4 v1, -0x1

    invoke-static {p1, v0, v1, v1}, Lcom/miui/gallery/util/Utils;->setPermissions(Ljava/lang/String;III)I

    const-string p1, "CloudUtils"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "copy image finish, time:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/miui/gallery/cloud/CloudUtils$1;->val$startTime:J

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic handle(Ljava/io/FileOutputStream;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/CloudUtils$1;->handle(Ljava/io/FileOutputStream;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
