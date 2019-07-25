.class Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;
.super Landroid/os/AsyncTask;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "QueryTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/miui/gallery/model/FavoriteInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private item:Lcom/miui/gallery/model/BaseDataItem;

.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->item:Lcom/miui/gallery/model/BaseDataItem;

    return-void
.end method

.method static synthetic access$7100(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->item:Lcom/miui/gallery/model/BaseDataItem;

    return-object p0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/miui/gallery/model/FavoriteInfo;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->item:Lcom/miui/gallery/model/BaseDataItem;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->item:Lcom/miui/gallery/model/BaseDataItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->access$7500(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;)Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->getFavoriteInfo(Z)Lcom/miui/gallery/model/FavoriteInfo;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->doInBackground([Ljava/lang/Void;)Lcom/miui/gallery/model/FavoriteInfo;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/miui/gallery/model/FavoriteInfo;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->item:Lcom/miui/gallery/model/BaseDataItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->access$7602(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;Lcom/miui/gallery/model/FavoriteInfo;)Lcom/miui/gallery/model/FavoriteInfo;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->refreshStatus()V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/model/FavoriteInfo;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->onPostExecute(Lcom/miui/gallery/model/FavoriteInfo;)V

    return-void
.end method
