.class Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;
.super Landroid/os/AsyncTask;
.source "FolderItemsLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/renameface/FolderItemsLoader;->reload()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/ArrayList<",
        "Lcom/miui/gallery/model/DisplayFolderItem;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/renameface/FolderItemsLoader;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;->this$0:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;->doInBackground([Ljava/lang/Void;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DisplayFolderItem;",
            ">;"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;->this$0:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;->this$0:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader;->refreshCloudFolderItems()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader;->access$002(Lcom/miui/gallery/ui/renameface/FolderItemsLoader;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;->this$0:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader;->access$000(Lcom/miui/gallery/ui/renameface/FolderItemsLoader;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;->onPostExecute(Ljava/util/ArrayList;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DisplayFolderItem;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;->this$0:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    iput-object p1, v0, Lcom/miui/gallery/ui/renameface/FolderItemsLoader;->mItems:Ljava/util/ArrayList;

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;->this$0:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader;->access$100(Lcom/miui/gallery/ui/renameface/FolderItemsLoader;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;->this$0:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader;->access$200(Lcom/miui/gallery/ui/renameface/FolderItemsLoader;)Lcom/miui/gallery/ui/renameface/FolderItemsLoader$LoaderUpdatedItems;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$1;->this$0:Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader;->access$200(Lcom/miui/gallery/ui/renameface/FolderItemsLoader;)Lcom/miui/gallery/ui/renameface/FolderItemsLoader$LoaderUpdatedItems;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader$LoaderUpdatedItems;->onLoaderUpdatedItems()V

    :cond_0
    return-void
.end method
