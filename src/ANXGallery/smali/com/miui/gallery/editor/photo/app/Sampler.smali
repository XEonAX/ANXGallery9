.class public Lcom/miui/gallery/editor/photo/app/Sampler;
.super Ljava/lang/Object;
.source "Sampler.java"


# instance fields
.field private mFormat:Ljava/lang/String;

.field private mPage:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s%%s%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object p2, v2, p1

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/Sampler;->mFormat:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/app/Sampler;->mPage:Ljava/lang/String;

    return-void
.end method

.method public static from(Landroid/os/Bundle;)Lcom/miui/gallery/editor/photo/app/Sampler;
    .locals 3

    if-eqz p0, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/editor/Constants;->EXTRA_IS_SCREENSHOT:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/editor/Constants;->EXTRA_IS_LONG_SCREENSHOT:Ljava/lang/String;

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "Sampler"

    const-string v0, "create long screenshot\'s sampler"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/miui/gallery/editor/photo/app/Sampler;

    const-string v0, "photo_editor"

    const-string v1, "(long_screenshot)"

    const-string v2, "photo_editor_long_screenshot"

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/Sampler;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :cond_0
    const-string p0, "Sampler"

    const-string v0, "create screenshot\'s sampler"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/miui/gallery/editor/photo/app/Sampler;

    const-string v0, "photo_editor"

    const-string v1, "(screenshot)"

    const-string v2, "photo_editor_screenshot"

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/Sampler;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object p0

    :cond_1
    const-string p0, "Sampler"

    const-string v0, "create sampler"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/miui/gallery/editor/photo/app/Sampler;

    const-string v0, "photo_editor"

    const-string v1, ""

    const-string v2, "photo_editor_main"

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/Sampler;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method


# virtual methods
.method public recordEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    const-string v0, "Sampler"

    const-string v1, "record cat: %s, event: %s"

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/Sampler;->mFormat:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public recordEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "Sampler"

    const-string v1, "record cat: %s, event: %s, params: %s"

    invoke-static {v0, v1, p1, p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/Sampler;->mFormat:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public recordNumericEvent(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 4

    const-string v0, "Sampler"

    const-string v1, "record cat: %s, event: %s, params: %d"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, p1, p2, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/Sampler;->mFormat:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2, p3, p4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method

.method public recordPageEnd(Landroid/app/Activity;)V
    .locals 2

    const-string v0, "Sampler"

    const-string v1, "record page end"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/Sampler;->mPage:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public recordPageStart(Landroid/app/Activity;)V
    .locals 3

    const-string v0, "Sampler"

    const-string v1, "record page start: %s"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/Sampler;->mPage:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/Sampler;->mPage:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method
