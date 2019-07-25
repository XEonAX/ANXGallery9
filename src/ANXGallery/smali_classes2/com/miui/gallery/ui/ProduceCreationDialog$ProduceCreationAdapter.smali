.class Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;
.super Landroid/widget/BaseAdapter;
.source "ProduceCreationDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ProduceCreationDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProduceCreationAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;
    }
.end annotation


# instance fields
.field private mCreationModelList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/ProduceCreationDialog;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->mCreationModelList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->mCreationModelList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;
    .locals 1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->mCreationModelList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->mCreationModelList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->getItem(I)Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    if-nez p2, :cond_0

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b0065

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;-><init>(Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;Lcom/miui/gallery/ui/ProduceCreationDialog$1;)V

    const v0, 0x7f0900bc

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p3, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    const v0, 0x7f0900bd

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p3, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->title:Landroid/widget/TextView;

    const v0, 0x7f09017b

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p3, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->information:Landroid/widget/TextView;

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->getItem(I)Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;

    move-result-object v0

    invoke-virtual {p3, v0, p1}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->bindView(Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;I)V

    return-object p2
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;

    iget p1, p1, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->position:I

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-static {v0}, Lcom/miui/gallery/ui/ProduceCreationDialog;->access$200(Lcom/miui/gallery/ui/ProduceCreationDialog;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-static {v0}, Lcom/miui/gallery/ui/ProduceCreationDialog;->access$300(Lcom/miui/gallery/ui/ProduceCreationDialog;)Lcom/miui/gallery/ui/ProduceCreationDialog$OnOperationSelectedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "ProduceCreationDialog"

    const-string v1, "Creation select : %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-static {v0}, Lcom/miui/gallery/ui/ProduceCreationDialog;->access$200(Lcom/miui/gallery/ui/ProduceCreationDialog;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;

    iget-boolean v0, p1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->isRemainWhenClick:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-static {v0}, Lcom/miui/gallery/ui/ProduceCreationDialog;->access$300(Lcom/miui/gallery/ui/ProduceCreationDialog;)Lcom/miui/gallery/ui/ProduceCreationDialog$OnOperationSelectedListener;

    move-result-object v0

    iget p1, p1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->creationId:I

    invoke-interface {v0, p1}, Lcom/miui/gallery/ui/ProduceCreationDialog$OnOperationSelectedListener;->onOperationSelected(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->this$0:Lcom/miui/gallery/ui/ProduceCreationDialog;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ProduceCreationDialog;->dismissSafely()V

    :cond_0
    return-void
.end method

.method public setInformation(ILjava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->mCreationModelList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;

    iget v2, v1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->creationId:I

    if-ne v2, p1, :cond_0

    iput-object p2, v1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->informationString:Ljava/lang/String;

    :cond_1
    return-void
.end method

.method public setRemainWhenClick(IZ)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;->mCreationModelList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;

    iget v2, v1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->creationId:I

    if-ne v2, p1, :cond_0

    iput-boolean p2, v1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->isRemainWhenClick:Z

    :cond_1
    return-void
.end method
