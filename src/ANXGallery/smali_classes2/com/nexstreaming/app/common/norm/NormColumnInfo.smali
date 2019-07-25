.class public Lcom/nexstreaming/app/common/norm/NormColumnInfo;
.super Ljava/lang/Object;
.source "NormColumnInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;
    }
.end annotation


# instance fields
.field final a:Ljava/lang/String;

.field final b:Ljava/lang/reflect/Field;

.field final c:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

.field final d:Z

.field final e:Z

.field final f:Z

.field final g:Z

.field final h:Z

.field final i:I

.field final j:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Lcom/nexstreaming/app/common/norm/b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/reflect/Field;)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/nexstreaming/app/common/norm/b$c;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_1

    const-class v1, Lcom/nexstreaming/app/common/norm/b;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->f:Z

    iget-boolean v1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->f:Z

    if-eqz v1, :cond_2

    const-class v1, Lcom/nexstreaming/app/common/norm/b;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2

    iput-object v0, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->j:Ljava/lang/Class;

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->j:Ljava/lang/Class;

    :goto_2
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v4, "_id"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-class v1, Lcom/nexstreaming/app/common/norm/b$f;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_3
    const/4 v2, 0x1

    :cond_4
    iput-boolean v2, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->g:Z

    iget-boolean v1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->f:Z

    if-eqz v1, :cond_5

    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->LONG:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto/16 :goto_8

    :cond_5
    const-class v1, Ljava/lang/Integer;

    if-eq v0, v1, :cond_16

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_6

    goto/16 :goto_7

    :cond_6
    const-class v1, Ljava/lang/Long;

    if-eq v0, v1, :cond_15

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_7

    goto/16 :goto_6

    :cond_7
    const-class v1, Ljava/lang/Float;

    if-eq v0, v1, :cond_14

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_8

    goto/16 :goto_5

    :cond_8
    const-class v1, Ljava/lang/Double;

    if-eq v0, v1, :cond_13

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_9

    goto/16 :goto_4

    :cond_9
    const-class v1, Ljava/lang/String;

    if-ne v0, v1, :cond_a

    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->TEXT:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto/16 :goto_8

    :cond_a
    const-class v1, Ljava/lang/Boolean;

    if-eq v0, v1, :cond_12

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_b

    goto :goto_3

    :cond_b
    const-class v1, Ljava/util/Collection;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_c

    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->JSON:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto/16 :goto_8

    :cond_c
    const-class v1, Ljava/util/Map;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_d

    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->JSON:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto :goto_8

    :cond_d
    const-class v1, [B

    if-ne v0, v1, :cond_e

    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->BLOB:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto :goto_8

    :cond_e
    const-class v1, Landroid/graphics/Bitmap;

    if-ne v0, v1, :cond_10

    const-class v0, Lcom/nexstreaming/app/common/norm/b$b;

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_f

    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->JPEG:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto :goto_8

    :cond_f
    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->PNG:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto :goto_8

    :cond_10
    const-class v1, Ljava/lang/Enum;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_11

    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->ENUM:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto :goto_8

    :cond_11
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized column type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " (for column \'"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\')"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_12
    :goto_3
    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->BOOL:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto :goto_8

    :cond_13
    :goto_4
    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->DOUBLE:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto :goto_8

    :cond_14
    :goto_5
    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->FLOAT:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto :goto_8

    :cond_15
    :goto_6
    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->LONG:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    goto :goto_8

    :cond_16
    :goto_7
    sget-object v0, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->INT:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    :goto_8
    iget-boolean v1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->g:Z

    if-eqz v1, :cond_18

    sget-object v1, Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;->LONG:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    if-ne v0, v1, :cond_17

    goto :goto_9

    :cond_17
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Primary key must be \'long\' type."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_18
    :goto_9
    const-class v1, Lcom/nexstreaming/app/common/norm/b$g;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->d:Z

    const-class v1, Lcom/nexstreaming/app/common/norm/b$d;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->h:Z

    const-class v1, Lcom/nexstreaming/app/common/norm/b$e;

    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->e:Z

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/nexstreaming/app/common/norm/a;->camelCaseToLCUnderscore(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->a:Ljava/lang/String;

    iput-object p1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->b:Ljava/lang/reflect/Field;

    iput-object v0, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->c:Lcom/nexstreaming/app/common/norm/NormColumnInfo$ColumnType;

    const-class v0, Lcom/nexstreaming/app/common/norm/b$a;

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_19

    const-class v0, Lcom/nexstreaming/app/common/norm/b$a;

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p1

    check-cast p1, Lcom/nexstreaming/app/common/norm/b$a;

    invoke-interface {p1}, Lcom/nexstreaming/app/common/norm/b$a;->a()I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->i:I

    goto :goto_a

    :cond_19
    const/16 p1, 0xb

    iput p1, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->i:I

    :goto_a
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/norm/NormColumnInfo;->a:Ljava/lang/String;

    return-object v0
.end method
