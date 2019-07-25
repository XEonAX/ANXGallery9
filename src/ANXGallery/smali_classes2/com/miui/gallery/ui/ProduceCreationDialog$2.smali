.class Lcom/miui/gallery/ui/ProduceCreationDialog$2;
.super Ljava/lang/Object;
.source "ProduceCreationDialog.java"

# interfaces
.implements Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ProduceCreationDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/ProduceCreationDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$2;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloading()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$2;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-static {v0}, Lcom/miui/gallery/ui/ProduceCreationDialog;->access$000(Lcom/miui/gallery/ui/ProduceCreationDialog;)Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->setRemainWhenClick(IZ)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$2;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-static {v0}, Lcom/miui/gallery/ui/ProduceCreationDialog;->access$000(Lcom/miui/gallery/ui/ProduceCreationDialog;)Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f100561

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->setInformation(ILjava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$2;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-static {v0}, Lcom/miui/gallery/ui/ProduceCreationDialog;->access$000(Lcom/miui/gallery/ui/ProduceCreationDialog;)Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public onFinish(ZI)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$2;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-static {p1}, Lcom/miui/gallery/ui/ProduceCreationDialog;->access$000(Lcom/miui/gallery/ui/ProduceCreationDialog;)Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    move-result-object p1

    const/4 p2, 0x1

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->setRemainWhenClick(IZ)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$2;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-static {p1}, Lcom/miui/gallery/ui/ProduceCreationDialog;->access$000(Lcom/miui/gallery/ui/ProduceCreationDialog;)Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->setInformation(ILjava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$2;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-static {p1}, Lcom/miui/gallery/ui/ProduceCreationDialog;->access$000(Lcom/miui/gallery/ui/ProduceCreationDialog;)Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->notifyDataSetChanged()V

    return-void
.end method
