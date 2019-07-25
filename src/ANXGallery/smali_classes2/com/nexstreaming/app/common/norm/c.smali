.class public Lcom/nexstreaming/app/common/norm/c;
.super Ljava/lang/Object;
.source "NormTableInfo.java"


# static fields
.field private static g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/nexstreaming/app/common/norm/b;",
            ">;",
            "Lcom/nexstreaming/app/common/norm/c;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:[Ljava/lang/String;

.field private final b:[Ljava/lang/String;

.field private final c:[Lcom/nexstreaming/app/common/norm/NormColumnInfo;

.field private final d:Ljava/lang/String;

.field private final e:[Ljava/lang/String;

.field private final f:Lcom/nexstreaming/app/common/norm/NormColumnInfo;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/app/common/norm/c;->g:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Class;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/nexstreaming/app/common/norm/b;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/nexstreaming/app/common/norm/a;->camelCaseToLCUnderscore(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/nexstreaming/app/common/norm/c;->d:Ljava/lang/String;

    const-string v2, "CREATE TABLE "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/app/common/norm/c;->d:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " (\n    "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "DROP TABLE IF EXISTS "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/app/common/norm/c;->d:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object p1

    array-length v2, p1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v6, p1, v4

    invoke-direct {p0, v6}, Lcom/nexstreaming/app/common/norm/c;->a(Ljava/lang/reflect/Field;)Z

    move-result v6

    if-eqz v6, :cond_0

    add-int/lit8 v5, v5, 0x1

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    array-length v2, p1

    sub-int/2addr v2, v5

    new-array v2, v2, [Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    iput-object v2, p0, Lcom/nexstreaming/app/common/norm/c;->c:[Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    array-length v2, p1

    sub-int/2addr v2, v5

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/nexstreaming/app/common/norm/c;->e:[Ljava/lang/String;

    const/4 v2, -0x1

    const/4 v4, 0x0

    move-object v7, v4

    move-object v8, v7

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, -0x1

    :goto_1
    array-length v9, p1

    if-ge v2, v9, :cond_a

    aget-object v9, p1, v2

    invoke-direct {p0, v9}, Lcom/nexstreaming/app/common/norm/c;->a(Ljava/lang/reflect/Field;)Z

    move-result v10

    if-eqz v10, :cond_2

    goto/16 :goto_3

    :cond_2
    add-int/lit8 v6, v6, 0x1

    new-instance v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    invoke-direct {v10, v9}, Lcom/nexstreaming/app/common/norm/NormColumnInfo;-><init>(Ljava/lang/reflect/Field;)V

    iget-object v9, p0, Lcom/nexstreaming/app/common/norm/c;->c:[Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    aput-object v10, v9, v6

    iget-object v9, p0, Lcom/nexstreaming/app/common/norm/c;->e:[Ljava/lang/String;

    iget-object v11, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->a:Ljava/lang/String;

    aput-object v11, v9, v6

    iget-boolean v9, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->h:Z

    if-eqz v9, :cond_4

    if-nez v7, :cond_3

    array-length v7, p1

    new-array v7, v7, [Ljava/lang/String;

    array-length v8, p1

    new-array v8, v8, [Ljava/lang/String;

    :cond_3
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "CREATE INDEX idx_"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->a:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, " ON "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, p0, Lcom/nexstreaming/app/common/norm/c;->d:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "( "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->a:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, ")"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v5

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "DROP INDEX IF EXISTS idx_"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->a:Ljava/lang/String;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v5

    add-int/lit8 v5, v5, 0x1

    :cond_4
    iget-boolean v9, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->g:Z

    if-eqz v9, :cond_5

    move-object v4, v10

    :cond_5
    if-lez v6, :cond_6

    const-string v9, ",\n    "

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    iget-object v9, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->a:Ljava/lang/String;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v9, 0x20

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    sget-object v9, Lcom/nexstreaming/app/common/norm/c$1;->a:[I

    iget-object v11, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->c:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    invoke-virtual {v11}, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->ordinal()I

    move-result v11

    aget v9, v9, v11

    packed-switch v9, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    const-string v9, "BLOB"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :pswitch_1
    const-string v9, "TEXT"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :pswitch_2
    const-string v9, "REAL"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :pswitch_3
    iget-boolean v9, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->g:Z

    if-eqz v9, :cond_7

    const-string v9, "INTEGER PRIMARY KEY"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_7
    const-string v9, "INTEGER"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_2
    iget-boolean v9, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->d:Z

    if-eqz v9, :cond_8

    const-string v9, " UNIQUE"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_8
    iget-boolean v9, v10, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->e:Z

    if-eqz v9, :cond_9

    const-string v9, " NOT NULL"

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_9
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_1

    :cond_a
    iput-object v4, p0, Lcom/nexstreaming/app/common/norm/c;->f:Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    const/16 p1, 0x29

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 p1, v5, 0x1

    new-array v2, p1, [Ljava/lang/String;

    iput-object v2, p0, Lcom/nexstreaming/app/common/norm/c;->a:[Ljava/lang/String;

    iget-object v2, p0, Lcom/nexstreaming/app/common/norm/c;->a:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    if-lez v5, :cond_b

    iget-object v0, p0, Lcom/nexstreaming/app/common/norm/c;->a:[Ljava/lang/String;

    const/4 v2, 0x1

    invoke-static {v7, v3, v0, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_b
    new-array p1, p1, [Ljava/lang/String;

    iput-object p1, p0, Lcom/nexstreaming/app/common/norm/c;->b:[Ljava/lang/String;

    iget-object p1, p0, Lcom/nexstreaming/app/common/norm/c;->b:[Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v5

    if-lez v5, :cond_c

    iget-object p1, p0, Lcom/nexstreaming/app/common/norm/c;->b:[Ljava/lang/String;

    invoke-static {v8, v3, p1, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_c
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static a(Ljava/lang/Class;)Lcom/nexstreaming/app/common/norm/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/nexstreaming/app/common/norm/b;",
            ">;)",
            "Lcom/nexstreaming/app/common/norm/c;"
        }
    .end annotation

    sget-object v0, Lcom/nexstreaming/app/common/norm/c;->g:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/app/common/norm/c;

    if-nez v0, :cond_0

    new-instance v0, Lcom/nexstreaming/app/common/norm/c;

    invoke-direct {v0, p0}, Lcom/nexstreaming/app/common/norm/c;-><init>(Ljava/lang/Class;)V

    sget-object v1, Lcom/nexstreaming/app/common/norm/c;->g:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method private a(Ljava/lang/reflect/Field;)Z
    .locals 2

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->isSynthetic()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object p1

    const-string v0, "$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "serialVersionUID"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1

    :cond_2
    :goto_0
    return v1
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/nexstreaming/app/common/norm/NormColumnInfo;
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/app/common/norm/c;->c:[Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget-object v4, v3, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->a:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public a()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/norm/c;->a:[Ljava/lang/String;

    return-object v0
.end method

.method public a(II)[Ljava/lang/String;
    .locals 5

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/nexstreaming/app/common/norm/c;->c:[Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    array-length v2, v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/nexstreaming/app/common/norm/c;->c:[Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->i:I

    if-le v2, p1, :cond_0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_2

    new-array p1, v0, [Ljava/lang/String;

    return-object p1

    :cond_2
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object v2, p0, Lcom/nexstreaming/app/common/norm/c;->c:[Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    aget-object v1, v2, v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ALTER TABLE "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/nexstreaming/app/common/norm/c;->d:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ADD COLUMN "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v1, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/nexstreaming/app/common/norm/c$1;->a:[I

    iget-object v4, v1, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->c:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    invoke-virtual {v4}, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    const-string v1, "BLOB"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :pswitch_1
    const-string v1, "TEXT"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :pswitch_2
    const-string v1, "REAL"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :pswitch_3
    iget-boolean v1, v1, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->g:Z

    if-eqz v1, :cond_3

    const-string v1, "INTEGER PRIMARY KEY"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_3
    const-string v1, "INTEGER"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p1, v0

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->reverse()Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public b()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/norm/c;->b:[Ljava/lang/String;

    return-object v0
.end method

.method public c()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/norm/c;->d:Ljava/lang/String;

    return-object v0
.end method

.method public d()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/norm/c;->e:[Ljava/lang/String;

    return-object v0
.end method

.method public e()[Lcom/nexstreaming/app/common/norm/NormColumnInfo;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/norm/c;->c:[Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    return-object v0
.end method

.method public f()Lcom/nexstreaming/app/common/norm/NormColumnInfo;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/norm/c;->f:Lcom/nexstreaming/app/common/norm/NormColumnInfo;

    return-object v0
.end method
