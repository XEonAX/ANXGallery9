.class Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$1;
.super Ljava/lang/Object;
.source "SearchImageResultFragment.java"

# interfaces
.implements Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;

.field final synthetic val$mode:Landroid/view/ActionMode;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;Landroid/view/ActionMode;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;

    iput-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$1;->val$mode:Landroid/view/ActionMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$1;->val$mode:Landroid/view/ActionMode;

    invoke-virtual {v0}, Landroid/view/ActionMode;->finish()V

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mSectionDataResultHelper:Lcom/miui/gallery/search/resultpage/SearchResultHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultHelper;->resetCacheInfo()V

    new-instance p1, Landroid/os/Bundle;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/os/Bundle;-><init>(I)V

    const-string v1, "force_requery"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;

    iget-object v0, v0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->restartSectionDataLoader(Landroid/os/Bundle;)V

    :cond_0
    return-void
.end method
