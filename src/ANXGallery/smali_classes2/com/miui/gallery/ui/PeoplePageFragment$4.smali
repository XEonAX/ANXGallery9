.class Lcom/miui/gallery/ui/PeoplePageFragment$4;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeoplePageFragment;->destroySnapshotLoader()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PeoplePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$4;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$4;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$4;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->destroyLoader(I)V

    :cond_0
    return-void
.end method
