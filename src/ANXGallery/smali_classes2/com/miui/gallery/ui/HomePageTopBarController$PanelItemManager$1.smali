.class Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager$1;
.super Ljava/lang/Object;
.source "HomePageTopBarController.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;-><init>(Lcom/miui/gallery/ui/HomePageTopBarController;Lcom/miui/gallery/widget/PanelBar;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/miui/gallery/widget/PanelItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;

.field final synthetic val$this$0:Lcom/miui/gallery/ui/HomePageTopBarController;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;Lcom/miui/gallery/ui/HomePageTopBarController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager$1;->this$1:Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager;

    iput-object p2, p0, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager$1;->val$this$0:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/widget/PanelItem;Lcom/miui/gallery/widget/PanelItem;)I
    .locals 0

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    if-nez p1, :cond_1

    const/4 p1, -0x1

    return p1

    :cond_1
    if-nez p2, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getPriority()I

    move-result p1

    invoke-interface {p2}, Lcom/miui/gallery/widget/PanelItem;->getPriority()I

    move-result p2

    sub-int/2addr p1, p2

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/widget/PanelItem;

    check-cast p2, Lcom/miui/gallery/widget/PanelItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/HomePageTopBarController$PanelItemManager$1;->compare(Lcom/miui/gallery/widget/PanelItem;Lcom/miui/gallery/widget/PanelItem;)I

    move-result p1

    return p1
.end method
