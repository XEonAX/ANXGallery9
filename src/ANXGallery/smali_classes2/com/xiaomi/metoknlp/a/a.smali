.class public Lcom/xiaomi/metoknlp/a/a;
.super Ljava/lang/Object;
.source "NLPBuild.java"


# static fields
.field private static DEBUG:Z = false

.field private static TAG:Ljava/lang/String; = "NLPBuild"

.field private static k:Ljava/lang/String;

.field private static l:Ljava/lang/String;

.field private static m:Ljava/lang/Class;

.field private static n:Ljava/lang/reflect/Field;

.field private static o:Ljava/lang/reflect/Field;

.field private static p:Ljava/lang/reflect/Field;

.field private static q:Ljava/lang/reflect/Field;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    sput-object v0, Lcom/xiaomi/metoknlp/a/a;->k:Ljava/lang/String;

    sget-object v0, Landroid/os/Build;->TYPE:Ljava/lang/String;

    sput-object v0, Lcom/xiaomi/metoknlp/a/a;->l:Ljava/lang/String;

    const/4 v0, 0x1

    :try_start_0
    const-string v1, "miui.os.Build"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    const-string v2, "IS_CTA_BUILD"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lcom/xiaomi/metoknlp/a/a;->n:Ljava/lang/reflect/Field;

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    const-string v2, "IS_ALPHA_BUILD"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lcom/xiaomi/metoknlp/a/a;->o:Ljava/lang/reflect/Field;

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    const-string v2, "IS_DEVELOPMENT_VERSION"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lcom/xiaomi/metoknlp/a/a;->p:Ljava/lang/reflect/Field;

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    const-string v2, "IS_STABLE_VERSION"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    sput-object v1, Lcom/xiaomi/metoknlp/a/a;->q:Ljava/lang/reflect/Field;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x0

    :catch_0
    if-eqz v0, :cond_0

    const/4 v0, 0x0

    sput-object v0, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    sput-object v0, Lcom/xiaomi/metoknlp/a/a;->n:Ljava/lang/reflect/Field;

    sput-object v0, Lcom/xiaomi/metoknlp/a/a;->o:Ljava/lang/reflect/Field;

    sput-object v0, Lcom/xiaomi/metoknlp/a/a;->p:Ljava/lang/reflect/Field;

    sput-object v0, Lcom/xiaomi/metoknlp/a/a;->q:Ljava/lang/reflect/Field;

    :cond_0
    return-void
.end method

.method public static q()Z
    .locals 3

    sget-boolean v0, Lcom/xiaomi/metoknlp/a/a;->DEBUG:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "brand="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/xiaomi/metoknlp/a/a;->k:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->k:Ljava/lang/String;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->k:Ljava/lang/String;

    const-string v1, "xiaomi"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static r()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "3rdROM-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->l:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static s()Z
    .locals 4

    invoke-static {}, Lcom/xiaomi/metoknlp/a/a;->q()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->o:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_1

    :try_start_0
    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->o:Ljava/lang/reflect/Field;

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    sget-boolean v1, Lcom/xiaomi/metoknlp/a/a;->DEBUG:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "is alpha version="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return v0

    :catch_0
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static t()Z
    .locals 4

    invoke-static {}, Lcom/xiaomi/metoknlp/a/a;->q()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->p:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_1

    :try_start_0
    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->p:Ljava/lang/reflect/Field;

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    sget-boolean v1, Lcom/xiaomi/metoknlp/a/a;->DEBUG:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "is dev version="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return v0

    :catch_0
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public static u()Z
    .locals 4

    invoke-static {}, Lcom/xiaomi/metoknlp/a/a;->q()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->q:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_1

    :try_start_0
    sget-object v0, Lcom/xiaomi/metoknlp/a/a;->q:Ljava/lang/reflect/Field;

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->m:Ljava/lang/Class;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v0

    sget-boolean v1, Lcom/xiaomi/metoknlp/a/a;->DEBUG:Z

    if-eqz v1, :cond_0

    sget-object v1, Lcom/xiaomi/metoknlp/a/a;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "is stable version="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return v0

    :catch_0
    :cond_1
    const/4 v0, 0x0

    return v0
.end method
