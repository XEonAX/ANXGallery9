.class Lcom/miui/gallery/util/uil/CloudImageLoader$2;
.super Ljava/lang/Object;
.source "CloudImageLoader.java"

# interfaces
.implements Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/uil/CloudImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$2;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadProgress(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;JJ)V
    .locals 11

    move-object v0, p0

    iget-object v1, v0, Lcom/miui/gallery/util/uil/CloudImageLoader$2;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    new-instance v10, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    iget-object v3, v0, Lcom/miui/gallery/util/uil/CloudImageLoader$2;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-object v2, v10

    move-object v4, p1

    move-object v5, p2

    move-wide v6, p3

    move-wide/from16 v8, p5

    invoke-direct/range {v2 .. v9}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;JJ)V

    const/4 v2, 0x4

    invoke-static {v1, v2, v10}, Lcom/miui/gallery/util/uil/CloudImageLoader;->access$100(Lcom/miui/gallery/util/uil/CloudImageLoader;ILcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    return-void
.end method
