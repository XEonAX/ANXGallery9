.class Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14$1;
.super Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$p;
.source "NexEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14$1;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$p;-><init>()V

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    const-string v0, "seekToOriginalTimeAfterCapture"

    return-object v0
.end method

.method public a(II)V
    .locals 0

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14$1;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;

    iget-object p1, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Z)Z

    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    .locals 1

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14$1;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;

    iget-object p1, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$14;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Z)Z

    return-void
.end method
