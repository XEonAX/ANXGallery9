.class Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;
.super Ljava/lang/Object;
.source "PhotoEditor.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/AbstractNaviFragment$Callbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/PhotoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onNavigate$84(Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;Lcom/miui/gallery/editor/photo/core/Effect;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->showEditFragment(Lcom/miui/gallery/editor/photo/core/Effect;)V

    return-void
.end method

.method private sampleExit(Ljava/lang/String;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "step_count"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getStepCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "total_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1400(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x64

    div-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isRemoveWatermarkEnable()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "remove_watermark"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isWithWatermark()Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1300(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/Sampler;

    move-result-object v1

    const-string v2, "_main"

    invoke-virtual {v1, v2, p1, v0}, Lcom/miui/gallery/editor/photo/app/Sampler;->recordEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private sampleNavigate(Lcom/miui/gallery/editor/photo/core/Effect;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1300(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/Sampler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result p1

    aget-object p1, v1, p1

    const-string v1, "enter"

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/app/Sampler;->recordEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onDiscard()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/compat/app/ActivityCompat;->finishAfterTransition(Landroid/app/Activity;)V

    const-string v0, "cancelled"

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->sampleExit(Ljava/lang/String;)V

    return-void
.end method

.method public onExport()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$1100(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/ExportTask;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/ExportTask;->showExportDialog()V

    const-string v0, "exported"

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->sampleExit(Ljava/lang/String;)V

    return-void
.end method

.method public onNavigate(Lcom/miui/gallery/editor/photo/core/Effect;)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isPreviewEnable()Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->getProvider(Lcom/miui/gallery/editor/photo/core/Effect;)Lcom/miui/gallery/editor/photo/core/SdkProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->initialized()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "PhotoEditor"

    const-string v1, "SdkProvider: %s has not initialized when click"

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/Effect;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_1
    const-string v0, "PhotoEditor"

    const-string v1, "navigate %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "PhotoEditor"

    const-string v0, "last effect editor is still active"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$800(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)[Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/Effect;->ordinal()I

    move-result v1

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v1

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;->renderTag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/RenderFragment;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v2

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;->gestureTag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;->newMenu()Lcom/miui/gallery/editor/photo/app/MenuFragment;

    move-result-object v3

    const/4 v4, 0x0

    const v5, 0x7f0900de

    const/4 v6, 0x1

    if-nez v1, :cond_3

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->createRenderFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;

    move-result-object v1

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v4

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;->renderTag:Ljava/lang/String;

    invoke-virtual {v4, v5, v1, v7}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/app/FragmentTransaction;->hide(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentTransaction;->commit()I

    const/4 v4, 0x1

    :cond_3
    iget-object v7, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$000(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Lcom/miui/gallery/editor/photo/app/DraftManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getPreview()Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->isSupportBitmap(Landroid/graphics/Bitmap;)Z

    move-result v7

    if-nez v7, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->getUnSupportStringRes()I

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return-void

    :cond_4
    if-nez v2, :cond_5

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->createGestureFragment()Landroid/app/Fragment;

    move-result-object v2

    if-eqz v2, :cond_5

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v4

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;->gestureTag:Ljava/lang/String;

    invoke-virtual {v4, v5, v2, v7}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/app/FragmentTransaction;->hide(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentTransaction;->commit()I

    const/4 v4, 0x1

    :cond_5
    if-eqz v4, :cond_6

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_6
    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v5

    const-string v7, "MenuFragment:display_fragment"

    invoke-virtual {v5, v4, v7, v1}, Landroid/app/FragmentManager;->putFragment(Landroid/os/Bundle;Ljava/lang/String;Landroid/app/Fragment;)V

    if-eqz v2, :cond_7

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v5

    const-string v7, "MenuFragment:gesture_fragment"

    invoke-virtual {v5, v4, v7, v2}, Landroid/app/FragmentManager;->putFragment(Landroid/os/Bundle;Ljava/lang/String;Landroid/app/Fragment;)V

    :cond_7
    invoke-virtual {v3, v4}, Lcom/miui/gallery/editor/photo/app/MenuFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v2

    const-string v4, "navigator"

    invoke-virtual {v2, v4}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    if-eqz v2, :cond_8

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_8
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    const v4, 0x7f0901cd

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$FragmentData;->menuTag:Ljava/lang/String;

    invoke-virtual {v2, v4, v3, v0}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/RenderFragment;->isSupportAnimation()Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$200(Lcom/miui/gallery/editor/photo/app/PhotoEditor;)Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "preview"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_a

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-static {v1, v6}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->access$902(Lcom/miui/gallery/editor/photo/app/PhotoEditor;Z)Z

    const-class v1, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/PreviewFragment;

    new-instance v1, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PhotoEditor$4$Xuc5SC9WXyH3hYn9quydzpekMw8;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/app/-$$Lambda$PhotoEditor$4$Xuc5SC9WXyH3hYn9quydzpekMw8;-><init>(Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;)V

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/app/PreviewFragment;->prepareShowEditFragment(Lcom/miui/gallery/editor/photo/core/Effect;Lcom/miui/gallery/editor/photo/app/PreviewFragment$OnPrepareEditFragmentListener;)V

    goto :goto_0

    :cond_9
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->this$0:Lcom/miui/gallery/editor/photo/app/PhotoEditor;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor;->showEditFragment(Lcom/miui/gallery/editor/photo/core/Effect;)V

    :cond_a
    :goto_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/PhotoEditor$4;->sampleNavigate(Lcom/miui/gallery/editor/photo/core/Effect;)V

    return-void

    :cond_b
    :goto_1
    const-string p1, "PhotoEditor"

    const-string v0, "has not load preview when click"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
