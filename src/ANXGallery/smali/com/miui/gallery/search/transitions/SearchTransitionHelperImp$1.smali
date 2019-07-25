.class Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$1;
.super Lcom/miui/gallery/search/transitions/SearchSharedElementCallback;
.source "SearchTransitionHelperImp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$1;->this$0:Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;

    invoke-direct {p0}, Lcom/miui/gallery/search/transitions/SearchSharedElementCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onMapSharedElements(Ljava/util/List;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/search/transitions/SearchSharedElementCallback;->onMapSharedElements(Ljava/util/List;Ljava/util/Map;)V

    iget-object p1, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$1;->this$0:Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;

    iget-object p1, p1, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mEnterTransitionListener:Lcom/miui/gallery/search/transitions/SearchTransitionHelper$SearchTransitionListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp$1;->this$0:Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;

    iget-object p1, p1, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->mEnterTransitionListener:Lcom/miui/gallery/search/transitions/SearchTransitionHelper$SearchTransitionListener;

    invoke-interface {p1}, Lcom/miui/gallery/search/transitions/SearchTransitionHelper$SearchTransitionListener;->onTransitionStart()V

    :cond_0
    return-void
.end method
