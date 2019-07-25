.class Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;
.super Ljava/lang/Object;
.source "NexImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field final a:Ljava/lang/String;

.field final b:I

.field final c:I

.field final d:I

.field final e:Landroid/graphics/Bitmap$Config;

.field final f:Z


# direct methods
.method private constructor <init>(Ljava/lang/String;IIILandroid/graphics/Bitmap$Config;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    const-string p1, ""

    :cond_0
    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->a:Ljava/lang/String;

    iput p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->b:I

    iput p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->c:I

    iput p4, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->d:I

    iput-object p5, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->e:Landroid/graphics/Bitmap$Config;

    iput-boolean p6, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->f:Z

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;IIILandroid/graphics/Bitmap$Config;ZLcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;-><init>(Ljava/lang/String;IIILandroid/graphics/Bitmap$Config;Z)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    instance-of v1, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    if-ne p1, p0, :cond_1

    return v1

    :cond_1
    check-cast p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;

    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->b:I

    iget v3, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->b:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->c:I

    iget v3, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->c:I

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->d:I

    iget v3, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->d:I

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->e:Landroid/graphics/Bitmap$Config;

    iget-object v3, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->e:Landroid/graphics/Bitmap$Config;

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->a:Ljava/lang/String;

    iget-object v3, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->f:Z

    iget-boolean p1, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->f:Z

    if-ne v2, p1, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0

    :cond_3
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    iget v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->b:I

    mul-int/lit16 v1, v1, 0xbf

    add-int/2addr v0, v1

    iget v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->c:I

    mul-int/lit8 v1, v1, 0x3d

    add-int/2addr v0, v1

    iget v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->d:I

    mul-int/lit16 v1, v1, 0xc7

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->e:Landroid/graphics/Bitmap$Config;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;->e:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v1}, Landroid/graphics/Bitmap$Config;->hashCode()I

    move-result v1

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method
