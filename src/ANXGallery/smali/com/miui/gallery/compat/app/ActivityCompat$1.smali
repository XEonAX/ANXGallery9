.class final Lcom/miui/gallery/compat/app/ActivityCompat$1;
.super Landroid/app/SharedElementCallback;
.source "ActivityCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/compat/app/ActivityCompat;->setEnterSharedElementCallback(Landroid/app/Activity;Lcom/miui/gallery/compat/app/ActivityCompat$SharedElementCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/miui/gallery/compat/app/ActivityCompat$SharedElementCallback;


# direct methods
.method constructor <init>(Lcom/miui/gallery/compat/app/ActivityCompat$SharedElementCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/compat/app/ActivityCompat$1;->val$callback:Lcom/miui/gallery/compat/app/ActivityCompat$SharedElementCallback;

    invoke-direct {p0}, Landroid/app/SharedElementCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onSharedElementStart(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/compat/app/ActivityCompat$1;->val$callback:Lcom/miui/gallery/compat/app/ActivityCompat$SharedElementCallback;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/compat/app/ActivityCompat$1;->val$callback:Lcom/miui/gallery/compat/app/ActivityCompat$SharedElementCallback;

    invoke-interface {p1}, Lcom/miui/gallery/compat/app/ActivityCompat$SharedElementCallback;->onSharedElementStart()V

    :cond_0
    return-void
.end method
