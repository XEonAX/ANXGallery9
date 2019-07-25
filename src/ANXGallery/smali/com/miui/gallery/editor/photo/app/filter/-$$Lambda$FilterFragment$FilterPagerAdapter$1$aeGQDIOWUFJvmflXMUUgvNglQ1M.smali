.class public final synthetic Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;

.field private final synthetic f$1:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

.field private final synthetic f$2:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

.field private final synthetic f$3:Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

.field private final synthetic f$4:I


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;->f$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;->f$1:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;->f$2:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    iput-object p4, p0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;->f$3:Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    iput p5, p0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;->f$4:I

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;->f$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;->f$1:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;->f$2:Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;->f$3:Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$FilterPagerAdapter$1$aeGQDIOWUFJvmflXMUUgvNglQ1M;->f$4:I

    move-object v5, p1

    check-cast v5, Ljava/lang/Boolean;

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;->lambda$OnItemClick$95(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$FilterPagerAdapter$1;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderFragment;Lcom/miui/gallery/editor/photo/core/imports/filter/FilterItem;Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;ILjava/lang/Boolean;)V

    return-void
.end method
