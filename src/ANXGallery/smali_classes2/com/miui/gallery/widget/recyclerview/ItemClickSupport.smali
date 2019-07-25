.class public Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;
.super Ljava/lang/Object;
.source "ItemClickSupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;,
        Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;,
        Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;
    }
.end annotation


# instance fields
.field private mItemClickListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

.field private mItemLongClickListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

.field private final mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private final mTouchListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;-><init>(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;Landroid/support/v7/widget/RecyclerView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->mTouchListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->mTouchListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$TouchListener;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->addOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->mItemClickListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->mItemLongClickListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    return-object p0
.end method

.method public static addTo(Landroid/support/v7/widget/RecyclerView;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;
    .locals 2

    invoke-static {p0}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->from(Landroid/support/v7/widget/RecyclerView;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    const v1, 0x7f0902cc

    invoke-virtual {p0, v1, v0}, Landroid/support/v7/widget/RecyclerView;->setTag(ILjava/lang/Object;)V

    :cond_0
    return-object v0
.end method

.method public static from(Landroid/support/v7/widget/RecyclerView;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const v0, 0x7f0902cc

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    return-object p0
.end method


# virtual methods
.method public setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->mItemClickListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    return-void
.end method

.method public setOnItemLongClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->isLongClickable()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLongClickable(Z)V

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->mItemLongClickListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    return-void
.end method
