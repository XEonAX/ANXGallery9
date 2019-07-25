.class public Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;
.super Ljava/lang/Object;
.source "LookUpTable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;,
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;,
        Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;
    }
.end annotation


# static fields
.field private static a:I = 0x64

.field private static b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b; = null

.field private static i:I = 0x64


# instance fields
.field private c:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;",
            ">;"
        }
    .end annotation
.end field

.field private d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;",
            ">;"
        }
    .end annotation
.end field

.field private f:Landroid/content/Context;

.field private transient g:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private h:Z

.field private j:Ljava/lang/Object;

.field private k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->j:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->f:Landroid/content/Context;

    return-void
.end method

.method static synthetic a(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;Ljava/lang/String;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method private a(Landroid/graphics/Bitmap;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;)Landroid/graphics/Bitmap;
    .locals 20

    invoke-virtual/range {p2 .. p2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;->a()[I

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    mul-int v1, v7, v8

    invoke-static {v1}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/nio/IntBuffer;->array()[I

    move-result-object v2

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v1, p1

    move v4, v7

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    invoke-virtual {v9}, Ljava/nio/IntBuffer;->array()[I

    move-result-object v1

    array-length v2, v1

    :goto_0
    if-ge v3, v2, :cond_0

    aget v4, v1, v3

    shr-int/lit8 v5, v4, 0x10

    and-int/lit16 v5, v5, 0xff

    int-to-float v5, v5

    const/high16 v6, 0x43800000    # 256.0f

    div-float/2addr v5, v6

    const/high16 v7, 0x427c0000    # 63.0f

    mul-float v5, v5, v7

    shr-int/lit8 v8, v4, 0x8

    and-int/lit16 v8, v8, 0xff

    int-to-float v8, v8

    div-float/2addr v8, v6

    mul-float v8, v8, v7

    and-int/lit16 v4, v4, 0xff

    int-to-float v4, v4

    div-float/2addr v4, v6

    mul-float v4, v4, v7

    float-to-double v6, v4

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v9

    double-to-int v4, v9

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v9

    double-to-int v9, v9

    rem-int/lit8 v10, v4, 0x8

    sub-int/2addr v4, v10

    div-int/lit8 v4, v4, 0x8

    rem-int/lit8 v11, v9, 0x8

    sub-int/2addr v9, v11

    div-int/lit8 v9, v9, 0x8

    mul-int/lit8 v4, v4, 0x40

    mul-int/lit8 v10, v10, 0x40

    mul-int/lit8 v9, v9, 0x40

    mul-int/lit8 v11, v11, 0x40

    float-to-double v12, v5

    invoke-static {v12, v13}, Ljava/lang/Math;->floor(D)D

    move-result-wide v14

    double-to-int v14, v14

    move-object/from16 v16, v1

    move/from16 v17, v2

    float-to-double v1, v8

    move-wide/from16 v18, v6

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v6

    double-to-int v6, v6

    invoke-static {v12, v13}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v12

    double-to-int v7, v12

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    add-int v2, v10, v14

    mul-int/lit16 v2, v2, 0x200

    add-int/2addr v2, v4

    add-int v12, v2, v6

    aget v12, v0, v12

    add-int/2addr v10, v7

    mul-int/lit16 v10, v10, 0x200

    add-int/2addr v10, v4

    add-int/2addr v10, v6

    aget v4, v0, v10

    add-int/2addr v2, v1

    aget v2, v0, v2

    shr-int/lit8 v10, v12, 0x10

    and-int/lit16 v10, v10, 0xff

    shr-int/lit8 v13, v12, 0x8

    and-int/lit16 v13, v13, 0xff

    shr-int/lit8 v4, v4, 0x10

    and-int/lit16 v4, v4, 0xff

    shr-int/lit8 v2, v2, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-float v15, v14

    sub-float/2addr v5, v15

    int-to-float v15, v6

    sub-float/2addr v8, v15

    invoke-static/range {v18 .. v19}, Ljava/lang/Math;->floor(D)D

    int-to-float v10, v10

    const/high16 v15, 0x3f800000    # 1.0f

    sub-float v18, v15, v5

    mul-float v10, v10, v18

    int-to-float v4, v4

    mul-float v4, v4, v5

    add-float/2addr v10, v4

    float-to-int v4, v10

    int-to-float v5, v13

    sub-float/2addr v15, v8

    mul-float v5, v5, v15

    int-to-float v2, v2

    mul-float v2, v2, v8

    add-float/2addr v5, v2

    float-to-int v2, v5

    and-int/lit16 v5, v12, 0xff

    add-int/2addr v14, v11

    mul-int/lit16 v14, v14, 0x200

    add-int/2addr v14, v9

    add-int v8, v14, v6

    aget v8, v0, v8

    add-int/2addr v11, v7

    mul-int/lit16 v11, v11, 0x200

    add-int/2addr v11, v9

    add-int/2addr v11, v6

    aget v6, v0, v11

    add-int/2addr v14, v1

    aget v1, v0, v14

    const/high16 v1, -0x1000000

    shl-int/lit8 v4, v4, 0x10

    or-int/2addr v1, v4

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    or-int/2addr v1, v5

    aput v1, v16, v3

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v1, v16

    move/from16 v2, v17

    goto/16 :goto_0

    :cond_0
    move-object/from16 v16, v1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    move-object/from16 v3, v16

    invoke-static {v3, v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_1
    move-object/from16 v3, v16

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static a(Landroid/content/Context;)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    iget-object v0, v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->f:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    :cond_0
    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    if-nez v0, :cond_1

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    invoke-direct {v0, p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    sget-object p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d()I

    :cond_1
    sget-object p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    return-object p0
.end method

.method static synthetic a(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    return-object p0
.end method

.method private b(I)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private c(I)I
    .locals 3

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k()V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {v2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->b(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)I

    move-result v2

    if-ne v2, p1, :cond_2

    return v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method public static c()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;
    .locals 1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    return-object v0
.end method

.method private e(Ljava/lang/String;)I
    .locals 3

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k()V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {v2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->a(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_2

    return v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method private i()I
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k:Ljava/util/ArrayList;

    sget v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->i:I

    :goto_0
    sget v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->i:I

    add-int/lit8 v1, v1, 0xa

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private j()V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->j:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c:Landroid/util/LruCache;

    if-nez v1, :cond_0

    new-instance v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$1;

    sget v2, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->a:I

    invoke-direct {v1, p0, v2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$1;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;I)V

    iput-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c:Landroid/util/LruCache;

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private k()V
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->h:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->h:Z

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d()I

    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)I
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object p1

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->a()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->m(I)I

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->a()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b(I)V

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->h()V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public a(Ljava/lang/String;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->j()V

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->i()I

    move-result v1

    invoke-direct {v0, p0, v1, p2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;ILcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;)V

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->h()V

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->a()I

    move-result p1

    return p1

    :cond_0
    new-instance p1, Ljava/lang/Exception;

    const-string p2, "Exceed the capacity of custom lut - it is 10"

    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 0

    invoke-virtual {p0, p2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->a(I)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;

    move-result-object p2

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->a(Landroid/graphics/Bitmap;Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public a(I)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;
    .locals 8

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c(I)I

    move-result p1

    const/4 v0, 0x0

    if-gez p1, :cond_0

    return-object v0

    :cond_0
    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->j()V

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->j:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c:Landroid/util/LruCache;

    iget-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {v3}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->c(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;

    if-nez v2, :cond_3

    iget-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    iget-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {v4}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->c(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->b()Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;

    move-result-object v2

    goto/16 :goto_4

    :cond_1
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v4, 0x0

    iput-boolean v4, v3, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v4

    iget-object v5, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {v5}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->c(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v4, :cond_3

    :try_start_1
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v5

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getPackageURI()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getAssetPackage()Lcom/nexstreaming/app/common/nexasset/assetpackage/b;

    move-result-object v7

    invoke-interface {v7}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetId()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    move-result-object v5
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v5, :cond_2

    :try_start_2
    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getFilePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4, v0, v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v4}, Ljava/io/InputStream;->close()V

    iget-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c:Landroid/util/LruCache;

    iget-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {p1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->c(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)Ljava/lang/String;

    move-result-object p1

    new-instance v4, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;

    invoke-direct {v4, p0, v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$b;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;Landroid/graphics/Bitmap;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {v3, p1, v4}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v2, v4

    goto :goto_1

    :catch_0
    move-exception p1

    move-object v2, v4

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    :goto_0
    move-object v0, v5

    goto :goto_2

    :cond_2
    :goto_1
    :try_start_4
    invoke-static {v5}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_4

    :catchall_1
    move-exception p1

    move-object v5, v0

    goto :goto_3

    :catch_2
    move-exception p1

    :goto_2
    :try_start_5
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    invoke-static {v0}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    goto :goto_4

    :goto_3
    invoke-static {v5}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    throw p1

    :cond_3
    :goto_4
    monitor-exit v1

    return-object v2

    :catchall_2
    move-exception p1

    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw p1
.end method

.method public a()V
    .locals 2

    const-string v0, "LookUpTable"

    const-string v1, "releaseResource2LookUpTable()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c:Landroid/util/LruCache;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    iput-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c:Landroid/util/LruCache;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iput-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    :cond_1
    sput-object v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b:Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;

    return-void
.end method

.method public a(Z)[Ljava/lang/String;
    .locals 4

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    if-eqz p1, :cond_1

    invoke-static {v2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->c(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->c()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {v2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->c(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    const/4 v1, 0x0

    :goto_1
    array-length v2, p1

    if-ge v1, v2, :cond_3

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    aput-object v2, p1, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    return-object p1
.end method

.method public b()V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->j:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c:Landroid/util/LruCache;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c:Landroid/util/LruCache;

    invoke-virtual {v1}, Landroid/util/LruCache;->size()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->c:Landroid/util/LruCache;

    invoke-virtual {v1}, Landroid/util/LruCache;->evictAll()V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public b(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public c(Ljava/lang/String;)I
    .locals 3

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k()V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->a()I

    move-result p1

    return p1

    :cond_2
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_4

    iget-object v2, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {v2}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->a(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_3

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {p1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->b(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)I

    move-result p1

    return p1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return v1
.end method

.method public d()I
    .locals 13

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    :goto_0
    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;->filter:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemCategory;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    const/4 v9, 0x1

    const/4 v10, 0x1

    :cond_1
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getType()Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    move-result-object v1

    sget-object v2, Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;->lut:Lcom/nexstreaming/app/common/nexasset/assetpackage/ItemType;

    if-ne v1, v2, :cond_1

    iget-object v11, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    new-instance v12, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getId()Ljava/lang/String;

    move-result-object v3

    const-wide/16 v4, 0x0

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->isHidden()Z

    move-result v6

    const/4 v7, 0x0

    move-object v0, v12

    move-object v1, p0

    move v2, v10

    invoke-direct/range {v0 .. v7}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;ILjava/lang/String;JZLcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$1;)V

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;

    iget-object v11, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    new-instance v12, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->a()I

    move-result v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Ljava/lang/String;

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, v12

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;-><init>(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;ILjava/lang/String;JZLcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$1;)V

    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_3
    sub-int/2addr v10, v9

    return v10
.end method

.method public d(Ljava/lang/String;)Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;
    .locals 3

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k()V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;

    invoke-static {v1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;->c(Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public e()V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v2

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->a()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->m(I)I

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$a;->a()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->b(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->d:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    invoke-virtual {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->h()V

    return-void
.end method

.method public f()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b$c;",
            ">;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->k()V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->e:Ljava/util/List;

    return-object v0
.end method

.method public final g()Landroid/graphics/Bitmap;
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->g:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->g:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v3, 0x0

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    if-nez v0, :cond_2

    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->f()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "vignette.webp"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1

    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->f:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v3, "vignette.webp"

    invoke-virtual {v0, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0, v1, v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    move-object v0, v1

    :cond_2
    :goto_1
    if-nez v0, :cond_3

    return-object v1

    :cond_3
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->g:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method public h()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/kminternal/kinemaster/editorwrapper/b;->h:Z

    return-void
.end method
