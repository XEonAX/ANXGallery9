.class Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$IconResult;
.super Ljava/lang/Object;
.source "ChooserFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IconResult"
.end annotation


# instance fields
.field final drawable:Landroid/graphics/drawable/Drawable;

.field final isCustomIcon:Z

.field final synthetic this$0:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;Landroid/graphics/drawable/Drawable;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$IconResult;->this$0:Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$IconResult;->drawable:Landroid/graphics/drawable/Drawable;

    iput-boolean p3, p0, Lcom/miui/gallery/ui/ChooserFragment$ResolverAdapter$ResolveInfoLoader$IconResult;->isCustomIcon:Z

    return-void
.end method
