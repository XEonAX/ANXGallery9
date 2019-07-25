.class Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$3;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "MarkPeopleDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$PeopleItemViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$3;->this$0:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$3;->this$0:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->access$100(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$PeopleItemViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$3;->onBindViewHolder(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$PeopleItemViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$PeopleItemViewHolder;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$3;->this$0:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->access$100(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/people/model/People;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$PeopleItemViewHolder;->bindView(Lcom/miui/gallery/people/model/People;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$3;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$PeopleItemViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$PeopleItemViewHolder;
    .locals 4

    new-instance p1, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$PeopleItemViewHolder;

    iget-object p2, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$3;->this$0:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    iget-object v0, p0, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$3;->this$0:Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b00ac

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment$PeopleItemViewHolder;-><init>(Lcom/miui/gallery/people/mark/MarkPeopleDialogFragment;Landroid/view/View;)V

    return-object p1
.end method
