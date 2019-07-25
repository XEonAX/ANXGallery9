.class Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;
.super Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhotoEditorManager"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    return-void
.end method


# virtual methods
.method protected handleEditorResult(Landroid/content/Intent;)Z
    .locals 6

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    const-string v1, "photo_secret_id"

    const-wide/16 v2, 0x0

    invoke-virtual {p1, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v4

    cmp-long v1, v4, v2

    if-lez v1, :cond_0

    invoke-virtual {p0, v4, v5}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->setTargetId(J)V

    invoke-virtual {p0, v4, v5}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->notifyDataSetChange(J)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "file://"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPagerSamplingStatHelper;->onEditorSaved(Landroid/net/Uri;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->notifyDataSetChange(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->setTargetPath(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onDestroy()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoEditorManager;->release()V

    return-void
.end method
