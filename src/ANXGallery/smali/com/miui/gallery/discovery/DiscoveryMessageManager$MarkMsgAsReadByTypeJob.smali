.class Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadByTypeJob;
.super Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadJob;
.source "DiscoveryMessageManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/discovery/DiscoveryMessageManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarkMsgAsReadByTypeJob"
.end annotation


# instance fields
.field private mMsgType:I

.field final synthetic this$0:Lcom/miui/gallery/discovery/DiscoveryMessageManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/discovery/DiscoveryMessageManager;Landroid/content/Context;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadByTypeJob;->this$0:Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadJob;-><init>(Lcom/miui/gallery/discovery/DiscoveryMessageManager;Landroid/content/Context;)V

    iput p3, p0, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadByTypeJob;->mMsgType:I

    return-void
.end method


# virtual methods
.method protected getMessages()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/DiscoveryMessage;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadByTypeJob;->mContextRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadByTypeJob;->this$0:Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    iget v2, p0, Lcom/miui/gallery/discovery/DiscoveryMessageManager$MarkMsgAsReadByTypeJob;->mMsgType:I

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->loadMessage(Landroid/content/Context;I)Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method
