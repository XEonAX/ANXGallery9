.class Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$1;
.super Landroid/util/LruCache;
.source "LookUpTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;I)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$1;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    invoke-direct {p0, p2}, Landroid/util/LruCache;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    const-string p1, "LookUpTable"

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "The entry is being removed / key:"

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p1, p4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    check-cast p3, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;

    invoke-virtual {p3}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;->b()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$1;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    invoke-static {p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->a(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;Ljava/lang/String;)I

    move-result p1

    if-gez p1, :cond_0

    const-string p1, "LookUpTable"

    const-string p2, "The entry is not found"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string p2, "LookUpTable"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "The entry index ="

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, ", id="

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p4, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$1;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    invoke-static {p4}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->a(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;)Ljava/util/List;

    move-result-object p4

    invoke-interface {p4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {p4}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->b(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)I

    move-result p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object p2

    iget-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$1;->a:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    invoke-static {p3}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->a(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {p1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->b(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->m(I)I

    :goto_0
    return-void
.end method
