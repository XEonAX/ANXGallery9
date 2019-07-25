.class Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;
.super Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;
.source "NexEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(ILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;

.field final synthetic b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iput-object p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;)V
    .locals 3

    const-string v0, "NexEditor.java"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  Capture onCapture="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {p0, v0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    .locals 3

    const-string v0, "NexEditor.java"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  Capture onCaptureFail="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;Landroid/graphics/Bitmap;)V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Z)Z

    const/4 v0, 0x0

    if-nez p2, :cond_0

    const-string p2, "NexEditor.java"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "  Capture failed; error="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Z)Z

    iget-object p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;

    invoke-virtual {p2, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V

    goto :goto_0

    :cond_0
    const-string p1, "NexEditor.java"

    const-string v2, "  Capture success; notify listener"

    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Z)Z

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;

    invoke-virtual {p1, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;->a(Landroid/graphics/Bitmap;)V

    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Z)Z

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->d(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Z)Z

    const-string p1, "NexEditor.java"

    const-string p2, "  Capture done; seek to original location"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->e(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)I

    move-result p2

    new-instance v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14$1;

    invoke-direct {v1, p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14$1;-><init>(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;)V

    invoke-virtual {p1, p2, v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(IZLcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$p;)V

    goto :goto_1

    :cond_1
    const-string p1, "NexEditor.java"

    const-string p2, "  Capture done; SKIP SEEK"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-void
.end method
