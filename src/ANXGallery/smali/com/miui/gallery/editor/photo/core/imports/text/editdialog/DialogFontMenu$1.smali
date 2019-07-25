.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;
.super Ljava/lang/Object;
.source "DialogFontMenu.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->downloadResource(Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

.field final synthetic val$position:I

.field final synthetic val$textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;->val$textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Z)V
    .locals 4

    const-string v0, "DialogFontMenu"

    const-string v1, "%s download is : %s"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;->val$textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;)V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1$2;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;)V

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;->val$textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    const/16 v0, 0x14

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->setState(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;->val$position:I

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->notifyItemChanged(I)V

    :goto_0
    return-void
.end method

.method public onStart()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;->val$textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    const/16 v1, 0x12

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->setState(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$1;->val$position:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->notifyItemChanged(I)V

    return-void
.end method
