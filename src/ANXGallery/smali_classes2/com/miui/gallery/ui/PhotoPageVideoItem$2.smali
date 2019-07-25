.class Lcom/miui/gallery/ui/PhotoPageVideoItem$2;
.super Lcom/miui/gallery/widget/AntiDoubleClickListener;
.source "PhotoPageVideoItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageVideoItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageVideoItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$2;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-direct {p0}, Lcom/miui/gallery/widget/AntiDoubleClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAntiDoubleClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$2;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$2;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$2;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$700(Lcom/miui/gallery/ui/PhotoPageVideoItem;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$2;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->access$900(Lcom/miui/gallery/ui/PhotoPageVideoItem;)V

    :cond_1
    :goto_0
    return-void
.end method
