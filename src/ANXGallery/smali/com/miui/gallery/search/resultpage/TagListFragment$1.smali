.class Lcom/miui/gallery/search/resultpage/TagListFragment$1;
.super Ljava/lang/Object;
.source "TagListFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/resultpage/TagListFragment;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/TagListFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/resultpage/TagListFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/TagListFragment$1;->this$0:Lcom/miui/gallery/search/resultpage/TagListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/TagListFragment$1;->this$0:Lcom/miui/gallery/search/resultpage/TagListFragment;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/search/resultpage/TagListFragment;->access$002(Lcom/miui/gallery/search/resultpage/TagListFragment;Z)Z

    return-void
.end method
