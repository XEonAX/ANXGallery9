.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;
.super Ljava/lang/Object;
.source "DialogFontMenu.java"

# interfaces
.implements Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TypeFaceItemSelectChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelect(Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;IZ)Z
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-static {p1, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$502(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->isLocal()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$600(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mListener:Ljava/lang/Object;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mListener:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;->onTypefaceChange(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->isExtra()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->isNeedDownload()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$000(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Landroid/content/Context;

    move-result-object p3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object v0

    invoke-static {p1, p3, v0, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$700(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->isDownloaded()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$600(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mListener:Ljava/lang/Object;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->mListener:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$TypeFaceItemSelectChangeListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object p2

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;->onTypefaceChange(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method
