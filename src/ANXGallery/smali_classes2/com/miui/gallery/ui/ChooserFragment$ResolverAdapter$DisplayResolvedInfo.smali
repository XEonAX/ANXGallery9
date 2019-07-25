.class Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;
.super Ljava/lang/Object;
.source "ChooserFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DisplayResolvedInfo"
.end annotation


# instance fields
.field private mResolveInfo:Landroid/content/pm/ResolveInfo;

.field private mResolvedIntent:Landroid/content/Intent;

.field final synthetic this$0:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;Landroid/content/Intent;Landroid/content/pm/ResolveInfo;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->this$0:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->mResolvedIntent:Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->mResolvedIntent:Landroid/content/Intent;

    new-instance p3, Landroid/content/ComponentName;

    iget-object v0, p1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {p3, v0, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;)Landroid/content/pm/ResolveInfo;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->getResolveInfo()Landroid/content/pm/ResolveInfo;

    move-result-object v0

    check-cast p1, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->getResolveInfo()Landroid/content/pm/ResolveInfo;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->access$800(Landroid/content/pm/ResolveInfo;Landroid/content/pm/ResolveInfo;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getResolveInfo()Landroid/content/pm/ResolveInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    return-object v0
.end method

.method public getResolvedIntent()Landroid/content/Intent;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->mResolvedIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
