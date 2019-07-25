.class Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;
.super Lcom/miui/gallery/listener/SingleClickListener;
.source "MovieActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/activity/MovieActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-direct {p0}, Lcom/miui/gallery/listener/SingleClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method protected onSingleClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->finish()V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$000(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/movie/core/MovieManager;->pause()V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$100(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)Lcom/miui/gallery/movie/entity/MovieShareData;

    move-result-object p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    new-instance v0, Lcom/miui/gallery/movie/entity/MovieShareData;

    invoke-direct {v0}, Lcom/miui/gallery/movie/entity/MovieShareData;-><init>()V

    invoke-static {p1, v0}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$102(Lcom/miui/gallery/movie/ui/activity/MovieActivity;Lcom/miui/gallery/movie/entity/MovieShareData;)Lcom/miui/gallery/movie/entity/MovieShareData;

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$100(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)Lcom/miui/gallery/movie/entity/MovieShareData;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$200(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object v0

    iget-boolean v0, v0, Lcom/miui/gallery/movie/entity/MovieInfo;->isShortVideo:Z

    invoke-virtual {p1, v0}, Lcom/miui/gallery/movie/entity/MovieShareData;->setShortVideo(Z)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$100(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)Lcom/miui/gallery/movie/entity/MovieShareData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/MovieShareData;->getVideoPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$300(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;

    move-result-object p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    new-instance v0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;

    invoke-direct {v0}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;-><init>()V

    invoke-static {p1, v0}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$302(Lcom/miui/gallery/movie/ui/activity/MovieActivity;Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;)Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$300(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$400(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-static {v1}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$000(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-static {v2}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->access$200(Lcom/miui/gallery/movie/ui/activity/MovieActivity;)Lcom/miui/gallery/movie/entity/MovieInfo;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->showAndShare(Landroid/app/Activity;Lcom/miui/gallery/movie/core/MovieManager;Lcom/miui/gallery/movie/entity/MovieInfo;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$1;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->handleShareEvent(Ljava/lang/String;)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f0901e6
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
