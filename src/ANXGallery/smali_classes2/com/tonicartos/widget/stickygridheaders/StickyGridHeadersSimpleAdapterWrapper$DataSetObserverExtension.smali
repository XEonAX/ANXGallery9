.class final Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;
.super Landroid/database/DataSetObserver;
.source "StickyGridHeadersSimpleAdapterWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DataSetObserverExtension"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;


# direct methods
.method private constructor <init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;)V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 3

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;

    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;

    iget-object v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;

    invoke-static {v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->access$200(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->generateHeaderList(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->access$102(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;Ljava/util/List;)Ljava/util/List;

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->notifyDataSetChanged()V

    return-void
.end method

.method public onInvalidated()V
    .locals 3

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;

    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;

    iget-object v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;

    invoke-static {v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->access$200(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->generateHeaderList(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;)Ljava/util/List;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->access$102(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;Ljava/util/List;)Ljava/util/List;

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->notifyDataSetInvalidated()V

    return-void
.end method
