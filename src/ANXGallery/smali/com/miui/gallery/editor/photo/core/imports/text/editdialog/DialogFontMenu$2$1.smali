.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$1;
.super Ljava/lang/Object;
.source "DialogFontMenu.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->onResponse([Ljava/lang/Object;)V
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

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$1;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$1;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$202(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$1;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2$1;->this$1:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;)Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogFontMenu;->initializeData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    return-void
.end method
