.class Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$EffectModuleLoadListener;
.super Ljava/lang/Object;
.source "PhotoNaviFragment.java"

# interfaces
.implements Lcom/miui/gallery/module/GalleryModuleManager$ModuleLoadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EffectModuleLoadListener"
.end annotation


# instance fields
.field private mNavigatorData:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

.field private mNotifyResult:Z


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$EffectModuleLoadListener;->mNavigatorData:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$EffectModuleLoadListener;->mNotifyResult:Z

    return-void
.end method


# virtual methods
.method public onLoadFailed()V
    .locals 6

    const-string v0, "PhotoNaviFragment"

    const-string v1, "Module %s load failed. Notify result %s"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$EffectModuleLoadListener;->mNavigatorData:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->pluginModuleName:Ljava/lang/String;

    iget-boolean v3, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$EffectModuleLoadListener;->mNotifyResult:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$EffectModuleLoadListener;->mNotifyResult:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$EffectModuleLoadListener;->mNavigatorData:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    iget v2, v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->name:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f100536

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    invoke-virtual {v1, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public onLoadSuccess()V
    .locals 3

    const-string v0, "PhotoNaviFragment"

    const-string v1, "Module %s load success"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/navigator/PhotoNaviFragment$EffectModuleLoadListener;->mNavigatorData:Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$NavigatorData;->pluginModuleName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
