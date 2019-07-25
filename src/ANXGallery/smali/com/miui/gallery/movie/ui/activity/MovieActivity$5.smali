.class Lcom/miui/gallery/movie/ui/activity/MovieActivity$5;
.super Landroid/animation/AnimatorListenerAdapter;
.source "MovieActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/movie/ui/activity/MovieActivity;->doFullScreenChangeAnimal(Landroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/miui/gallery/movie/ui/activity/MovieActivity;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$5;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    iput-object p2, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$5;->val$view:Landroid/view/View;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$5;->val$view:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
