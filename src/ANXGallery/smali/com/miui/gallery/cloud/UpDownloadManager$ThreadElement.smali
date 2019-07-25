.class Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;
.super Ljava/lang/Object;
.source "UpDownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/UpDownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ThreadElement"
.end annotation


# instance fields
.field batchSize:I

.field commandMaxSize:I

.field type:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;->type:I

    iput p2, p0, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;->batchSize:I

    iput p3, p0, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;->commandMaxSize:I

    return-void
.end method
