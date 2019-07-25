.class Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1$1;
.super Ljava/lang/Object;
.source "PhotoNaviFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;

.field final synthetic val$navigatorData:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1$1;->this$1:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1$1;->val$navigatorData:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/module/GalleryModuleManager;->getInstance()Lcom/miui/gallery/module/GalleryModuleManager;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1$1;->val$navigatorData:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->pluginModuleName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/module/GalleryModuleManager;->isModuleLoaded(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1$1;->this$1:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$1$1;->val$navigatorData:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p1, p2, v0, v1}, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;->access$100(Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;ZZ)V

    :cond_0
    return-void
.end method
