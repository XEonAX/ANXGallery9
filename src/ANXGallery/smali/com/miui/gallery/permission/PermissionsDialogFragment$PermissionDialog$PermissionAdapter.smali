.class Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "PermissionsDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PermissionAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/miui/gallery/permission/PermissionsDialogFragment$BaseViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mPermissions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->this$0:Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;Lcom/miui/gallery/permission/PermissionsDialogFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;-><init>(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    return-object p0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;

    invoke-static {p1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;->access$200(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/permission/PermissionsDialogFragment$BaseViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->onBindViewHolder(Lcom/miui/gallery/permission/PermissionsDialogFragment$BaseViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/permission/PermissionsDialogFragment$BaseViewHolder;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/permission/PermissionsDialogFragment$BaseViewHolder;->bindPermission(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/permission/PermissionsDialogFragment$BaseViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/permission/PermissionsDialogFragment$BaseViewHolder;
    .locals 1

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    new-instance p2, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionViewHolder;

    sget v0, Lcom/miui/gallery/permission/R$layout;->user_permission_item:I

    invoke-static {p1, v0}, Lcom/miui/gallery/permission/PermissionsDialogFragment$BaseViewHolder;->getView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionViewHolder;-><init>(Landroid/view/View;)V

    return-object p2

    :cond_0
    new-instance p2, Lcom/miui/gallery/permission/PermissionsDialogFragment$CategoryViewHolder;

    sget v0, Lcom/miui/gallery/permission/R$layout;->user_permission_category:I

    invoke-static {p1, v0}, Lcom/miui/gallery/permission/PermissionsDialogFragment$BaseViewHolder;->getView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$CategoryViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public setPermissions(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/permission/core/Permission;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    if-eqz p1, :cond_3

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/permission/core/Permission;

    iget-boolean v3, v1, Lcom/miui/gallery/permission/core/Permission;->mRequired:Z

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    new-instance v4, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;

    invoke-direct {v4, v1, v2}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;-><init>(Lcom/miui/gallery/permission/core/Permission;Z)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v3, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;

    invoke-direct {v3, v1, v2}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;-><init>(Lcom/miui/gallery/permission/core/Permission;Z)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p1

    const/4 v1, 0x1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    new-instance v3, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;

    new-instance v4, Lcom/miui/gallery/permission/core/Permission;

    const-string v5, ""

    const-string v6, ""

    const-string v7, ""

    invoke-direct {v4, v5, v6, v7, v1}, Lcom/miui/gallery/permission/core/Permission;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-direct {v3, v4, v1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;-><init>(Lcom/miui/gallery/permission/core/Permission;Z)V

    invoke-virtual {p1, v2, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    new-instance v3, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;

    new-instance v4, Lcom/miui/gallery/permission/core/Permission;

    const-string v5, ""

    const-string v6, ""

    const-string v7, ""

    invoke-direct {v4, v5, v6, v7, v2}, Lcom/miui/gallery/permission/core/Permission;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-direct {v3, v4, v1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;-><init>(Lcom/miui/gallery/permission/core/Permission;Z)V

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->mPermissions:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->notifyDataSetChanged()V

    return-void
.end method
