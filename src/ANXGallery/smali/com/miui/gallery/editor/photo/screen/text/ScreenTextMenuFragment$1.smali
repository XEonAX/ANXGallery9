.class Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment$1;
.super Ljava/lang/Object;
.source "ScreenTextMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;)Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;->getItemData(I)Lcom/miui/gallery/editor/photo/core/common/model/TextData;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->access$100(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;)Lcom/miui/gallery/editor/photo/screen/base/IScreenOperation;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/screen/text/IScreenTextOperation;

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;

    invoke-interface {p2, p1, p3}, Lcom/miui/gallery/editor/photo/screen/text/IScreenTextOperation;->add(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment$1;->this$0:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;->access$000(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextMenuFragment;)Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextBubbleAdapter;->setSelection(I)V

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statTextMenuItemClick(I)V

    const/4 p1, 0x1

    return p1
.end method
