.class Lcom/nexstreaming/app/common/util/FileType$3;
.super Lcom/nexstreaming/app/common/util/FileType$a;
.source "FileType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/app/common/util/FileType;-><init>(Ljava/lang/String;ILcom/nexstreaming/app/common/util/FileType$FileCategory;[Ljava/lang/String;[[I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:[[I

.field final synthetic b:Lcom/nexstreaming/app/common/util/FileType;


# direct methods
.method constructor <init>(Lcom/nexstreaming/app/common/util/FileType;[[I)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/app/common/util/FileType$3;->b:Lcom/nexstreaming/app/common/util/FileType;

    iput-object p2, p0, Lcom/nexstreaming/app/common/util/FileType$3;->a:[[I

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/nexstreaming/app/common/util/FileType$a;-><init>(Lcom/nexstreaming/app/common/util/FileType$1;)V

    return-void
.end method


# virtual methods
.method a([B)Z
    .locals 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/nexstreaming/app/common/util/FileType$3;->a:[[I

    array-length v2, v2

    if-ge v1, v2, :cond_4

    iget-object v2, p0, Lcom/nexstreaming/app/common/util/FileType$3;->a:[[I

    aget-object v2, v2, v1

    array-length v3, p1

    array-length v4, v2

    if-ge v3, v4, :cond_0

    goto :goto_2

    :cond_0
    const/4 v3, 0x0

    :goto_1
    array-length v4, v2

    if-ge v3, v4, :cond_3

    aget v4, v2, v3

    const/4 v5, -0x1

    if-ne v4, v5, :cond_1

    goto :goto_3

    :cond_1
    aget-byte v4, p1, v3

    aget v5, v2, v3

    int-to-byte v5, v5

    if-eq v4, v5, :cond_2

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    const/4 p1, 0x1

    return p1

    :cond_4
    return v0
.end method
