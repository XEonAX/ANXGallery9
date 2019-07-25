.class Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo$1;
.super Ljava/lang/Object;
.source "CommonBottomMenuWithUndo.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo$1;->this$0:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo$1;->this$0:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->access$000(Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;)Lcom/miui/gallery/editor/photo/app/RenderRecord;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo$1;->this$0:Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;->access$000(Lcom/miui/gallery/editor/photo/widgets/CommonBottomMenuWithUndo;)Lcom/miui/gallery/editor/photo/app/RenderRecord;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/app/RenderRecord;->previousRecord()V

    :cond_0
    return-void
.end method
