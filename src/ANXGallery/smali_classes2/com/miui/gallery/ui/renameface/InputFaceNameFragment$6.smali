.class Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6;
.super Ljava/lang/Object;
.source "InputFaceNameFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->changeMergeResultCursor(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/FutureListener<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

.field final synthetic val$input:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6;->val$input:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/database/Cursor;

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v2, 0x0

    :goto_1
    iget-object v3, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    iget-object v4, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6;->val$input:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$1200(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v4

    if-lez v4, :cond_3

    const/4 v4, 0x1

    goto :goto_2

    :cond_3
    const/4 v4, 0x0

    :goto_2
    iget-object v5, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    xor-int/lit8 v6, v4, 0x1

    invoke-static {v5, v6}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$1302(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Z)Z

    const/4 v5, 0x2

    if-eqz v2, :cond_4

    if-eqz v4, :cond_4

    const/4 v2, 0x3

    new-array v2, v2, [Landroid/database/Cursor;

    aput-object v3, v2, v0

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$1400(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Landroid/database/Cursor;

    move-result-object v0

    aput-object v0, v2, v1

    aput-object p1, v2, v5

    goto :goto_3

    :cond_4
    if-eqz v2, :cond_5

    new-array v2, v5, [Landroid/database/Cursor;

    iget-object v4, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$1400(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Landroid/database/Cursor;

    move-result-object v4

    aput-object v4, v2, v0

    aput-object p1, v2, v1

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_3

    :cond_5
    new-array v2, v1, [Landroid/database/Cursor;

    aput-object v3, v2, v0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :goto_3
    new-instance p1, Landroid/database/MergeCursor;

    invoke-direct {p1, v2}, Landroid/database/MergeCursor;-><init>([Landroid/database/Cursor;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$1600(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6$1;-><init>(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$6;Landroid/database/Cursor;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
