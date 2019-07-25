.class Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$3;
.super Ljava/lang/Object;
.source "PhotoPageItem.java"

# interfaces
.implements Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressUpdate(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;II)V
    .locals 0

    int-to-float p1, p4

    const/high16 p3, 0x3f800000    # 1.0f

    mul-float p1, p1, p3

    int-to-float p3, p5

    div-float/2addr p1, p3

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;

    invoke-static {p3, p2, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->access$1500(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;F)V

    return-void
.end method
