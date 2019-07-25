.class Lcom/miui/gallery/editor/photo/app/PhotoEditor$9;
.super Ljava/lang/Object;
.source "PhotoEditor.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnViewReadyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PhotoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$9;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewReady()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$9;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$2000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/MenuFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$9;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1500(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Lcom/miui/gallery/editor/photo/app/MenuFragment;)V

    goto :goto_0

    :cond_0
    const-string v0, "PhotoEditor"

    const-string v1, "menu already exit."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
