.class Lcom/miui/gallery/movie/ui/activity/MovieActivity$3;
.super Lcom/miui/gallery/listener/SingleClickListener;
.source "MovieActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/movie/ui/activity/MovieActivity;->initView()V
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

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$3;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-direct {p0}, Lcom/miui/gallery/listener/SingleClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method protected onSingleClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieActivity$3;->this$0:Lcom/miui/gallery/movie/ui/activity/MovieActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/activity/MovieActivity;->changeEditorPreview()V

    return-void
.end method
