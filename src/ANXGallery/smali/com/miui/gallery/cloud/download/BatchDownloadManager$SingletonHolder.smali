.class final Lcom/miui/gallery/cloud/download/BatchDownloadManager$SingletonHolder;
.super Ljava/lang/Object;
.source "BatchDownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/download/BatchDownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SingletonHolder"
.end annotation


# static fields
.field private static final INSTANCE:Lcom/miui/gallery/cloud/download/BatchDownloadManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;-><init>(Lcom/miui/gallery/cloud/download/BatchDownloadManager$1;)V

    sput-object v0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$SingletonHolder;->INSTANCE:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    return-void
.end method

.method static synthetic access$100()Lcom/miui/gallery/cloud/download/BatchDownloadManager;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/download/BatchDownloadManager$SingletonHolder;->INSTANCE:Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    return-object v0
.end method
