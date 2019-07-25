.class public Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;
.super Landroid/app/Fragment;
.source "ScreenNavFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;
    }
.end annotation


# instance fields
.field private mCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;

.field private mIsLongCropMode:Z

.field private mNavAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;

.field private mNavRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

.field private mNavigatorData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;",
            ">;"
        }
    .end annotation
.end field

.field private mNavigatorSelectedListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$1;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavigatorSelectedListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;)Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;)Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavigatorData:Ljava/util/List;

    return-object p0
.end method

.method public static newInstance(Z)Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    sget-object v1, Lcom/miui/gallery/sdk/editor/Constants;->EXTRA_IS_LONG_SCREENSHOT:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;-><init>()V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method


# virtual methods
.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b012d

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 7

    invoke-super {p0, p1, p2}, Landroid/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    if-eqz p2, :cond_0

    sget-object v0, Lcom/miui/gallery/sdk/editor/Constants;->EXTRA_IS_LONG_SCREENSHOT:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mIsLongCropMode:Z

    :cond_0
    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mIsLongCropMode:Z

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;->getNavData(Z)Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavigatorData:Ljava/util/List;

    new-instance p2, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavigatorData:Ljava/util/List;

    invoke-direct {p2, v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;

    const p2, 0x7f09027d

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavigatorSelectedListener:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->setOnItemClickListener(Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavRecyclerView:Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->getStartMargin()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p2

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mNavAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->setSelection(I)V

    return-void
.end method

.method public setCallback(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment;->mCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenNavFragment$Callback;

    return-void
.end method
