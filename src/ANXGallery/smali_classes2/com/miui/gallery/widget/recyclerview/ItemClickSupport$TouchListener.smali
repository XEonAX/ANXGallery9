.class Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;
.super Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;
.source "ItemClickSupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TouchListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;Landroid/support/v7/widget/RecyclerView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;->this$0:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method


# virtual methods
.method performItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
    .locals 11

    move-object v0, p0

    iget-object v1, v0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;->this$0:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->access$000(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;->this$0:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->access$000(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    move-result-object v3

    move-object v4, p1

    move-object v5, p2

    move v6, p3

    move-wide v7, p4

    move/from16 v9, p6

    move/from16 v10, p7

    invoke-interface/range {v3 .. v10}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;->onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z

    move-result v1

    if-eqz v1, :cond_0

    move-object v3, p2

    invoke-virtual {p2, v2}, Landroid/view/View;->playSoundEffect(I)V

    :cond_0
    return v1

    :cond_1
    return v2
.end method

.method performItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
    .locals 6

    iget-object p6, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;->this$0:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    invoke-static {p6}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->access$100(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    move-result-object p6

    const/4 p7, 0x0

    if-eqz p6, :cond_1

    iget-object p6, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;->this$0:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    invoke-static {p6}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->access$100(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    move-result-object v0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-wide v4, p4

    invoke-interface/range {v0 .. v5}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;->onItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p2, p7}, Landroid/view/View;->performHapticFeedback(I)Z

    :cond_0
    return p1

    :cond_1
    return p7
.end method
