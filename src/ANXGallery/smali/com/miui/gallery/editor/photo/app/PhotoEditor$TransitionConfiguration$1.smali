.class Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$1;
.super Ljava/lang/Object;
.source "PhotoEditor.java"

# interfaces
.implements Lcom/miui/gallery/compat/app/ActivityCompat$SharedElementCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->onExit(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSharedElementStart()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration$1;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;->access$2200(Lcom/miui/gallery/editor/photo/app/PhotoEditor$TransitionConfiguration;)Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/ExportTask;->closeExportDialog()V

    return-void
.end method
