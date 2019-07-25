.class Lcom/miui/gallery/search/SearchFragment$5;
.super Ljava/lang/Object;
.source "SearchFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/SearchFragment;->requestIME(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/SearchFragment;

.field final synthetic val$show:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/SearchFragment;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/SearchFragment$5;->this$0:Lcom/miui/gallery/search/SearchFragment;

    iput-boolean p2, p0, Lcom/miui/gallery/search/SearchFragment$5;->val$show:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/SearchFragment$5;->val$show:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment$5;->this$0:Lcom/miui/gallery/search/SearchFragment;

    invoke-static {v0}, Lcom/miui/gallery/search/SearchFragment;->access$000(Lcom/miui/gallery/search/SearchFragment;)Lcom/miui/gallery/search/widget/SearchView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/widget/SearchView;->showInputMethod()Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment$5;->this$0:Lcom/miui/gallery/search/SearchFragment;

    invoke-static {v0}, Lcom/miui/gallery/search/SearchFragment;->access$000(Lcom/miui/gallery/search/SearchFragment;)Lcom/miui/gallery/search/widget/SearchView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/widget/SearchView;->hideInputMethod()Z

    :goto_0
    return-void
.end method
