.class Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager$EchoListener;
.super Lcom/miui/extraphoto/sdk/BaseEchoListener;
.source "PhotoPageImageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EchoListener"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager$EchoListener;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    invoke-direct {p0}, Lcom/miui/extraphoto/sdk/BaseEchoListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;Lcom/miui/gallery/ui/PhotoPageImageItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager$EchoListener;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;)V

    return-void
.end method


# virtual methods
.method public onEnd(Ljava/lang/String;Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager$EchoListener;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "PhotoPageImageItem"

    const-string p2, "view has detached from window"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager$EchoListener;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;->access$800(Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;)V

    if-eqz p2, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager$EchoListener;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager$EchoListener;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager$EchoListener;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->refreshItem()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager$EchoListener;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoPageInteractionListener:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager$EchoListener;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoPageInteractionListener:Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

    invoke-interface {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;->notifyDataChanged()V

    :cond_2
    :goto_0
    return-void
.end method

.method public onStart()V
    .locals 0

    return-void
.end method
