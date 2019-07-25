.class Lcom/miui/gallery/ui/PeoplePageFragment$3;
.super Ljava/lang/Object;
.source "PeoplePageFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PeoplePageFragment;->loadPeoplePage()V
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

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$3;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$3;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    sget-object v1, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->DISPLAY_PARTIAL_PEOPLE:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$402(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment$3;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PeoplePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment$3;->this$0:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PeoplePageFragment;->access$300(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

    move-result-object v1

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method
