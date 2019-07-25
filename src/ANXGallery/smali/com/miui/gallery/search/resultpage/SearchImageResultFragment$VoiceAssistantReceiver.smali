.class Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SearchImageResultFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VoiceAssistantReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isInActionMode()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    const-string v0, "assistant_target_package"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "assistant_target_class"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$1500(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
