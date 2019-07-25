.class Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$2;
.super Lcom/miui/gallery/listener/SingleClickListener;
.source "RemoverMenuFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-direct {p0}, Lcom/miui/gallery/listener/SingleClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method protected onSingleClick(Landroid/view/View;)V
    .locals 5

    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.miui.gallery.action.VIEW_WEB"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "https://i.mi.com/static2?filename=MicloudWebBill/event/gallery/MagicAllh5.html%1$s#%2$s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->access$400(Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "&mode=dark"

    goto :goto_0

    :cond_0
    const-string v3, ""

    :goto_0
    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "url"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/remover/RemoverMenuFragment;->startActivity(Landroid/content/Intent;)V

    const-string p1, "photo_editor"

    const-string v0, "remove_tips_click"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
