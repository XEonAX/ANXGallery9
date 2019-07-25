.class Lcom/miui/gallery/ui/ChooserFragment$Component;
.super Ljava/lang/Object;
.source "ChooserFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ChooserFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Component"
.end annotation


# instance fields
.field mClassName:Ljava/lang/String;

.field mHashCode:I

.field mPackageName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Landroid/content/pm/ResolveInfo;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/ui/ChooserFragment$Component;->init(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private init(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$Component;->mPackageName:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment$Component;->mClassName:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment$Component;->mPackageName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment$Component;->mClassName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/ChooserFragment$Component;->mHashCode:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    instance-of v0, p1, Lcom/miui/gallery/ui/ChooserFragment$Component;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$Component;->mPackageName:Ljava/lang/String;

    check-cast p1, Lcom/miui/gallery/ui/ChooserFragment$Component;

    iget-object v1, p1, Lcom/miui/gallery/ui/ChooserFragment$Component;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$Component;->mClassName:Ljava/lang/String;

    iget-object p1, p1, Lcom/miui/gallery/ui/ChooserFragment$Component;->mClassName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public hashCode()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/ChooserFragment$Component;->mHashCode:I

    return v0
.end method

.method wrap(Landroid/content/pm/ResolveInfo;)Lcom/miui/gallery/ui/ChooserFragment$Component;
    .locals 1

    iget-object v0, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/ui/ChooserFragment$Component;->init(Ljava/lang/String;Ljava/lang/String;)V

    return-object p0
.end method
