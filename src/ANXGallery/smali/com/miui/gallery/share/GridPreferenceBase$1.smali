.class Lcom/miui/gallery/share/GridPreferenceBase$1;
.super Ljava/lang/Object;
.source "GridPreferenceBase.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/share/GridPreferenceBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/share/GridPreferenceBase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/GridPreferenceBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/GridPreferenceBase$1;->this$0:Lcom/miui/gallery/share/GridPreferenceBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/share/GridPreferenceBase$1;->this$0:Lcom/miui/gallery/share/GridPreferenceBase;

    invoke-static {v0}, Lcom/miui/gallery/share/GridPreferenceBase;->access$000(Lcom/miui/gallery/share/GridPreferenceBase;)Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/GridPreferenceBase$1;->this$0:Lcom/miui/gallery/share/GridPreferenceBase;

    invoke-virtual {v0}, Lcom/miui/gallery/share/GridPreferenceBase;->getTagInfo()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/share/GridPreferenceBase$1;->this$0:Lcom/miui/gallery/share/GridPreferenceBase;

    invoke-static {v0}, Lcom/miui/gallery/share/GridPreferenceBase;->access$000(Lcom/miui/gallery/share/GridPreferenceBase;)Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/share/GridPreferenceBase$1;->this$0:Lcom/miui/gallery/share/GridPreferenceBase;

    invoke-interface {v0, v1, p1}, Lcom/miui/gallery/share/GridPreferenceBase$OnItemClickListener;->onItemClick(Lcom/miui/gallery/share/GridPreferenceBase;I)V

    :cond_0
    return-void
.end method
