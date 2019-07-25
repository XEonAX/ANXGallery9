.class Lcom/miui/gallery/adapter/PhotoPageAdapter$1;
.super Ljava/lang/Object;
.source "PhotoPageAdapter.java"

# interfaces
.implements Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/PhotoPageAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/adapter/PhotoPageAdapter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/PhotoPageAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$1;->this$0:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$1;->this$0:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItemKey(I)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$1;->this$0:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-static {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->access$100(Lcom/miui/gallery/adapter/PhotoPageAdapter;)Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$1;->this$0:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-static {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->access$100(Lcom/miui/gallery/adapter/PhotoPageAdapter;)Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/model/BaseDataSet;->getItemKey(I)J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method public getItemPos(JI)I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$1;->this$0:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-static {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->access$100(Lcom/miui/gallery/adapter/PhotoPageAdapter;)Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$1;->this$0:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-static {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->access$100(Lcom/miui/gallery/adapter/PhotoPageAdapter;)Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {v1}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    invoke-virtual {v1, p1, p2}, Lcom/miui/gallery/model/BaseDataItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    invoke-virtual {v0, p1, p3}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;I)I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    return p1
.end method

.method public notifyCheckState()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$1;->this$0:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->notifyDataSetChanged()V

    return-void
.end method
