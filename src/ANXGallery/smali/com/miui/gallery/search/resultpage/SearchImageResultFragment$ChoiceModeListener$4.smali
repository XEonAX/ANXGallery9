.class Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$4;
.super Ljava/lang/Object;
.source "SearchImageResultFragment.java"

# interfaces
.implements Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;


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

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$4;->this$1:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;

    iput-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$4;->val$mode:Landroid/view/ActionMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete([J)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener$4;->val$mode:Landroid/view/ActionMode;

    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    return-void
.end method
