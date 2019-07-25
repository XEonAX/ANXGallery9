.class public Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;
.super Ljava/lang/Object;
.source "ComponentsStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Priority"
.end annotation


# instance fields
.field public final className:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "class-name"
    .end annotation
.end field

.field mMatchOrder:I

.field public final packageName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "package-name"
    .end annotation
.end field

.field public final packagePrefix:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "package-prefix"
    .end annotation
.end field

.field public final system:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "system"
    .end annotation
.end field

.field public final value:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "value"
    .end annotation
.end field


# virtual methods
.method initMathOrder()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->system:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    :cond_0
    const v0, 0x7fffffff

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->packagePrefix:Ljava/lang/String;

    if-eqz v1, :cond_1

    const/4 v0, 0x2

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->packageName:Ljava/lang/String;

    if-eqz v1, :cond_2

    const/4 v0, 0x1

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->className:Ljava/lang/String;

    if-eqz v1, :cond_3

    const/4 v0, 0x0

    :cond_3
    iput v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->mMatchOrder:I

    return-void
.end method

.method public match(Ljava/lang/String;Ljava/lang/String;Z)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->packageName:Ljava/lang/String;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    iget-object p3, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->packageName:Ljava/lang/String;

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->className:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->className:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->packagePrefix:Ljava/lang/String;

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->packagePrefix:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->system:Ljava/lang/Boolean;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->system:Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-ne p1, p3, :cond_4

    return v1

    :cond_4
    return v2
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Priority{packagePrefix=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->packagePrefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", packageName=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", className=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->className:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", value="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->value:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", system="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->system:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mMatchOrder="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->mMatchOrder:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
