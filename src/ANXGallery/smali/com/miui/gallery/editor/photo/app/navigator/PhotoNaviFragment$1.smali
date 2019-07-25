.class Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;
.super Ljava/lang/Object;
.source "PhotoNaviFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/SimpleRecyclerView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
    .locals 10

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->access$000(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    iget-boolean p2, p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->isPlugin:Z

    const/4 p3, 0x1

    if-eqz p2, :cond_3

    invoke-static {}, Lcom/miui/gallery/module/GalleryModuleManager;->getInstance()Lcom/miui/gallery/module/GalleryModuleManager;

    move-result-object p2

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->pluginModuleName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/module/GalleryModuleManager;->isModuleLoaded(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    iget v1, p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->name:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->pluginModuleName:Ljava/lang/String;

    invoke-virtual {p2, v1}, Lcom/miui/gallery/module/GalleryModuleManager;->isModuleLoading(Ljava/lang/String;)Z

    move-result p2

    const v1, 0x7f10053a

    const/4 v2, 0x0

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    new-array v3, p3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-virtual {p2, v1, v3}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return p3

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    const v1, 0x7f10053b

    new-array v3, p3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-virtual {p2, v1, v3}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return p3

    :cond_1
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result p2

    if-eqz p2, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    const v1, 0x7f100534

    invoke-virtual {p2, v1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    const v1, 0x7f100533

    new-array v5, p3, [Ljava/lang/Object;

    aput-object v0, v5, v2

    invoke-virtual {p2, v1, v5}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f100537

    const v7, 0x7f100539

    new-instance v8, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1$1;

    invoke-direct {v8, p0, p1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1$1;-><init>(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;)V

    const/4 v9, 0x0

    invoke-static/range {v3 .. v9}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->access$200(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;Ljava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    invoke-static {p2, p1, v2, p3}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->access$100(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;ZZ)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    new-array v3, p3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-virtual {p2, v1, v3}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_0
    return p3

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->effect:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-static {p2, p1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->access$300(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;Lcom/miui/gallery/editor/photo/core/Effect;)V

    return p3
.end method
