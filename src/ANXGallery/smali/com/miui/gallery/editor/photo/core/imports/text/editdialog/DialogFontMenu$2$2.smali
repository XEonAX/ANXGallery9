.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$2;
.super Ljava/lang/Object;
.source "DialogFontMenu.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->onResponseError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$2;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$2;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$2;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TypeFaceAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
