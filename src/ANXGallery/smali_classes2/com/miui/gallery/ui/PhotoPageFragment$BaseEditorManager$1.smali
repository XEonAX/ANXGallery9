.class Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager$1;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPageFragment$MediaUpdateTask$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->insertAndNotifyDataSet(Ljava/lang/String;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;

.field final synthetic val$background:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;

    iput-boolean p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager$1;->val$background:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onInsertDone(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;

    iget-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager$1;->val$background:Z

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->notifyDataSetChange(Ljava/lang/String;Z)V

    return-void
.end method
