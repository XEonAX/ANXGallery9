.class public Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;
.super Ljava/lang/Object;
.source "NexImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private a:Landroid/graphics/Bitmap;

.field private b:I

.field private c:I

.field private d:I


# direct methods
.method private constructor <init>(Landroid/graphics/Bitmap;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->b:I

    iput p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->c:I

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->a:Landroid/graphics/Bitmap;

    const/4 p1, 0x1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->d:I

    return-void
.end method

.method private constructor <init>(Landroid/graphics/Bitmap;III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->b:I

    iput p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->c:I

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->a:Landroid/graphics/Bitmap;

    iput p4, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->d:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/graphics/Bitmap;IIILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;III)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/graphics/Bitmap;IILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;II)V

    return-void
.end method


# virtual methods
.method public a()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->a:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public b()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->b:I

    return v0
.end method

.method public c()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->c:I

    return v0
.end method

.method public d()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->d:I

    return v0
.end method
