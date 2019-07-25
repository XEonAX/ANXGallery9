.class Lcom/miui/gallery/collage/CollageActivity$3;
.super Ljava/lang/Object;
.source "CollageActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/CollageActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/collage/CollageActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/CollageActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/CollageActivity$3;->this$0:Lcom/miui/gallery/collage/CollageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/collage/CollageActivity$3;->this$0:Lcom/miui/gallery/collage/CollageActivity;

    invoke-static {p1}, Lcom/miui/gallery/collage/CollageActivity;->access$100(Lcom/miui/gallery/collage/CollageActivity;)Lcom/miui/gallery/collage/core/CollagePresenter;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/collage/CollageActivity$3;->this$0:Lcom/miui/gallery/collage/CollageActivity;

    invoke-static {p1}, Lcom/miui/gallery/collage/CollageActivity;->access$100(Lcom/miui/gallery/collage/CollageActivity;)Lcom/miui/gallery/collage/core/CollagePresenter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/collage/core/CollagePresenter;->isActivating()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/collage/CollageActivity$3;->this$0:Lcom/miui/gallery/collage/CollageActivity;

    invoke-static {p1}, Lcom/miui/gallery/collage/CollageActivity;->access$100(Lcom/miui/gallery/collage/CollageActivity;)Lcom/miui/gallery/collage/core/CollagePresenter;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/collage/CollageActivity$3;->this$0:Lcom/miui/gallery/collage/CollageActivity;

    invoke-static {v0}, Lcom/miui/gallery/collage/CollageActivity;->access$200(Lcom/miui/gallery/collage/CollageActivity;)Lcom/miui/gallery/collage/BitmapManager;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/core/CollagePresenter;->doSave(Lcom/miui/gallery/collage/BitmapManager;)V

    :cond_0
    return-void
.end method
