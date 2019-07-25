.class Lcom/miui/gallery/util/CheckDownloadOriginHelper$3$2;
.super Ljava/lang/Object;
.source "CheckDownloadOriginHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->onDownloadComplete(Ljava/util/List;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3$2;->this$1:Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3$2;->this$1:Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;

    iget-object p1, p1, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3$2;->this$1:Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;

    iget-object p1, p1, Lcom/miui/gallery/util/CheckDownloadOriginHelper$3;->this$0:Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->access$100(Lcom/miui/gallery/util/CheckDownloadOriginHelper;)Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;->onCanceled()V

    :cond_0
    return-void
.end method
