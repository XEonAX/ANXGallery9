.class Lcom/miui/gallery/search/resultpage/ImageResultAdapter$1;
.super Ljava/lang/Object;
.source "ImageResultAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/ImageResultAdapter;

.field final synthetic val$groupIndex:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/resultpage/ImageResultAdapter;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultAdapter$1;->this$0:Lcom/miui/gallery/search/resultpage/ImageResultAdapter;

    iput p2, p0, Lcom/miui/gallery/search/resultpage/ImageResultAdapter$1;->val$groupIndex:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultAdapter$1;->this$0:Lcom/miui/gallery/search/resultpage/ImageResultAdapter;

    invoke-static {p1}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->access$000(Lcom/miui/gallery/search/resultpage/ImageResultAdapter;)Lcom/miui/gallery/search/resultpage/ImageResultAdapter$OnHeaderItemClickedListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultAdapter$1;->this$0:Lcom/miui/gallery/search/resultpage/ImageResultAdapter;

    invoke-static {p1}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->access$000(Lcom/miui/gallery/search/resultpage/ImageResultAdapter;)Lcom/miui/gallery/search/resultpage/ImageResultAdapter$OnHeaderItemClickedListener;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultAdapter$1;->val$groupIndex:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter$OnHeaderItemClickedListener;->onHeaderItemClicked(I)V

    :cond_0
    return-void
.end method
