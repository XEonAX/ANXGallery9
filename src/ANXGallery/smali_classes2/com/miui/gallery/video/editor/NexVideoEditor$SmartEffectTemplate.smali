.class Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;
.super Ljava/lang/Object;
.source "NexVideoEditor.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/NexVideoEditor$Change;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SmartEffectTemplate"
.end annotation


# instance fields
.field private mLimitTime:I

.field private template:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;

.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/SmartEffect;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/SmartEffect;->getTemplate()Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->template:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/SmartEffect;->getLongTime()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->mLimitTime:I

    :cond_0
    return-void
.end method

.method private checkTemplate()Ljava/lang/String;
    .locals 7

    const-string v0, ""

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v1

    if-gtz v1, :cond_0

    const-string v0, "Project is empty"

    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->template:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;

    if-nez v1, :cond_1

    const-string v0, "Template did not selected"

    return-object v0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2700(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2700(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->allClear(Z)V

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v3}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v3

    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->clone(Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2702(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->mLimitTime:I

    if-lez v1, :cond_3

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->mLimitTime:I

    iget-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-virtual {v3}, Lcom/miui/gallery/video/editor/NexVideoEditor;->getVideoTotalTime()I

    move-result v3

    if-ge v1, v3, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2700(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalClipCount(Z)I

    move-result v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v1, :cond_3

    iget-object v5, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v5}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2700(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v5

    invoke-virtual {v5, v4, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getClip(IZ)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v5

    invoke-virtual {v5}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v5

    iget v6, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->mLimitTime:I

    invoke-virtual {v5, v3, v6}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$200(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexEngine;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2700(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setProject(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;->getInstance()Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;->getKmTemplateManager()Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2700(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->template:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;->id()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager;->applyTemplateToProjectById(Lcom/nexstreaming/nexeditorsdk/nexProject;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    const-string v0, "Fail to apply template on project"
    :try_end_0
    .catch Lcom/nexstreaming/nexeditorsdk/exception/ExpiredTimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :catch_1
    const-string v0, "This is expired asset!"

    :cond_4
    :goto_1
    const-string v1, "NexVideoEditor"

    const-string v2, "check template info : %s "

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method private delete()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2602(Lcom/miui/gallery/video/editor/NexVideoEditor;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "edit_type_smart_effect_template"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public applyChange()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->template:Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->checkTemplate()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->delete()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "edit_type_smart_effect_template"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2602(Lcom/miui/gallery/video/editor/NexVideoEditor;Z)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2702(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/nexstreaming/nexeditorsdk/nexProject;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$200(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexEngine;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setProject(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->delete()V

    :goto_0
    return-void
.end method
