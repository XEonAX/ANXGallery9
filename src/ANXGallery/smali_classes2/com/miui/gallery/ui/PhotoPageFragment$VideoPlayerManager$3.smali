.class Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$3;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->playVideo(Lcom/miui/gallery/model/BaseDataItem;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/ui/ProcessTask$ProcessCallback<",
        "Landroid/net/Uri;",
        "Landroid/net/Uri;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

.field final synthetic val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Landroid/net/Uri;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$3;->val$uri:Landroid/net/Uri;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$3;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public doProcess([Landroid/net/Uri;)Landroid/net/Uri;
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$3;->val$uri:Landroid/net/Uri;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$3;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getSecretKey()[B

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$3;->val$dataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v1

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/util/SecretAlbumCryptoUtils;->decryptVideo2CacheFolder(Landroid/net/Uri;[BJ)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic doProcess([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$3;->doProcess([Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method
