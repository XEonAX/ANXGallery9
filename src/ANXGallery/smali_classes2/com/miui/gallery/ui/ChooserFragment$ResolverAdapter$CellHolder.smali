.class Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;
.super Ljava/lang/Object;
.source "ChooserFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CellHolder"
.end annotation


# instance fields
.field public mIcon:Landroid/widget/ImageView;

.field public mInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

.field public mText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->this$0:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;Lcom/miui/gallery/ui/ChooserFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;-><init>(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;)V

    return-void
.end method


# virtual methods
.method public needRefresh(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/ShareComponentSorter;->getInstance()Lcom/miui/gallery/util/ShareComponentSorter;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    invoke-static {v0}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->access$600(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;)Landroid/content/pm/ResolveInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    invoke-static {v1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->access$600(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/util/ShareComponentSorter;->touch(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->this$0:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-static {p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->access$700(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;)Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->this$0:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;

    invoke-static {p1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;->access$700(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter;)Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$CellHolder;->mInfo:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$DisplayResolvedInfo;->getResolvedIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-interface {p1, v0}, Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;->onIntentSelected(Landroid/content/Intent;)V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/ShareComponentSorter;->getInstance()Lcom/miui/gallery/util/ShareComponentSorter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/util/ShareComponentSorter;->save()V

    return-void
.end method
