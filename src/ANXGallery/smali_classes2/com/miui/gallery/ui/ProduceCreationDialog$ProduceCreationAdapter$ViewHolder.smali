.class Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;
.super Ljava/lang/Object;
.source "ProduceCreationDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewHolder"
.end annotation


# instance fields
.field icon:Landroid/widget/ImageView;

.field information:Landroid/widget/TextView;

.field position:I

.field final synthetic this$1:Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

.field title:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->this$1:Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;Lcom/miui/gallery/ui/ProduceCreationDialog$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;-><init>(Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter;)V

    return-void
.end method


# virtual methods
.method public bindView(Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    iget v1, p1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->iconResourceId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->title:Landroid/widget/TextView;

    iget v1, p1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->titleResourceId:I

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->informationString:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->information:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->information:Landroid/widget/TextView;

    iget-object p1, p1, Lcom/miui/gallery/ui/ProduceCreationDialog$CreationModel;->informationString:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->information:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->information:Landroid/widget/TextView;

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    iput p2, p0, Lcom/miui/gallery/ui/ProduceCreationDialog$ProduceCreationAdapter$ViewHolder;->position:I

    return-void
.end method
