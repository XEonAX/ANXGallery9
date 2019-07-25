.class Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;
.super Ljava/lang/Object;
.source "ChooserFragment.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ChooserFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PriorityComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/content/pm/ResolveInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private mNormal:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/content/pm/ResolveInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mPriority:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/miui/gallery/ui/ChooserFragment$Component;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mTemp:Lcom/miui/gallery/ui/ChooserFragment$Component;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mPriority:Ljava/util/HashMap;

    new-instance v0, Lcom/miui/gallery/ui/ChooserFragment$Component;

    invoke-direct {v0}, Lcom/miui/gallery/ui/ChooserFragment$Component;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mTemp:Lcom/miui/gallery/ui/ChooserFragment$Component;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/ChooserFragment$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;-><init>()V

    return-void
.end method

.method static synthetic access$302(Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;Ljava/util/Comparator;)Ljava/util/Comparator;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mNormal:Ljava/util/Comparator;

    return-object p1
.end method


# virtual methods
.method build(Ljava/util/List;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;",
            ">;",
            "Ljava/util/List<",
            "Landroid/content/pm/ResolveInfo;",
            ">;)V"
        }
    .end annotation

    const-string v0, "ChooserFragment"

    const-string v1, "build priority: %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mTemp:Lcom/miui/gallery/ui/ChooserFragment$Component;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/ui/ChooserFragment$Component;->wrap(Landroid/content/pm/ResolveInfo;)Lcom/miui/gallery/ui/ChooserFragment$Component;

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mPriority:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mTemp:Lcom/miui/gallery/ui/ChooserFragment$Component;

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;

    iget-object v4, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v5, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    iget-object v6, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v6, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v6, v6, Landroid/content/pm/ApplicationInfo;->flags:I

    const/4 v7, 0x1

    and-int/2addr v6, v7

    if-eqz v6, :cond_2

    const/4 v3, 0x1

    :cond_2
    invoke-virtual {v2, v4, v5, v3}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->match(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1

    iget v3, v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->value:I

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mPriority:Ljava/util/HashMap;

    new-instance v2, Lcom/miui/gallery/ui/ChooserFragment$Component;

    invoke-direct {v2, v0}, Lcom/miui/gallery/ui/ChooserFragment$Component;-><init>(Landroid/content/pm/ResolveInfo;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "ChooserFragment"

    const-string v1, "assign priority of %s, %s by %d"

    iget-object v2, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mTemp:Lcom/miui/gallery/ui/ChooserFragment$Component;

    iget-object v2, v2, Lcom/miui/gallery/ui/ChooserFragment$Component;->mPackageName:Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mTemp:Lcom/miui/gallery/ui/ChooserFragment$Component;

    iget-object v4, v4, Lcom/miui/gallery/ui/ChooserFragment$Component;->mClassName:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v4, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_4
    const-string p1, "ChooserFragment"

    const-string p2, "build finish"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public compare(Landroid/content/pm/ResolveInfo;Landroid/content/pm/ResolveInfo;)I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mNormal:Ljava/util/Comparator;

    invoke-interface {v0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mPriority:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mTemp:Lcom/miui/gallery/ui/ChooserFragment$Component;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/ChooserFragment$Component;->wrap(Landroid/content/pm/ResolveInfo;)Lcom/miui/gallery/ui/ChooserFragment$Component;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Numbers;->unbox(Ljava/lang/Integer;I)I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mPriority:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->mTemp:Lcom/miui/gallery/ui/ChooserFragment$Component;

    invoke-virtual {v2, p2}, Lcom/miui/gallery/ui/ChooserFragment$Component;->wrap(Landroid/content/pm/ResolveInfo;)Lcom/miui/gallery/ui/ChooserFragment$Component;

    move-result-object p2

    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-static {p2, v0}, Lcom/miui/gallery/util/Numbers;->unbox(Ljava/lang/Integer;I)I

    move-result p2

    if-ge p1, p2, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    if-ne p1, p2, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Landroid/content/pm/ResolveInfo;

    check-cast p2, Landroid/content/pm/ResolveInfo;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/ChooserFragment$PriorityComparator;->compare(Landroid/content/pm/ResolveInfo;Landroid/content/pm/ResolveInfo;)I

    move-result p1

    return p1
.end method
