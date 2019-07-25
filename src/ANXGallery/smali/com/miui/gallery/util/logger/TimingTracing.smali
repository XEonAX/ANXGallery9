.class public Lcom/miui/gallery/util/logger/TimingTracing;
.super Ljava/lang/Object;
.source "TimingTracing.java"


# static fields
.field private static ENABLED:Z = false

.field private static final mTracings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/util/logger/TimingLogger;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/logger/TimingTracing;->mTracings:Ljava/util/Map;

    return-void
.end method

.method public static addSplit(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/util/logger/TimingTracing;->ENABLED:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "TimingTracing"

    const-string p1, "addSplit: the trace tag shouldn\'t be empty"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    sget-object v0, Lcom/miui/gallery/util/logger/TimingTracing;->mTracings:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/util/logger/TimingLogger;

    if-eqz p0, :cond_2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/logger/TimingLogger;->addSplit(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string p0, "TimingTracing"

    const-string p1, "addSplit: Did you have called the beginTracing?"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public static beginTracing(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/util/logger/TimingTracing;->ENABLED:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "TimingTracing"

    const-string p1, "beginTracing: the trace tag shouldn\'t be empty"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    new-instance v0, Lcom/miui/gallery/util/logger/TimingLogger;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/util/logger/TimingLogger;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/util/logger/TimingTracing;->mTracings:Ljava/util/Map;

    invoke-interface {p1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static setEnabled(Z)V
    .locals 0

    sput-boolean p0, Lcom/miui/gallery/util/logger/TimingTracing;->ENABLED:Z

    return-void
.end method

.method public static stopTracing(Ljava/lang/String;Landroid/util/Printer;)J
    .locals 3

    sget-boolean v0, Lcom/miui/gallery/util/logger/TimingTracing;->ENABLED:Z

    const-wide/16 v1, -0x1

    if-nez v0, :cond_0

    return-wide v1

    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "TimingTracing"

    const-string p1, "stopTracing: the trace tag shouldn\'t be empty"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v1

    :cond_1
    sget-object v0, Lcom/miui/gallery/util/logger/TimingTracing;->mTracings:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/logger/TimingLogger;

    if-eqz v0, :cond_2

    sget-object v1, Lcom/miui/gallery/util/logger/TimingTracing;->mTracings:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/logger/TimingLogger;->dump(Landroid/util/Printer;)J

    move-result-wide p0

    return-wide p0

    :cond_2
    const-string p0, "TimingTracing"

    const-string p1, "stopTracing: Did you have called the beginTracing?"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v1
.end method
