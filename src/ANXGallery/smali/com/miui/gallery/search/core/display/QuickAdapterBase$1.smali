.class Lcom/miui/gallery/search/core/display/QuickAdapterBase$1;
.super Ljava/lang/Object;
.source "QuickAdapterBase.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/core/display/QuickAdapterBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/core/display/QuickAdapterBase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/core/display/QuickAdapterBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$1;->this$0:Lcom/miui/gallery/search/core/display/QuickAdapterBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$1;->this$0:Lcom/miui/gallery/search/core/display/QuickAdapterBase;

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$1;->this$0:Lcom/miui/gallery/search/core/display/QuickAdapterBase;

    invoke-static {v0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->access$000(Lcom/miui/gallery/search/core/display/QuickAdapterBase;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->removeFooterView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$1;->this$0:Lcom/miui/gallery/search/core/display/QuickAdapterBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->openLoadMore()V

    return-void
.end method
