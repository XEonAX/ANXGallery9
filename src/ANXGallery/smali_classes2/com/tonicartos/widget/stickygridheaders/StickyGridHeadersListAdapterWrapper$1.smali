.class Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper$1;
.super Landroid/database/DataSetObserver;
.source "StickyGridHeadersListAdapterWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;


# direct methods
.method constructor <init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;)V
    .locals 0

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper$1;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper$1;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->notifyDataSetChanged()V

    return-void
.end method

.method public onInvalidated()V
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper$1;->this$0:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->notifyDataSetInvalidated()V

    return-void
.end method
