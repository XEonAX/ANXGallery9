.class Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1$1;
.super Ljava/lang/Object;
.source "EditAdapter.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1$1;->this$1:Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr p1, v0

    mul-float v1, p1, p1

    mul-float v1, v1, p1

    mul-float v1, v1, p1

    mul-float v1, v1, p1

    add-float/2addr v1, v0

    return v1
.end method
